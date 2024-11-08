<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Auth database</title>
</head>
<body>
<%
String msg = (String) request.getAttribute("message");
if (msg != null && !msg.isEmpty()) {
%>
<script type="text/javascript">
  alert('<%= msg %>');
</script>
<%
}
%>
<%@include file = "login.jsp" %>

</body>
</html>
