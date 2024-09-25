package com.metime.controller;

import java.security.Principal;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import com.metime.repository.BookingRepository;
import com.metime.service.BookingsService;
import com.razorpay.RazorpayException;

@Controller
@RequestMapping("/MeTime/")
public class BookingsController {

	@Autowired BookingRepository bookingRepository;
	@Autowired BookingsService bookingsService;
	
	@PostMapping("createorder")
	public ResponseEntity<Map<String, String>> createAndSaveorder(@RequestBody Map<String, String> data, Principal principal) throws RazorpayException{
		
		Map<String, String> orderdata =	bookingsService.generateOrder(data);
		
		bookingsService.makeandsavePayment(orderdata, data, principal);
		System.out.println("orderdata==="+orderdata);
		return ResponseEntity.ok(orderdata);
	}	
}
