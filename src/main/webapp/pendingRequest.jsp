<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.useraccess.model.Request"%>
<%@ page import="com.useraccess.dao.ApprovalDAO"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Pending Access Requests</title>
</head>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f4f7fc;
	color: #333;
	text-align: center;
}

.container {
	width: 80%;
	margin: 20px auto;
	padding: 20px;
	background-color: #ffffff;
	border-radius: 8px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

h2 {
	text-align: center;
	color: #4CAF50;
	margin-bottom: 20px;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

th, td {
	padding: 12px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

th {
	background-color: #4CAF50;
	color: white;
}

td {
	background-color: #f9f9f9;
}

tr:nth-child(even) td {
	background-color: #f1f1f1;
}

tr:hover td {
	background-color: #e9e9e9;
}

.no-requests {
	text-align: center;
	color: #888;
	font-style: italic;
}

form {
	display: inline-block;
	margin-right: 10px;
}

input[type="submit"] {
	padding: 8px 16px;
	font-size: 14px;
	cursor: pointer;
	border: none;
	border-radius: 4px;
	margin-top: 5px;
	transition: background-color 0.3s ease;
}

input[name="action"][value="Approve"] {
	background-color: #4CAF50;
	color: white;
}

input[name="action"][value="Approve"]:hover {
	background-color: #45a049;
}

input[name="action"][value="Reject"] {
	background-color: #f44336;
	color: white;
}

input[name="action"][value="Reject"]:hover {
	background-color: #e53935;
}
</style>
<body>
	<%
	String role = (String) session.getAttribute("role");
	String buttonText = "Login as " + role;
	%>
	<div style="text-align: right; margin: 20px;">
		<button
			style="padding: 8px 16px; font-size: 14px; cursor: pointer; border: none; background-color: #4CAF50; color: white; border-radius: 4px;">
			<%=buttonText%>
		</button>
	</div>
	<div class="container">
		<h2>Pending Access Requests</h2>
		<table>
			<tr>
				<th>Request ID</th>
				<th>Name</th>
				<th>Software</th>
				<th>Access Type</th>
				<th>Reason</th>
				<th>Action</th>
			</tr>
			<%
			// Initialize DAO and fetch the pending requests
			ApprovalDAO approvalDAO = new ApprovalDAO();
			List<Request> pendingRequests = null;
			try {
				pendingRequests = approvalDAO.getPendingRequests();
			} catch (Exception e) {
				e.printStackTrace();
				out.println("<p>Error fetching pending requests: " + e.getMessage() + "</p>");
			}

			// Cast the attribute to List<Request>
			if (pendingRequests != null && !pendingRequests.isEmpty()) {
				for (Request req : pendingRequests) {
			%>
			<tr>
				<td><%=req.getId()%></td>
				<td><%=req.getUserName()%></td>
				<td><%=req.getSoftwareName()%></td>
				<td><%=req.getAccessType()%></td>
				<td><%=req.getReason()%></td>
				<td>
					<form action="pendingRequests" method="post">
						<input type="hidden" name="requestId" value="<%=req.getId()%>">
						<input type="submit" name="action" value="Approve">
						<input type="submit" name="action" value="Reject">
					</form>
				</td>
			</tr>
			<%
			}
			} else {
			%>
			<tr>
				<td colspan="6" class="no-requests">No pending requests.</td>
			</tr>
			<%
			}
			%>
		</table>
	</div>
</body>
</html>
