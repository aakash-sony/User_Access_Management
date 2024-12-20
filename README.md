

https://github.com/user-attachments/assets/a3a14819-ae0d-4112-a246-2e40bdfe2f6c

![request page](https://github.com/user-attachments/assets/d8baa54c-9a08-4966-941c-ab13f4ac6ce7)
![signup page](https://github.com/user-attachments/assets/f6d5794e-25c5-4f73-ace8-a2b755ae62dc)
![pendingRequest page](https://github.com/user-attachments/assets/8aa4f355-7ffb-42d8-8a22-80ad7f0ec74a)
![login page](https://github.com/user-attachments/assets/5a91b032-45c8-4705-8c92-d9c1bec7389e)
![admin page](https://github.com/user-attachments/assets/f0754d34-523f-443b-9f43-1f917bd8162e)
## User Access Management System

### Overview
The **User Access Management System** is a web-based application designed to streamline user access requests to various software applications within an organization. This system allows employees to sign up, log in, and request access to software, while managers and admins can review, approve, or reject these requests. The application aims to enhance security and operational efficiency in managing software access.

### Features
- **User Registration**: New users can register and create accounts with a default role of "Employee."
- **User Authentication**: Registered users can securely log in.
- **Software Management** (Admin-only): Admins can create and manage software applications.
- **Access Requests**: Employees can request access to software applications with specified access levels (Read, Write, Admin).
- **Approval System** (Manager-only): Managers can review and approve or reject pending access requests.

### User Roles
- **Employee**:
   - Can register, log in, and request access to software.
- **Manager**:
   - Can review and respond to access requests.
- **Admin**:
   - Can create software applications, manage settings, and has all permissions of an Employee and Manager.

### Technologies Used
- **Backend**: Java Servlets and JSP for processing and handling requests.
- **Frontend**: HTML, CSS, JavaScript for user interface.
- **Database**: PostgreSQL for data storage.
- **Server**: Java Servlet Container (e.g., Apache Tomcat).

### Database Schema
- **users**: Stores user details and roles (Employee, Manager, Admin).
- **software**: Holds software application details and access levels.
- **requests**: Manages user access requests, including request status (Pending, Approved, Rejected).

### Setup Instructions
To set up and run the User Access Management System locally, follow these steps:

1. **Clone the repository**:
git clone <https://github.com/aakash-sony/User_Access_Management>

2. **Set up PostgreSQL database**:
- Run the provided SQL script to create the necessary tables (`users`, `software`, `requests`).

3. **Configure the server**:
- Deploy the application on a Java Servlet container (e.g., Apache Tomcat).
- 
### Usage
1. **Sign-Up**: Users register via the sign-up page to create an "Employee" account.
2. **Login**: Users log in to access different system features based on their roles.
3. **Request Access**: Employees request access to software, specifying access level and reason.
4. **Approve/Reject Requests**: Managers can review and act on pending requests.
5. **Admin Privileges**: Admins can add new software applications for access management.

### Contributing
Contributions are welcome! Please [fork the repository](https://github.com/aakash-sony/User_Access_Management/fork) and submit a pull request for any improvements or bug fixes.

### License
This project is licensed under the [MIT License](LICENSE). See the LICENSE file for more details.

