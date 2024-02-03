package com.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
	
    @GetMapping("/admin/home")
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

    @RequestMapping("/admin/generate-report")
    public ModelAndView showGenerateReportPage() {
        ModelAndView mav = new ModelAndView("Admin/generateReportSidebar");
        // Add objects to the model if needed
        return mav;
    }

    @RequestMapping("/admin/participants")
    public ModelAndView showViewParticipantsPage() {
        ModelAndView mav = new ModelAndView("Admin/viewParticipant");
        // Add objects to the model if needed
        return mav;
    }

    // If you have a logout functionality, add this:
    @RequestMapping("/admin/logout")
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
}
