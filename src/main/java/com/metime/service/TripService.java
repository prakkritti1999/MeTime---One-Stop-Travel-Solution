package com.metime.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.metime.dao.Trips;
import com.metime.repository.TripRepository;
import com.metime.repository.TripRepositoryJPA;

@Service
public class TripService {

	
	@Autowired TripRepository tripRepos;
	
	@Autowired TripRepositoryJPA tripReposJPA;
	
	public String saveTrips(Trips trips) {
		
		tripRepos.save(trips);
		return "Trip Saved";
	}
	
	
	public ArrayList<Trips> getTrips(){
		return tripRepos.findAll();
	}
	
	
	public List<Trips> searchByCategoryOrOD(String keyword){
		return tripReposJPA.findByCategoryContainingOrODContaining(keyword, keyword);
	}
	
	public String deletetrip(String tripId) {
		tripRepos.deleteById(tripId);
		return "deleted";
	}
	
	public String updateTrip(String id, String Od, String category, int charges) {
		tripRepos.updateById(id, Od, category, charges);
		return "updated";
	}
	
	public boolean isTripIdDuplicate(String tripId) {
        return tripReposJPA.findById(tripId).isPresent();  
    }

}