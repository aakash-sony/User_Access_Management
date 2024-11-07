<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>Login Form</h2>
<form action="login" method="post">
Username: <input type="text" name="uName" required><br/>
Password: <input type="password" name="pWord" required><br/>
<input type="submit" value="Login">
<p>Don't have an account ? <a href="signup.jsp">Click Here</a></p>
</form>
</body>
</html>