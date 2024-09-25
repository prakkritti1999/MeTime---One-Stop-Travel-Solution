package com.metime.dao;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.MapsId;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@RequiredArgsConstructor
public class Bookings {
	
	@EmbeddedId
	private BookingsKey bkey;
	
	@JoinColumn(name = "trip_id")
	@ManyToOne
	@MapsId("tripid")
	private Trips trip;
	
	@ManyToOne
	@MapsId("username")
	@JoinColumn(name = "username")
	private User user;
	
	@Column(name = "booking_status")
	private String status;
	
	private String order_id;
	private Integer amount;
	private String receipt;
	
	@Column(name = "booking_time")
	private LocalDateTime bookingTime;

	@Override
	public String toString() {
		return "Bookings [bkey=" + bkey + ", trip=" + trip + ", user=" + user + ", status=" + status + ", order_id="
				+ order_id + ", amount=" + amount + ", receipt=" + receipt + ", bookingTime=" + bookingTime + "]";
	}
}
