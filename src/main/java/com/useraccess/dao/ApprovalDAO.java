package com.useraccess.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.useraccess.model.Request;

public class ApprovalDAO {

	  public List<Request> getPendingRequests() throws SQLException {
	        String sql = "SELECT * FROM requests WHERE status = 'Pending'";
	        List<Request> requestList = new ArrayList<>();
	        try (Connection connection = DBConnection.getConnection();
	             PreparedStatement statement = connection.prepareStatement(sql);
	             ResultSet resultSet = statement.executeQuery();) {
	        	System.out.println(sql);
	            while (resultSet.next()) {
	                requestList.add(new Request(
	                        resultSet.getInt(1),
	                        resultSet.getInt(2),
	                        resultSet.getInt(3),
	                        resultSet.getString(4),
	                        resultSet.getString(5),
	                        resultSet.getString(6)
	                ));
	            }
	        }
	        return requestList;
	    }
	  
	  public boolean updateRequestStatus(int requestId, String status) throws SQLException {
	        String sql = "UPDATE requests SET status = ? WHERE id = ?";
	        try (Connection connection = DBConnection.getConnection();
	             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
	            preparedStatement.setString(1, status);
	            preparedStatement.setInt(2, requestId);
	            return preparedStatement.executeUpdate() > 0;
	        }
	    }

}
