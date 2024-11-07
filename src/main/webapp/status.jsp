<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String success = (String) request.getAttribute("success");
	String failed = (String) request.getAttribute("failed");
	
	if(success != null)
	{
		out.println(success);
	}
	if(failed != null)
	{
		out.println(failed);
	}
	%>
	<%@include file = "createSoftware.jsp" %>
</body>
</html>