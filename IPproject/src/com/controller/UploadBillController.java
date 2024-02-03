package com.controller;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class UploadBillController {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @PostMapping("/uploadWaterBill")
    public String uploadWaterBill(
            MultipartFile file,
            Double consumption,
            String billMonth,
            HttpServletRequest request,
            RedirectAttributes redirectAttributes) {
        return processFileAndSaveBill(file, consumption, billMonth, "water_bills", null, null, request, redirectAttributes);
    }

    @PostMapping("/uploadElectricityBill")
    public String uploadElectricityBill(
            MultipartFile file,
            Double consumption,
            String billMonth,
            HttpServletRequest request,
            RedirectAttributes redirectAttributes) {
        return processFileAndSaveBill(file, consumption, billMonth, "electricity_bills", null, null, request, redirectAttributes);
    }

    @PostMapping("/uploadCookingOilBill")
    public String uploadCookingOilBill(
            MultipartFile file,
            Integer recyclingDays,
            Double volume,
            String billMonth,
            HttpServletRequest request,
            RedirectAttributes redirectAttributes) {
        return processFileAndSaveBill(file, volume, billMonth, "cooking_oil_bills", "recycling_days", recyclingDays, request, redirectAttributes);
    }

    @PostMapping("/uploadWasteBill")
    public String uploadWasteBill(
            Integer daysProduced,
            Double weight,
            String billMonth,
            HttpServletRequest request,
            RedirectAttributes redirectAttributes) {
        return processFileAndSaveBill(null, weight, billMonth, "waste_bills", "days_produced", daysProduced, request, redirectAttributes);
    }

    private String processFileAndSaveBill(
            MultipartFile file,
            Double consumption,
            String billMonth,
            String tableName,
            String additionalColumn,
            Object additionalValue,
            HttpServletRequest request,
            RedirectAttributes redirectAttributes) {

        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            redirectAttributes.addFlashAttribute("message", "User not found. Please log in again.");
            return "redirect:/login";
        }

        try {
            byte[] fileContent = file != null ? file.getBytes() : new byte[0];

            String sql = String.format(
                    "INSERT INTO %s (user_id, consumption, bill_month, file_path, file_content%s) VALUES (?, ?, ?, ?, ?%s)",
                    tableName,
                    (additionalColumn != null) ? ", " + additionalColumn : "",
                    (additionalValue != null) ? ", ?" : ""
            );

            jdbcTemplate.update(connection -> {
                PreparedStatement ps = connection.prepareStatement(sql);
                ps.setInt(1, userId);
                ps.setDouble(2, consumption);
                ps.setString(3, billMonth);
                ps.setString(4, file != null ? file.getOriginalFilename() : null);
                ps.setBytes(5, fileContent);

                if (additionalColumn != null && additionalValue != null) {
                    if (additionalValue instanceof Integer) {
                        ps.setInt(6, (Integer) additionalValue);
                    } else {
                        ps.setObject(6, additionalValue);
                    }
                }
                return ps;
            });

            redirectAttributes.addFlashAttribute("message", "You successfully uploaded '" + (file != null ? file.getOriginalFilename() : "") + "'");

        } catch (IOException e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("message", "Could not upload the file. Error: " + e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("message", "An error occurred while saving the bill. Please try again.");
        }

        return "redirect:/uploadStatus";
    }
}
