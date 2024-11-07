<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.useraccess.model.Request"%>
<%@ page import="com.useraccess.dao.ApprovalDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pending Requests</title>
</head>
<body>

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
%>

	<h2>Pending Access Requests</h2>

	<table border="1">
		<tr>
			<th>Request ID</th>
			<th>Employee ID</th>
			<th>Software ID</th>
			<th>Access Type</th>
			<th>Reason</th>
			<th>Action</th>
		</tr>

		<%
		// Cast the attribute to List<Request>

		if (pendingRequests != null && !pendingRequests.isEmpty()) {
			for (Request req : pendingRequests) {
		%>
		<tr>
			<td><%=req.getId()%></td>
			<td><%=req.getUserId()%></td>
			<td><%=req.getSoftwareId()%></td>
			<td><%=req.getAccessType()%></td>
			<td><%=req.getReason()%></td>
			<td>
				<form action="pendingRequests" method="post">
					<input type="hidden" name="requestId" value="<%=req.getId()%>">
					<input type="submit" name="action" value="Approve"> <input
						type="submit" name="action" value="Reject">
				</form>
			</td>
		</tr>
		<%
		}
		} else {
		%>
		<tr>
			<td colspan="6">No pending requests.</td>
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>
