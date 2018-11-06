<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>

<meta charset="utf-8" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="JRS" content="">
<meta name="google-signin-client_id"
	content="1032689498916-u8i9l91qq544t77cijcfupqij5vjs5lg.apps.googleusercontent.com">
<link rel="icon" type="image/png" href="img/logo2.png">

<title>Destino</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom fonts for this template -->
<link href="vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Kaushan+Script'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700'
	rel='stylesheet' type='text/css'>
	<link rel="stylesheet" type="text/css" href="css/app.css">

<!-- Custom styles for this template -->
<link href="css/agency.min.css" rel="stylesheet">

<!--google Sign In-->
<script src="https://apis.google.com/js/platform.js" async defer
	type="text/javascript"></script>
<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js" type="text/javascript"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"
	type="text/javascript"></script>

<!--     Plugin JavaScript -->
<script src="vendor/jquery-easing/jquery.easing.min.js"
	type="text/javascript"></script>

<!-- Contact form JavaScript -->
<script src="js/jqBootstrapValidation.js" type="text/javascript"></script>
<script src="js/contact_me.js" type="text/javascript"></script>

<!-- Custom scripts for this template -->
<script src="js/agency.min.js" type="text/javascript"></script>
</head>

<body id="page-top" style="background-color: #282828">

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
	<div class="container">
		<a class="navbar-brand js-scroll-trigger" href="index.jsp" id="title">Destino
		<img class="logo" alt="logo" src="img/logo2.png"></a>
		<button class="navbar-toggler navbar-toggler-right" type="button"
			data-toggle="collapse" data-target="#navbarResponsive"
			aria-controls="navbarResponsive" aria-expanded="false"
			aria-label="Toggle navigation">
			<i class="fa fa-bars"></i>
		</button>

		<!--Login form-->
		<div id="id01" class="modal">

			<form class="modal-content animate" action="Home" method="post" style="width:50%;height:auto;">
				<div class="imgcontainer">
					<span
						onclick="document.getElementById('id01').style.display='none'"
						class="close" title="Close Modal">&times;</span> <img
						src="./img/logo2.png" alt="Avatar" class="avatar">
				</div>

				 <div class="container2">
				 <div class="row">
				 <div class="col-4" style="margin-top: auto;margin-bottom: auto;">
                        <label for="uname"><b>Email</b></label></div>
                        	<div class="col-2" style="height: 50px;">
                        <input type="text" placeholder="Enter Email" style="width: auto; height: 100%; margin-left: 7%; margin-right: auto; border-radius: 25px;" name="em" required><br>
                        </div>
                        </div><br>
                        <div class="row">
						<div class="col-4" style="margin-top: auto;margin-bottom: auto;">
                        <label for="psw"><b>Password</b></label></div>
                        	<div class="col-2">
                        <input type="password" placeholder="Enter Password" style="width: auto; height: auto; margin-left: 1%; border-radius: 25px;" name="ps" required><br><br>
</div>
</div>
<br>
                        <button class="login" type="submit" style="margin-left:35%;margin-right:auto; border-radius: 25px" name="submit" value="Login">Login</button><br><br><br>
                    </div><br><br><br>

				
			</form><br><br>
		</div><br><br>

		<!--Navigation Menu-->
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav text-uppercase ml-auto">

				<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="about.jsp">About Us</a></li>
						<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="contact.jsp">Contact Us</a></li>
						<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="terms.jsp">Terms of Use</a></li>
						<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="privacy.jsp">Privacy Policy</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					onclick="document.getElementById('id01').style.display='block'"
					href="#" id="menuLoginBtn">Login</a></li>	
					
       
