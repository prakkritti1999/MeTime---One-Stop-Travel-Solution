package com.metime.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DBConnection {

	 private static final String URL = "jdbc:mysql://localhost:3306/cris";
	    private static final String USER = "root";
	    private static final String PASSWORD = "admin";

	    public static Connection getConnection() throws SQLException {
	        try {
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            System.out.println("Connected to Database !!!");
	        } catch (ClassNotFoundException e) {
	            throw new SQLException("MySQL Driver not found", e);
	        }
	        return DriverManager.getConnection(URL, USER, PASSWORD);
	    }
}
