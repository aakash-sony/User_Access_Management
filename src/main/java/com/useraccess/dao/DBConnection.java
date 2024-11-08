package com.useraccess.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	// Database URL, username, and password
	private static final String URL = "jdbc:postgresql://localhost:5432/auth_db";
	private static final String USER = "postgres";
	private static final String PASSWORD = "root";

	public static Connection getConnection() throws SQLException {
		Connection connection = null;
		try {
			// Register the PostgreSQL JDBC driver

			Class.forName("org.postgresql.Driver");

			// Create a connection to the database
			connection = DriverManager.getConnection(URL, USER, PASSWORD);

		} catch (ClassNotFoundException e) {
			System.out.println("PostgreSQL JDBC Driver not found.");
			e.printStackTrace();
		}
		return connection;
	}

}
