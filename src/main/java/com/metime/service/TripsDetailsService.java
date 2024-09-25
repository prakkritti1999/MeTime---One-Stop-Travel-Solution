package com.metime.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.metime.dao.TripDetails;
import com.metime.repository.TripsDetailsRepository;

@Service
public class TripsDetailsService {

	@Autowired TripsDetailsRepository tripsDetailsRepository;
	
	public List<TripDetails> getAllTripsDetails(){
		return tripsDetailsRepository.findAll();
	}
	
}
