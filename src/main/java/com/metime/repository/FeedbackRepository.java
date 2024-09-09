package com.metime.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.metime.dao.Feedback;

public interface FeedbackRepository extends JpaRepository<Feedback, Long> {
	

}
