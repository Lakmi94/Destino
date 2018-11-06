<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@page import="java.sql.*" %>
<%@page import="javax.servlet.*"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.util.*" language="java" %>
<%@ page import="java.io.*"%>
<%@ page import="java.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Destino</title>
<meta charset="utf-8">
<meta name="google-signin-client_id" content="1032689498916-u8i9l91qq544t77cijcfupqij5vjs5lg.apps.googleusercontent.com">
    <link rel="icon" type="image/png" href="img/logo2.png">
    
    <title>Destino</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

    <!-- Custom styles for this template -->
    <link href="css/agency.min.css" rel="stylesheet">
    
    <!--google Sign In-->
    <script src="https://apis.google.com/js/platform.js" async defer></script>

</head>

<body id="page-top">


<%
byte[ ] imgData = null ;
Blob image = null;
String lname = (String)session.getAttribute("lname");
String email = (String)session.getAttribute("email");
String userID =(String)session.getAttribute("userID");
String bio="";
String imgDataBase64="";
int tripId=0;
ResultSet countries;
String country="";

//Connecting to database
Class.forName("com.mysql.jdbc.Driver");  
Connection conn = DriverManager.getConnection("jdbc:mysql://166.62.29.165:3306/308db1?autoReconnect=true&useSSL=false","308db1","308db11234308db1"); 

try{
PreparedStatement ps1 = conn.prepareStatement("select * from users where userID = ?");
ps1.setString(1, userID);
ResultSet rs = ps1.executeQuery();

while(rs.next()){ 
image = rs.getBlob("ProfilePic");
bio=rs.getString("description");
imgData = image.getBytes(1,(int)image.length());
imgDataBase64=new String(Base64.getEncoder().encode(imgData));
}
if (session.getAttribute("fname")==null){

%>
 <nav class="navbar navbar-expand-lg fixed-top bgc" id="mainNav">
	<div class="container" style="margin-left: 3%;">
		<div><a class="navbar-brand" href="home.jsp" id="title">Destino</a> 
	<img class="logo" src="img/logo2.png" href="home.jsp"> </div>	
		
		<button class="navbar-toggler navbar-toggler-right" type="button"
			data-toggle="collapse" data-target="#navbarResponsive"
			aria-controls="navbarResponsive" aria-expanded="false"
			aria-label="Toggle navigation">
			<i class="fa fa-bars"></i>
		</button>
	</div>

	<!--Login form-->

	<div class="container" style="margin-left: 3%;">
		<div class="collapse navbar-collapse" id="navbarResponsive"
			style="margin-right: 3%;">
			<ul class="navbar-nav text-uppercase ml-auto">

				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="SignUp.jsp">Sign Up</a></li>
				
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="SignUp.jsp">Log In</a></li>
			</ul>
		</div>
	</div>
	</nav><%
}
else{ %>

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg fixed-top bgc" id="mainNav">
	<div class="container" style="margin-left: 3%;">
		<div><a class="navbar-brand" href="home.jsp" id="title">Destino</a> 
	<img class="logo" src="img/logo2.png" href="home.jsp"> </div>	
		<form class="nav-item" action="Search" method="post">
		<img class="icon" src="img/search-icon.png" style="margin-left: 4px; margin-right: 0px;"> 	
			<input class="form-control1 submit_on_enter" name="f_search" style="margin-left: 0px;"
			 placeholder="Search Destino" aria-label="Search" type="text"></form>
		<button class="navbar-toggler navbar-toggler-right" type="button"
			data-toggle="collapse" data-target="#navbarResponsive"
			aria-controls="navbarResponsive" aria-expanded="false"
			aria-label="Toggle navigation">
			<i class="fa fa-bars"></i>
		</button>
	</div>

	<!--Login form-->

	<%
    String fname = (String)session.getAttribute("fname");
   
%>
	<div class="container" style="margin-left: 3%;">
		<div class="collapse navbar-collapse" id="navbarResponsive"
			style="margin-right: 3%;">
			<ul class="navbar-nav text-uppercase ml-auto">

				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="FlightAndHotel.jsp">Flights</a></li>
				
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="newtrip.jsp">Trip Planner</a></li>
			 <%if(imgDataBase64.isEmpty()){
						%>
                            <li class="nav-item"><a class="nav-link js-scroll-trigger"><img
								id="profileImage" class="rounded-circle center-block"
								src="http://www.rlsandbox.com/img/profile.jpg"
								style="width: 40px; height: 40px; align-self: flex-start"
								href="profile.jsp"><%=fname %>
							</a></li>

                            <%}
								else{%>
								                                <li class="nav-item"><a class="nav-link js-scroll-trigger"><img
								        id="profileImage" class="rounded-circle center-block"
								        src="data:image/gif;base64,<%= imgDataBase64 %>"
								        style="width: 40px; height: 40px; align-self: flex-start"
								        href="profile.jsp"> <%=fname%></a></li>
								                                <%}}}catch(Exception e){
									

								}%>
			</ul>
		</div>
	</div>
	</nav>
