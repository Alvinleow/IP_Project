package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user") // Base URL for all user-related pages
public class UserPageController {

    // Mapping for the user's home page
    @GetMapping("/home")
    public String showUserHomePage() {
        return "views/User/homepageuser"; // Path to the JSP for the user home page
    }

    // Mapping for the user's profile page
    @GetMapping("/profile")
    public String showUserProfile() {
        return "views/User/userProfile"; // Path to the JSP for the user profile page
    }

    // Mapping for the user's dashboard
    @GetMapping("/dashboard")
    public String showUserDashboard() {
        return "views/User/userDashboard"; // Path to the JSP for the user dashboard
    }

    // Mapping for the user's settings page
    @GetMapping("/settings")
    public String showUserSettings() {
        return "views/User/userSettings"; // Path to the JSP for the user settings page
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
