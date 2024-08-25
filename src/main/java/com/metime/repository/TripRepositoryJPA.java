package com.metime.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.metime.dao.Trips;

public interface TripRepositoryJPA extends JpaRepository<Trips, String> {

	//@Query(value = "select * from trips where category = %")
	List<Trips> findByCategoryContainingOrODContaining(String category, String OD);
}
