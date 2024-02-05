package com.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class AdminController {
	
	@Autowired
    private JdbcTemplate jdbcTemplate;

    @RequestMapping("/admin/home")
    public ModelAndView showAdminHomePage() {
        ModelAndView mav = new ModelAndView("Admin/adminHomePage");
        // You can add objects that you want to pass to the view here
        // mav.addObject("attributeName", attributeValue);
        return mav;
    }

    @RequestMapping("/admin/dashboard")
    public ModelAndView showAdminDashboard() {
        ModelAndView mav = new ModelAndView("Admin/adminDashboard");
        // Add objects to the model if needed
        return mav;
    }
    
    @RequestMapping("/admin/verify-upload-month")
    public ModelAndView showVerifyUploadMonth() {
        ModelAndView mav = new ModelAndView("Admin/chooseMonth");
        // Add objects to the model if needed
        return mav;
    }

    @GetMapping("/admin/verify-upload-category")
    public ModelAndView showVerifyUploadCategory(@RequestParam("month") String month, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("Admin/chooseCategory");
        mav.addObject("selectedMonth", month); // Pass the selected month to the view
        // Add any necessary objects to the model
        return mav;
    }
    
    @GetMapping("/admin/verify-upload")
    public ModelAndView verifyUpload(@RequestParam("month") String month, @RequestParam("category") String category, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("Admin/verificationPage");
        mav.addObject("selectedMonth", month);
        mav.addObject("selectedCategory", category);
        
        String sql = "";
        switch (category.toLowerCase()) {
            case "water":
            case "electricity":
                sql = "SELECT id, user_id, consumption, file_content FROM " + category + "_bills WHERE verify_status = 'No' AND bill_month = ?";
                break;
            case "waste":
                sql = "SELECT id, user_id, days_produced, weight FROM waste_bills WHERE verify_status = 'No' AND bill_month = ?";
                break;
            case "cooking_oil":
                sql = "SELECT id, user_id, recycling_days, volume, file_content FROM cooking_oil_bills WHERE verify_status = 'No' AND bill_month = ?";
                break;
        }

        List<Map<String, Object>> unverifiedData = jdbcTemplate.queryForList(sql, month);
        mav.addObject("unverifiedData", unverifiedData);
        return mav;
    }

    @GetMapping("/admin/verify")
    public String verifyData(@RequestParam("id") int id, @RequestParam("category") String category, HttpServletRequest request, RedirectAttributes redirectAttributes) {
        String sql = "UPDATE " + category + "_bills SET verify_status = 'Yes' WHERE id = ?";
        try {
            jdbcTemplate.update(sql, id);
            redirectAttributes.addFlashAttribute("successMessage", "Data verified successfully.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Error verifying data: " + e.getMessage());
        }
        return "redirect:/admin/verify-upload?month=" + request.getParameter("month") + "&category=" + category;
    }
    
    @GetMapping("/admin/reject")
    public String rejectData(@RequestParam("id") int id, @RequestParam("category") String category, HttpServletRequest request, RedirectAttributes redirectAttributes) {
        String sql = "UPDATE " + category + "_bills SET verify_status = 'Rejected' WHERE id = ?";
        try {
            jdbcTemplate.update(sql, id);
            redirectAttributes.addFlashAttribute("successMessage", "Data rejected successfully.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Error rejecting data: " + e.getMessage());
        }
        return "redirect:/admin/verify-upload?month=" + request.getParameter("month") + "&category=" + category;
    }



    @GetMapping("/admin/generate-report")
    public ModelAndView showGenerateReportSidebar() {
        ModelAndView mav = new ModelAndView("Admin/generateReportSidebar");
        // Add objects to the model if needed
        return mav;
    }

    @RequestMapping("/admin/participants")
    public ModelAndView showViewParticipantsPage() {
        ModelAndView mav = new ModelAndView("Admin/viewParticipant");
        // Query to fetch participants where userLevel = 0
        String sql = "SELECT fullname, email, phoneNumber, address, households, buildingtype FROM user WHERE userLevel = 0";
        List<Map<String, Object>> participants = jdbcTemplate.queryForList(sql);

        // Add the retrieved data to the model
        mav.addObject("participants", participants);
        return mav;
    }

    // If you have a profile page, add this:
    @RequestMapping("/admin/profile")
    public ModelAndView showAdminProfile() {
        ModelAndView mav = new ModelAndView("Admin/adminProfile");
        // Add objects to the model if needed
        return mav;
    }

    @GetMapping("/admin/generateReport")
    public ModelAndView showGenerateReportPage() {
        ModelAndView mav = new ModelAndView("Admin/generateReport");
        List<String> months = Arrays.asList("January", "February", "March", "April", "May", 
        		"June", "July", "August", "September", "October", "November", "December");
        mav.addObject("months", months);
        
        return mav;
    }
    
    @GetMapping("/admin/downloadReport")
    public ModelAndView showDownloadReportPage() {
        ModelAndView mav = new ModelAndView("Admin/downloadReport");
        // Add objects to the model if needed
        return mav;
    }
    
    // If you have a logout functionality, add this:
//    @RequestMapping("/admin/logout")
//    public String logout(HttpServletRequest request) {
//        request.getSession().invalidate();
//        return "redirect:/login";
//    }
    
    @GetMapping("/admin/profile")
    public ModelAndView showAdminProfile(HttpServletRequest request) {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");
        ModelAndView mav = new ModelAndView("Admin/adminProfile");

        if (userId != null) {
            try {
                String sql = "SELECT * FROM user WHERE id = ?";
                Map<String, Object> user = jdbcTemplate.queryForMap(sql, userId);
                mav.addObject("user", user);
            } catch (Exception e) {
                mav.addObject("errorMessage", "Error retrieving user profile: " + e.getMessage());
            }
        } else {
            mav.addObject("errorMessage", "Session expired or user not found.");
        }
        return mav;
    }
    
    @GetMapping("/admin/editProfile")
    public ModelAndView showEditProfile(HttpServletRequest request) {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");
        ModelAndView mav = new ModelAndView("Admin/editProfile");

        if (userId != null) {
            try {
                String sql = "SELECT * FROM user WHERE id = ?";
                Map<String, Object> user = jdbcTemplate.queryForMap(sql, userId);
                mav.addObject("user", user);
            } catch (Exception e) {
                mav.addObject("errorMessage", "Error retrieving user profile for editing: " + e.getMessage());
            }
        } else {
            mav.addObject("errorMessage", "Session expired or user not found.");
        }
        return mav;
    }
    
    @PostMapping("/admin/updateProfile")
    public String updateProfile(@RequestParam Map<String, String> params, HttpServletRequest request, RedirectAttributes redirectAttributes) {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            redirectAttributes.addFlashAttribute("errorMessage", "Session expired. Please login again.");
            return "redirect:/login";
        }

        try {
            String sql = "UPDATE user SET email = ?, phoneNumber = ?, address = ?, households = ?, buildingtype = ? WHERE id = ?";
            jdbcTemplate.update(sql, params.get("email"), params.get("phoneNumber"), params.get("address"), Integer.parseInt(params.get("households")), params.get("buildingtype"), userId);
            redirectAttributes.addFlashAttribute("successMessage", "Profile updated successfully.");
            return "redirect:/admin/profile";
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Error updating profile: " + e.getMessage());
            return "redirect:/admin/editProfile";
        }
    }
    
    @GetMapping("/admin/generateMonthlyReport")
    public ModelAndView generateMonthlyReport(@RequestParam("selectedMonth") String selectedMonth) {
        ModelAndView mav = new ModelAndView("Admin/generateReport");
        mav.addObject("selectedMonth", selectedMonth);
        
        int countWater = 0;
        int countElectricity = 0;
        int countCookingOil = 0;
        int countWaste = 0;
        List<String> months = Arrays.asList("January", "February", "March", "April", "May",
        		"June", "July", "August", "September", "October", "November", "December");

        try {
            String sqlWater = "SELECT COUNT(*) FROM water_bills WHERE bill_month = ?";
            countWater = jdbcTemplate.queryForObject(sqlWater, Integer.class, selectedMonth);
        } catch (EmptyResultDataAccessException e) {
            countWater = 0;
        }

        try {
            String sqlElectricity = "SELECT COUNT(*) FROM electricity_bills WHERE bill_month = ?";
            countElectricity = jdbcTemplate.queryForObject(sqlElectricity, Integer.class, selectedMonth);
        } catch (EmptyResultDataAccessException e) {
            countElectricity = 0;
        }

        try {
            String sqlCookingOil = "SELECT COUNT(*) FROM cooking_oil_bills WHERE bill_month = ?";
            countCookingOil = jdbcTemplate.queryForObject(sqlCookingOil, Integer.class, selectedMonth);
        } catch (EmptyResultDataAccessException e) {
            countCookingOil = 0;
        }

        try {
            String sqlWaste = "SELECT COUNT(*) FROM waste_bills WHERE bill_month = ?";
            countWaste = jdbcTemplate.queryForObject(sqlWaste, Integer.class, selectedMonth);
        } catch (EmptyResultDataAccessException e) {
            countWaste = 0;
        }
        
        int total = countWater + countElectricity + countCookingOil + countWaste;
        mav.addObject("total", total);
        
        mav.addObject("countWater", countWater);
        mav.addObject("countElectricity", countElectricity);
        mav.addObject("countCookingOil", countCookingOil);
        mav.addObject("countWaste", countWaste);
        mav.addObject("months", months);

        return mav;
    }
}
