package com.metime.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.metime.dao.User;
import com.metime.repository.UserRepo;


@Service
public class UserService {

	
	@Autowired UserRepo urepo;
	private BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(12);   //used to encrypt the password using Bcrypt technique
	
	public User getUser(User user) {
		
		user.setPassword(encoder.encode(user.getPassword()));
		System.out.println("Encrypted Password --- "+ user.getPassword());
		
		return urepo.save(user);
	}

}
