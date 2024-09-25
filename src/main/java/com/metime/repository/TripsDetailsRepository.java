package com.metime.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.metime.dao.TripDetails;

@Repository
public interface TripsDetailsRepository extends JpaRepository<TripDetails, Integer>{
	
}
