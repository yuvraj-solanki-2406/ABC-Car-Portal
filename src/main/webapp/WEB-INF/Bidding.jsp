<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Bidding Page</title>
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
	
	
	<div class="container-fluid mt-3">
	
		<div class="col-md-12" style="display:inline;">
			<img src="/resources/Images/bidding.jpg" alt="bidding image" class="float-img">
		</div>
	
	
		<div class="col-md-5 my-5 mx-5" style="float:right;">
			<sf:form action="/user/boughtCar" method="post" modelAttribute="bidCar">
			
				<div class="form-group" style="display:none;">
					<label for="bidid">Bid Id</label>
					<sf:input path="bidid" class="form-control" name="bidid"/>
					<sf:errors path="name" class="errors"></sf:errors>
				</div>
				
				<div class="form-group" style="display:none;">
					<label for="buyerid">LoggedIn UserId</label>
					<sf:input path="buyerid" class="form-control" name="buyerid"/>
					<sf:errors path="buyerid" class="errors"></sf:errors>
				</div>
				
				<div class="form-group" style="display:none;">
					<label for="sellerid">LoggedIn UserId</label>
					<sf:input path="sellerid" class="form-control" name="sellerid"/>
					<sf:errors path="sellerid" class="errors"></sf:errors>
				</div>
							
				<div class="form-group">
					<label for="name">Name</label>
					<sf:input path="name" class="form-control" name="name" placeholder="Name of Buyer"/>
					<sf:errors path="name" class="errors"></sf:errors>
				</div>
	
				<div class="form-group">
					<label for="date">Date of Appointment</label>
					<sf:input path="date" class="form-control" name="date" type="date"/>
					<sf:errors path="date" class="errors"></sf:errors>
				</div>
				
				<div class="form-group">
					<label for="price">Price<span class="text-muted">&nbsp;(Suitable for you)</span></label>
					<sf:input path="price" class="form-control" name="price" placeholder="Price"/>
					<sf:errors path="price" class="errors"></sf:errors>
				</div>
				
				
				<div class="form-group text-center mt-2">
					<button class="btn btn-primary">Buy Car</button>
				</div>
				
			</sf:form>
		</div>
	</div>

</body>
</html>