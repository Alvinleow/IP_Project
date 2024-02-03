package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user") // Base URL for all user-related pages
public class UserPageController {
	
	@Autowired
    private JdbcTemplate jdbcTemplate;
	
    // Mapping for the user's home page
    @GetMapping("/home")
    public String showUserHomePage() {
        return "User/homepageuser"; // Path to the JSP for the user home page
    }

    @GetMapping("/profile")
    public ModelAndView showUserProfile(HttpServletRequest request) {
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

    // Mapping for the user's dashboard
    @GetMapping("/dashboard")
    public String showUserDashboard() {
        return "User/userDashboard"; // Path to the JSP for the user dashboard
    }

    // Mapping for the user's settings page
    @GetMapping("/settings")
    public String showUserSettings() {
        return "User/userSettings"; // Path to the JSP for the user settings page
    }

    // Mapping for the logout process
    @GetMapping("/logout")
    public String logoutUser(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate(); // Invalidate the session to logout the user
        }
        return "redirect:/logoutPage"; // Redirect to the logout page
    }

    // Additional methods can be added here for other user pages...

}
