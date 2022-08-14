<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Search result for ${search }</title>
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
<style>.display-6{}</style>
</head>

<body>
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
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0" id="nav_list">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="/">Home</a></li>
						<li class="nav-item"><a class="nav-link active" href="#">About Us</a></li>
						<li class="nav-item"><a class="nav-link active" href="#">Contact Us</a></li>
					</ul>
					
					<sf:form class="d-flex ms-4" role="search" action="/search" method="get">
						<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="search">
						<button class="btn btn-outline-primary" type="submit" id="search_btn">Search</button>
					</sf:form>
					
				<span style="margin-right:15px; margin-left:10px;">${userDetails.first_name }&nbsp;${userDetails.last_name }</span>
					
					
				</div>
			</div>
		</nav>
			
		<div class="container col-md-12 mt-4">
			
			<div class="container mb-4 col-md-12" style="height:10em; background-color:#efefef; width:100%;">
				<h3 class="display-6 text-center pt-3">Search Result for: <span>${search }</span></h3>
			</div>		
				
			<table class="table table-bordered table-hover">
					<tr>	
						<th>Model Name</th>
						<th>Company</th>
						<th>Price <span class="text-muted">(in lakhs)</span></th>
						<th>Distance Covered <span class="text-muted">(in KiloMeters)</span></th>
						<th>Price <span class="text-muted">(in Lakhs)</span></th>
						<th>Image</th>
						<th>Buy </th>
				    </tr>
												
				<c:forEach var="search" items='${searchResult }'>
					
					<tr>
						<td>${search.modelname }</td>
						<td>${search.company }</td>
						<td>${search.price }</td>
						<td>${search.distance}</td>
						<td>${search.price}</td>
						<td>${search.image }</td>
						<td>
							<form action="/user/buy/${search.id }" method="get">
								<button class="btn btn-primary" type="submit">Buy Car</button>
							</form>
						</td>
					</tr>
					
				</c:forEach>
									
			</table>
			
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