<div>

<section class="bg-dark">
<header class="mastheadHome" style="background:none;position:top;" ">
	
		<div class="intro-text" style=" padding-top: 15px;padding-bottom: 60px" >
			<script src="https://widget.flowxo.com/embed.js" data-fxo-widget="eyJ0aGVtZSI6IiMwM2RkYzciLCJ3ZWIiOnsiYm90SWQiOiI1YjBkNzZmODE5YjcyMTAwMzk1ZWM0YzkiLCJ0aGVtZSI6IiMwM2RkYzciLCJsYWJlbCI6IlRyaXBweSBCb3QifSwid2VsY29tZVRleHQiOiJUcmlwcHlCb3QgVGFsa2luZyJ9" async defer></script>
			<div class="intro-lead-in">
				<h1>Contact Us</h1>
				<p></p>
				<p></p>
			</div>
				<br>
				<br> 
				<a href="home.jsp" style="color:#fff;"> <p></p></a>
		</div>
	
	</header>

                                                                      
 <a href="contact.jsp"><i></i>Contact Us or email us at <i>apl.destino@gmail.com</a></i></p>
 
 
 <!-- Mailing Server Section.. -->
<a id="foxyform_embed_link_929718" href="http://www.http://localhost:8080/contacts.html/">Destino will Reply Soon..</a>
<script type="text/javascript">
(function(d, t){
   var g = d.createElement(t),
       s = d.getElementsByTagName(t)[0];
   g.src = "http://www.foxyform.com/js.php?id=929718&sec_hash=b080f8cdacc&width=350px";
   s.parentNode.insertBefore(g, s);
}(document, "script"));
</script>
<!-- Mail Server from foxy. -->
</div>
<br>


    <footer class="navbar navbar-expand-lg navbar-dark position-relative">
            <div class="container">


                <!--Navigation Menu-->
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    
                     <ul class="navbar-nav text-uppercase mr-auto" style="margin-left:30%">
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" style="font-size: 12px;" href="home.jsp">Discover</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" style="font-size: 12px;" href="about.jsp">About Us</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" style="font-size: 12px;" href="contact.jsp">Contact Us</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" style="font-size: 12px;" href="privacy.jsp">Privacy Policy</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" style="font-size: 12px;" href="terms.jsp">Terms of Use</a></li>
  					<li class="nav-item">
                             <form action="Home" method="POST"><input class="logout nav-link js-scroll-trigger" style="font-size: 12px;" type="submit" id="menuLoginBtn" name="submit" value="LOGOUT"></form>
                        </li>

                    </ul>
                        
                       
                        
                </div>
            </div>



        </footer>

               <!--Login Form-->
    <script>
        // Get the modal
        var modal = document.getElementById('id01');

        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
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
</body>
</html>
