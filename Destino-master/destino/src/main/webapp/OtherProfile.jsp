<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*" %>
<%@page import="javax.servlet.*"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.util.*" language="java" %>
<%@ page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>Destino</title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="google-signin-client_id" content="1032689498916-u8i9l91qq544t77cijcfupqij5vjs5lg.apps.googleusercontent.com">

    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.3.1/dist/leaflet.css" integrity="sha512-Rksm5RenBEKSKFjgI3a41vrjkw4EVPlJ3+OiI65vTjIdo9brlAacEuKOiQ5OFh7cOI1bkDwLqdLw3Zg0cRJAAQ==" crossorigin="" />

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

    <!--Axios: for ajax requests-->
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>

<body id="page-top" style="background-color: #282828">
<%
if (session.getAttribute("fname")==null){
	 response.sendRedirect("Signup.jsp?error="+"In order to access this page you need to login first!");
} 
	byte[ ] imgData = null ;
	Blob image = null;
    String fname = (String)session.getAttribute("fname");
    String lname = (String)session.getAttribute("lname");
    String email = (String)session.getAttribute("email");
    String userID =(String)session.getAttribute("userID");
    String facebook = "";
	String twitter ="";
	String bio="";
    String imgDataBase64="";
    String profilePic="";
    String uid=request.getParameter("uid");
    int tripId=0;
	ResultSet countries;
	String country="";
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

