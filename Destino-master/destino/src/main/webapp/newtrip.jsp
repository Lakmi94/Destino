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
        <!-- Custom styles for this template -->
        <link href="css/3-col-portfolio.css" rel="stylesheet">
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

        <!-- Axios for easy ajax request  -->
        <script src="https://unpkg.com/axios/dist/axios.min.js"></script>

        <!--     <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet">-->

        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <link href="css/jumbotron.css" rel="stylesheet">
        <!------------------------------------------------>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Destino project - APL</title>

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
	

<br><br><br><br><br>

        <div class="container-fluid text-center">
            <div class="row">

                <!-- left space -->
                <div class="col-sm-2 sidenav">
                </div>
                <!-- middle column -->
                <div class="col-sm-8 text-left">
                    <!--Define the servlet to open-->
                    <form action="NewTrip" method="post" enctype="multipart/form-data">
                        <div class="jumbotron text-left">
                            <h2 style="color: #282828; text-align: center;
                                    margin-bottom: 3%;">Add a New Trip</h2>

                                    <!-- Error message space -->
                                    <%if(request.getParameter("error")==null)
                                    {%>
                                    <div class="row"></div>
                                    <%}
                                    else{%>
                                        <div class="row" color="red"><%=request.getParameter("error")%></div>
                                    <%}%>
                            <!--Title-->
                            <div class="row">
                                <div class="col-md-2" style="margin-top: auto;margin-bottom: auto;">
                                    <label for="title">Name of Trip</label></div>
                                <div class="col-md-41" style="margin-top: auto;margin-bottom: auto;">
                                    <input type="text" class="form-control" id="title" name="title" placeholder="Enter the trip name" style="border-radius: 5px; width: 100%;" required></div>
                            </div>


                            <!--Location-->
                            <div class="row">
                                <div class="col-md-2" style="margin-top: auto;margin-bottom: auto;">
                                    <label for="place">Location</label>
                                </div>
                                <div class="col-md-41">
                                    <input type="text" style="border-radius: 5px;" class="form-control" id="place" name="location" style="width: 100%;" onchange="geocode()"> <label id="short_name" name="short_name" required></label>
                                </div>
                            </div><br>


                            <!--Date Picker-->
                            <div class="row">

                                <div class="col-md-2"><label for="datePicker">Date</label></div>
                                <div class="col-md-41">
                                    <span class="glyphicon glyphicon-calendar"></span>&nbsp;
                                    <span><input type="date" id="datePicker" style="border-radius: 5px;" name="datePicker">&nbsp;</span>

                                    <!--For Date Picking-->
                                    <!-- /*Get the first date*/-->
                                    <script type="text/javascript">
                                        $(function() {
                                            $('#datepicker').datepicker();
                                        });
                                    </script>
                                </div>

                            </div><br>

                            <!--Description-->
                            <div class="row">
                                <label for="context1">Description</label>
                            </div>
                            <div class="row">
                                <textarea class="form-control" rows="6" id="context1" style="border-radius: 5px; width: 70%;" name="description"></textarea>
                            </div><br>

                            <!--Add Trip Type-->
                            <div class="row" style="width: auto; height: auto;">
                                <div class="col-md-6"><label for="trip_type">Trip Type</label></div>
                                <div class="col-md-6"><label for="transport_mode">Mode of Transport</label></div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <select style="height: 25px; border-radius: 5px; width: 50%;" name="trip_type">
                                <option selected value="none">Select</option>
                                <option value="Backpacking">Backpacking</option>
                                <option value="Packages">Packages</option>
                                <option value="HoneyMoon">Honeymoon</option>
                                <option value="Camping">Camping</option>
                                <option value="RoadTrips">Road Trip</option>
                                <option value="Expeditions">Expeditions</option>
                                <option value="Beaches">Beaches</option>
                                <option value="Wellness">Wellness</option>
                                <option value="Adventure">Adventure</option>
                                <option value="Culture">Culture</option>
                                <option value="Sailing">Sailing</option>
                                <option value="Space">Space</option>
                            </select>
                                </div>
                                <!--Add Mode of transport-->
                                <div class="col-md-6" style="float: right;">
                                    <select style="height: 25px; border-radius: 5px;width: 50%;" name="transport_mode">
                                        <option selected value="none">Select</option>
                                        <option value="Plane">By Plane</option>
                                        <option value="Car">By Car</option>
                                        <option value="Boat">By Boat</option>
                                        <option value="Foot">By Foot</option>
                                        <option value="Bike">By Bike</option>
                                        <option value="Train">By Train</option>
                                        <option value="Bus">By Bus</option>
                                    </select>
                                </div>
                            </div><br>

                            <!--Add Photos-->
                            <div class="row"><label>Upload images</label></div>
                            <div class="row">
                                <input type="file" class="imageUpload btn" name="pic1" style="border-radius: 5px;" multiple="false" accept="image/*">
                            	</div>
                            <div class="row">
                                <input type="file" class="imageUpload btn" name="pic2" style="border-radius: 5px;" multiple="false" accept="image/*">
                                </div>
                            <div class="row">
                                <input type="file" class="imageUpload btn" name="pic3" style="border-radius: 5px;" multiple="false" accept="image/*">
                                </div>
                            <div class="row">
                                <input type="file" class="imageUpload btn" name="pic4" style="border-radius: 5px;" multiple="false" accept="image/*">
                                </div>
                            <div class="row">
                                <input type="file" class="imageUpload btn" name="pic5" style="border-radius: 5px;" multiple="false" accept="image/*">
                                </div>
                            <div class="row">
                                <input type="file" class="imageUpload btn" name="pic6" style="border-radius: 5px;" multiple="false" accept="image/*" onchange="moreImages()"></div>
                            <div class="row" id="moreImages">
                            </div>
                            <div class="imageOutput"></div>
                        </div>


                        <div class="form-group" align="right">
                            <button class="btn btn-primary" id="savetrip" type="submit" name="submit" value="save">Save</button>
                            <button class="btn btn-secondary" id="canceltrip" name="submit" value="cancel">Cancel</button>
                        </div>
                    </form>
                </div>



            </div>
            <!-- right column -->
            <div class="col-sm-2 sidenav">
            </div>
        </div>


        <!-- Footer -->
        <footer class="navbar navbar-expand-lg navbar-dark position-relative">
            <div class="container">


                <!--Navigation Menu-->
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav text-uppercase mr-auto" style="margin-left:35%">
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
        <!--For country autocomplete and geocoding-->
        <script>
            function autoComp() {
                var input = document.getElementById("place");
                var autocomplete = new google.maps.places.Autocomplete(input);
                var result=autocomplete.getPlace();
                console.log(result);
                console.log(result.address_components);
                
                for(var i = 0; i < result.address_components.length; i += 1) {
                	  var addressObj = result.address_components[i];
                	  for(var j = 0; j < addressObj.types.length; j += 1) {
                	    if (addressObj.types[j] === 'country') {
                	      console.log(addressObj.types[j]); // confirm that this is 'country'
                	      console.log(addressObj.long_name); // confirm that this is the country name
                	    }
                	  }
                	}

                geocode();
            }

            function geocode() {
                var location = document.getElementById("place").value;
                axios.get('https://maps.googleapis.com/maps/api/geocode/json?address=' + location + '&key=AIzaSyD3BGsGYoUdXxL3oP0cgfW0-PF_w-wQetE').then(function(response) {
                    console.log(response);
                    var lat = response.data.results[0].geometry.location.lat;
                    var longi = response.data.results[0].geometry.location.lng;
                    var short_name = response.data.results[0].address_components[0].short_name;
                    var address = lat + "," + longi;
                    document.getElementById("short_name").innerHTML = short_name;
                })
            }
        </script>
                        
        <!--Add pictures-->
        <script>
            $images = $('.imageOutput')

            $(".imageUpload").change(function(event) {
                readURL(this);
            });

            function readURL(input) {

                if (input.files && input.files[0]) {

                    $.each(input.files, function() {
                        var reader = new FileReader();
                        reader.onload = function(e) {
                            $images.append('<img src="' + e.target.result + '" size="50" />')
                        }
                        reader.readAsDataURL(this);
                    });

                }
            }
        </script>


        <!--Google places API-->
        <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD3BGsGYoUdXxL3oP0cgfW0-PF_w-wQetE&libraries=places&callback=autoComp"></script>
    </body>

    </html>