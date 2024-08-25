package com.metime.dao;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
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
	public String getTripId() {
		return tripId;
	}
	public void setTripId(String tripId) {
		this.tripId = tripId;
	}
	public String getOD() {
		return OD;
	}
	public void setOD(String oD) {
		OD = oD;
	}
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getCharges() {
		return charges;
	}
	public void setCharges(int charges) {
		this.charges = charges;
	}
	public Trips(String tripId, String oD, String duration, Date startDate, Date endDate, String category,
			int charges) {
		super();
		this.tripId = tripId;
		OD = oD;
		this.duration = duration;
		this.startDate = startDate;
		this.endDate = endDate;
		this.category = category;
		this.charges = charges;
	}
	public Trips() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Trips [tripId=" + tripId + ", OD=" + OD + ", duration=" + duration + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", category=" + category + ", charges=" + charges + "]";
	}
}
