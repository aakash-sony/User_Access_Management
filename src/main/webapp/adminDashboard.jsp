<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dashboard</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f7fc;
	margin: 0;
	padding: 0;
}

.container {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	padding: 20px;
	flex-wrap: wrap;
}

.tile {
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	margin: 10px;
	width: 250px;
	height: 150px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	text-align: center;
	transition: transform 0.3s ease, box-shadow 0.3s ease;
	cursor: pointer;
}

.tile:hover {
	transform: translateY(-10px);
	box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
}

.tile h2 {
	margin: 0;
	color: #333;
}

.tile p {
	font-size: 14px;
	color: #666;
}

.tile i {
	font-size: 30px;
	margin-bottom: 10px;
	color: #007BFF;
}

.tile-1 {
	background-color: #e1f5fe;
}

.tile-2 {
	background-color: #e8f5e9;
}

.tile-3 {
	background-color: #fff3e0;
}
</style>
</head>
<body>

	<div class="container">

		<div class="tile tile-1"
			onclick="window.location.href='createSoftware.jsp'">
			<i class="fa fa-plus-circle"></i>
			<h2>Create Software</h2>
			<p>Option to create new software</p>
		</div>

		<div class="tile tile-2"
			onclick="window.location.href='pendingRequest.jsp'">
			<i class="fa fa-clock"></i>
			<h2>View Pending Requests</h2>
			<p>Check and manage your pending requests</p>
		</div>

		<div class="tile tile-3"
			onclick="window.location.href='requestAccess.jsp'">
			<i class="fa fa-file-alt"></i>
			<h2>Raise Software Request</h2>
			<p>Submit a new request for software</p>
		</div>
	</div>

</body>
</html>
