<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" language="java" %>
<%@ page import="java.io.*"%>
<%@ page import="java.text.*" %>
<%@ page import="java.util.Date" %>
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
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

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
<%
if (session.getAttribute("fname")==null)
{
	 response.sendRedirect("SignUp.jsp?error="+"In order to access this page you need to login first!");
}

byte[ ] img = null ;
Blob image = null;
String fname = (String)session.getAttribute("fname");
String lname = (String)session.getAttribute("lname");
String email = (String)session.getAttribute("email");
String userID =(String)session.getAttribute("userID");
String imgDataBase64="";

%>


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

	<div class="container" style="margin-left: 3%;">
		<div class="collapse navbar-collapse" id="navbarResponsive"
				style="margin-right: 3%;">
			<ul class="navbar-nav text-uppercase ml-auto">

				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="FlightAndHotel.jsp">Flights</a></li>
				
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="newtrip.jsp">Trip Planner</a></li>
					<li class="nav-item">
                             <form action="Home" method="POST"><input class="logout nav-link js-scroll-trigger" type="submit" id="menuLoginBtn" name="submit" value="LOGOUT"></form>
                        </li>
                        
                        
 <% 
		
		//Connecting to database
	    Class.forName("com.mysql.jdbc.Driver");  
	    Connection conn = DriverManager.getConnection("jdbc:mysql://166.62.29.165:3306/308db1?autoReconnect=true&useSSL=false","308db1","308db11234308db1"); 
		
	    try{
	    	PreparedStatement profile = conn.prepareStatement("select ProfilePic from users where userID = ?");
	    	profile.setString(1, userID);
	    	ResultSet profilepic = profile.executeQuery();

	        while(profilepic.next()){ 
	        	image = profilepic.getBlob("ProfilePic");
	            img = image.getBytes(1,(int)image.length());
	        	imgDataBase64=new String(Base64.getEncoder().encode(img));
 			}
	        
	    }
		catch(Exception e){
			try {
		    	Class.forName("com.mysql.jdbc.Driver");  
			    Connection con=DriverManager.getConnection("jdbc:mysql://166.62.29.165:3306/308db1?autoReconnect=true&useSSL=false","308db1","308db11234308db1"); 
			    
			    PreparedStatement errorcatch=con.prepareStatement("insert into Errors values(?,?)");
			    errorcatch.setString(1, userID);
			    errorcatch.setString(2, e.getMessage());
		    	}catch(Exception exception)
		    	{
		    		
		    	}
			}
%>                       
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="profile.jsp">
			<%if(imgDataBase64!=""){
				%>
				
								<img
										id="profileImage" class="rounded-circle center-block"
										src="data:image/*;base64,<%= imgDataBase64%>"
										style="width: 40px; height: 40px; align-self: flex-start;cursor:pointer"
										>
							<%}else{

							%>
							<img
						id="profileImage" class="rounded-circle center-block"
						src="http://www.rlsandbox.com/img/profile.jpg"
						style="width: 40px; height: 40px; align-self: flex-start;cursor:pointer"
						>
						
							<%}%>
			<%=fname%></a>
								</li>
						
			</ul>
		</div>
	</div>
	</nav>
	


<%

//Connecting to database

Date date = Calendar.getInstance().getTime();
DateFormat formatter = new SimpleDateFormat("MM/dd/yyyy, EEE");
String today = formatter.format(date);

