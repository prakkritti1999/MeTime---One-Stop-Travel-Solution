package com.metime.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import com.metime.dao.Bookings;
import com.metime.service.BookingsService;
import com.metime.service.EmailService;

@Controller
@RequestMapping(path = "/MeTime/")
public class EmailController {

	@Autowired EmailService emailService;
	@Autowired BookingsService bookingsService;
	
	@PostMapping("sendConfirmationEmail")
	@ResponseBody
	public String sendConfirmationEmail(@RequestParam String tripId, Principal principal){
		Bookings bookings = bookingsService.getBookingByTripIdAndUsername(tripId, principal.getName());
		System.out.println("Principal"+principal);
		System.out.println("principal getname  "+principal.getName());
		System.out.println("email sent");
		System.out.println("Bookings Details  "+bookings);
		
		emailService.sendEmail(bookings);
		return "Email Sent";
	}
}
