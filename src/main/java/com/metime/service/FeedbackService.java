package com.metime.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import com.metime.dao.Feedback;
import com.metime.dao.BookingsKey;
import com.metime.dao.User;
import com.metime.repository.FeedbackRepository;
import com.metime.repository.UserRepo;

@Service
public class FeedbackService {

    @Autowired
    private FeedbackRepository feedbackRepository;

    @Autowired
    private UserRepo userRepository;


	
	public Feedback saveReview(int ratings, String reviews) {
		String username = getCurrentUsername();
		User user = userRepository.findById(username).orElseThrow(() -> new RuntimeException("User not found"));

		Feedback feedback = new Feedback();
		feedback.setUser(user);
		feedback.setRatings(ratings);
		feedback.setReviews(reviews);
		System.out.println("Logged In USer : "+user);
		
		return feedbackRepository.save(feedback);
	}

	private String getCurrentUsername() {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			return ((UserDetails) principal).getUsername();
		} else {
			return principal.toString();
		}
	}

	public List<Feedback> getListofFeedback() {
		System.out.println(feedbackRepository.findAll());
		return feedbackRepository.findAll();
	}
	 
    
/*
 * public Feedback saveReview(Feedback feedback) { return feedback; }
 */
}
