<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Page</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f7fc;
        margin: 0;
        padding: 0;
    }

    .container {
        width: 30%;
        margin: 50px auto;
        padding: 20px;
        background-color: #ffffff;
        border-radius: 8px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    }

    h1 {
        text-align: center;
        color: #4CAF50;
        margin-bottom: 30px;
        font-size: 24px;
    }

    label {
        display: block;
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
        box-sizing: border-box;
    }

    textarea {
        resize: vertical;
        height: 100px;
    }

    .checkbox-group {
        margin-bottom: 20px;
    }

    input[type="checkbox"] {
        margin-right: 10px;
    }

    input[type="submit"]
    {
        background-color: #4CAF50;
        color: white;
        border: none;
        padding: 10px;
        font-size: 14px;
        cursor: pointer;
        border-radius: 4px;
        transition: background-color 0.3s;
        width: 100%;
        margin-bottom: 10px; 
    }
    
    .back-button {
        background-color: #4CAF50;
        color: white;
        border: none;
        padding: 10px;
        font-size: 14px;
        cursor: pointer;
        border-radius: 4px;
        transition: background-color 0.3s;
        width: 140px;
        margin-bottom: 10px; 
    }

    input[type="submit"]:hover,
    .back-button:hover {
        background-color: #45a049;
    }

    .back-button {
        background-color: #007bff; 
    }

    .back-button:hover {
        background-color: #0056b3; 
    }

    .form-footer {
        text-align: center;
    }

</style>
</head>
<body>

    <div class="container">
        <h1>Create New Software</h1>
        <form action="createSoftware" method="post">
            <label for="softwareName">Software Name:</label>
            <input type="text" name="softwareName" id="softwareName" required><br>

            <label for="description">Description:</label>
            <textarea name="description" id="description"></textarea><br>

            <label>Access Levels:</label>
            <div class="checkbox-group">
                <input type="checkbox" name="accessLevels" value="Read"> Read<br>
                <input type="checkbox" name="accessLevels" value="Write"> Write<br>
                <input type="checkbox" name="accessLevels" value="Admin"> Admin<br>
            </div>

            <div class="form-footer">
                <input type="submit" value="Create Software">
                
            </div>
            <div>
            <button type="button" class="back-button" onclick="window.location.href='login.jsp'">Back to Login</button>
            </div>
        </form>
    </div>

</body>
</html>
