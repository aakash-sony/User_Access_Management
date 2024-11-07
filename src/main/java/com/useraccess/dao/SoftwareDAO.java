package com.useraccess.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.useraccess.model.Software;

public class SoftwareDAO {
	public boolean addSoftware(Software software) throws SQLException {
		String query = "INSERT INTO software (name, description, access_levels) VALUES (?, ?, ?)";
		try (Connection connection = DBConnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(query)) {
			preparedStatement.setString(1, software.getName());
			preparedStatement.setString(2, software.getDescription());
			preparedStatement.setArray(3, connection.createArrayOf("text", software.getAccessLevels()));
			return preparedStatement.executeUpdate() > 0;
		}
	}

	public List<Software> getAllSoftware() throws SQLException {
		String sql = "SELECT * FROM software";
		List<Software> softwareList = new ArrayList<>();
		try (Connection connection = DBConnection.getConnection();
				PreparedStatement statement = connection.prepareStatement(sql);
				ResultSet resultSet = statement.executeQuery();) {
			while (resultSet.next()) {
				softwareList.add(new Software(resultSet.getInt("id"), resultSet.getString("name"),
						resultSet.getString("description"), (String[]) resultSet.getArray("access_levels").getArray()));
			}
		}
		return softwareList;
	}

}
