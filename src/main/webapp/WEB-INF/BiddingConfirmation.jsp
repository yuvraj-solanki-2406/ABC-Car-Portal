<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bidding Success</title>

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
					<sf:form class="d-flex ms-4" role="search" action="/search" method="get">
						<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="search">
						<button class="btn btn-outline-primary" type="submit" id="search_btn">Search</button>
					</sf:form>
					
					<img src="/resources/Images/userdashboard.jpg" width="30px" height="30px">
					<span style="margin-right:15px;">${userDetails.first_name }&nbsp;${userDetails.last_name }</span>
					
					<form action="/logout"><button class="btn btn-primary">Logout</button></form>
				</div>
			</div>
		</nav>
	</div>
	
	<div class="container m-4 text-center" id="congrats">
		<p class="text-center">Congratulations</p> 
		<p class="text-center">Your request to buy the car is being accepted</p>
	</div>
	
	<div class="container-fluid mt-3">
		
		<div class="img-float container-fluid mt-4 col-md-4" style="display:inline;">
			<img src="/resources/Images/car_caursel_3.jpg" alt="car">
		</div>
		
		<div class="col-md-6" style="float:right;">
			We have requested the seller to contact you for further details 
			<p>Thank you for Choosing Us</p>
			
			<div>
				<span>Buyer name : ${biddingUserDetails.name }</span><br>
				<span>Date of Appointment with the Seller : ${biddingUserDetails.date }</span><br>
				<span>Selling Price : ${biddingUserDetails.price }</span><br>
			</div>
			
		</div>
	
		<div class="text-center">
			<a href="/user" class="btn btn-primary">Back to Profile</a>
		</div>
	
	</div>
	
	
	<div class="container-fluid"
		style="background-color: #eeeeee; margin-top: 5em; border-radius: 10px;">
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