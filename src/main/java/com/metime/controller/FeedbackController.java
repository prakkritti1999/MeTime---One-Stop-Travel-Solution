package com.metime.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.metime.service.FeedbackService;

@Controller
@RequestMapping("/MeTime/")
public class FeedbackController {
	
	@Autowired FeedbackService feedbackServ;

	
	  @PostMapping("feedback") 
	  public ResponseEntity<String>submitFeedback(@RequestParam int ratings, @RequestParam String review){
		  feedbackServ.saveReview(ratings, review);
	  
		  return ResponseEntity.ok("feedback Submitted"); 
	  }
	 
	/*
	 * @PostMapping("feedback") public ResponseEntity<String>
	 * submitFeedback(@RequestBody Feedback feedback){
	 * feedbackServ.saveReview(feedback); System.out.println("Controller called" +
	 * feedback);
	 * 
	 * return ResponseEntity.ok("feedback Submitted"); }
	 */
	  
	/*
	 * public ModelAndView getListofFeedback(ModelAndView model) {
	 * 
	 * List<Feedback> allfeedbacks = feedbackServ.getListofTrips();
	 * System.out.println(allfeedbacks); model.addObject("userfeedbacks",
	 * allfeedbacks); model.setViewName("home"); return model; }
	 * 
	 */
	  
	
}
