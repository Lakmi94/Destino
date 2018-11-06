<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" language="java" %>
<%@ page import="java.io.*"%>
<%@ page import="java.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="JRS" content="">
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
        <link rel="stylesheet" type="text/css" href="css/app.css">

        <!-- Custom styles for this template -->
        <link href="css/agency.min.css" rel="stylesheet">

        <!--google Sign In-->
        <script src="https://apis.google.com/js/platform.js" async defer type="text/javascript"></script>
        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js" type="text/javascript"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js" type="text/javascript"></script>

        <!--     Plugin JavaScript -->
        <script src="vendor/jquery-easing/jquery.easing.min.js" type="text/javascript"></script>

        <!-- Contact form JavaScript -->
        <script src="js/jqBootstrapValidation.js" type="text/javascript"></script>
        <script src="js/contact_me.js" type="text/javascript"></script>

        <!-- Custom scripts for this template -->
        <script src="js/agency.min.js" type="text/javascript"></script>
</head>

<body id="page-top" style="background-color: #282828">
<%String fname = (String)session.getAttribute("fname"); %>
  <%
		byte[ ] imgDataX = null ;
		Blob imageX = null;
		String lname = (String)session.getAttribute("lname");
		String email = (String)session.getAttribute("email");
		String userID =(String)session.getAttribute("userID");
		String bio="";
		String imgDataBase64X="";
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
		imageX = rs.getBlob("ProfilePic");
		bio=rs.getString("description");
		imgDataX = imageX.getBytes(1,(int)imageX.length());
		imgDataBase64X=new String(Base64.getEncoder().encode(imgDataX));
}%>


        <!-- Navigation -->
        <nav class="navbar navbar-expand-lg fixed-top bgc" id="mainNav">
            <div class="container" style="margin-left: 3%;">
                <div><a class="navbar-brand" href="home.jsp" id="title">Destino</a>
                    <img class="logo" src="img/logo2.png" href="home.jsp"> </div>
                <form class="nav-item" action="Search" method="post">
                    <img class="icon" src="img/search-icon.png" style="margin-left: 4px; margin-right: 0px;">
                    <input class="form-control1 submit_on_enter" name="f_search" style="margin-left: 0px;" placeholder="Search Destino" aria-label="Search" type="text"></form>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
					<i class="fa fa-bars"></i>
				</button>
            </div>

            <script src="https://widget.flowxo.com/embed.js" data-fxo-widget="eyJ0aGVtZSI6IiMwM2RkYzciLCJ3ZWIiOnsiYm90SWQiOiI1YjBkNzZmODE5YjcyMTAwMzk1ZWM0YzkiLCJ0aGVtZSI6IiMwM2RkYzciLCJsYWJlbCI6IlRyaXBweSBCb3QifSwid2VsY29tZVRleHQiOiJUcmlwcHlCb3QgVGFsa2luZyJ9" async defer></script>
            <div class="container" style="margin-left: 3%;">
                <div class="collapse navbar-collapse" id="navbarResponsive" style="margin-right: 3%;">
                    <ul class="navbar-nav text-uppercase ml-auto">

                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="FlightAndHotel.jsp">Flights</a></li>

                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="newtrip.jsp">Trip Planner</a></li>
<li class="nav-item">
                             <form action="Home" method="POST"><input class="logout nav-link js-scroll-trigger" type="submit" id="menuLoginBtn" name="submit" value="LOGOUT"></form>
                        </li>
                        <%if(imgDataBase64X.isEmpty()){
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
								        src="data:image/gif;base64,<%= imgDataBase64X %>"
								        style="width: 40px; height: 40px; align-self: flex-start"
								        href="profile.jsp"> <%=fname%></a></li>
								                                <%}
								}catch(Exception e){
									

								}%>
                    </ul>
                </div>
            </div>
        </nav>

    <!----------------------------------->
  
  
 <% String type1 = request.getParameter("type");    
request.setAttribute("type", type1); 
  %>  
 

<header class="mastheadTrip">
	<div class="container">
		<div class="intro-text">
			<div class="intro-lead-in">
				<h1 class ="text-uppercase">${type}</h1>
			</div>
			
		</div>
	</div>
	</header>

 <section class="bg-light" id="portfolio">
  <div class="container">
      <div class="row"> 
      
              
  <%byte[ ] imgData = null ;
	Blob image1 = null;
  try {
	
  String type2 = request.getParameter("type");
 // request.setAttribute("type", type2);
  PreparedStatement ps = conn.prepareStatement("select * from trip where tripType=?");
  ps.setString(1, type2);
  
  ResultSet rs = ps.executeQuery();
  boolean count = false;
       //if the result of the querys is not empty
    while (rs.next()){
    	count =true;
    	%>
    	
    	 <div class="col-md-4 col-sm-6">
                    <div class = "card mb-4 box-shadow">
                        <a href="trip.jsp?TripID=<%=rs.getString("TripID")%>">
				<%  try{
		               int  numTripID=rs.getInt("TripID");
		               PreparedStatement ps3 = conn.prepareStatement("select image from image where TripID_image = ?;");
		               ps3.setInt(1, numTripID);
		               ResultSet rs3 = ps3.executeQuery();
		               if (rs3.next()){
		            	   image1 = rs3.getBlob("image");
		                   imgData = image1.getBytes(1,(int)image1.length());
		               	String imgDataBase=new String(Base64.getEncoder().encode(imgData));   
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
                            <h4><%=rs.getString("title")%></h4>
                            <p class="card-text"><%=rs.getString("Tripdescription")%></p></a>
                            <div class="d-flex justify-content-between align-items-center">
                            <small class="text-muted"><%=rs.getString("TripNumLikes") %></small>
                            </div>
                        </div>
                    </div>
                    </div>
    	

    	<% 

	
  }
if(!count){
	 %> 	<h2  style="text-align: center;">No Trips to be Found</h2><%
}	
  }
  catch(Exception e)
  {
    
  }
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
  
</body>

</html>