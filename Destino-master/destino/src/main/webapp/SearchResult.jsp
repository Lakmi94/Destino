<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" language="java" %>
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
<title>Destino</title>
</head>
<body><%String fname = (String)session.getAttribute("fname"); %>
	  <%
		byte[ ] imgData2 = null ;
    	byte[ ] img = null ;
		Blob image2 = null;
		String lname = (String)session.getAttribute("lname");
		String email = (String)session.getAttribute("email");
		String userID =(String)session.getAttribute("userID");
		String facebook = "";
		String twitter ="";
		String bio="";
		String imgDataBase64="";
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

                         <% 
		
		//Connecting to database
	    Class.forName("com.mysql.jdbc.Driver");  
	    Connection conn = DriverManager.getConnection("jdbc:mysql://166.62.29.165:3306/308db1?autoReconnect=true&useSSL=false","308db1","308db11234308db1"); 
		
	    try{
	    	PreparedStatement profile = conn.prepareStatement("select * from users where userID = ?");
	    	profile.setString(1, userID);
	    	ResultSet profilepic = profile.executeQuery();

	        while(profilepic.next()){ 
	        	image2 = profilepic.getBlob("ProfilePic");
	            img = image2.getBytes(1,(int)image2.length());
	        	imgDataBase64=new String(Base64.getEncoder().encode(img));
	        	
	        	facebook=profilepic.getString("facebook");
	        	twitter=profilepic.getString("twitter");
	        	bio=profilepic.getString("description");
	        	
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
	//getting the search string from the search bar
String name1 =(String)request.getAttribute("fsearch2");
	  String pec1 = "%";
int TripID=0;
String countryCode=null;
byte[ ] imgData = null ;
Blob image = null;
String imgDataBase64_1="";
byte[ ] imgData1 = null ;
Blob image1 = null;
//connecting to the database

	%>
<section class="bg-light" id="portfolio">

 <h4 style="color: #212529; margin-left: 20%;font-size: 2.5rem;">
                <%=name1%>
            </h4>
            <hr style="width:70%; text-align:center">
            <nav style="margin-left: 20%;">
       <div class="nav nav-tabs1" id="nav-tab" role="tablist" style="border-bottom:transparent; background:transparent;">
            <!--Users-->
            <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true" onmouseover="changeColor(this)" onmouseout="changeBackColor(this)">Users</a>

            <!--Trips-->
            <a class="nav-item nav-link" id="nav-trips-tab" data-toggle="tab" href="#nav-trips" role="tab" aria-controls="nav-trips" aria-selected="false" style="color: #03ddc7;" onmouseover="changeColor(this)" onmouseout="changeBackColor(this)">Trips</a>
</div>
    </nav>
            <hr style="width:70%; text-align:center; margin-top:0px;">
    <div class="tab-content" id="nav-tabContent">
        <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
        <% if (name1.equals("%")){
        	System.out.println("nope");
        %>	<h2  style="text-align: center;">Invalid String. Enter a Different String</h2><%
        }
        else{
try{
	//getting the users with the last name or first name similar to the search string 
	  String pec = "%";
	  String name2= pec+name1+pec; // %xxx%
	  PreparedStatement ps = conn.prepareStatement("select * from users where first_name like ? or last_name like ?");
	  ps.setString(1, name2);
	  ps.setString(2, name2);
	  ResultSet rs = ps.executeQuery();
	  boolean exists = false;
	  %><div class="container">
		 
		  <div class="row"> <%
	 
		 	
		  //when the result of the querys is not empty
	    while (rs.next()){
	    	  exists = true;
	    	  //print until there are users in the results
	    	%>
	    	 <div class="col-md-4 col-sm-6">
                    <div class = "card mb-4 box-shadow">
                  <a style="color:#212529;" href="OtherProfile.jsp?uid=<%=rs.getInt("userID")%>">
                     <% try{
                    	 //gettign the profile picture from the database 
  		             int userId = rs.getInt("userID");
  		            PreparedStatement psp = conn.prepareStatement("select ProfilePic from users where UserID = ? ");
  		          psp.setInt(1, userId);
  		        ResultSet profp = psp.executeQuery();
  		        while (profp.next()){
  		      image1 = profp.getBlob("ProfilePic");
  		      
  		      if(image1!=null){
  		    	  //checking if the user has a profile picture or not 
                imgData1 = image1.getBytes(1,(int)image1.length());
            	 imgDataBase64_1=new String(Base64.getEncoder().encode(imgData1));
  		        }
  		        }
  		        if (!imgDataBase64_1.isEmpty()){ //if the user has a profile pic use it as the card top image 
						
  		            	    
  		               %>
  		               
  		                	<img class="card-img-top" src="data:image/gif;base64,<%=imgDataBase64_1 %>" style = "height:350px; width:100%" display ="block">
  		             <%    
				}
  		        else if (imgDataBase64_1.isEmpty()){ 
					//if the user has no profile pic, use the default pic as profile pic
					 %>
		                <img class="card-img-top" src="http://www.rlsandbox.com/img/profile.jpg" style = "height:350px; width:100%" display ="block">  	
	               
	             <%   	
				}}
				
			    catch (Exception e){}%>
			
                        <div class="card-body">
                        <hr>
                            <h5><%=rs.getString("first_name")%> <%=rs.getString("last_name") %></h5>
                           
                            <div class="d-flex justify-content-between align-items-center">
                            
                            </div>
                        </div></a>
                    </div>
                    </div>
<%
}
		  if(!exists){ //if there are no users in the database, give an error messgae 
			  %> 	<h2  style="text-align: center;">No Users to be Found</h2><%
		  }
		  else{}
	
}
        catch (Exception e){}
%>
</div>
</div>
</div>
<!-- search for trips -->
        
        <div class="tab-pane fade" id="nav-trips" role="tabpanel" aria-labelledby="nav-trips-tab">
          <%
	try{
		//getting the trips with the title or description similar to the search string 
		  String pec = "%";
		  String name2= pec+name1+pec; // %xxx%
		  PreparedStatement ps1 = conn.prepareStatement("select * from trip where title like ? or Tripdescription like ?");
		  ps1.setString(1, name2);
		  ps1.setString(2, name2);
		  
		  ResultSet rs1 = ps1.executeQuery();
		  boolean exists1 = false;
%>
<div class="container">
		  
		  <div class="row"> 

<%
		  
			  //if the result of the querys is not empty
		    while (rs1.next()){ //print until there are users in the results
		    	 exists1 = true;
		    	%>
		    	 <div class="col-md-4 col-sm-6">
		    	  
		              <div class = "card mb-4 box-shadow">
		               
		                <a style="color: #212529;" href="trip.jsp?TripID=<%=rs1.getInt("TripID")%>">
		                <%  try{
		               int  tripID=rs1.getInt("TripID");
		               PreparedStatement ps3 = conn.prepareStatement("select image from image where TripID_image = ?;");
		               ps3.setInt(1, tripID);
		               ResultSet rs3 = ps3.executeQuery();
		               if (rs3.next()){
		           
		            	   image = rs3.getBlob("image");
		                   imgData = image.getBytes(1,(int)image.length());
		               	String imgDataBase64_2=new String(Base64.getEncoder().encode(imgData));   
		               %>
		               
		                	<img class="card-img-top" src="data:image/gif;base64,<%=imgDataBase64_2 %>" style = "height:350px; width:100%" display ="block">
		                	<%
		               }
		               else{
		            	   %><img class="card-img-top" src="img/portfolio/06-thumbnail.jpg" style = "height:350px; width:100%" display ="block"><% 
		               }
		               }
		                catch (Exception e){}%>
		                	
		  		
		  			
		                  <div class="card-body">
		                      <h5><%=rs1.getString("title")%></h5>
		                      <p><%=rs1.getString("Tripdescription")%></p>
		                     
		                      <div class="d-flex justify-content-between align-items-center">
		                      
		                      </div>
		                  </div>	</a>
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
	        catch (Exception e){}}
	%>
  
        </div>
        
        </div>
      


</div>
</div>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
</section>
    <footer class="navbar navbar-expand-lg navbar-dark position-relative">
            <div class="container">


                <!--Navigation Menu-->
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav text-uppercase mr-auto">
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" style="font-size: 12px;" href="home.jsp">Discover</a></li>
                     
            
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" style="font-size: 12px;" href="SignUp.html">Sign Up</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" style="font-size: 12px;" href="SignUp.html">Login</a></li>
                       
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" style="font-size: 12px;" href="about.jsp">About Us</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" style="font-size: 12px;" href="contact.jsp">Contact Us</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" style="font-size: 12px;" href="privacy.jsp">Privacy Policy</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" style="font-size: 12px;" href="terms.jsp">Terms of Use</a></li>


                    </ul>
                </div>
            </div>



        </footer>
         <script>
            function changeColor(tab) {
                tab.style.color = "#02ab9a";
            }
            function changeBackColor(tab) {
                tab.style.color = "";
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
        <!--For mouse hovering over the objects-->
</body>
</html>