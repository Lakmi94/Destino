<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <!-- Custom styles for this template -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
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

<body id="page-top" style="background-color: #282828; color:white;">
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
										id="profileImage" 

class="rounded-circle center-block"
										

src="data:image/*;base64,<%= imgDataBase64%>"
										style="width: 40px; 

height: 40px; align-self: flex-start;cursor:pointer"
										>
							<%}else{

							%>
							<img
						id="profileImage" class="rounded-circle center-block"
						src="http://www.rlsandbox.com/img/profile.jpg"
						style="width: 40px; height: 40px; align-self: flex-

start;cursor:pointer"
						>
						
							<%}%>
			<%=fname%></a>
								</li>
						
			</ul>
		</div>
	</div>
	</nav>
	

	
<div class="navbar"></div>
<div class="navbar"></div>
<div class="navbar"></div>
<div class="navbar"></div>
<div class="navbar"></div>
<div class="navbar"></div>


<%
int countryID=0;
int TripID=0;
String countryCode=null;
byte[ ] imgData1 = null ;
Blob image1 = null;
int writer=0;
int userID1=0;
int imgID1=0;
String imgDataBaseLink="";
//Store all countries list in each trip
int countCountry=0;
   
//Getting TripID
String tripID = request.getParameter("TripID");
TripID = Integer.parseInt(tripID);
   
