<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<h2>Sign up Form</h2>
<form action="signup" method="post">
    <label>Username:</label><input type="text" name="uName" required><br>
    <label>Password:</label><input type="password" name="pWord" required><br>
    <input type="submit" value="Sign up">
    <p>Already have an account<a href="login.jsp">Login</a></p>
</form>
</body>
</html>