package com.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
        ModelAndView mav = new ModelAndView("Admin/verificationPage"); // Change to your actual verification page view name
        mav.addObject("selectedMonth", month);
        mav.addObject("selectedCategory", category);
        // Perform the verification process or add necessary data to the model
        return mav;
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
        // Add objects to the model if needed
        return mav;
    }
    
    // If you have a logout functionality, add this:
    @RequestMapping("/admin/logout")
    public String logout(HttpServletRequest request) {
        request.getSession().invalidate();
        return "redirect:/login"; // or whatever your login page URL is
    }
}
