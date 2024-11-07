package com.useraccess.servlets;

import java.io.IOException;

import com.useraccess.dao.RequestDAO;
import com.useraccess.model.Request;
import com.useraccess.model.UserRequest;
import com.useraccess.model.Users;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/requestAccess")
public class RequestAccessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Users users = (Users) session.getAttribute("users");

		// Check if the user is logged in and is an Employee
		if (users == null || !"Employee".equals(users.getRole())) {
			request.setAttribute("message", "Unauthorized access.");
			request.getRequestDispatcher("Message.jsp").forward(request, response);
			return;
		}

		// Get parameters from the form
		
		int softwareId = Integer.parseInt(request.getParameter("softwareId"));
		String accessType = request.getParameter("accessType");
		String reason = request.getParameter("reason");

		// Create a Request object with the status defaulted to "Pending"

		UserRequest accessRequest = new UserRequest();
		accessRequest.setUserId(users.getId());
		accessRequest.setSoftwareId(softwareId);
		accessRequest.setAccessType(accessType);
		accessRequest.setReason(reason);

		// Submit the request using RequestDAO
		boolean isSubmitted = new RequestDAO().submitRequest(accessRequest);

		if (isSubmitted) {
			// Redirect to a confirmation page or back to the request form with a success
			// message
			request.setAttribute("success", "Request submitted successfully!");
			request.getRequestDispatcher("access.jsp").forward(request, response);
		} else {
			// Redirect back to the request form with an error message
			request.setAttribute("failed", "Failed to submit request. Please try again..");
			request.getRequestDispatcher("access.jsp").forward(request, response);

		}
	}
}
