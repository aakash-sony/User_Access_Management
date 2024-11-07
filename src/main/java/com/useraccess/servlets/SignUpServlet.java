package com.useraccess.servlets;

import java.io.IOException;

import com.useraccess.dao.UserDAO;
import com.useraccess.model.Users;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/signup")
public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Users users = new Users();
		users.setUsername(request.getParameter("uName"));
		users.setPassword(request.getParameter("pWord"));
		users.setRole("Employee");

		boolean isRegistered = new UserDAO().register(users);

		if (isRegistered) {
			request.setAttribute("message", "Registration successful! Please log in.");
			request.getRequestDispatcher("RegSuccess.jsp").forward(request, response);
		} else {
			request.setAttribute("message", "Registration failed! Please try again!!");
			request.getRequestDispatcher("Message.jsp").forward(request, response);
		}

	}
}