//Get trip data with TripID
try
{
PreparedStatement ps1 = conn.prepareStatement("select * from trip where TripID = ?");
ps1.setInt(1, TripID);
ResultSet rs1 = ps1.executeQuery();
PreparedStatement statement=conn.prepareStatement("select userID from users where email=?");
statement.setString(1, email);
//CHECKING FOR RESULT 
ResultSet rs=statement.executeQuery();
if(rs.next())
{
	//GETTING THE userID from the Trip
	userID1=rs.getInt("userID");
}
%>
       
    <!-- Get countrycode -->
    <script>
    function geocode(place) {
        var short_name = '';
        var location = place;
        var request = new XMLHttpRequest();
        request.open('GET', 'https://maps.googleapis.com/maps/api/geocode/json?address=' + location + '&key=AIzaSyD3BGsGYoUdXxL3oP0cgfW0-PF_w-wQetE');
        request.responseType = 'json';
        request.send();
        request.onload = function() {
            var response = request.response;
            var results = response.results[0];
            if(results.address_components.length==1){
            	var addressComponents = results.address_components[0];
            }
            else if(results.address_components.length==2){
            	var addressComponents = results.address_components[1];
            }
            else if(results.address_components.length==3){
            	var addressComponents = results.address_components[2];
            }
            else if(results.address_components.length==4){
            	var addressComponents = results.address_components[3];
            }
            else if(results.address_components.length==5){
            	var addressComponents = results.address_components[4];
            }
            
            short_name = addressComponents.short_name;
            CI(short_name);
        }
    }
    </script>
    
    
    <!-- country information api -->
    <script type='text/javascript'>
    function CI(code) {
        var countryurl = 'https://restcountries.eu/rest/v2/alpha/';
        var countryCode = code;
        var apiurl = countryurl + countryCode;
        var weather = 'http://api.openweathermap.org/data/2.5/weather?q=';
        var weatherapikey = "&units=metric&appid=b9960ffcaf3fb13b83054fc780067b70";
        var request = new XMLHttpRequest();
        request.open('GET', apiurl);
        request.responseType = 'json';
        request.send();
        request.onload = function() {
            var countryInfo = request.response;
            var flagimg = countryInfo.flag;
            var weathercity = countryInfo.capital;
            var countryName = countryInfo.name;
            var subregion = countryInfo.subregion;
            var timezone = countryInfo.timezones[0];
            var language = countryInfo.languages[0].name;
            var currencyCode = countryInfo.currencies[0].code;
            //weather
            var weatherurl = weather + weathercity + ',' + countryCode + weatherapikey;
            var getWeather = new XMLHttpRequest();
            getWeather.open('GET', weatherurl);
            getWeather.responseType = 'json';
            getWeather.send();
            getWeather.onload = function() {
                var weatherResults = getWeather.response;
                showWeather(weatherResults);
                function showWeather(jsonObj) {
                    var weatherList = jsonObj['weather'];
                    var iconsrc = 'http://openweathermap.org/img/w/' + weatherList[0].icon + '.png'
                    var main = jsonObj['main'];
                    var clouds = jsonObj['clouds'];
                    var temperature = main.temp + " C ";
                    var infotable = "";
                    var myPara1 = "";
                    myPara1 += '<table border="1" style="width:100%; font-family:Montserrat; font-size:14px;><thead><tr style="padding:8px"><th style="text-align:left; width:50%">' + countryName + '</th>';
                    var myPara2 = "";
                    myPara2 += '<th style="text-align:right; width:50%"><img width=40 height=30 src="' + flagimg + '"></th></tr></thead>';
                    var myPara3 = "";
                    myPara3 += '<tbody><tr style="padding:8px"><td align="left" style="width:50%">Capital</td>';
                    var myPara4 = "";
                    myPara4 += '<td align="right" style="width:50%">' + weathercity + '</td></tr></tbody>';
                    var myPara5 = "";
                    myPara5 += '<tbody><tr style="padding:8px;"><td align="left" style="width:50%">Region</td>';
                    var myPara6 = "";
                    myPara6 += '<td align="right" style="width:50%">' + subregion + '</td></tr></tbody>';
                    var myPara7 = "";
                    myPara7 += '<tbody><tr style="padding:8px"><td align="left" style="width:50%">Time</td>';
                    var myPara8 = "";
                    myPara8 += '<td align="right" style="width:50%">' + timezone + '</td></tr></tbody>';
                    var myPara9 = "";
                    myPara9 += '<tbody><tr style="padding:8px;"><td align="left" style="width:50%">Language</td>';
                    var myPara10 = "";
                    myPara10 += '<td align="right">' + language + '</td></tr></tbody>';
                    var myPara11 = "";
                    myPara11 += '<tbody><tr style="padding:8px;"><td align="left" style="width:50%">Weather</td>';
                    var myPara12 = "";
                    myPara12 += '<td align="right" style="width:50%">' + temperature + '<img width=40 height=30 src="' + iconsrc + '"></td></tr></tbody>';
                    var myPara13 = "";
                    myPara13 += '<tbody><tr style="padding:8px;"><td align="left" style="width:50%">Currency</td>';
                    var myPara14 = "";
                    myPara14 += '<td align="right" style="width:50%">' + currencyCode + '</td></tr></tbody></table>'
                    infotable += myPara1 + myPara2 + myPara3 + myPara4 + myPara5 + myPara6 + myPara7 + myPara8 + myPara9 + myPara10 + myPara11 + myPara12 + myPara13 + myPara14 + '<br><br>';
                    $('#infoSection').append(infotable);
                }
            }
        }
    }
    </script>

    <!--Title-->
    <div class="jumbotron text-center" style="color:black;">
        <h1></h1>
        <h1></h1>

<%
//When result grid is not empty, get title, description, and triptype
while(rs1.next())
{ 
    writer=rs1.getInt("userID_trip");

if (writer!=userID1)
{
%>
        <script>
            //hide edit and delete button when userID1 != writer
            document.getElementById('editTrip').style.display = 'block';
        </script>
<% 
}
else
{
%>
    <!-------------edit trip button------------------>
        <div id="editTrip" align="right">
            <button type="button" class="fa fa-edit" id="editTrip" onclick="document.getElementById('editTripData').style.display='block';document.getElementById('TripData').style.display='none';">
            </button>
        </div>
<%
}
%>
        <!-------------Trip data----------------->
        <div id="TripData">
            <h1><b><%=rs1.getString("title") %></b></h1>
            <p><%=rs1.getString("Tripdescription") %></p>
            <p><%=rs1.getString("tripType")%></p>
        </div>
        
            
<!-- ----------toggle edit forms----------------- -->
        <div id="editTripData" style="display:none" align="center">
            <form method="post" id="editTripForm" action="editTrip">
                <!-- Pass TripID & countryID-->
                <input type="hidden" name="editTrip" value="<%=TripID%>">
                <!--title-->
                <div class="row">
                    <div class="col-md-2" style="margin-top: auto;margin-bottom: auto;">
                        <label for="place">Title</label>
                    </div>
                    <div class="col-md-8">
                        <input type="text" style="border-radius: 5px;" class="form-control" id="triptitle" name="triptitle" style="width: 100%;">
                    </div>
                </div>
                <br>

                <!--Trip Description-->
                <div class="row">
                    <div class="col-md-2" style="margin-top: auto;margin-bottom: auto;">
                        <label for="context1">Description</label>
                    </div>
                    <div class="col-md-8" style="margin-top: auto;margin-bottom: auto;">
                        <textarea row="1" type="text" class="form-control" id="editTripDesc" style="border-radius: 5px; width: 70%;" name="editTripDesc"></textarea>
                    </div>
                </div>
                <br>

                <div class="form-group" align="right">

                    <button class="btn btn-primary" id="saveedittrip" type="submit" name="submit" value="save">Save</button>
                    
                </div>
            </form>
                <div class="canceltripedit" align="right">
                    <button class="btn btn-secondary" id="canceledittrip" name="submit" value="cancel" onclick="document.getElementById('editTripData').style.display='none';document.getElementById('TripData').style.display='block';">Cancel</button>
                </div>
        </div>
        <br><br>    
            
            
        <a id="fb-share" style='text-decoration:none;' type="icon_link" onClick="window.open('http://www.facebook.com/sharer.php?s=100&amp;p[title]= foo &amp;p[summary]=bar&amp;p[url]=https://docs.google.com/document/d/1dwd5R9gqW_kpkoAUUPgpUA6I6OdenxZSYSEDQfT_Zq4/edit?usp=sharing;p[images][2]=https://http://localhost:8080/trip.jsp?TripID=1','sharer','toolbar=0,status=0,width=880,height=525');" href="javascript: void(0)">
   
        <img src="img/share.png" width="70" height="25" alt="Share"/>
        </a>
            
        <a href="https://twitter.com/share?ref_src=twsrc%5Etfw" class="twitter-share-button" data-show-count="false">Tweet</a><script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>   
     
    </div>
<%
//close rs1
}
}
catch (Exception e) 
{
}
%>

    <!--Containers-->
    <div class="container-fluid text-center">
        <div class="row content">
            <!--left column-->
            <div class="col-sm-1 text-left">
            </div>
            <!-- middle column -->
            <div class="col-sm-8 text-left">

