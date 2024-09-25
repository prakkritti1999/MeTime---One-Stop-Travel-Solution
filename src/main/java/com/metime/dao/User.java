package com.metime.dao;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Entity
@RequiredArgsConstructor
@Getter
@Setter
public class User {

	@Id
	private String username;
	private String password;
	private String role;
	private String emailId;
	@Override
	public String toString() {
		return "User [username=" + username + ", password=" + password + ", role=" + role + ", emailId=" + emailId
				+ "]";
	}
}
