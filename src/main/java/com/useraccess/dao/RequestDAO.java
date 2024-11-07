package com.useraccess.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.useraccess.model.Request;

public class RequestDAO {
	// Method to submit a new access request
	public boolean submitRequest(Request request) {
		String sql = "INSERT INTO requests (user_id, software_id, access_type, reason, status) VALUES (?, ?, ?, ?, ?)";

		try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

			stmt.setInt(1, request.getUserId());
			stmt.setInt(2, request.getSoftwareId());
			stmt.setString(3, request.getAccessType());
			stmt.setString(4, request.getReason());
			stmt.setString(5, "Pending");

			int rowsInserted = stmt.executeUpdate();
			return rowsInserted > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
}
