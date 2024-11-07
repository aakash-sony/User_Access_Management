package com.useraccess.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.useraccess.model.Users;

public class UserDAO {

	public boolean register(Users users) {
		String sql = "INSERT INTO users (username, password, role) VALUES (?, ?, ?)";

		int rowInserted = 0;
		try (Connection conn = DBConnection.getConnection();
				PreparedStatement stmt = conn.prepareStatement(sql)) {

			stmt.setString(1, users.getUsername());
			stmt.setString(2, users.getPassword());
			stmt.setString(3, users.getRole() != null ? users.getRole() : "Employee"); // Default role is "Employee" if
																						// not set
			rowInserted = stmt.executeUpdate();
			return rowInserted > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public Users login(String username, String password) {
		String sql = "SELECT * FROM users WHERE username = ? AND password = ?";

		Users users = null;
		try (Connection conn = DBConnection.getConnection();
				PreparedStatement stmt = conn.prepareStatement(sql)) {

			stmt.setString(1, username);
			stmt.setString(2, password);

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				users = new Users();
				users.setId(rs.getInt(1));
				users.setUsername(rs.getString(2));
				users.setPassword(rs.getString(3));
				users.setRole(rs.getString(4));

				return users;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return users;
	}
}
