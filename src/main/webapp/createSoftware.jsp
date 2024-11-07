<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="createSoftware" method="post">
    <label>Software Name:</label><input type="text" name="softwareName" required><br>
    <label>Description:</label><textarea name="description"></textarea><br>
    <label>Access Levels:</label><br>
    <input type="checkbox" name="accessLevels" value="Read"> Read<br>
    <input type="checkbox" name="accessLevels" value="Write"> Write<br>
    <input type="checkbox" name="accessLevels" value="Admin"> Admin<br>
    <input type="submit" value="Create Software">
</form>
</body>
</html>