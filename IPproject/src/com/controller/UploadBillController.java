package com.controller;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/user")
public class UploadBillController {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @PostMapping("/uploadWaterBill")
    public String uploadWaterBill(
            @RequestParam("file") MultipartFile file,
            @RequestParam("consumption") Double consumption,
            @RequestParam("bill_month") String billMonth, // capture the bill_month
            HttpServletRequest request,
            RedirectAttributes redirectAttributes,
            Model model) {

        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");
        
        if (userId == null) {
            redirectAttributes.addFlashAttribute("message", "User not found. Please log in again.");
            return "redirect:/login";
        }
        
        try {
            byte[] fileContent = file.getBytes();
            String sql = "INSERT INTO water_bills (user_id, consumption, bill_month, file_content) VALUES (?, ?, ?, ?)";
            jdbcTemplate.update(connection -> {
                PreparedStatement ps = connection.prepareStatement(sql);
                ps.setInt(1, userId);
                ps.setDouble(2, consumption);
                ps.setString(3, billMonth);
                ps.setBytes(4, fileContent);
                return ps;
            });

            double co2PerCubicMeter = 0.419; 
            double carbonFootprint = consumption * co2PerCubicMeter;
            
            session.setAttribute("carbonFootprint", carbonFootprint);
            session.setAttribute("waterConsumption", consumption);
            session.setAttribute("co2PerCubicMeter", co2PerCubicMeter);
            session.setAttribute("billMonth", billMonth);
            return "redirect:/user/calculateResultWater";

        } catch (IOException e) {
            redirectAttributes.addFlashAttribute("message", "Failed to upload the file: " + e.getMessage());
            return "redirect:/user/upload";
        }
    }

    @GetMapping("/calculateResultWater")
    public String calculateResultWater(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            return "redirect:/login";
        }
        
        model.addAttribute("carbonFootprint", session.getAttribute("carbonFootprint"));
        model.addAttribute("waterConsumption", session.getAttribute("waterConsumption"));
        model.addAttribute("co2PerCubicMeter", session.getAttribute("co2PerCubicMeter"));
        model.addAttribute("billMonth", session.getAttribute("billMonth"));
        
        // Clear the session attributes if you no longer need them
        session.removeAttribute("carbonFootprint");
        session.removeAttribute("waterConsumption");
        session.removeAttribute("co2PerCubicMeter");
        session.removeAttribute("billMonth");
        
