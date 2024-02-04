package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user") // Base URL for all user-related pages
public class UserPageController {
	
	@Autowired
    private JdbcTemplate jdbcTemplate;
	
    // Mapping for the user's home page
    @RequestMapping("/home")
    public ModelAndView showUserHomePage() {
    	ModelAndView mav = new ModelAndView("User/HomePageUser");
        return mav; // Path to the JSP for the user home page
    }

    @GetMapping("/profile")
    public ModelAndView showUserProfile(HttpServletRequest request) {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");
        ModelAndView mav = new ModelAndView("User/userProfile");
        
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

    @RequestMapping("/dashboard")
    public ModelAndView showUserDashboard() {
    	ModelAndView mav = new ModelAndView("User/DashboardUser");
        return mav;
    }
    
    // Mapping for the user's upload page
    @RequestMapping("/upload")
    public ModelAndView showUserUpload() {
    	ModelAndView mav = new ModelAndView("User/ChooseMonth");
        return mav;
    }

    // Mapping for the user's about us page
    @RequestMapping("/aboutUs")
    public ModelAndView showAboutUs() {
    	ModelAndView mav = new ModelAndView("User/aboutUs");
        return mav; 
    }

    @RequestMapping("/logout")
    public String logoutUser(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate(); // Invalidate the session to logout the user
        }
        return "General/LogoutPage"; // Path to the JSP for the logout confirmation page
    }
    
    // Mapping for choosing the category of bill to upload
    @RequestMapping("/chooseCategory")
    public ModelAndView chooseCategory(@RequestParam(required = false) String month, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("User/ChooseCategory");
        HttpSession session = request.getSession();
        session.setAttribute("selectedMonth", month);
        return mav;
    }
    
    // Mapping for the upload water bill page
    @RequestMapping("/water")
    public ModelAndView showWaterUpload() {
    	ModelAndView mav = new ModelAndView("User/UploadWaterBill");
    	return mav;
    }
    
    // Mapping for the upload electricity bill page
    @RequestMapping("/electricity")
    public ModelAndView showElectricityUpload() {
    	ModelAndView mav = new ModelAndView("User/UploadElectricityBill");
    	return mav;
    }
    
    // Mapping for the upload waste bill page
    @RequestMapping("/waste")
    public ModelAndView showWasteUpload() {
    	ModelAndView mav = new ModelAndView("User/UploadWasteBill");
    	return mav;
    }
    
    // Mapping for the upload cooking oil recycling bill page
    @RequestMapping("/oil")
    public ModelAndView showOilUpload() {
    	ModelAndView mav = new ModelAndView("User/UploadCookingOilRecycling");
    	return mav;
    }

    @GetMapping("/editProfile")
    public ModelAndView showEditProfile(HttpServletRequest request) {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");
        ModelAndView mav = new ModelAndView("User/editProfile");

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
    
    @PostMapping("/updateProfile")
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
            return "redirect:/user/profile";
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Error updating profile: " + e.getMessage());
            return "redirect:/user/editProfile";
        }
    }
}
