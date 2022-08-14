<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home Page</title>
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
						<li class="nav-item"><a class="nav-link active" href="#">About
								Us</a></li>
						<li class="nav-item"><a class="nav-link active" href="#">Contact
								Us</a></li>
						<li class="nav-item"><a class="nav-link active" href="login">Login</a>
						</li>
						<li class="nav-item"><a class="nav-link active"
							href="registration">Register</a></li>
					</ul>
					<sf:form class="d-flex ms-4" role="search" action="/search" method="get">
						<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="search">
						<button class="btn btn-outline-primary" type="submit" id="search_btn">Search</button>
					</sf:form>
				</div>
			</div>
		</nav>
	</div>
	<div class="container-fluid">
		<img src="/resources/Images/hero_banner_2.jpg" alt=""
			class="col-md-12 img-fluid" id="hero_banner">
		<p class="container col-md-5 ms-md-5" id="para1">Lorem ipsum dolor
			sit amet consectetur adipisicing elit. Eos non ipsum dolorem nihil,
			explicabo quia consectetur perspiciatis debitis magnam aliquam.</p>
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