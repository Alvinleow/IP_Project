package com.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {
	
	@Autowired
    private JdbcTemplate jdbcTemplate;
	
    @GetMapping("/admin/home")
    public ModelAndView showAdminHomePage() {
        ModelAndView mav = new ModelAndView("Admin/adminHomePage");
        // You can add objects that you want to pass to the view here
        // mav.addObject("attributeName", attributeValue);
        return mav;
    }

    @GetMapping("/admin/dashboard")
    public ModelAndView showAdminDashboard() {
        ModelAndView mav = new ModelAndView("Admin/adminDashboard");
        // Add objects to the model if needed
        return mav;
    }

    @GetMapping("/admin/generate-report")
    public ModelAndView showGenerateReportPage() {
        ModelAndView mav = new ModelAndView("Admin/generateReportSidebar");
        // Add objects to the model if needed
        return mav;
    }

    @GetMapping("/admin/participants")
    public ModelAndView showViewParticipantsPage() {
        ModelAndView mav = new ModelAndView("Admin/viewParticipant");
        // Add objects to the model if needed
        return mav;
    }

    @GetMapping("/admin/logout")
    public String logout(HttpServletRequest request) {
        request.getSession().invalidate();
        return "redirect:/login";
    }
    
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
}