<script src="https://widget.flowxo.com/embed.js" 
data-fxo-widget="eyJ0aGVtZSI6IiMwM2RkYzciLCJ3ZWIiOnsiYm90SWQiOiI1YjBkNzZmODE5YjcyMTAwMzk1ZWM0YzkiLCJ0aGVtZSI6IiMwM2RkYzciLCJsYWJlbCI6IlRyaXBweSBCb3QifSwid2VsY29tZVRleHQiOiJUcmlwcHlCb3QgVGFsa2luZyJ9" async defer></script>
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
		
	    
	    //Get The user prile pic
	    try{
	    	PreparedStatement ps1 = conn.prepareStatement("select * from users where userID = ?");
	    	ps1.setString(1, userID);
	    	ResultSet rs = ps1.executeQuery();
	        while(rs.next()){ 
	        	image = rs.getBlob("ProfilePic");
	            imgData = image.getBytes(1,(int)image.length());
	        	imgDataBase64=new String(Base64.getEncoder().encode(imgData));
	        

	        	facebook=rs.getString("facebook");
	        	twitter=rs.getString("twitter");
	        	bio=rs.getString("description");
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
<!-- 			Check if the user has a profile pic -->
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

    <!----------------------------------->
    <div class="jumbotron text-left" style="background-color: #1e1d22;">
        <!--Map-->
        <div id="mapid"></div>
        
        <!--User Information-->
<div class="userInfo">
    <%
    //Get the other user accaount
    try{
    	PreparedStatement ps1 = conn.prepareStatement("select * from users where userID = ?");
    	ps1.setString(1, uid);
    	ResultSet rs = ps1.executeQuery();
        while(rs.next()){ 
        	image = rs.getBlob("ProfilePic");
        	fname=rs.getString("first_name");
        	lname=rs.getString("last_name");
        	bio=rs.getString("description");
            imgData = image.getBytes(1,(int)image.length());
        	profilePic=new String(Base64.getEncoder().encode(imgData));
        }
    }catch(Exception e)
    {
    	
    }
    %>
        <!--Profile Image-->
        <%if(profilePic.isEmpty()){%>
        <img id="profileImage" class="rounded-circle left-block" src="http://www.rlsandbox.com/img/profile.jpg">
		<%}else{ %>
		 <img id="profileImage" class="rounded-circle left-block" src="data:image/gif;base64,<%=profilePic %>" style="width:100px;height:100px;">
		<%} %>
		
    <!--User Name-->
        <h2 class="text-left" style="padding-left: 0%;margin-left: 0%;"><b id="userName" name="user"><%=fname%> <%=lname%></b></h2>
    <!-- User Social Media -->
							<div id="socialMedia">
							
							<span><%if(facebook.isEmpty()) {%><a class="fa fa-facebook-square" style="color:#6a6d7c; font-size:36px" href="#"></a>
							<%} else{%>
							<a class="fa fa-facebook-square" style="font-size:36px" href="<%=facebook%>" target="_blank"></a>
							<%}%>
							</span>
							
							<span><%
							if(twitter.isEmpty()){
							%><a class="fa fa-twitter-square" style="color:#6a6d7c; font-size:36px" href="#"></a>
							<%} else{
							%>
							<a class="fa fa-twitter-square" style="font-size:36px" href="<%=twitter%>" target="_blank"></a>
							<%} %>
							</span>
							</div>
							<br><br>
    <!--User Description-->
    <%if(bio.isEmpty()){ %>
    <h5 class="userDesc" id="Description" name="desc"> </h5>
    <%}
    else{%>
     <h5 class="userDesc" id="Description" name="desc"><%=bio %></h5>
     <%} %>
     

</div><br><br>

    </div>

    <nav>
        <div class="tabs-destino nav nav-tabs" id="nav-tab" role="tablist">
            <!--Stories-->
            <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true" onmouseover="changeColor(this)" onmouseout="changeBackColor(this)">Stories<span class="glyphicon glyphicon-book"></span></a>

            <!--Favorites-->
            <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-favorites" role="tab" aria-controls="nav-profile" aria-selected="false" style="color: #03ddc7;" onmouseover="changeColor(this)" onmouseout="changeBackColor(this)">Favorites<span class="glyphicon glyphicon-heart"></span></a>

            <!--Following-->
            <a class="nav-item nav-link" id="nav-follow-tab" data-toggle="tab" href="#nav-following" role="tab" aria-controls="nav-following" aria-selected="false" style="color: #03ddc7;" onmouseover="changeColor(this)" onmouseout="changeBackColor(this)">Following<span class="glyphicon glyphicon-user"></span></a>

            </div>
    </nav>
    <p class="row"></p>
    
    <!--Stories-->
    <div class="tab-content" id="nav-tabContent">
        <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
<%
try {
    PreparedStatement ps=conn.prepareStatement("select * from trip where userID_trip=?");
            //USE THE ID
    ps.setString(1, uid);
    ResultSet trips=ps.executeQuery();
    boolean prof = false;
    %> <div class="container" style="margin-left:2%;margin-right:2%;margin-bottom:2%;margin-top:2%;">
	  
	  <div class="row"> 
	  
  <%
        while(trips.next())
        {
        	prof = true; 
        	tripId=trips.getInt("TripID");
			//Get the name of the country assocaiated with the trip 
				PreparedStatement countryName=conn.prepareStatement("select countryName from Country where TripID_country=?");
				countryName.setInt(1,tripId);
				countries=countryName.executeQuery();
				while(countries.next())
				{
					country=countries.getString(1);
            %><div class="col-sm-6 col-md-4">
				<div class="card mb-4 box-shadow">
				<a style="color: #212529;" href="trip.jsp?TripID=<%=trips.getInt("TripID")%>">
				
				          	<!--Getting geolocations for inputing on the map-->
                                        	
                                        	<script>
                                        	var lat,longi;
                                        	var location
                                        	geocode();
                                        	function geocode()
                                    		{
                                    			var location="<%=country%>"; 
                                                axios.get('https://maps.googleapis.com/maps/api/geocode/json?address=' + location + '&key=AIzaSyD3BGsGYoUdXxL3oP0cgfW0-PF_w-wQetE').then(function(response) {
                                                    console.log(response);
                                                    lat = response.data.results[0].geometry.location.lat;
                                                    longi = response.data.results[0].geometry.location.lng;
                                                    addOnMap(lat,longi,location);
                                                })
                                    		}
                                        	
                                        function addOnMap(latitude,longitude,location)
                                        {
                                        	 var circle = L.circle([latitude, longitude], {
                                                 color: 'red',
                                                 fillColor: '#f03',
                                                 fillOpacity: 0.5,
                                                 radius: 1000
                                             }).addTo(mymap).bindPopup(location);
                                        }
                                        	</script>
				
  			<%  //Get the image trip
  				try{
		               int  tripID=trips.getInt("TripID");
		               PreparedStatement ps3 = conn.prepareStatement("select image from image where TripID_image = ?;");
		               ps3.setInt(1, tripID);
		               ResultSet rs3 = ps3.executeQuery();
		               if (rs3.next()){
		            	   image = rs3.getBlob("image");
		                   imgData = image.getBytes(1,(int)image.length());
		               	imgDataBase64=new String(Base64.getEncoder().encode(imgData));   
		               %>
		               		<img class="card-img-top" src="data:image/gif;base64,<%=imgDataBase64 %>" style = "height:350px; width:100%" display ="block">
		                	<%
		               }
		               else{
		            	   %><img class="card-img-top" src="img/portfolio/06-thumbnail.jpg" style = "height:350px; width:100%" display ="block"><% 
		               }
		               }
		                catch (Exception e){
		                	
		                }%>
		                		  			
		                  <div class="card-body">
		                      <h4><%=trips.getString("title")%></h4>
		                      <p><%=trips.getString("Tripdescription")%></p>
		                      <div style="padding-left:15px; padding-bottom:15px;">
		                   <i class="fa fa-thumbs-o-up" style="color:#03DDC7;"></i>
		           <small class="text-muted" style="padding-left:2px;"><%=trips.getString("TripNumLikes")%></small>
		                </div>  
		                     
		                      <div class="d-flex justify-content-between align-items-center">
		                      
		                      </div>
		                  </div>	</a>
		              </div>
		              </div>

			<%
			if(!prof){
	 		 %> 	
	  		<h2  style="text-align: center;">No Trips to be Found</h2>
	 		 <%
			}
			else{}		 
       		 }
			}
}
	        catch (Exception e){
	        	}	        
%>
  				      </div>
		              </div>
		              </div>

        <!--Favorites stories-->

        <div class="tab-pane fade" id="nav-favorites" role="tabpanel" aria-labelledby="nav-profile-tab">
            <div id="favorites">
        <img src="img/logoUnfocus.png" style="width:20%;height:40%;  margin-left:40%;"><br><p style="color: darkgray;text-align: center;font-size: 12px;"> Oops, it seems like you did not like any story yet.</p>
            </div>
        </div>

        <!--Followers-->

        <div class="tab-pane fade" id="nav-following" role="tabpanel" aria-labelledby="nav-contact-tab">
            <div id="folowing">
        <img src="img/logoUnfocus.png" style="width:20%;height:40%;  margin-left:40%;"><br><p style="color: darkgray;text-align: center;font-size: 12px;"> Oops, it seems like you are not following anybody yet.</p>
            </div>
            </div>
</div>



    <!-- Footer -->
	    <footer class="navbar navbar-expand-lg navbar-dark position-relative" style="margin-left:35%;">
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

        <!-- Make sure you put this AFTER Leaflet's CSS -->
        <script src="https://unpkg.com/leaflet@1.3.1/dist/leaflet.js" integrity="sha512-/Nsx9X4HebavoBvEBuyp3I7od5tA0UzAxs+j83KgC8PU0kgB4XiK4Lfe4y4cgBtaRJQEIFCW+oC506aPT2L1zw==" crossorigin=""></script>

        <!-- Map Script -->
        <script>
            var mymap = L.map('mapid').setView([-3.3488767, 29.3686321], 2.2);
            L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
                attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
                maxZoom: 18,
                id: 'mapbox.streets-satellite',
                accessToken: 'pk.eyJ1Ijoic3Vydml2b3JzIiwiYSI6ImNqaDk1am83cTA5MmkzNm4wMzh3OGc3M2cifQ.Fkm3EUu09j4i7nMe-JlnSQ'
            }).addTo(mymap);
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
        <!--For mouse hovering over the objects-->
        <script>
            function changeColor(tab) {
                tab.style.color = "#02ab9a";
            }
            function changeBackColor(tab) {
                tab.style.color = "";
            }
        </script>

        <!-- /.container -->
    <!--google Sign In-->
    <script src="https://apis.google.com/js/platform.js" async defer></script>

    <!--Leaflet map link-->
    <script src='https://api.mapbox.com/mapbox-gl-js/v0.44.2/mapbox-gl.js'></script>

    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
    <!--Google places API-->
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD3BGsGYoUdXxL3oP0cgfW0-PF_w-wQetE&libraries=places&callback=autoComp"></script>
    
    <!--Google Maps APIs-->
    <!--<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD3BGsGYoUdXxL3oP0cgfW0-PF_w-wQetE"
    async defer></script>-->
</body>

</html>