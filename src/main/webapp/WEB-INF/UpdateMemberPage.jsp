<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Registration Form</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
<style>
.errors {
	display: block;
	color: red;
} 	.form-group{padding:5px;}
</style>

</head>

<body>

	<div class="container-fluid">
		<nav class="navbar navbar-expand-lg mt-2"
			style="background-color: #d8dde2;">
			<div class="container-fluid">
				<a class="navbar-brand h1" href="#" id="abc_logo"> 
				<img src="/resources/Images/logo_u2.png" alt="image" width="100" height="40">&nbsp; 
				<span id="heading" class="mt-1">ABC Cars Limited</span>
				</a>
				
				<button class="navbar-toggler" type="button"data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"aria-label="Toggle navigation">
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
					<span style="margin-right:15px;">${adminDetails.first_name }&nbsp;${adminDetails.last_name }</span>
					
					<form action="/logout"><button class="btn btn-primary">Logout</button></form>
				</div>
			</div>
		</nav>
	</div>

	<div class="container" style="display: block;">
		<div class="container-fluid col-md-5 mt-4" id="form_image">
			<img src="/resources/Images/UpdateProfile.jpg" alt="image"
				id="form_images">
		</div>

		<div class="container-fluid col-md-7 mt-4" id="form">
		
			<sf:form action="/admin/updateDetails" method="post" modelAttribute="updateMember">
				<div class="form-group" style="display: none;">
					<label for="id">User Id</label>
					<sf:input path="id" type="text" name="id" id="id" class="form-control" />
				</div>

				<div class="form-group">
					<label for="name">First Name</label>
					<sf:input path="first_name" type="text" name="first_name" id="first_name" class="form-control" />
					<sf:errors path="first_name" class="errors"></sf:errors>
				</div>

				<div class="form-group">
					<label for="name">Last Name</label>
					<sf:input path="last_name" type="text" name="last_name"
						id="last_name" class="form-control" />
					<sf:errors path="last_name" class="errors"></sf:errors>
				</div>

				<div class="form-group">
					<label for="name">Email</label>
					<sf:input path="email" type="text" name="email" id="email"
						class="form-control" />
					<sf:errors path="email" class="errors"></sf:errors>
				</div>

				<div class="form-group">
					<label for="name">Username</label>
					<sf:input path="username" type="text" name="username" id="username"
						class="form-control" />
					<sf:errors path="username" class="errors"></sf:errors>
				</div>

				<div class="form-group">
					<label for="name">Age</label>
					<sf:input path="age" type="number" name="age" id="age"
						class="form-control" />
					<sf:errors path="age" class="errors"></sf:errors>
				</div>

				<div class="form-group">
					<label for="name">Address</label>
					<sf:input path="address" type="text" name="address" id="address"
						class="form-control" />
					<br>
					<sf:errors path="address" class="errors"></sf:errors>
				</div>

				<div class="form-group text-center" id="submit_btn">
					<button type="submit" class="btn btn-primary" id="submit_btn">Update Details</button>
				</div>
			</sf:form>
		</div>
	</div>

	<div class="container-fluid"
		style="background-color: #eeeeee; border-radius: 10px; margin-top: 40em;">
		<footer class="py-3 my-4">
			<ul class="nav justify-content-center border-bottom pb-3 mb-3">
				<li class="nav-item"><a href="/"
					class="nav-link px-2 text-muted">Home</a></li>
				<li class="nav-item"><a href="#"
					class="nav-link px-2 text-muted">About Us</a></li>
				<li class="nav-item"><a href="#"
					class="nav-link px-2 text-muted">Cars</a></li>
				<li class="nav-item"><a href="registration"
					class="nav-link px-2 text-muted">Register</a></li>
			</ul>
			<p class="text-center text-muted">&copy; 2023 Cars Portal, Inc</p>
		</footer>
	</div>


</body>

</html>