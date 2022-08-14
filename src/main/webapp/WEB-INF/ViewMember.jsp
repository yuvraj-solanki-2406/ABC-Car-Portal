<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Cars</title>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
	crossorigin="anonymous"></script>
<link rel="shortcut icon" href="/resources/Images/logo_u2.png"
	type="image/x-icon">
<link rel="stylesheet" href="/resources/CSS/index.css">

</head>
<body style="background-color: white">
	
	<div class="container-fluid">
		<nav class="navbar navbar-expand-lg mt-2"
			style="background-color: #d8dde2;">
			<div class="container-fluid">
				<a class="navbar-brand h1" href="#" id="abc_logo"> <img
					src="/resources/Images/logo_u2.png" alt="image" width="100"
					height="40">&nbsp; <span id="heading" class="mt-1">ABC
						Cars Limited</span>
				</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
					<div class="collapse navbar-collapse" id="navbarSupportedContent" style="margin-left:-30px;">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0" id="nav_list">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="/">Home</a></li>
						<li class="nav-item"><a class="nav-link active" href="#">About
								Us</a></li>
						<li class="nav-item"><a class="nav-link active" href="#">Contact
								Us</a></li>
					</ul>
					<form class="d-flex ms-4 mr-3" action="/search" method="get" role="search" style="margin-right:15px;" >
						<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
						<button class="btn btn-outline-primary" type="submit" id="search_btn">Search</button>
					</form>
					
					<img src="/resources/Images/userdashboard.jpg" width="30px" height="30px">
					<span style="margin-right:15px;">${userDetails.first_name }&nbsp;${userDetails.last_name }</span>
					
					<form action="/logout"><button class="btn btn-primary">Logout</button></form>
				</div>
			</div>
		</nav>
	</div>
	
	<div class="container mt-5">
	
		<Table style="text-align:center; margin:2px;" class="table table-bordered table-hover">
			<tr>
			<th scope="col" style="text-align:center;">First Name</th>
			<th scope="col" style="text-align:center;">Last Name</th>
			<th scope="col" style="text-align:center;">Email</th>
			<th scope="col" style="text-align:center;">Username</th>
			<th scope="col" style="text-align:center;">Gender</th>
			<th scope="col" style="text-align:center;">#</th>
			<th scope="col" style="text-align:center;">#</th>
			</tr>
				
		<c:forEach var="members" items="${membersDetails }">
			<tr>		
				<td>${members.first_name }</td>
				<td>${members.last_name }</td>
				<td>${members.email }</td>
				<td>${members.username }</td>
				<td>${members.gender }</td>
				<td>
					<form action="/delete/${members.id }">
						<button class="btn btn-danger">Delete</button>
					</form>					
				</td>
				<td>
					<form action="/update/${members.id }">
						<button class="btn btn-primary">Update</button>
					</form>					
				</td>
			</tr>
			
		</c:forEach>
		
		</Table>
		
	</div>

</body>
</html>

