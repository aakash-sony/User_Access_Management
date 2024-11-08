<%@page import="netscape.javascript.JSObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.useraccess.dao.SoftwareDAO"%>
<%@ page import="com.useraccess.model.Software"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Request Access Form</title>
<style>
    body {
        font-family: Arial, sans-serif;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
        background-color: #f4f4f4;
        position: relative;  /* Add relative positioning to body */
    }

    .container {
        background-color: white;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        width: 300px;
    }

    .form-group {
        margin-bottom: 15px;
    }

    label {
        display: block;
        margin-bottom: 5px;
    }

    select, input[type="text"], input[type="password"], textarea {
        width: 100%;
        padding: 8px;
        box-sizing: border-box;
    }

    button {
        width: 100%;
        padding: 10px;
        background-color: #28a745;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        margin-bottom: 10px;
    }

    button:hover {
        background-color: #218838;
    }

    .back-button {
        width: 140px;
        background-color: #007bff; /* Blue color for back button */
    }

    .back-button:hover {
        background-color: #0056b3; /* Darker blue on hover */
    }

    /* Styling for the role button at the top-right */
    .role-button {
        position: absolute;
        top: 20px;
        right: 20px;
        padding: 8px 16px;
        font-size: 14px;
        cursor: pointer;
        border: none;
        background-color: #4CAF50;
        color: white;
        border-radius: 4px;
    }
</style>
</head>
<body>
    <% 
        String role = (String) session.getAttribute("role");
        String buttonText = "Login as " + (role != null ? role : "Guest");
    %>
    
    <!-- Top-right role button -->
    <button class="role-button"><%= buttonText %></button>

    <div class="container">
        <form action="requestAccess" method="post" class="request-form">
            <h2>Request for Software</h2>

            <div class="form-group">
                <label for="software">Select Software</label>
                <select id="software" name="softwareId" required onchange="updateAccessTypes()">
                    <option value="" disabled selected>Select Software</option>
                    <%
                    SoftwareDAO softwareDAO = new SoftwareDAO();
                    List<Software> softwareList = null;

                    try {
                        softwareList = softwareDAO.getAllSoftware();
                    } catch (Exception e) {
                        out.println("Error fetching software: " + e.getMessage());
                    }

                    if (softwareList != null) {
                        for (Software software : softwareList) {
                            String accessTypes = String.join(",", software.getAccessLevels());
                    %>
                    <option value="<%= software.getId() %>" data-access-types="<%= accessTypes %>">
                        <%= software.getName() %>
                    </option>
                    <%
                        }
                    } else {
                    %>
                    <option value="">No software available</option>
                    <%
                    }
                    %>
                </select>
            </div>

            <div class="form-group">
                <label for="access-type">Access Type</label>
                <select id="access-type" name="accessType" required>
                    <option value="" disabled selected>Select Access Type</option>
                </select>
            </div>

            <div class="form-group">
                <label for="reason">Reason</label>
                <textarea id="reason" name="reason" required></textarea>
            </div>

            <button type="submit">Submit Request</button>
            <button type="button" class="back-button" onclick="window.location.href='login.jsp'">Back to Login</button>
        </form>
    </div>

    <script>
        function updateAccessTypes() {
            var softwareSelect = document.getElementById("software");
            var accessTypeSelect = document.getElementById("access-type");

            // Clear the existing options in the access-type dropdown
            accessTypeSelect.innerHTML = '<option value="" disabled selected>Select Access Type</option>';

            // Get selected software's access types from the data attribute
            var selectedOption = softwareSelect.options[softwareSelect.selectedIndex];
            var accessTypes = selectedOption.getAttribute("data-access-types");

            if (accessTypes) {
                // Split the access types and add each as an option
                accessTypes.split(",").forEach(function(type) {
                    var option = document.createElement("option");
                    option.value = type;
                    option.text = type;
                    accessTypeSelect.appendChild(option);
                });
            }
        }
    </script>
</body>
</html>
