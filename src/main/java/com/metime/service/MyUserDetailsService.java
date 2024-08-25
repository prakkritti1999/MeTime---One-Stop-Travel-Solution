package com.metime.service;

import java.util.Collections;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.metime.dao.User;
import com.metime.repository.UserRepo;


@Service
public class MyUserDetailsService implements UserDetailsService{

	
	@Autowired private UserRepo repo;
	
	/*
	 * @Override public UserDetails loadUserByUsername(String username) throws
	 * UsernameNotFoundException {
	 * 
	 * User user = repo.findByUsername(username);
	 * 
	 * if(user == null) { System.out.println("User 404"); throw new
	 * UsernameNotFoundException("User 404"); }
	 * 
	 * return new UserPrincipal(user);
	 * 
	 * }
	 */
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = repo.findById(username)
                .orElseThrow(() -> new UsernameNotFoundException("User not found"));

        GrantedAuthority authority = new SimpleGrantedAuthority("ROLE_" + user.getRole());

        return new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(), Collections.singletonList(authority));
    }
	
}