<%
//Getting countries data where TripID is matched. CountryName, city, date, and description
try
{
PreparedStatement ps2 = conn.prepareStatement("select * from Country where TripID_country = ? ORDER BY TripID_country ASC;");
ps2.setInt(1, TripID);
ResultSet rs2 = ps2.executeQuery();
while(rs2.next())
{ 
%>
                
                <script type="text/javascript">
                //Go to api function with country code from api
                geocode("<%= rs2.getString("countryName") %>");
                </script>
                
<%
countryID = rs2.getInt("countryID");
PreparedStatement ps3 = conn.prepareStatement("select * from image where TripID_image = ? and countryID_image = ?;");
ps3.setInt(1, TripID);
ps3.setInt(2, countryID);
%>

                <div class="jumbotron text-left" style="color:black;">
                    
<% 
if (writer!=userID1)
{
%>
                    <script>
                        //hide edit and delete button when userID1 != writer
                        document.getElementById('editanddelete').style.display = 'block';
                    </script>
<% 
}
else
{
%>
                <!-------------edit and delete button------------------>
                    <div id="editanddelete<%=countryID %>" align="right">
                        <button type="button" class="fa fa-edit" id="editCountry<%=countryID %>" onclick="document.getElementById('editCountryData<%=countryID %>').style.display='block';document.getElementById('showCountryData<%=countryID%>').style.display='none';">
                        </button>
                        <div class="row">
                            <h1></h1>
                        </div>
                        <form method="post" id="deleteCountry<%=countryID %>" action="deleteCountry">
                            <input type="hidden" name="deletecountryTID" value="<%=TripID%>">
                            <input type="hidden" name="deletecountryCIDof<%=TripID %>" value="<%=countryID %>">
                            <button type="submit" class="fa fa-trash" id="deleteCountry<%=countryID%>">
                            </button>
                        </form>
                    </div>
<%
}
%>
                
                <!-- ----------return country names and descriptions--------------- -->
                    <div id="showCountryData<%=countryID %>">
                        <div class="form-group">
                            <label for="place1"><b>Place</b></label>
                            <p><%=rs2.getString("countryName") %></p>
                        </div>

                        <div class="form-group">
                            <label for="context1"><b>Description</b></label>
                            <p><%=rs2.getString("countryDescription") %></p>
                        </div>
                    </div>
                
    
                <!-- ----------toggle edit forms----------------- -->
                    <div id="editCountryData<%=countryID %>" style="display:none">
                        <form method="post" id="editCountry<%=countryID %>" action="editCountry">
                            <!-- Pass TripID & countryID-->
                            <input type="hidden" name="editcountryTID" value="<%=TripID%>">
                            <input type="hidden" name="editcountryCIDof<%=TripID %>" value="<%=countryID%>">
                            <!--Location-->
                            <div class="row">
                                <div class="col-md-2" style="margin-top: auto;margin-bottom: auto;">
                                    <label for="place">Location</label>
                                </div>
                                <div class="col-md-8">
                                    <input type="text" style="border-radius: 5px;" class="form-control" id="place<%=countryID %>" name="editlocation" style="width: 100%;">
                                </div>
                            </div>
                            <br>

                            <!--Description-->
                            <div class="row">
                                <label for="context1">Description</label>
                            </div>
                            <div class="row">
                                <textarea row="4" type="text" class="form-control" id="editdescription<%=countryID %>" style="border-radius: 5px; width: 70%;" name="editdescription"></textarea>
                            </div><br>

                            <div class="form-group" align="right">

                                <button class="btn btn-primary" id="saveedit" type="submit" name="submit" value="save">Save</button>
                                
                            </div>
                        </form>
                            <div class="cancelbutton" align="right">
                                <button class="btn btn-secondary" id="canceledit" name="submit" value="cancel" onclick="document.getElementById('editCountryData<%=countryID %>').style.display='none';document.getElementById('showCountryData<%=countryID%>').style.display='block';">Cancel</button>
                            </div>
                    </div>
                    <br><br>
    
                <!-----------imgs-------------------->
    
                    <div class="row ">
<%
//Getting images where TripID is matched
try
{

ResultSet rs3 = ps3.executeQuery();
while(rs3.next())
{ 
image1 = rs3.getBlob

("image");
imgData1 = image1.getBytes

(1,(int)image1.length());
String imgDataBase641=new 

String(Base64.getEncoder().encode(imgData1));
imgID1 = rs3.getInt

("imageID");
%>
                        <div class=" col-md-4 ">
                            <a href="#" class="">
								<%
								if(writer != userID1)
								{
								%>
                                <script>
                                    document.getElementById('deleteimg').style.display = 'block';
                                </script>
								<%
								}
								else
								{
								%>
                            <div id="deleteimg">
                                <form method="post" id="deleteimg<%=imgID1 %>" action="deleteImage">
                                    <input type="hidden" name="deleteimgTID" value="<%=TripID%>">
                                    <input type="hidden" name="deleteimgCIDof<%=TripID %>" value="<%=countryID %>">
                                    <input type="hidden" name="deleteimgIIDof<%=countryID %>" value="<%=imgID1 %>">
                                    <button type="submit" class="close" id="deleteImage<%=imgID1 %>" style="color:#03ddc7;">&times;</button>
                                </form>
                            </div>
<%
}
%>
                            <img class="img-fluid img-thumbnail" src="data:image/*;base64,<%= imgDataBase641 %>" alt="image<%=imgID1 %>" id="image<%=imgID1%>">
                            </a>
                        </div>
    
                        <!-- The Image Modal -->
                        <div id="myModal" class="modal"style="margin-top:5%;">
                          <span class="close" id="imgclose">&times;</span>
                          <img class="modal-content" id="img01" style="width:60%;height:auto;">
                        </div>
    
                        <script>
                            // Get the modal
                            var modal = document.getElementById('myModal');

                            // Get the image and insert it inside the modal - use its "alt" text as a caption
                            var img = document.getElementById('image<%=imgID1%>');
                            var modalImg = document.getElementById("img01");
                            img.onclick = function(){
                                modal.style.display = "block";
                                modalImg.src = this.src;
                                captionText.innerHTML = this.alt;
                            }

                            // Get the <span> element that closes the modal
                            var span = document.getElementById('imgclose');

                            // When the user clicks on <span> (x), close the modal
                            span.onclick = function() { 
                                modal.style.display = "none";
                            }
                        </script>
    
<% 
//close rs3
}   //close while
}   //close try
catch (Exception e) {
}%>
    
    
                    
    
    
                    </div>
    
<%
if(writer != userID1)
{
%>  
                    <script>
                        document.getElementById('addmore').style.display = 'none';
                    </script>  
<%
}
else
{
%>
                
                    <hr>
                    <div id="addmore">
                        <form method="post" id="addmoreImages<%=countryID %>" action="addmoreImage" enctype="multipart/form-data">
                            <input type="hidden" name="addmoreimage" value="<%=TripID%>">
                            <input type="hidden" name="addmoreimageCIDof<%=TripID %>" value="<%=countryID %>">
                            <div class="row">
                                <label>Upload images</label>
                            </div>
                            <div class="row">
                                <input type="file" class="addimage btn" name="addpic1of<%=countryID %>" style="border-radius: 5px;" multiple="false" accept="image/*">
                            </div>
                            <div class="row">
                                <input type="file" class="addimage btn" name="addpic2of<%=countryID %>" style="border-radius: 5px;" multiple="false" accept="image/*">
                            </div>
                            <input type="submit" class="btn btn-primary" id="addmoreImages<%=countryID %>" value="Save images">
                        </form>
                    </div>
<%
}
%>
    
                </div>
                <hr><br>
                        
<%
//close rs2
}   //close while
}   //close try
catch (Exception e) {
}%>

			<!-- Add more countries if writer and user session are the same -->
