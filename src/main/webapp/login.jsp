<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Form</title>
</head>
<style>
* {
  box-sizing: border-box;
}

body {
  font-family: Arial, sans-serif;
  background-color: #f4f4f4;
  margin: 0;
  padding: 0;
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
}

.container {
  background-color: white;
  padding: 20px;
  border-radius: 5px;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.login-form {
  display: flex;
  flex-direction: column;
}

.form-group {
  margin-bottom: 15px;
}

label {
  margin-bottom: 5px;
  font-weight: bold;
}

input {
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 3px;
}

button {
  padding: 10px;
  background-color: #5cb85c;
  color: white;
  border: none;
  border-radius: 3px;
  cursor: pointer;
}

button:hover {
  background-color: #4cae4c;
}

.signup-prompt {
  margin-top: 15px;
  text-align: center;
}

.signup-prompt a {
  color: #5cb85c;
  text-decoration: none;
}

.signup-prompt a:hover {
  text-decoration: underline;
}

</style>
<body>
    <div class="container">
      <form action="login" method="post" class="login-form">
        <h2>Login</h2>
        <div class="form-group">
          <label for="username">Username</label>
          <input type="text" id="username" name="uName" required />
        </div>
        <div class="form-group">
          <label for="password">Password</label>
          <input type="password" id="password" name="pWord" required />
        </div>
        <button type="submit">Login</button>
      </form>
      <p class="signup-prompt">
        Don't have an account? <a href="signup.jsp">Sign up</a>
      </p>
    </div>
  </body>
</html>