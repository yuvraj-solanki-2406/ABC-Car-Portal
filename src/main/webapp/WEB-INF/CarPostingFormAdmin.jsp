<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Page</title>
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
<style type="text/css">.errors{color:red;}</style>

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
					<form class="d-flex ms-4 mr-3" action="/search" method="get" role="search" style="margin-right:15px;">
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

	<div class="container mt-3 col-md-8">
		<div class="jumbotron" style="background-color:#efefef; padding:10px;border-radius:5px;">
			<h1 class="display-6">Post the Details of Your Car</h1>
			<p>Sell your car and find the best price for the car</p>
		</div>
		<br>
		
		<div class="">
			<sf:form action="/admin/postCarDetails" method="post" modelAttribute="postCarDetails">
				<div class="form-group">
					<label>Model Name</label>
					<sf:input path="modelname" name="modelname" class="form-control"/>
					<sf:errors path="modelname" class="errors"></sf:errors>
				</div>
				
				<div class="Company">
					<label>Company</label>
					<sf:input path="company" name="company" class="form-control"/>
					<sf:errors path="company" class="errors"></sf:errors>
				</div>
				
				<div class="form-group">
					<label for="distance">Distance Traveled</label><span class="text-muted">(Approximate KM run)</span>
					<sf:input path="distance" name="distance" class="form-control"/>
					<sf:errors path="distance" class="errors"></sf:errors>
				</div>
				
				<div class="form-group">
					<label for="distance">Manufacturing Year</label>
					<sf:input path="year" name="year" class="form-control"/>
					<sf:errors path="year" class="errors"></sf:errors>
				</div>
				
				<div class="form-group">
					<label for="distance">Price</label><span class="text-muted">(Price to be sold at)</span>
					<sf:input path="price" name="price" class="form-control"/>
					<sf:errors path="price" class="errors"></sf:errors>
				</div>
				
				<div class="form-group">
					<label for="distance">Car Image</label>
					<sf:input path="image" name="image" type="file" class="form-control"/>
					<sf:errors path="image" class="errors"></sf:errors>
				</div>
				
				<div class="form-group mb-5 mt-3 text-center">
					<button class="btn btn-primary" type="submit">Submit Car Details</button>
				</div>			
				
			</sf:form>
		</div>

	</div>
	
	
	
</body>
</html>