<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="JRS" content="">
<meta name="google-signin-client_id"
	content="1084702813538-ckcgokn0fgg66mu3oevrc2j45ki1081d.apps.googleusercontent.com">
<link rel="icon" type="image/png" href="img/logo2.png">

<script src="js/firebase.js"></script>

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

<!-- Custom styles for this template -->
<link href="css/agency.min.css" rel="stylesheet">

<!--google Sign In-->
<script src="https://apis.google.com/js/platform.js" async defer></script>

</head>

<body id="page-top" style="background-color: #1d1e22">
<%String errorMsg=request.getParameter("error"); %>
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
		<div class="container">
			<a class="navbar-brand js-scroll-trigger" href="home.jsp" id="title">Destino</a>
			<img class="logo" alt="logo" src="img/logo2.png">
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<i class="fa fa-bars"></i>
			</button>


			<!--Navigation Menu-->
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav text-uppercase ml-auto">
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="about.jsp">About Us</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<br>
	<br>
	<br>
	
	<br>
	<div class="SignUp-tab-container">
		<div class="SignUp-tab">
			<!--Sign Up button tab-->
			<a class="tablinks SignUp-tab-btn" onclick="openTab(event,'Sign_up')">Sign Up</a>

			<!--Login button tab-->
			<a class="tablinks SignUp-tab-btn  active" onclick="openTab(event,'Login')">Login</a>
		</div>
		


	<!--Login form-->
	<div id="Login" class="SignUp-tab-content">

		<form class="modal-content animate" action="Home" method="post">
			<div class="imgcontainer">
				<img src="./img/logo2.png" alt="Avatar" class="avatar">
			</div>

			<div class="container2">
			<div class="row">
						<div class="col-4" style="margin-top: auto;margin-bottom: auto;">
							<label for="email"><b> e-mail</b></label>
						</div>
						<div class="col-2" style="height: 50px;">
							<input type="text" id="email" placeholder="     Enter Email" name="em"
								style="width: auto; height: 100%; margin-left: 7%; margin-right: auto; border-radius: 25px;"
								required>
						</div>
					</div>
					<br>
					
					<div class="row">
						<div class="col-4" style="margin-top: auto;margin-bottom: auto;">
							<label for="psw"><b>Password</b></label>
						</div>
						<div class="col-2">
							<input type="password" placeholder="Enter Password"
								name="ps"
								style="width: auto; height: auto; margin-left: 1%; border-radius: 25px;"
								class="fieldset" required>
						</div>
					</div>
					<br>
				<!--error message -->
					<%if(errorMsg==null){ %>
					<p id="errorMsg" style="color: red" name="error"></p>
				<%}
					else{
					%>
					<p id="errorMsg" style="color: red" name="error"><%=errorMsg %></p>
					<%} %>
					<br>
				<button class="login" style="margin-left:40%;margin-right:auto;  border-radius: 25px" type="submit" name="submit" value="Login">Login</button>
				<br>
			</div>
		</form>
	</div>

<!--SIgn up form-->
		<div id="Sign_up" class="SignUp-tab-content">

			<form class="modal-content animate" action="Home" method="post">
				<div class="imgcontainer">
					<img src="./img/logo2.png" alt="Avatar" class="avatar">
				</div>

				<!--First name-->
				<div class="container2">
					<div class="row">
						<div class="col-4" style="margin-top: auto;margin-bottom: auto;">
							<label for="first_name"><b>First name</b></label>
						</div>
						<div class="col-2">
							<input type="text" placeholder="Enter First Name"
								name="first_name" class="fieldset"
								style="width: auto; height: auto; border-radius: 25px;" required>
						</div>
					</div>

					<!--Last name-->
					<div class="row">
						<div class="col-4" style="margin-top: auto;margin-bottom: auto;">
							<label for="last_name"><b>Last name</b></label>
						</div>
						<div class="col-2">
							<input type="text" placeholder="Enter Last Name" name="last_name"
								class="fieldset"
								style="width: auto; height: auto; border-radius: 25px;" required>
						</div>
					</div>

					<!--Email-->
					<div class="row">
						<div class="col-4" style="margin-top: auto;margin-bottom: auto;">
							<label for="email"><b> e-mail</b></label>
						</div>
						<div class="col-2" style="height: 50px;">
							<input type="text" id="email" pattern="[a-zA-Z0-9.-_]{1,}@[a-zA-Z.-]{2,}[.]{1}[a-zA-Z]{2,}"placeholder="     Enter Email" name="email"
								style="width: auto; height: 100%; margin-left: 7%; margin-right: auto; border-radius: 25px;"
								required>
						</div>
					</div>
					<br>
					<!--Password-->
					<div class="row">
						<div class="col-4" style="margin-top: auto;margin-bottom: auto;">
							<label for="psw"><b>Password</b></label>
						</div>
						<div class="col-2">
							<input type="password" placeholder="Enter Password"
								name="password"
								style="width: auto; height: auto; margin-left: 1%; border-radius: 25px;"
								class="fieldset" required>
						</div>
					</div>
					<br>
					<div>By clicking submit you are agreeing to the <a href="terms.jsp">Terms and Conditions</a></div>
					<br>
					<button class="login" style="margin-left:25%;margin-right:auto; border-radius: 25px" type="submit" name="submit" value="Sign Up">Sign
						Up</button>
					<br>

				</div>

			</form>
		</div>
	</div>

	<!-- Footer -->
	     <footer class="navbar navbar-expand-lg navbar-dark position-relative">
            <div class="container">


                <!--Navigation Menu-->
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav text-uppercase mr-auto">
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" style="font-size: 12px;" href="home.jsp">Discover</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" style="font-size: 12px;" href="about.jsp">About Us</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" style="font-size: 12px;" href="contact.jsp">Contact Us</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" style="font-size: 12px;" href="#">Privacy Policy</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" style="font-size: 12px;" href="#">Terms of Use</a></li>
                    </ul>
                </div>
            </div>

        </footer>
	<!--Login/SignUp tabs-->
	<script>
function openTab(evt, auth) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("SignUp-tab-content");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(auth).style.display = "block";
    evt.currentTarget.className += " active";
}
</script>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Plugin JavaScript -->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Contact form JavaScript -->
	<script src="js/jqBootstrapValidation.js"></script>
	<script src="js/contact_me.js"></script>

	<!-- Custom scripts for this template -->
	<script src="js/agency.min.js"></script>
	<!-- Firebase Link -->

</body>
</html>