<%
if(writer != userID1)
{
%>           
                <script>document.getElementById('addCountryButton').style.display='block';</script>
<%
if(email.equals("apl.destino@gmail.com"))
{
%>
					<form method="post" id="deleteTripAdmin<%=TripID %>" action="deleteTrip">
						<input type="hidden" name="adminDelete" value="apl.destino@gmail.com">
                        <input type="hidden" name="deletetripTID" value="<%=TripID%>">
                        <button type="submit" class="btn btn-info btn-lg">Delete Trip</button>
                    </form>
   
<%
}
} 
else{  
%>
                <div id="addCountryButton" align="right">
                    <button type="button" class="btn btn-info btn-lg" onclick="document.getElementById('addcountry').style.display='block'">Add more</button>
                    <div class="row">
                        <h1></h1>
                    </div>
                    <form method="post" id="deleteTrip<%=TripID %>" action="deleteTrip">
                        <input type="hidden" name="deletetripTID" value="<%=TripID%>">
                        <button type="submit" class="btn btn-info btn-lg">Delete Trip</button>
                    </form>
                </div>
    
                <h1></h1>
    
<%
//}
%>
    
                <div class="jumbotron text-left" style="color:black;display: none;" id="addcountry">
                    <form method="post" action="AddMoreCountry" enctype="multipart/form-data">
                        <!-- Pass TripID -->
                        <input type="hidden" name="TID" value="<%=TripID%>">
                        <!--Location-->
                        <div class="row">
                            <div class="col-md-2" style="margin-top: auto;margin-bottom: auto;">
                                <label for="place">Location</label>
                            </div>
                            <div class="col-md-4">
                                <input type="text" style="border-radius: 5px;" class="form-control" id="place" name="addlocation" style="width: 100%;">
                            </div>
                        </div>
                        <br>

                        <!--Description-->
                        <div class="row">
                            <label for="context1">Description</label>
                        </div>
                        <div class="row">
                            <textarea row="4" type="text" class="form-control" id="adddescription" style="border-radius: 5px; width: 70%;" name="adddescription"></textarea>
                        </div>
                        <br>
                        <!--Add Trip Type-->
                        <div class="row" style="width: auto; height: auto;">
                            <div class="col-md-6"></div>
                            <div class="col-md-6">
                                <label for="transport_mode">Mode of Transport</label>
                            </div>
                        </div>
                        <!--Add Mode of transport-->
                        <div class="row">
                            <div class="col-md-6">
                            </div>
                            <div class="col-md-6" style="float: right;">
                                <select style="height: 25px; border-radius: 5px;width: 50%;" name="transport_mode" id="transport_mode">
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
                        </div>
                        <br>

                        <!--Add Photos-->
                        <div class="row">
                            <label>Upload images</label>
                        </div>
                        <div class="row">
                            <input type="file" class="imageUpload btn" name="pic1" style="border-radius: 5px;" multiple="multiple" accept="image/*">
                        </div>
                        <div class="row">
                            <input type="file" class="imageUpload btn" name="pic2" style="border-radius: 5px;" multiple="multiple" accept="image/*">
                        </div>
                        <div class="row">
                            <input type="file" class="imageUpload btn" name="pic3" style="border-radius: 5px;" multiple="multiple" accept="image/*">
                        </div>
                        <div class="row">
                            <input type="file" class="imageUpload btn" name="pic4" style="border-radius: 5px;" multiple="multiple" accept="image/*">
                        </div>
                        <div class="row">
                            <input type="file" class="imageUpload btn" name="pic5" style="border-radius: 5px;" multiple="multiple" accept="image/*">
                        </div>
                        <div class="row">
                            <input type="file" class="imageUpload btn" name="pic6" style="border-radius: 5px;" multiple="multiple" accept="image/*">
                        </div>
                        <div class="imageOutput">
                        </div>

                        <div class="form-group" align="right">
                            <button class="btn btn-primary" id="savecountry" type="submit" name="submit" value="save">Save</button>
                        </div>
                    </form>
                        <div class="cancleedit" aligh="right">
                            <button class="btn btn-secondary" id="cancelcountry" name="submit" value="cancel" onclick="document.getElementById('addcountry').style.display='none'">Cancel</button>
                        </div>
                </div>
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
                                    $images.append('<img src="' + e.target.result + '" size="50" />');
                                }
                                reader.readAsDataURL(this);
                            });

                        }
                    }
                </script>
            	<h1></h1>
				<h1></h1>
				
