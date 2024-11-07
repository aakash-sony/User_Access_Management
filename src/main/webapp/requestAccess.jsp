<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.useraccess.dao.SoftwareDAO" %>
    <%@ page import="com.useraccess.model.Software" %>
    <%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="requestAccess" method="post">
    <label>Software:</label><select name="softwareId" required>
     <option value="" disabled selected>Select...</option> 
          <% 
                SoftwareDAO softwareDAO = new SoftwareDAO();
                List<Software> softwareList = null;

                try {
                    // Get the software list from the database
                    softwareList = softwareDAO.getAllSoftware();
                } catch (Exception e) {
                    out.println("Error fetching software: " + e.getMessage());
                }

                // Loop through the software list and create the options
                if (softwareList != null) {
                    for (Software software : softwareList) {
            %>
                        <option value="<%= software.getId() %>"><%= software.getName() %></option>
            <%
                    }
                } else {
            %>
                    <option value="">No software available</option>
            <%
                }
            %>
    </select><br>
    <label>Access Type:</label><select name="accessType" required>
         <option value="" disabled selected>Select...</option> 
        <option value="Read">Read</option>
        <option value="Write">Write</option>
        <option value="Admin">Admin</option>
    </select><br>
    <label>Reason:</label><textarea name="reason" required></textarea><br>
    <input type="submit" value="Submit Request">
</form>
</body>
</html>