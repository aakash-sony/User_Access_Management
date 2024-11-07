package com.useraccess.servlets;

import java.io.IOException;
import com.useraccess.dao.ApprovalDAO;
import com.useraccess.model.Users;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/pendingRequests")
public class ApprovalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Users users = (Users) session.getAttribute("users");

		// Verify if the user is logged in and has the Manager role
		if (users == null || !"Manager".equals(users.getRole())) {
			request.setAttribute("message", "Unauthorized access. Only Managers can update requests.");
			request.getRequestDispatcher("Message.jsp").forward(request, response);
			return;
		}

		int requestId = Integer.parseInt(request.getParameter("requestId"));
		String action = request.getParameter("action");

		boolean success = false;
		try {
			if ("Approve".equalsIgnoreCase(action)) {
				success = new ApprovalDAO().updateRequestStatus(requestId, "Approved");
			} else if ("Reject".equalsIgnoreCase(action)) {
				success = new ApprovalDAO().updateRequestStatus(requestId, "Rejected");
			}

			if (success) {
				request.setAttribute("success", "Request " + action.toLowerCase() + " successfully.");
				request.getRequestDispatcher("approval.jsp").forward(request, response);
			} 
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error processing request: " + e.getMessage());
		}
	}
}
