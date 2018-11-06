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
    <meta charset="UTF-8" content="">
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

    <!--     Plugin JavaScript -->
    <script src="vendor/jquery-easing/jquery.easing.min.js" type="text/javascript"></script>

    <!-- Contact form JavaScript -->
    <script src="js/jqBootstrapValidation.js" type="text/javascript"></script>
    <script src="js/contact_me.js" type="text/javascript"></script>

    <!-- Custom scripts for this template -->
    <script src="js/agency.min.js" type="text/javascript"></script>

</head>

<body id="page-top" style="background-color: #282828">
    <%
    String fname = (String)session.getAttribute("fname");
	String lname = (String)session.getAttribute("lname");
	String email = (String)session.getAttribute("email");
	String bio = (String)session.getAttribute("bio");
	String facebook = (String)session.getAttribute("facebook");
	String twitter = (String)session.getAttribute("twitter");
	String datePicker1 =(String)session.getAttribute("birthday");
	String errorMsg=(String)request.getAttribute("error");	
	//Blob image = (Blob)session.getAttribute("ProfilePic");
	byte[] imgData=null;
	String imgDataBase64="";
	//if(image!=null)
	//{
    // imgData = image.getBytes(1,(int)image.length());
	// imgDataBase64=new String(Base64.getEncoder().encode(imgData));
	//}
	%>

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg fixed-top bgc" id="mainNav">
	<div class="container" style="margin-left: 3%;">
		<div><a class="navbar-brand" href="home.jsp" id="title">Destino</a> 
	<img class="logo" src="img/logo2.png" href="home.jsp"> </div>	
		<form class="nav-item" action="Search" method="post">
		<img class="icon" src="img/search-icon.png" style="margin-left: 4px; margin-right: 0px;"> 	
			<input class="form-control1 submit_on_enter" name="f_search" style="margin-left: 0px;" placeholder="Search Destino" aria-label="Search" type="text"></form>
		<button class="navbar-toggler navbar-toggler-right" type="button"
			data-toggle="collapse" data-target="#navbarResponsive"
			aria-controls="navbarResponsive" aria-expanded="false"
			aria-label="Toggle navigation">
			<i class="fa fa-bars"></i>
		</button>
	</div>

