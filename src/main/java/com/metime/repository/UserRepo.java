package com.metime.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.metime.dao.User;

public interface UserRepo extends JpaRepository<User, String> {
	
	User findByUsername(String username);

}
