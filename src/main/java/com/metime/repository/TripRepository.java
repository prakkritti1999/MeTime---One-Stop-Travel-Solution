package com.metime.repository;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.metime.connection.DBConnection;
import com.metime.dao.Trips;

@Repository
public class TripRepository {

	
	//Method to save/add a trip
	public void save(Trips trips) {
		
		String sql = "INSERT INTO trips (category,duration,source_destination,trip_id,charges, start_date, end_date) values (?,?,?,?,?,?,?)";
		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			
			int count = 1;
			ps.setString(count++, trips.getCategory());
			ps.setString(count++, trips.getDuration());
			ps.setString(count++, trips.getOD());
			ps.setString(count++, trips.getTripId());
			ps.setInt(count++, trips.getCharges());
	        ps.setDate(count++, new Date(trips.getStartDate().getTime()));
	        ps.setDate(count++, new Date(trips.getEndDate().getTime()));
	        
	        ps.executeUpdate();
		}
		catch (Exception e) {
			// TODO: handle exception
			System.out.println("SOMETHING WENT WRONG!!-------" +e.getMessage());
		}
		
	}
	
	
	public ArrayList<Trips> findAll(){
		
		String sql = "Select * from trips";
		
		ArrayList<Trips> arrayTrips = new ArrayList<Trips>();
		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			
			
			ResultSet rs= ps.executeQuery();
			
			while(rs.next()) {
				Trips trips = new Trips();
				trips.setCategory(rs.getString("category"));
				trips.setCharges(rs.getInt("charges"));
				trips.setDuration(rs.getString("duration"));
				trips.setEndDate(rs.getDate("end_date"));
				trips.setStartDate(rs.getDate("start_date"));
				trips.setOD(rs.getString("source_destination"));
				trips.setTripId(rs.getString("trip_id"));
				
				arrayTrips.add(trips);
			}
		}
		catch (Exception e) {
			// TODO: handle exception
			System.out.println("SOMETHING WENT WRONG!!----" + e.getMessage());
		}
		return arrayTrips;
	}
	
	
	public void deleteById(String tripId) {

		String sql = "DELETE FROM trips where trip_id = ?";
		try {			
			Connection conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, tripId);
			
			int rowsdeleted = ps.executeUpdate();
			
			if(rowsdeleted > 0) {
				System.out.println("Trip Id: " + tripId+ " was deleted");
			}
			else {
				System.out.println("Id not found!!");
			}
		}
		catch (Exception e) {
			// TODO: handle exception
			System.out.println("something went wrong!!"+e.getMessage());
		}
	}
	
	public void updateById(String tripId, String OD, String category, int charges) {
		
		
		String sql = "update trips set source_destination = ? , category = ?, charges = ? where trip_id = ?";
		try {			
			Connection conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			
			int count =1;
			
			ps.setString(count++, OD);
			ps.setString(count++, category);
			ps.setInt(count++, charges);

			ps.setString(count++, tripId);
			
			int rowsupdated = ps.executeUpdate();
			
			if(rowsupdated > 0) {
				System.out.println("Trip Id: " + tripId+ " was updated");
			}
			else {
				System.out.println("Id not found!!");
			}
		}
		catch (Exception e) {
			// TODO: handle exception
			System.out.println("something went wrong!!"+e.getMessage());
		}
	}
}
