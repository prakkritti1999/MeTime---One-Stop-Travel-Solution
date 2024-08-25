package com.metime.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.metime.dao.User;
import com.metime.service.UserService;



@Controller
@RequestMapping("/MeTime")
public class UserController {
	
	@Autowired UserService userServ;
	
	
	@PostMapping("/newUser")
	public ResponseEntity<String> register(@RequestParam("uname") String username, @RequestParam("pass") String password, @RequestParam String role) {
		
		
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		user.setRole(role);
		
		
		userServ.getUser(user);
		return ResponseEntity.ok("User Created");
	}
	
	@GetMapping("register")
	public String register() {
		//userServ.getUser(user);
		return "signUp";
	}
}
