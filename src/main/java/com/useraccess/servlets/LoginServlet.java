package com.useraccess.servlets;

import java.io.IOException;

import com.useraccess.dao.UserDAO;
import com.useraccess.model.Users;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("uName");
		String password = request.getParameter("pWord");

		try {
			Users users = new UserDAO().login(username, password);
			if (users != null) {
				HttpSession session = request.getSession();
				session.setAttribute("users", users);
				switch (users.getRole()) {
				case "Employee":
					response.sendRedirect("requestAccess.jsp");
					break;
				case "Manager":
					response.sendRedirect("pendingRequest.jsp");
					break;
				case "Admin":
					response.sendRedirect("adminDashboard.jsp");
					break;
				}
			} else {
				request.setAttribute("message", "Login failed. Please try again.");
				request.getRequestDispatcher("Message.jsp").forward(request, response);
			}
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}
}