        return "User/CalculateResultWater";
    }

    @PostMapping("/uploadElectricityBill")
    public String uploadElectricityBill(
    		@RequestParam("file") MultipartFile file,
            @RequestParam("consumption") Double consumption,
            @RequestParam("bill_month") String billMonth,
            HttpServletRequest request,
            RedirectAttributes redirectAttributes,
            Model model) {

        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");
        
        if (userId == null) {
            redirectAttributes.addFlashAttribute("message", "User not found. Please log in again.");
            return "redirect:/login";
        }
        
        try {
        	byte[] fileContent = file.getBytes();
        	String sql = "INSERT INTO electricity_bills (user_id, consumption, bill_month, file_content) VALUES (?, ?, ?, ?)";
        	jdbcTemplate.update(connection -> {
                PreparedStatement ps = connection.prepareStatement(sql);
                ps.setInt(1, userId);
                ps.setDouble(2, consumption);
                ps.setString(3, billMonth);
                ps.setBytes(4, fileContent);
                return ps;
            });
        	
        	double co2PerKwh = 0.584;
            double carbonFootprint = consumption * co2PerKwh;
            
            session.setAttribute("carbonFootprint", carbonFootprint);
            session.setAttribute("ElectricConsumption", consumption);
            session.setAttribute("co2PerKwh", co2PerKwh);
            session.setAttribute("billMonth", billMonth);
            return "redirect:/user/calculateResultElectricity";

        } catch (IOException e) {
            redirectAttributes.addFlashAttribute("message", "Failed to upload the file: " + e.getMessage());
            return "redirect:/user/upload";
        }
    }

    @GetMapping("/calculateResultElectricity")
    public String calculateResultElectric(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            return "redirect:/login";
        }
        
        model.addAttribute("carbonFootprint", session.getAttribute("carbonFootprint"));
        model.addAttribute("ElectricConsumption", session.getAttribute("ElectricConsumption"));
        model.addAttribute("co2PerKwh", session.getAttribute("co2PerKwh"));
        model.addAttribute("billMonth", session.getAttribute("billMonth"));
        
        session.removeAttribute("carbonFootprint");
        session.removeAttribute("ElectricConsumption");
        session.removeAttribute("co2PerKwh");
        session.removeAttribute("billMonth");
        
        return "User/CalculateResultElectricity";
    }

    @PostMapping("/uploadCookingOilBill")
    public String uploadCookingOilBill(
            @RequestParam("file") MultipartFile file,
            @RequestParam("recyclingDays") Integer recyclingDays,
            @RequestParam("oilVolume") Double volume,
            @RequestParam("bill_month") String billMonth,
            HttpServletRequest request,
            RedirectAttributes redirectAttributes,
            Model model) {

        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            redirectAttributes.addFlashAttribute("message", "User not found. Please log in again.");
            return "redirect:/login";
        }

        try {
            byte[] fileContent = file.getBytes();
            String sql = "INSERT INTO cooking_oil_bills (user_id, recycling_days, volume, bill_month, file_content) VALUES (?, ?, ?, ?, ?)";
            jdbcTemplate.update(connection -> {
                PreparedStatement ps = connection.prepareStatement(sql);
                ps.setInt(1, userId);
                ps.setInt(2, recyclingDays);
                ps.setDouble(3, volume);
                ps.setString(4, billMonth);
                ps.setBytes(5, fileContent);
                return ps;
            });

            double co2PerLitre = 2.860;
            double carbonFootprint = volume * co2PerLitre;

            session.setAttribute("carbonFootprint", carbonFootprint);
            session.setAttribute("volume", volume);
            session.setAttribute("co2PerLitre", co2PerLitre);
            session.setAttribute("recyclingDays", recyclingDays);
            session.setAttribute("billMonth", billMonth);

            return "redirect:/user/calculateResultCookingOil";

        } catch (IOException e) {
            redirectAttributes.addFlashAttribute("message", "Failed to upload the file: " + e.getMessage());
            return "redirect:/user/upload";
        }
    }

    @GetMapping("/calculateResultCookingOil")
    public String calculateResultCookingOil(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            return "redirect:/login";
        }

        model.addAttribute("carbonFootprint", session.getAttribute("carbonFootprint"));
        model.addAttribute("volume", session.getAttribute("volume"));
        model.addAttribute("co2PerLitre", session.getAttribute("co2PerLitre"));
        model.addAttribute("recyclingDays", session.getAttribute("recyclingDays"));
        model.addAttribute("billMonth", session.getAttribute("billMonth"));

        session.removeAttribute("carbonFootprint");
        session.removeAttribute("volume");
        session.removeAttribute("co2PerLitre");
        session.removeAttribute("recyclingDays");
        session.removeAttribute("billMonth");

        return "User/CalculateResultOilConsumption";
    }

    @PostMapping("/uploadWasteBill")
    public String uploadWasteBill(
            @RequestParam("days") Integer days,
            @RequestParam("waste-consumption") Double wasteConsumption,
            @RequestParam("bill_month") String billMonth,
            HttpServletRequest request,
            RedirectAttributes redirectAttributes) {

        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            redirectAttributes.addFlashAttribute("message", "User not found. Please log in again.");
            return "redirect:/login";
        }

        
        try {
            String sql = "INSERT INTO waste_bills (user_id, days_produced, weight, bill_month) VALUES (?, ?, ?, ?)";
            jdbcTemplate.update(connection -> {
                PreparedStatement ps = connection.prepareStatement(sql);
                ps.setInt(1, userId);
                ps.setInt(2, days);
                ps.setDouble(3, wasteConsumption);
                ps.setString(4, billMonth);
                return ps;
            });

            double co2PerKg = 2.860;
            double carbonFootprint = wasteConsumption * co2PerKg;

            session.setAttribute("carbonFootprint", carbonFootprint);
            session.setAttribute("WasteConsumption", wasteConsumption);
            session.setAttribute("co2PerKg", co2PerKg);
            session.setAttribute("billMonth", billMonth);
            return "redirect:/user/calculateResultWaste";
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("message", "An error occurred while uploading the data. Please try again.");
            return "redirect:/user/upload";
        }

    }

    @GetMapping("/calculateResultWaste")
    public String calculateResultWaste(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            return "redirect:/login";
        }
        
        model.addAttribute("carbonFootprint", session.getAttribute("carbonFootprint"));
        model.addAttribute("WasteConsumption", session.getAttribute("WasteConsumption"));
        model.addAttribute("co2PerKg", session.getAttribute("co2PerKg"));
        model.addAttribute("billMonth", session.getAttribute("billMonth"));
        
        session.removeAttribute("carbonFootprint");
        session.removeAttribute("WasteConsumption");
        session.removeAttribute("co2PerKg");
        session.removeAttribute("billMonth");
        
        return "User/CalculateResultWasteConsumption";
    }
}