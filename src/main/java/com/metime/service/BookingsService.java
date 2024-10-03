package com.metime.service;

import java.security.Principal;
import java.time.LocalDateTime;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.metime.dao.Bookings;
import com.metime.dao.BookingsKey;
import com.metime.repository.BookingRepository;
import com.metime.repository.TripRepositoryJPA;
import com.metime.repository.UserRepo;
import com.razorpay.Order;
import com.razorpay.RazorpayClient;
import com.razorpay.RazorpayException;

@Service
public class BookingsService {

	@Autowired
	BookingRepository bookingRepository;
	@Autowired
	TripRepositoryJPA tripRepositoryJPA;
	@Autowired
	UserRepo urepo;

	public Bookings getBookingByTripIdAndUsername(String tripid, String username) {
		BookingsKey key = new BookingsKey();
		key.setTripid(tripid);
		key.setUsername(username);
		return bookingRepository.findByBkey(key);
	}

	public Map<String, String> generateOrder(Map<String, String> data) throws RazorpayException {
		System.out.println("amount sent to the razorpay server by client===" + data);

		int amount = Integer.parseInt(data.get("amount").toString());
		var client = new RazorpayClient("rzp_test_ciwRhHLwsUuPyr", "BE1r7ZboZswyrHqfYGT1aMlS");
		JSONObject ob = new JSONObject();
		ob.put("amount", amount * 100);
		ob.put("currency", "INR");
		ob.put("receipt", "txn_235425");

		// creating new order
		System.out.println("ob.." + ob);
		Order order = client.orders.create(ob);
		System.out.println("order created===" + order);

		return Map.of("id", order.get("id"), "amount", order.get("amount").toString(), "currency",
				order.get("currency"), "status", order.get("status"), "receipt", order.get("receipt"));
	}

	public void makeandsavePayment(Map<String, String> orderdata, Map<String, String> data, Principal principal) {
		// saving bookings to the table in database
		BookingsKey bkey = new BookingsKey();
		bkey.setTripid((String) data.get("tripid"));
		bkey.setUsername(principal.getName());

		// Initialize and set Bookings entity
		Bookings bookings = new Bookings();

		bookings.setBkey(bkey); // Set the composite key
		bookings.setTrip(tripRepositoryJPA.findById(bkey.getTripid()).orElse(null));
		bookings.setUser(urepo.findByUsername(bkey.getUsername()));
		bookings.setAmount(Integer.parseInt(orderdata.get("amount").toString()) / 100);
		bookings.setOrder_id(orderdata.get("id"));
		bookings.setReceipt(orderdata.get("receipt"));
		bookings.setStatus(orderdata.get("status"));
		bookings.setBookingTime(LocalDateTime.now());
		
		bookingRepository.save(bookings);
	}

}
