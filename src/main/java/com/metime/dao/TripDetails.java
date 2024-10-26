package com.metime.dao;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Table(name = "trip_details")
public class TripDetails {

	@Id @GeneratedValue(strategy = GenerationType.IDENTITY) private int id;
	
	@ManyToOne
	@JoinColumn(name = "trip_id")
	@JsonIgnore
	private Trips trip;
	
	private String imagePath;
	
	@Column(name = "description")
	private String desc;

	@Override
	public String toString() {
		return "TripDetails [id=" + id + ", trip=" + trip + ", imagePath=" + imagePath + ", desc=" + desc + "]";
	}
}
