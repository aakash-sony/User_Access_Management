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
	        String sql = "select u.username, s.name, r.id, r.reason, r.access_type from requests r join software s on \r\n"
	        		+ "r.software_id = s.id join users u on u.id = r.user_id WHERE r.status = 'Pending'";
	        List<Request> requestList = new ArrayList<>();
	        try (Connection connection = DBConnection.getConnection();
	             PreparedStatement statement = connection.prepareStatement(sql);
	             ResultSet resultSet = statement.executeQuery();) {
	        	System.out.println(sql);
	            while (resultSet.next()) {
	                requestList.add(new Request(
	                        resultSet.getInt(3),
	                        resultSet.getString(1),
	                        resultSet.getString(5),
	                        resultSet.getString(4),
	                        resultSet.getString(2)
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
