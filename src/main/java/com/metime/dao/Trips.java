package com.metime.dao;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Trips {

	@Id
	@Column(name = "TripId")
	private String tripId;
	
	@JsonProperty("OD")
	@Column(name="source_destination")
	private String OD;
	
	private String duration;
	
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy")
    @Column(name = "Start_Date")
    private Date startDate;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy")
    @Column(name = "End_Date")
    private Date endDate;
	
	
	private String category;
	private int charges;
	
	@Override
	public String toString() {
		return "Trips [tripId=" + tripId + ", OD=" + OD + ", duration=" + duration + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", category=" + category + ", charges=" + charges + "]";
	}
}
