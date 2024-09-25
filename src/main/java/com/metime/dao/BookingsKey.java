package com.metime.dao;

import java.io.Serializable;

import jakarta.persistence.Embeddable;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@SuppressWarnings("serial")
@Setter
@Getter
@Embeddable
@RequiredArgsConstructor
public class BookingsKey implements Serializable {
	
	@Override
	public String toString() {
		return "BookingsKey [tripid=" + tripid + ", username=" + username + "]";
	}
	private String tripid;
	private String username;
}