//Get trip data with TripID
try{
PreparedStatement ps1 = conn.prepareStatement("select count(*) from users;");
ResultSet rs1 = ps1.executeQuery();
PreparedStatement ps2 = conn.prepareStatement("select count(*) from trip;");
ResultSet rs2 = ps2.executeQuery();
PreparedStatement ps3 = conn.prepareStatement("select count(*) from Country;");
ResultSet rs3 = ps3.executeQuery();

%>
	<!-- Landing cover page -->
	<header class="mastheadHome">
	<div class="container">
		<div class="intro-text">
			<script src="https://widget.flowxo.com/embed.js" data-fxo-widget="eyJ0aGVtZSI6IiMwM2RkYzciLCJ3ZWIiOnsiYm90SWQiOiI1YjBkNzZmODE5YjcyMTAwMzk1ZWM0YzkiLCJ0aGVtZSI6IiMwM2RkYzciLCJsYWJlbCI6IlRyaXBweSBCb3QifSwid2VsY29tZVRleHQiOiJUcmlwcHlCb3QgVGFsa2luZyJ9" async defer></script>
			<div class="intro-lead-in">
				<h1>Traveling Made Perfect</h1>
				<p>Plan your next adventure and tell the world about it</p>
				<p></p>
			</div>
		</div>
	</div>
	</header>
    <div class="row bg-light"><h1> </h1></div>
    <div class="row bg-light"><h1> </h1></div>
    <div class="bg-light" id="statistic">
        <div class="container">
            <div class="row">
            <%
    //When result grid is not empty, get title, description, and triptype
    if(rs1.next() && rs2.next() && rs3.next()){ 
    %>
            
                <div class="information-box">
                <div>
                <div><%=today %></div>
                <div class="row"><h1></h1></div>
                    <div class="information-left">
                        <p><strong><b><%=rs1.getString("count(*)") %></b></strong></p>
                        <p>Users</p>
                    </div>
                    <div class="information-middle">
                        <p><strong><b><%=rs2.getString("count(*)") %></b></strong></p>
                        <p>Trips</p>
                    </div>
                    <div class="information-right">
                        <p><strong><b><%=rs3.getString("count(*)") %></b></strong></p>
                        <p>Countries</p>
                    </div>
                </div>
        <% 
    }
    }

    catch (Exception e) {
    e.printStackTrace();
    }%>
            </div>
        </div>
    </div>
        
	<section class="bg-light" id="portfolio">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<h2 class="section-heading text-uppercase">Community</h2>
				<p>Explore the world through Destino</p>
			</div>
		</div>

		<div class="row">
			<div class="col-md-4 col-sm-6 portfolio-item" id="community1">

				<a href="tripType.jsp?type=backpacking" name="type"
					value="Backpacking"> <img class="img-fluid1"
					src="img/photo1.jpg">
					<div class="centered text-uppercase">Backpacking</div>
				</a>

			</div>
			<div class="col-md-4 col-sm-6 portfolio-item" id="community2">
				<a href="tripType.jsp?type=Packages" name="type" value="Packages">

					<img class="img-fluid1" src="img/photo2.jpg" alt="">
					<div class="centered text-uppercase">Packages</div>
				</a>

			</div>
			<div class="col-md-4 col-sm-6 portfolio-item" id="community3">
				<a href="tripType.jsp?type=Honeymoon" name="type" value="Honeymoon">
					<img class="img-fluid1" src="img/photo3.jpg" alt="">
					<div class="centered text-uppercase">Honeymoon</div>
				</a>

			</div>

			<div class="col-md-4 col-sm-6 portfolio-item" id="community4">
				<a href="tripType.jsp?type=Camping" name="type" value="Camping">
					<img class="img-fluid1" src="img/photo4.jpg" alt="">
					<div class="centered">Camping</div>
				</a>

			</div>

			<div class="col-md-4 col-sm-6 portfolio-item" id="community5">
				<a href="tripType.jsp?type=Road Trips" name="type"
					value="Road Trips"> <img class="img-fluid1"
					src="img/photo5.jpg" alt="">
					<div class="centered1">Road Trips</div>
				</a>
			</div>

			<div class="col-md-4 col-sm-6 portfolio-item" id="community6">
				<a href="tripType.jsp?type=Expeditions" name="type"
					value="Expeditions"> <img class="img-fluid1"
					src="img/photo6.jpg" alt="">
					<div class="centered">Expeditions</div>
				</a>
			</div>

			<div class="col-md-4 col-sm-6 portfolio-item" id="community7">
				<a href="tripType.jsp?type=Beaches" name="type" value="Beaches">
					<img class="img-fluid1" src="img/photo7.jpg" alt="">
					<div class="centered">Beaches</div>
				</a>
			</div>


			<div class="col-md-4 col-sm-6 portfolio-item" id="community8">
				<a href="tripType.jsp?type=Wellness" name="type" value="Wellness">
					<img class="img-fluid1" src="img/photo8.jpg" alt="">
					<div class="centered">Wellness</div>
				</a>
			</div>

			<div class="col-md-4 col-sm-6 portfolio-item" id="community9">
				<a href="tripType.jsp?type=Adventure" name="type" value="Adventure">
					<img class="img-fluid1" src="img/photo9.jpg" alt="">
					<div class="centered">Adventure</div>
				</a>
			</div>

			<div class="col-md-4 col-sm-6 portfolio-item" id="community10">
				<a href="tripType.jsp?type=Culture" name="type" value="Culture">
					<img class="img-fluid1" src="img/photo10.jpg" alt="">
					<div class="centered">Culture</div>
				</a>
			</div>

			<div class="col-md-4 col-sm-6 portfolio-item" id="community11">
				<a href="tripType.jsp?type=Sailing" name="type" value="Sailing">
					<img class="img-fluid1" src="img/photo11.jpg" alt="">
					<div class="centered">Sailing</div>
				</a>
			</div>

			<div class="col-md-4 col-sm-6 portfolio-item" id="community12">
				<a href="tripType.jsp?type=Space" name="type" value="Space"> <img
					class="img-fluid1" src="img/photo12.jpg" alt="">
					<div class="centered">Space</div>
				</a>
			</div>

		</div>
	</div>
	</section>


	<!-- Portfolio Grid -->
	<section class="bg-light" id="portfolio">
	<div class="container">
	
	<%
	byte[ ] imgData1 = null ;
	Blob image1 = null;
	    
	try{
		
		  PreparedStatement ps = conn.prepareStatement("select * from trip where TripNumLikes >= 5");	
		  ResultSet rs1 = ps.executeQuery();
		  boolean exists1 = false;
		  
	%>
	<div class="col-lg-12 text-center">
				<h2 class="section-heading text-uppercase">Discover</h2>
			</div>
		<div class="row">
			
			<br>
			<%
			
			while(rs1.next()){
			  exists1 = true;
			  
			  %>
			  <div class="col-md-4 col-sm-6">
				<div class="card mb-4 box-shadow">
				<a style="color: #212529;" href="trip.jsp?TripID=<%=rs1.getInt("TripID")%>">
				
				 <%  try{
		               int  numTripID=rs1.getInt("TripID");
		               PreparedStatement ps3 = conn.prepareStatement("select image from image where TripID_image = ?;");
		               ps3.setInt(1, numTripID);
		               ResultSet rs3 = ps3.executeQuery();
		               if (rs3.next()){
		            	   image1 = rs3.getBlob("image");
		                   imgData1 = image1.getBytes(1,(int)image1.length());
		               	String imgDataBase=new String(Base64.getEncoder().encode(imgData1));   
		               %>
		               
		                	<img class="card-img-top" src="data:image/gif;base64,<%=imgDataBase %>" style = "height:auto; width:100%" display ="block">
		                	<%
		               }
		               else{
		            	   %><img class="card-img-top" src="img/portfolio/06-thumbnail.jpg" style = "height:auto; width:100%" display ="block"><% 
		               }
		               }
		                catch (Exception e){}%> 
				
				 <div class="card-body">
		                      <h5><%=rs1.getString("title")%></h5>
		                      <p><%=rs1.getString("Tripdescription")%></p>
		                  </div></a> <hr style="width:100%;">
		                  <div style="padding-left:15px; padding-bottom:15px;">
		                   <i onclick="myFunction(this)" class="fa fa-thumbs-o-up" style="color:#03DDC7;"></i>
		           <small class="text-muted" style="padding-left:2px;"><%=rs1.getString("TripNumLikes")%></small>
		                </div>  
		              </div>
		              </div>
		              <br>
				
				<%
	}
if(!exists1){
	  %> 	<h2  style="text-align: center;">No Trips to be Found</h2><%
}
else{}		 
	}
	        catch (Exception e){}
	%>
	
	</div>
	
			
				
		</div>
	
	</section>


	<!-- Footer -->
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
<!-- 	<script type="text/javascript"> -->
<!-- //             Get the modal -->
<!-- //             var modal = document.getElementById('id01'); -->
<!-- //              When the user clicks anywhere outside of the modal, close it -->
<!-- //             window.onclick = function(event) { -->
<!-- //                 if (event.target == modal) { -->
<!-- //                     modal.style.display = "none"; -->
<!-- //                 } -->
<!-- //             } -->
<!--         </script> -->
        <script>
        $(document).ready(function() {

        	  $('.submit_on_enter').keydown(function(event) {
        	    // enter has keyCode = 13, change it if you want to use another button
        	    if (event.keyCode == 13) {
        	      this.form.submit();
        	      return false;
        	    }
        	  });

        	});
        </script>



</body>

</html>