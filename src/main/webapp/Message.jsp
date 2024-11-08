<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
<h3 style="text-align: center; color: green">
<%
String msg = (String)request.getAttribute("message");
out.println(msg);
%>
</h3>
</div>
<div>
<%@include file = "login.jsp" %>
</div>
</body>
</html>