<%
} 
%>
				
				
                <!--HTML Comment api-->
                <!-- begin wwww.htmlcommentbox.com -->
                <div id="HCB_comment_box"><a href="http://www.htmlcommentbox.com">Widget</a> is loading 

comments...</div>
                <link rel="stylesheet" type="text/css" href="//www.htmlcommentbox.com/static/skins/bootstrap/twitter-bootstrap.css?v=0" />
                <script type="text/javascript" id="hcb">
                /*<!--*/
                if (!window.hcb_user) {
                hcb_user = {};
                }(function() {
                var s = document.createElement("script"),
                l = hcb_user.PAGE || ("" + window.location).replace(/'/g, "%27"),
                h = "//www.htmlcommentbox.com";
                s.setAttribute("type", "text/javascript");
                s.setAttribute("src", h + "/jread?page=" + encodeURIComponent(l).replace("+", "%2B") + "&mod=%241%24wq1rdBcg%24AeVZSYevro3yrx1Rm%2Faan0" + "&opts=276&num=10&ts=1527698008642");
                if (typeof s != "undefined") document.getElementsByTagName("head")[0].appendChild(s);
                })(); /*-->*/
                </script>
                <!-- end www.htmlcommentbox.com -->


            </div>
    
            <!-- right column -->
            <div class="col-sm-3 sidenav">
                <div class="well small">
                <!--Getting country information from api will be attached here-->
                    <div id="infoSection">
                    </div>
                    
                    <!--Currency converter form-->
                    <table>
                        <tr>
                            <td>
                                <input id="fromAmount" type="text" value="1.00" onkeyup="convertCurrency();" style="width:70%;height:10px;border-radius:5px; padding-left:0px; padding-right:-10">
                            </td>
                            <td>
                                <select id="from" onchange="convertCurrency();">
                                    <option value="AUD">Australian Dollar (AUD)</option>
                                    <option value="BGN">Bulgarian Lev (BGN)</option>
                                    <option value="CAD">Canadian Dollar (CAD)</option>
                                    <option value="XAF">Cameroon Franc (XAF)</option>
                                    <option value="COP">Colombian Peso (COP)</option>
                                    <option value="CNY">Chinese Yuen (CNY)</option>  
                                    <option value="DKK" >Danish Krone (DKK)</option>
                                    <option value="EUR" >Euro Members (EUR)</option>
                                    <option value="GHS">Ghana Cedi (GHS)</option>
                                    <option value="ILS">Israeli New Shekel (ILS)</option>
                                    <option value="INR">Indian Rupee (INR)</option>
                                    <option value="JPY">Japanese Yen (JPY)</option>
                                    <option value="KRW">Korean Won (KRW)</option>
                                    <option value="NGN">Nigerian Naira (NGN)</option>
                                    <option value="GBP">Pound Sterling (GBP)</option>    
                                    <option value="LKR">Sri Lankan Rupee (LKR)</option>
                                    <option value="CHF" >Swiss Franc (CHF)</option>
                                    <option value="USD" selected>United States (USD)</option> 
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input id="toAmount" type="text" disabled style="width:70%;height:10px;border-radius:5px; padding-left:0px; padding-right:auto;">
                            </td>
                            <td>
                                <select id="to">
                                    <option value="AUD">Australian Dollar (AUD)</option>
                                    <option value="BGN">Bulgarian Lev (BGN)</option>
                                    <option value="CAD">Canadian Dollar (CAD)</option>
                                    <option value="XAF">Cameroon Franc (XAF)</option>
                                    <option value="COP">Colombian Peso (COP)</option>
                                    <option value="CNY">Chinese Yuen (CNY)</option>  
                                    <option value="DKK" >Danish Krone (DKK)</option>
                                    <option value="EUR" >Euro Members (EUR)</option>
                                    <option value="GHS">Ghana Cedi (GHS)</option>
                                    <option value="ILS">Israeli New Shekel (ILS)</option>
                                    <option value="INR">Indian Rupee (INR)</option>
                                    <option value="JPY">Japanese Yen (JPY)</option>
                                    <option value="KRW"selected>Korean Won (KRW)</option>
                                    <option value="NGN">Nigerian Naira (NGN)</option>
                                    <option value="GBP">Pound Sterling (GBP)</option>    
                                    <option value="LKR">Sri Lankan Rupee (LKR)</option>
                                    <option value="CHF" >Swiss Franc (CHF)</option>
                                    <option value="USD" >United States (USD)</option>
                                </select>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>



    <script type="text/javascript">
    /* Function for Currency Convert */
    function convertCurrency() {
        var from = document.getElementById("from").value;
        var to = document.getElementById("to").value;
        var xmlhttp = new XMLHttpRequest();
        var url = "http://data.fixer.io/api/latest?access_key=8b7d8a9daf4bda339ee45556897be3e2&symbols=" + from + "," + to;
        xmlhttp.open("GET", url, true);
        xmlhttp.send();
        xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            var result = xmlhttp.responseText;
            /*alert(result);*/
            var jsResult = JSON.parse(result);
            var oneUnit = jsResult.rates[to] / jsResult.rates[from];
            var amt = document.getElementById("fromAmount").value;
            document.getElementById("toAmount").value = (oneUnit * amt).toFixed(2);
            }
        }
    }
    </script>



    <!-- Footer -->
    <footer class="navbar navbar-expand-lg navbar-dark position-relative">
        <div class="container">
            <!--Navigation Menu-->
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav text-uppercase mr-auto">
                    <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" style="font-size: 12px;" href="home.jsp">Discover
                        </a>
                    </li>
                
                    <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" style="font-size: 12px;" href="about.jsp">About Us
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" style="font-size: 12px;" href="contact.jsp">Contact Us
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" style="font-size: 12px;" href="privacy.jsp">Privacy Policy
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" style="font-size: 12px;" href="terms.jsp">Terms of Use
                        </a>
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
            geocode2();
        }
        function geocode2() {
            var location = document.getElementById("place").value;
            axios.get('https://maps.googleapis.com/maps/api/geocode/json?address=' + location + '&key=AIzaSyD3BGsGYoUdXxL3oP0cgfW0-PF_w-wQetE').then(function(response) {
                console.log(response);
                var latitude = response.data.results[0].geometry.location.lat;
                var longitude = response.data.results[0].geometry.location.lng;
                var address = latitude + "," + longitude;
            })
        }
    </script>
<!--Google places API-->
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD3BGsGYoUdXxL3oP0cgfW0-PF_w-wQetE&libraries=places&callback=autoComp"></script>
</body>

</html>