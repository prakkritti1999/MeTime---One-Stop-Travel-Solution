package com.metime.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.metime.dao.User;
import com.metime.service.UserService;

@Controller
@RequestMapping("/MeTime/")
public class UserController {
	
	@Autowired UserService userServ;
	
	@PostMapping("newUser")
	public ResponseEntity<String> register(@RequestBody User user) {
		
		
		if (userServ.isUserNameDuplicate(user.getUsername())) {
	        return ResponseEntity.status(HttpStatus.CONFLICT).body("Duplicate Username");
	    }
		
		userServ.saveUser(user);
		return ResponseEntity.ok("User Created");
	}
	
	@GetMapping("register")
	public ModelAndView register(ModelAndView model) {
		model.setViewName("signUp");
		return model;
	}
}