</ul>
		</div>
	</div>
	</nav>

	<!-- Landing cover page -->
	<header class="masthead">
	<div class="container">
		<div class="intro-text">
			<div class="intro-lead-in">
				<h1>Traveling Made Perfect</h1>
				<p>Plan your next adventure and tell the world about it</p>
				<p></p>
			</div>
			<a class="btn btn-primary btn-xl text-uppercase js-scroll-trigger"
				href="SignUp.jsp">Let's get Started</a>
		</div>
	</div>
	</header>
	<section class="bg-light" id="portfolio">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<h2 class="section-heading text-uppercase" >Community</h2>
				<p>Explore the world through Destino</p>
			</div>
		</div>
		<div class="row">
			<div class="col-md-4 col-sm-6 portfolio-item" id="community1">

				<a href="tripType.jsp?type=Backpacking" name = "type" value = "Backpacking"> 
				<img class="img-fluid1" src="img/photo1.jpg">
					<div class="centered">Backpacking</div>
				</a>

			</div>
                    <div class="col-md-4 col-sm-6 portfolio-item" id="community2">
                        <a href="tripType.jsp?type=Packages" name = "type" value = "Packages">
                        
					<img class="img-fluid1" src="img/photo2.jpg" alt="">
					<div class="centered">Packages</div>		
				</a>

                    </div>
                    <div class="col-md-4 col-sm-6 portfolio-item" id="community3">
                        <a href="tripType.jsp?type=Honeymoon" name = "type" value = "Honeymoon"> 
					<img class="img-fluid1" src="img/photo3.jpg" alt="">
					<div class="centered">Honeymoon</div>
				</a>

                    </div>
                    
                    <div class="col-md-4 col-sm-6 portfolio-item" id="community4">
                       <a href="tripType.jsp?type=Camping" name = "type" value = "Camping"> 
					<img class="img-fluid1" src="img/photo4.jpg" alt="">
					<div class="centered">Camping</div>
				</a>

                    </div>

                    <div class="col-md-4 col-sm-6 portfolio-item" id="community5">
                       <a href="tripType.jsp?type=Road Trips" name = "type" value = "Road Trips"> 
					<img class="img-fluid1" src="img/photo5.jpg" alt="">
					<div class="centered1">Road Trips</div>
				</a>
                    </div>

                    <div class="col-md-4 col-sm-6 portfolio-item" id="community6">
                      <a href="tripType.jsp?type=Expeditions" name = "type" value = "Expeditions"> 
					<img class="img-fluid1" src="img/photo6.jpg" alt="">
					<div class="centered">Expeditions</div>
				</a>
                    </div>

                    <div class="col-md-4 col-sm-6 portfolio-item" id="community7">
                     <a href="tripType.jsp?type=Beaches" name = "type" value = "Beaches"> 
					<img class="img-fluid1" src="img/photo7.jpg" alt="">
					<div class="centered">Beaches</div>
				</a>
                    </div>


                    <div class="col-md-4 col-sm-6 portfolio-item" id="community8">
                     <a href="tripType.jsp?type=Wellness" name = "type" value = "Wellness"> 
					<img class="img-fluid1" src="img/photo8.jpg" alt="">
					<div class="centered">Wellness</div>
				</a>
                    </div>

                    <div class="col-md-4 col-sm-6 portfolio-item" id="community9">
                       <a href="tripType.jsp?type=Adventure" name = "type" value = "Adventure"> 
					<img class="img-fluid1" src="img/photo9.jpg" alt="">
					<div class="centered">Adventure</div>
				</a>
                    </div>

                    <div class="col-md-4 col-sm-6 portfolio-item" id="community10">
                    <a href="tripType.jsp?type=Culture" name = "type" value = "Culture"> 
					<img class="img-fluid1" src="img/photo10.jpg" alt="">
					<div class="centered">Culture</div>
				</a>
                    </div>

                    <div class="col-md-4 col-sm-6 portfolio-item" id="community11">
                      <a href="tripType.jsp?type=Sailing" name = "type" value = "Sailing"> 
					<img class="img-fluid1" src="img/photo11.jpg" alt="">
					<div class="centered">Sailing</div>
				</a>
                    </div>

                    <div class="col-md-4 col-sm-6 portfolio-item" id="community12">
                   <a href="tripType.jsp?type=Space" name = "type" value = "Space"> 
					<img class="img-fluid1" src="img/photo12.jpg" alt="">
					<div class="centered">Space</div>
				</a>
                    </div>

                </div>
	</div>
	</section>


	
	<!-- Portfolio Grid -->
	

	<!-- Footer -->
	<footer class="navbar navbar-expand-lg navbar-dark position-relative">
	<div class="container">


		<!--Navigation Menu-->
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav text-uppercase mr-auto">
				<li class="nav-item"><a class="nav-link js-scroll-trigger" style="font-size: 12px;" href="SignUp.html">Sign Up</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" style="font-size: 12px;" href="SignUp.html">Login</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					style="font-size: 12px;"href="about.jsp">About Us</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					style="font-size: 12px;"href="contact.jsp">Contact Us</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					style="font-size: 12px;"href="#">Privacy Policy</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					style="font-size: 12px;"href="#">Terms of Use</a></li>
					      <li class="nav-item"><a class="nav-link js-scroll-trigger" 
					      style="font-size: 12px;" href="credits.jsp">Credits</a></li>


			</ul>
		</div>
	</div>



	</footer>


	<!--Login Form-->
	<script type="text/javascript">
        // Get the modal
        var modal = document.getElementById('id01');

        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
    </script>




</body>

</html>