<!--Navigation Menu-->
	<div class="container" style="margin-left: 3%;">
		<div class="collapse navbar-collapse" id="navbarResponsive"
			style="margin-right: 3%;">
			<ul class="navbar-nav text-uppercase ml-auto">

				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="FlightAndHotel.jsp">Flights</a></li>
			
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="newtrip.jsp">Trip Planner</a></li>
				
				<li class="nav-item">
                      	<a class="nav-link js-scroll-trigger" href="profile.jsp"><img id="profileImage" class="rounded-circle center-block" src="http://www.rlsandbox.com/img/profile.jpg" style="width: 40px;height: 40px;align-self: flex-start"><%=fname%></a></li>
			


			</ul>
		</div>
	</div> 	
	</nav>
	<br><br><br><br><br>
    <div class="row">
        <div class="col-sm-2 sidenav"></div>
        <div class="col-sm-8 text-left" style="background-color:whitesmoke; border-radius: 5px;">
            <!--Form-->
            <form class="animate" action="editProfile" method="post" style="color: #282828" enctype="multipart/form-data">

                <!--Error message-->
                <%if(errorMsg==null){%>
                <div class="row">
                    <p id="errorMsg" style="color: red" name="error"></p>
                </div>
                <%}
                else{
                %>
                <div class="row" style="text-aligned:center">
                    <p id="errorMsg" style="color: red" name="error" ><%=errorMsg %></p>
                </div>
                <%} %>
                <!--Email Label-->
                <div class="row">
                    <div class="col-2" style="margin-bottom: auto;margin-top: auto;">
                        <label for="email"><b>Email</b></label></div>
                <!--Email input-->
                    <div class="col-5">
                        <input type="text" class="form-control"name="email" value="<%=email %>" style="border-radius:5px; "></div>
                </div>
                <!--First Name label-->
                <div class="row">
                    <div class="col-2" style="margin-bottom: auto;margin-top: auto;">
                        <label for="firstname"><b>First name</b></label></div>
                <!--First name input-->
                    <div class="col-5">
                        <input type="text" name="fname" class="form-control"  value="<%=fname%>"style="border-radius:5px;">
                    </div>
                </div>
                <!--Last name Label-->
                <div class="row">
                    <div class="col-2" style="margin-bottom: auto;margin-top: auto;">
                        <label for="lastname"><b>Last name</b></label> </div>
                <!--Last name input-->
                    <div class="col-5"><input type="text"  class="form-control" name="lname" value="<%=lname%>" style="border-radius:5px;"></div>

                    <div class="col-4">
                    
                        <!--Add Profile Picture-->
                       
                        <div class="row">
                            <input type="file" class="imageUpload btn" name="ProfilePic" accept="image/*" multiple="false" style="border-radius: 5px;">
                        </div>
                        <div class="row">
                        <%if(imgDataBase64!=null){ %>
                        <div class="imageOutput"><%=imgDataBase64 %></div>
                        <%}else{%>
                        	<div class="imageOutput"></div>
                        <%}%>
                        </div>
                    </div>
                </div><br><br>

            <!--Date Of Birth-->
            <div class="row">
                    <div class="col-2">
                        <label for="date_of_birth"><b>Date of Birth</b></label>
                    </div>
                    <div class="col-3">
                             <input class="form-control" type="date" id="datePicker" style="border-radius: 5px;" name="datePicker1">
                    		<!--For Date Picking-->
                            <!-- /*Get the first date*/-->
                            <script type="text/javascript">
                                $(function() {
                                    $('#datepicker').datepicker();
                                });
                            </script>
                    </div>
                    <div class="col-3">
                    <%if(datePicker1!=null) {%>
                    <input type="text" readonly  class="form-control" name="datePicker2" value="<%=datePicker1%>" style="border-radius:5px; "></div>
                    <%}
                    else{ %>
                    <input type="text" readonly  class="form-control" name="datePicker2" value="No date added Yet!"style="border-radius:5px;width:auto; "></div>
                    <%} %>
                    </div>

            <!--Password-->
                <div class="row">
                    <div class="col-2" style="margin-bottom: auto;margin-top: auto;">
                        <label for="newPW"><b>New Password</b></label></div>
                    <div class="col-5">
                        <input type="password"  class="form-control" name="newPW" style="border-radius:5px;"></div>
                </div>
                <br>
                <div class="row">
                    <div class="col-2" style="margin-bottom: auto;margin-top: auto;">
                        <label for="confirmPW"><b>Confirm Password</b></label></div>
                    <div class="col-5">
                        <input type="password"  class="form-control"name="ConfirmPW" style="border-radius:5px;"></div>
                </div>
                <%if(request.getParameter("error")=="null") {%>
				<div class="row"><h4 style="color:red;text-aligned:center;"><%=request.getParameter("error") %></h4></div>
				<%}
                else{%>
                <div class="row"><h4 style="color:red"></h4></div>
                <%} %>
                <div class="row">
                    <div class="col-2" style="margin-bottom: auto;margin-top: auto;">
                        <label for="Password" required><b>Password</b></label>
                    </div>

                    <div class="col-5">
                        <input type="password"  class="form-control" name="password" required style="border-radius:5px;"><br></div>
                </div>


            <!--Description-->
                <div class="row">
                    <div class="col-2" style="margin-bottom: auto;margin-top: auto;">
                        <label for="text"><b>Tell us about yourself</b></label>
                    </div>
                    <div class="col-8">
                    <%if(bio!=null){ %>
                        <textarea class="form-control" rows="3" id="text" name="bio" style="border-radius:5px;"><%=bio%></textarea>
                            </div>
                        <%}
                    else{
                    %>
                    <textarea class="form-control" rows="3" id="text" name="bio" style="border-radius:5px;" placeholder="Say something about yourself..."></textarea>
                            </div><br>
                       <%} %>
                          
                           
                        <!--Social media Links-->    
                <!--Facebook-->
                <br> 
                <div class="row">
                	<div class="col-3" style="margin-bottom: auto;margin-top: auto;">
                    	<label class="col-1" for="facebook"><b>Facebook</b></label>
                    	</div>
                    <div class="col-8"style="margin-bottom: auto;margin-top: auto;">
                    <%
                    if(facebook!=null){ 
                    %>
                    <input type="text" class="form-control" name="facebook" id="facebook"style="border-radius: 5px;width:100%;height:100%" value="<%= facebook%>">
                    <%}else{ %>
                    <input type="text" class="form-control" placeholder="Please share your facebook link" name="facebook" id="facebook"style="border-radius: 5px;width:100%;height:100%">
                   <%} %>
                    </div>
                 </div>
               <!--Twitter-->
                
                <div class="row">
                    <div class="col-3" style="margin-bottom: auto;margin-top: auto;">
                    <label  for="twitter"><b>Twitter</b></label>
                    </div>
                    <div class="col-8" style="margin-bottom: auto;margin-top: auto;">
                    <%if(twitter==null){ %>
                    <input type="text" class="form-control" placeholder="Share your Twitter Profile Link" name="twitter" id="twitter"style="border-radius: 5px;width:100%;height:100%">
                    <%}else{ %>
                    <input type="text" class="form-control" name="twitter" id="twitter"style="border-radius: 5px;width:100%;height:100%" value="<%=twitter%>">
                    <%} %>
                    
                    </div>
                </div></div>
                           <br>

                <!--Save-->
                <div class="row">
                    <div class="col-3" style="margin-left: 10%;">
                        <a class="canel btn btn-secondary" type="submit" name="submit" value="cancel" style="border-radius:5px;" href="profile.jsp">Cancel</a></div>
                    <div class="col-md-5" style="float: right;">
                    </div>
                    <div class="col-md-2" style="float: right;">
                        <button class="save btn btn-primary" type="submit" name="submit" value="save" style="border-radius:5px;">Save Changes</button></div>
                      <div class="col-1" style="float: right;"></div>
                	<div class="col-4" style="float: right;">
                	<button class="save btn btn-primary" type="submit" name="submit" value="deleteAccount" style="border-radius:5px;">Delete Account</button>
                    </div>
                </div>
                <br>
                <br>

        </form>
    </div>
    </div>
    <div class="col-md-4"></div>
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
</body>

</html>