package com.metime.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.metime.dao.Trips;

@Repository
public interface TripRepositoryJPA extends JpaRepository<Trips, String> {

	//@Query(value = "select * from trips where category = %")
	//Creating methods using the Domain Specific Queries Language (DSL) feature of JPA Repository
	List<Trips> findByCategoryContainingOrODContaining(String category, String OD);
}
