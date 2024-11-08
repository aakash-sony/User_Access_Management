package com.useraccess.servlets;

import java.io.IOException;
import java.sql.SQLException;

import com.useraccess.dao.SoftwareDAO;
import com.useraccess.model.Software;
import com.useraccess.model.Users;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/createSoftware")
public class SoftwareServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Users user = (Users) session.getAttribute("users");

		if (user == null || !"Admin".equals(user.getRole())) {
			request.setAttribute("message", "Unauthorized access. Only Admins can add software.");
			request.getRequestDispatcher("Message.jsp").forward(request, response);
			return;
		}

		// Get parameters from the form
		String name = request.getParameter("softwareName");
		String description = request.getParameter("description");
		String[] accessLevels = request.getParameterValues("accessLevels"); // Read, Write, Admin

		if (accessLevels == null || accessLevels.length == 0) {
			request.setAttribute("failed", "Please select at least one access level.");
			request.getRequestDispatcher("status.jsp").forward(request, response);
			return;
		}

		// Create a Software object
		Software software = new Software();
		software.setName(name);
		software.setDescription(description);
		software.setAccessLevels(accessLevels);

		// Call DAO to add the software to the database
		boolean isAdded = false;
		try {
			isAdded = new SoftwareDAO().addSoftware(software);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		if (isAdded) {
			System.out.println("software Added..");
			request.setAttribute("success", "Software added successfully!");

			request.getRequestDispatcher("status.jsp").forward(request, response);
		} else {

			request.setAttribute("failed", "Software not added..something error..!");
			request.getRequestDispatcher("status.jsp").forward(request, response);
		}
	}
}
