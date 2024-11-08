<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Auth Database</title>
</head>
<body>
<%
    String success = (String) request.getAttribute("success");
    String failed = (String) request.getAttribute("failed");

   if (success != null && !success.isEmpty()) {
%>
<script type="text/javascript">
    alert('<%= success %>');
</script>
<%
    }

     if (failed != null && !failed.isEmpty()) {
%>
<script type="text/javascript">
    alert('<%= failed %>');
</script>
<%
    }
%>

	<%@include file = "createSoftware.jsp" %>
</body>
</html>