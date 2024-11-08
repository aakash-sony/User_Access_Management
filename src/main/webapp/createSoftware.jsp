<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Page</title>
<style>
    /* Reset and general styles */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: Arial, sans-serif;
        background-color: #f4f7fc;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        position: relative;
    }

    /* Top-right button styling */
    .role-button {
        position: absolute;
        top: 20px;
        right: 20px;
        width:140px;
        padding: 8px 16px;
        font-size: 14px;
        cursor: pointer;
        border: none;
        background-color: #4CAF50;
        color: white;
        border-radius: 4px;
    }

    .role-button:hover {
        background-color: #45a049;
    }

    /* Container styling */
    .container {
        width: 100%;
        max-width: 500px;
        background-color: #ffffff;
        padding: 30px;
        border-radius: 8px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        text-align: center;
    }

    h1 {
        color: #4CAF50;
        margin-bottom: 20px;
        font-size: 24px;
    }

    label {
        display: block;
        text-align: left;
        margin: 10px 0 5px;
        font-weight: bold;
        color: #333;
    }

    input[type="text"],
    textarea {
        width: 100%;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 4px;
        font-size: 14px;
        margin-bottom: 15px;
    }

    textarea {
        resize: vertical;
        height: 100px;
    }

    .checkbox-group {
        text-align: left;
        margin-bottom: 20px;
    }

    input[type="checkbox"] {
        margin-right: 8px;
    }

    /* Submit and back button styling */
    input[type="submit"],
    .back-button {
        width: 100%;
        padding: 10px;
        font-size: 14px;
        cursor: pointer;
        border-radius: 4px;
        border: none;
        color: white;
        transition: background-color 0.3s ease;
        margin-top: 10px;
    }

    input[type="submit"] {
        background-color: #4CAF50;
    }

    input[type="submit"]:hover {
        background-color: #45a049;
    }

    .back-button {
        background-color: #007bff;
        margin-top: 15px;
    }

    .back-button:hover {
        background-color: #0056b3;
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

    <!-- Main form container -->
    <div class="container">
        <h1>Create New Software</h1>
        <form action="createSoftware" method="post">
            <label for="softwareName">Software Name:</label>
            <input type="text" name="softwareName" id="softwareName" required>

            <label for="description">Description:</label>
            <textarea name="description" id="description"></textarea>

            <label>Access Levels:</label>
            <div class="checkbox-group">
                <input type="checkbox" name="accessLevels" value="Read"> Read<br>
                <input type="checkbox" name="accessLevels" value="Write"> Write<br>
                <input type="checkbox" name="accessLevels" value="Admin"> Admin<br>
            </div>

            <input type="submit" value="Create Software">
            <button type="button" class="back-button" onclick="window.location.href='login.jsp'">Back to Login</button>
        </form>
    </div>
</body>
</html>
