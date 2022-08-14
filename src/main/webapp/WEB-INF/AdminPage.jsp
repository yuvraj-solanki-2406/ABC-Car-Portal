<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Page</title>
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
					<span style="margin-right:15px;">${adminDetails.first_name }&nbsp;${adminDetails.last_name }</span>
					
					<form action="/logout"><button class="btn btn-primary">Logout</button></form>
				</div>
			</div>
		</nav>
	</div>
  

<section class="vh-100" style="background-color: white;">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col col-lg-6 mb-4 mb-lg-0">
      <h1 class="text-center"style="color:#ff833a;margin-top:-10px;">You are an Admin</h1>
        <div class="card mb-5 mt-0" style="border-radius: .5rem; ">
          <div class="row g-0">
            <div class="col-md-4 gradient-custom text-center text-white"
              style="border-top-left-radius: .5rem; border-bottom-left-radius: .5rem;">
              <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava1-bg.webp"
                alt="Avatar" class="img-fluid my-5" style="width: 80px;" />
              <h5>${adminDetails.first_name }&nbsp;${adminDetails.last_name }</h5>
              
              <form action="/update/${adminDetails.id }"><button class="btn" style="background-color:#ff9b66; border:1px solid black">
             			Edit Details
             </button></form><br>
             <form action="/logout"><button class="btn" style="background-color:#ff9b66; border:1px solid black">
             			Logout
             </button></form>
         
              <i class="far fa-edit mb-5"></i>
            </div>
            <div class="col-md-8">
              <div class="card-body p-4">
                <h6>User Information</h6>
                <hr class="mt-0 mb-4">
                <div class="row pt-1">
                
                  <div class="col-8 mb-3">
                    <h6>Name</h6>
                    <p class="text-muted">${adminDetails.first_name }&nbsp;${adminDetails.last_name }</p>
                  </div>               
                  <div class="col-4 mb-3">
                    <h6>Username</h6>
                    <p class="text-muted">${adminDetails.username }</p>
                  </div>
                  <br>
                  <div class="col-8 mb-3">
                    <h6>Email</h6>
                    <p class="text-muted">${adminDetails.email }</p>
                  </div>
                   <div class="col-4 mb-3">
                    <h6>Gender</h6>
                    <p class="text-muted">${adminDetails.gender }</p>
                  </div>

                </div>
                
                <h6>Actions</h6>
                <hr class="mt-0 mb-4">
                <div class="row pt-1">
                  <div class="col-6 mb-3">
                    <sf:form action="/admin/postCar" method="get">
                    	<button class="btn" type="submit" style="background-color:#fd9d83; border:2px solid white">
              				Post Car
              			</button>  
                    </sf:form>
                  </div>
                  
                  <div class="col-6 mb-3">
                    <sf:form action="/admin/viewallCars" method="get">
                    	<button class="btn" type="submit" style="background-color:#fd9d83; border:2px solid white">
              				View Cars
              			</button>  
                    </sf:form>
                  </div>
                  
                  <div class="col-9 mb-3">
                    <sf:form action="/admin/viewallmembers/" method="get">
                    	<button class="btn" type="submit" style="background-color:#fd9d83; border:2px solid white">
              				View All Members
              			</button>  
                    </sf:form>
                  </div>
                  
                  
                  
                </div>
                <div class="d-flex justify-content-start">
                  <a href="#!"><i class="fab fa-facebook-f fa-lg me-3"></i></a>
                  <a href="#!"><i class="fab fa-twitter fa-lg me-3"></i></a>
                  <a href="#!"><i class="fab fa-instagram fa-lg"></i></a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

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