package com.metime.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.metime.dao.Bookings;
import com.metime.repository.UserRepo;

@Service
public class EmailService {
	
	@Autowired JavaMailSender javam;
	@Autowired UserRepo userrepos;
	
	public void sendEmail(Bookings booking) {

		SimpleMailMessage message = new SimpleMailMessage();
		
		message.setFrom("metime@demomailtrap.com");
		//message.setTo(booking.getUser().getEmailId());
		message.setTo("prakriti.guptta@gmail.com");
		message.setSubject("Booking Confirmation: METIME");
		message.setText("Dear " + booking.getBkey().getUsername() + ",\n\n" +
	            "Thank you for booking with MeTime! Here are your booking details:\n" +
	            "Trip         : " + booking.getTrip().getTripId()+" - "+ booking.getTrip().getOD() + "\n" +
	            "Booking ID   : " + booking.getOrder_id() + "\n" +
	            "Receipt No.  : " + booking.getReceipt() + "\n"+
	            "Amount Paid  : ₹" + booking.getAmount() + "\n" +
	            "Booking Date : " + booking.getBookingTime() + "\n\n" +
	            "If you have any questions, feel free to contact us.\n" +
	            "Safe travels,\n" +
	            "The MeTime Team");
		
		javam.send(message);
	}
}
