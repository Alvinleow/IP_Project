package com.controller;

import java.sql.PreparedStatement;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class UserManageController {
	
	@Autowired
    private JdbcTemplate jdbcTemplate;
	
	@RequestMapping("/")
    public String defaultPageRedirect() {
        return "redirect:/login";
    }

	@GetMapping("/login")
	public String showLoginForm() {
		return "General/loginPage";
	}
	
	@PostMapping("/login")
	public String processLoginForm(@RequestParam String username, 
	                               @RequestParam String password, 
	                               RedirectAttributes redirectAttributes, 
	                               HttpServletRequest request) {
	    
	    String sql = "SELECT password, userLevel FROM user WHERE username = ?";
	    
	    try {
	        Map<String, Object> user = jdbcTemplate.queryForMap(sql, username);
	        
	        if (password.equals(user.get("password"))) {
	        	
	            HttpSession session = request.getSession();
	            session.setAttribute("userId", user.get("id"));
	            session.setAttribute("username", username);
	            session.setAttribute("userLevel", user.get("userLevel"));

	            if ((int) user.get("userLevel") == 0) {
	            	
	                return "redirect:/userHomePage";
	            } else if ((int) user.get("userLevel") == 1) {
	            	
	                return "redirect:/adminHomePage";
	            }
	            
	        } else {
	        	
	            redirectAttributes.addFlashAttribute("error", "The username or password is incorrect.");
	            return "redirect:/login";
	        }
	    } catch (EmptyResultDataAccessException e) {
	    	
	        redirectAttributes.addFlashAttribute("error", "This username is not registered yet.");
	        return "redirect:/login";
	    } catch (Exception e) {
	    	
	        redirectAttributes.addFlashAttribute("error", "An error occurred. Please try again.");
	        return "redirect:/login";
	    }

	    // Fallback for other scenarios
	    redirectAttributes.addFlashAttribute("error", "An unexpected error occurred.");
	    return "redirect:/login";
	}
	
	@GetMapping("/adminHomePage")
	public String showAdminHomePage() {
		return "Admin/adminHomePage";
	}
	
	
    
    @RequestMapping("/register")
    public ModelAndView showRegistrationForm() {
        return new ModelAndView("General/registerPage1");
    }

    @PostMapping("/register")
    public String processRegistration1(@RequestParam String fullname,
                                       @RequestParam String address,
                                       @RequestParam Integer households,
                                       @RequestParam String buildingtype,
                                       RedirectAttributes redirectAttributes,
                                       HttpServletRequest request) {
        String sql = "INSERT INTO user (fullname, address, households, buildingtype) VALUES (?, ?, ?, ?)";

        KeyHolder keyHolder = new GeneratedKeyHolder();

        jdbcTemplate.update(connection -> {
            PreparedStatement ps = connection.prepareStatement(sql, new String[] {"id"});
            ps.setString(1, fullname);
            ps.setString(2, address);
            ps.setInt(3, households);
            ps.setString(4, buildingtype);
            return ps;
        }, keyHolder);

        Number key = keyHolder.getKey();
        if (key != null) {
            int generatedId = key.intValue();
            HttpSession session = request.getSession();
            session.setAttribute("userId", generatedId);
        } else {
        	
        }

        return "redirect:/register2";
    }
    
    @GetMapping("/register2")
    public String showRegistration2() {
        return "General/registerPage2";
    }

    @PostMapping("/registerProcess2")
    public String processRegistration2(@RequestParam String email,
                                       @RequestParam String phoneNumber,
                                       HttpServletRequest request,
                                       RedirectAttributes redirectAttributes) {
    	
    	HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");
        if (userId == null) {
            return "redirect:/register";
        }
    	
        String sql = "UPDATE user SET email=?, phoneNumber=? WHERE id=?";

        jdbcTemplate.update(sql, email, phoneNumber, userId);

        return "redirect:/register3";
    }
    
    @GetMapping("/register3")
    public String showRegistration3() {
        return "General/registerPage3";
    }

    @PostMapping("/registerProcess3")
    public String processRegistration3(@RequestParam String username,
                                       @RequestParam String password,
                                       HttpServletRequest request,
                                       RedirectAttributes redirectAttributes,
                                       Model model) {
    	
    	HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");
        if (userId == null) {
            return "redirect:/register";
        }
    	
        String sql = "UPDATE user SET username=?, password=? WHERE id=?";

        jdbcTemplate.update(sql, username, password, userId);

        return "redirect:/registerSuccess";
    }

    @GetMapping("/registerSuccess")
    public String showRegistrationSuccess() {
        return "General/registerSuccessful";
    }
    
    @GetMapping("/logout")
	public String logout(HttpServletRequest request) {
	    HttpSession session = request.getSession(false); // false means: don't create if it doesn't exist
	    if (session != null) {
	        session.invalidate(); // this will clear the session
	    }
	    return "General/logoutPage"; // display the logout confirmation page
	}

}
