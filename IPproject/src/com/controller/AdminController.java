package com.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {

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

    // If you have a profile page, add this:
    @GetMapping("/admin/profile")
    public ModelAndView showAdminProfile() {
        ModelAndView mav = new ModelAndView("Admin/adminProfile");
        // Add objects to the model if needed
        return mav;
    }

    // If you have a logout functionality, add this:
    @GetMapping("/admin/logout")
    public String logout(HttpServletRequest request) {
        request.getSession().invalidate();
        return "redirect:/login"; // or whatever your login page URL is
    }
}
