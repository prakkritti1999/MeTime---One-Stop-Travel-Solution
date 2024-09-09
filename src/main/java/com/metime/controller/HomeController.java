package com.metime.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.metime.dao.Feedback;
import com.metime.dao.Trips;
import com.metime.service.FeedbackService;
import com.metime.service.TripService;

@Controller
@RequestMapping("/MeTime/")
public class HomeController {

	
	
	@Autowired TripService tripServ;
	@Autowired FeedbackService feedbackServ;
	
	@GetMapping("home")
	public ModelAndView getAllTrips(ModelAndView model){
				
		List<Trips> getAllTrips = tripServ.getTrips();
		List<Feedback> allfeedbacks = feedbackServ.getListofFeedback();
		
		model.addObject("listofTrips", getAllTrips);
		model.addObject("userfeedbacks", allfeedbacks);
		
		model.setViewName("home");
		System.out.println("List of Trips---"+getAllTrips);
		return model;
	}
}



// Get the logged-in user's details
/*
 * Authentication auth = SecurityContextHolder.getContext().getAuthentication();
 * if (auth != null && auth.getPrincipal() instanceof UserDetails) { UserDetails
 * userDetails = (UserDetails) auth.getPrincipal();
 * model.addAttribute("username", userDetails.getUsername());
 * model.addAttribute("role", auth.getAuthorities().stream()
 * .map(grantedAuthority -> grantedAuthority.getAuthority())
 * .findFirst().orElse("ROLE_USER")); }
 * 
 */
