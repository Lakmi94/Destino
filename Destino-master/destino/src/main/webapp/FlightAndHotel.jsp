<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.Connection"%>
<%@page import="java.sql.*" %>
<%@page import="javax.servlet.*"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.util.*" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Destino</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="google-signin-client_id" content="1032689498916-u8i9l91qq544t77cijcfupqij5vjs5lg.apps.googleusercontent.com">
    <link rel="icon" type="image/png" href="img/logo2.png">

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

    <!-- Datepicker js -->
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script type="text/javascript">var $jQuery_1_12_4 = jQuery.noConflict(true);</script>
	
	<!-- autocomplete -->
	<script src="https://code.jquery.com/jquery-1.11.2.min.js"></script>
	<script src="js/jquery.easy-autocomplete.min.js"></script>
	<link rel="stylesheet" href="css/easy-autocomplete.min.css">
	
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

    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <!--<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>-->

	<script>
	var fromAirport;
	var toAirport;
	var checkinHotel;
	</script>
	
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

    <div>
    <p class="row"></p>
    <p class="row"></p>
    <p class="row"></p>
    <p class="row"></p>
    <p class="row"></p>
    <p class="row"></p>
    </div>
    <nav>
        <div class="nav nav-tabs" id="nav-tab" role="tablist">
            <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">Flights</a>
            <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">Hotels</a>
            
        </div>
    </nav>
    <p class="row"></p>
    <div class="tab-content" id="nav-tabContent">
    <!-- Search for flights -->
        <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
        <p class="row"></p>
        <h2>&nbsp;&nbsp;&nbsp;&nbsp;Search for Flights!</h2>
        <!-- Flight tabs -->
            <div class="FHContainer">
                <div class="FHPadding">
                    <div class="tab">
                      <button class="tablinks" onclick="openCity(event, 'oneway')" id="onewayOpen">Oneway</button>
                      <button class="tablinks" onclick="openCity(event, 'roundtrip')">Round trip</button>
                    </div>
                    <div id="oneway" class="tabcontent">
                        <p class="row"></p>
                        <div class="row">
                            <div class="col-3">
                            <h6>&nbsp;&nbsp;Origin</h6>
                            </div>
                            <div class="col-9">
                                <input class="FHInput" type="text" id="oneway_departureCity" required>
                            </div>
                            <script>
                            var options1 = {
                                    url: "js/airports.json",
                                    getValue: "label",
                                    list: {
                                        match: {
                                            enabled: true
                                            
                                        },
                                        onSelectItemEvent: function() {
                                            fromAirport = $("#oneway_departureCity").getSelectedItemData().value;
                                        }
                                    }
                                };
                            $("#oneway_departureCity").easyAutocomplete(options1);
                            </script>

                        </div>
                        <div class="row">
                            <div class="col-3">
                            <h6>&nbsp;&nbsp;Destination</h6>
                            </div>
                            <div class="col-9">
                                <input type="text" id="oneway_destination" class="FHInput" required>
                            </div>
                            <script>
                            var options2 = {
                                    url: "js/airports.json",
                                    getValue: "label",
                                    list: {
                                        match: {
                                            enabled: true
                                        },
                                        onSelectItemEvent: function() {
                                            toAirport = $("#oneway_destination").getSelectedItemData().value;
                                        }
                                    }
                                };
                            $("#oneway_destination").easyAutocomplete(options2);
                            </script>
                        </div>
                        <div class="row">
                            <div class="col-3">
                            <h6>&nbsp;&nbsp;Departure</h6>
                            </div>
                            <div class="col-3">
                            </div>
                            <div class="col-2">
                            <h6>Adults</h6>
                            </div>
                            <div class="col-2">
                            <h6>Children</h6>
                            </div>
                            <div class="col-2">
                            <h6>Class</h6>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-3">
                                &nbsp;&nbsp;<input class="FHInput" type="text" id="oneway_departureDate" required>
                                <script>
                                $( function() {
                                    $jQuery_1_12_4( "#oneway_departureDate" ).datepicker({ dateFormat: 'yy-mm-dd' }).val();
                                      } );
                                </script>
                            </div>
                            <div class="col-3">
                            </div>
                            <div class="col-2">
                                <div id="adults"></div>
                                <select style="border-radius: 5px; width:50%;height: 50px;" id="adult" onchange="change_adult(this.value)">        
                                    <option id="1" value="1">1 </option>
                                    <option id="2" value="2">2 </option> 
                                    <option id="3" value="3">3 </option> 
                                    <option id="4" value="4">4 </option> 
                                    <option id="5" value="5">5 </option> 
                                    <option id="6" value="6">6 </option> 
                                    <option id="7" value="7">7 </option> 
                                </select>
                                <script>
                                    function change_adult(sel) {
                                        var value = sel.value;  
                                    }
                                </script>
                            </div>
                            <div class="col-2">
                                <div id="children"></div>
                                <select style="border-radius: 5px; width:50%;height: 50px;" id="children" onchange="change_children(this.value)">   
                                    <option id="0" value="0">0</option>
                                    <option id="1" value="1">1 </option>
                                    <option id="2" value="2">2 </option> 
                                    <option id="3" value="3">3 </option> 
                                    <option id="4" value="4">4 </option> 
                                    <option id="5" value="5">5 </option> 
                                    <option id="6" value="6">6 </option> 
                                    <option id="7" value="7">7 </option> 
                                </select>
                                <script>
                                    function change_children(sel) {
                                        var value = sel.value;  
                                    }
                                </script>
                            </div>
                            <div class="col-2">
                                <select style="border-radius: 5px; width: auto;height: 50px;" id="flightclass" onchange="change_flightclass(this.value)">
                                <option value="ECONOMY">Economy </option>
                                <option value="BUSINESS">Business </option> 
                                </select>
                                <script>
                                    function change_flightclass(sel) {
                                        var value = sel.value;  
                                    }
                                </script>
                            </div>
                        </div>

                        <div class="col-12" align="right">
                            <input type="submit" value="Search" id="oneway_flightSearch" class="round-button" /> 
                        </div>
                        <p class="row"></p>
                    </div>
                    
                    <div id="roundtrip" class="tabcontent">
                        <p class="row"></p>
                        <div class="row">
                            <div class="col-3">
                            <h6>&nbsp;&nbsp;Origin</h6>
                            </div>
                            <div class="col-9">
                                <input class="FHInput" type="text" id="round_departureCity" required>
                            </div>
                            <script>
                            var options1 = {
                                    url: "js/airports.json",
                                    getValue: "label",
                                    list: {
                                        match: {
                                            enabled: true
                                        },
                                        onSelectItemEvent: function() {
                                            fromAirport = $("#round_departureCity").getSelectedItemData().value;
                                        }
                                    }
                                };
                            $("#round_departureCity").easyAutocomplete(options1);
                            </script>

                        </div>
                        <div class="row">
                            <div class="col-3">
                            <h6>&nbsp;&nbsp;Destination</h6>
                            </div>
                            <div class="col-9">
                                <input type="text" id="round_destination" class="FHInput" required>
                            </div>
                            <script>
                            var options2 = {
                                    url: "js/airports.json",
                                    getValue: "label",
                                    list: {
                                        match: {
                                            enabled: true
                                        },
                                        onSelectItemEvent: function() {
                                            toAirport = $("#round_destination").getSelectedItemData().value;
                                        }
                                    }
                                };
                            $("#round_destination").easyAutocomplete(options2);
                            </script>
                        </div>
                        <div class="row">
                            <div class="col-3">
                            <h6>&nbsp;&nbsp;Departure</h6>
                            </div>
                            <div class="col-3">
                            <h6>Return</h6>
                            </div>
                            <div class="col-2">
                            <h6>Adults</h6>
                            </div>
                            <div class="col-2">
                            <h6>Children</h6>
                            </div>
                            <div class="col-2">
                            <h6>Class</h6>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-3">
                                &nbsp;&nbsp;<input class="FHInput" type="text" id="round_departureDate" required>
                                <script>
                                $( function() {
                                    $jQuery_1_12_4( "#round_departureDate" ).datepicker({ dateFormat: 'yy-mm-dd' }).val();
                                      } );
                                </script>
                            </div>
                            <div class="col-3">
                                <input class="FHInput" type="text" id="round_returnDate" required>
                                <script>
                                $( function() {
                                    $jQuery_1_12_4( "#round_returnDate" ).datepicker({ dateFormat: 'yy-mm-dd' }).val();
                                      } );
                                </script>
                            </div>
                            <div class="col-2">
                                <div id="adults"></div>
                                <select style="border-radius: 5px; width:50%;height: 50px;" id="adult" onchange="change_adult(this.value)">        
                                    <option id="1" value="1">1 </option>
                                    <option id="2" value="2">2 </option> 
                                    <option id="3" value="3">3 </option> 
                                    <option id="4" value="4">4 </option> 
                                    <option id="5" value="5">5 </option> 
                                    <option id="6" value="6">6 </option> 
                                    <option id="7" value="7">7 </option> 
                                </select>
                                <script>
                                    function change_adult(sel) {
                                        var value = sel.value;  
                                    }
                                </script>
                            </div>
                            <div class="col-2">
                                <div id="children"></div>
                                <select style="border-radius: 5px; width:50%;height: 50px;" id="children" onchange="change_children(this.value)">   
                                    <option id="0" value="0">0</option>
                                    <option id="1" value="1">1 </option>
                                    <option id="2" value="2">2 </option> 
                                    <option id="3" value="3">3 </option> 
                                    <option id="4" value="4">4 </option> 
                                    <option id="5" value="5">5 </option> 
                                    <option id="6" value="6">6 </option> 
                                    <option id="7" value="7">7 </option> 
                                </select>
                                <script>
                                    function change_children(sel) {
                                        var value = sel.value;  
                                    }
                                </script>
                            </div>
                            <div class="col-2">
                                <select style="border-radius: 5px; width: auto;height: 50px;" id="flightclass" onchange="change_flightclass(this.value)">
                                <option value="ECONOMY">Economy </option>
                                <option value="BUSINESS">Business </option> 
                                </select>
                                <script>
                                    function change_flightclass(sel) {
                                        var value = sel.value;  
                                    }
                                </script>
                            </div>
                        </div>

                        <div class="col-12" align="right">
                            <input type="submit" value="Search" id="round_flightSearch" class="round-button" /> 
                        </div>
                        <p class="row"></p>
                    </div>
                </div>
                <script>
                function openCity(evt, flightType) {
                    var i, tabcontent, tablinks;
                    tabcontent = document.getElementsByClassName("tabcontent");
                    for (i = 0; i < tabcontent.length; i++) {
                        tabcontent[i].style.display = "none";
                    }
                    tablinks = document.getElementsByClassName("tablinks");
                    for (i = 0; i < tablinks.length; i++) {
                        tablinks[i].className = tablinks[i].className.replace(" active", "");
                    }
                    document.getElementById(flightType).style.display = "block";
                    evt.currentTarget.className += " active";
                    
                }
                    
                    document.getElementById("onewayOpen").click();
                </script>
            </div>
            
            <!-- Getting data -->
            <div class="FHPadding" >
                <div class="flightSearchResults">
                    <div id="flightSection"></div>
                </div>
            </div>

            <!-- get search url oneway -->
            <script type='text/javascript'>
            $('#oneway_flightSearch').click(function() {

                $('#flightSection').empty();
                var searchurl = 'https://api.sandbox.amadeus.com/v1.2/flights/low-fare-search?apikey=rGJGDv5ZYPbi9VJuAw0Dv6kWNJjibKmK';
                var getDepartureCity = '&origin='+fromAirport;
                var getArrivalCity = '&destination='+ toAirport;
                var getDepartureDate = '&departure_date='+document.getElementById("oneway_departureDate").value;
                var getAdult="";
                var getChildren="";
                var getNonstop='&nonstop=TRUE';
                var getFlightClass="";

                if(document.getElementById("adult").value !=null){
                    getAdult='&adult='+document.getElementById("adult").value;
                }
                if(document.getElementById("children").value !=null){
                    getChildren='&children='+document.getElementById("children").value;
                }
                if(document.getElementById("flightclass").value !=null){
                    getFlightClass='&travel_class='+document.getElementById("flightclass").value;
                }
                else{
                    getAdult="";
                    getChildren="";
                    getFlightClass="";

                }

                var apiurl=searchurl+getDepartureCity + getArrivalCity + getDepartureDate+getAdult+getChildren+getNonstop+getFlightClass;

                console.log(apiurl);		//This is url for search result


                var requestURL=apiurl;
                var request = new XMLHttpRequest();
                request.open('GET',requestURL);
                request.responseType='json';
                request.send();
                request.onload=function(){
                    var flightResults=request.response;
                    showFlights(flightResults);
                }
                function showFlights(jsonObj){
                    var results = jsonObj['results'];
                    if(results.length==0){
                        $('#flightSection').append("No result");
                    }
                    else{
                        var table="";
                        table +='<table id="resultTable" border="1" style="width:100%; border-radius: 5px;"><tr style="padding:8px"><th style="padding:8px; width:5%">#</th><th style="padding:8px; width:25%">depart time</th><th style="padding:8px; width:25%">arrival time</th><th style="padding:8px; width:12.5%">origin</th><th style="padding:8px; width:12.5%">destination</th><th style="padding:8px; width:10%">seats</th><th style="padding:8px; width:10%">Price</th></tr>';
                        $('#flightSection').append(table);

                        for (var i=0; i<results.length; i++){
                            var myArticle ="";
                            myArticle += '<table id="resultTable" border="1" style="width:100%"><tr style="padding:8px; width:5%">';
                            var myPara1 ="";
                            myPara1 += '<td style="padding:8px; width:5%">';
                            var myPara2 ="";
                            myPara2+= '</td><td style="padding:8px; width:25%">';
                            var myPara3 ="";
                            myPara3 += '</td><td style="padding:8px; width:25%">';
                            var myPara4 ="";
                            myPara4 += '</td><td style="padding:8px; width:12.5%">';
                            var myPara5 ="";
                            myPara5 += '</td><td style="padding:8px; width:12.5%">';
                            var myPara6 ="";
                            myPara6 += '</td><td style="padding:8px; width:10%">';
                            var myPara12 ="";
                            myPara12 += '</td><td style="padding:8px; width:10%">';


            /*index*/				var index = i+1;
                                    myPara1 += index.toString();
            /*outbound depart time*/				myPara2+= results[i].itineraries[0].outbound.flights[0].departs_at;
            /*outbound arrival time*/				myPara3+= results[i].itineraries[0].outbound.flights[0].arrives_at;
            /*outbound origin airport*/				myPara4+= results[i].itineraries[0].outbound.flights[0].origin.airport;	
            /*outbound destination airport*/		myPara5+= results[i].itineraries[0].outbound.flights[0].destination.airport;
            /*outbound seats remaining*/			myPara6+= results[i].itineraries[0].outbound.flights[0].booking_info.seats_remaining;
            /*total fare*/							myPara12+= results[i].fare.total_price + " USD" + "</td></tr></table>";
                            myArticle += myPara1 + myPara2 + myPara3 + myPara4 + myPara5 + myPara6 + myPara12;

                            $('#flightSection').append(myArticle);
                        }
                       // $('#flightSection').append('</table>');
                    }

                }
            });
            </script>	
            
            
            <!-- get search url roundtrip -->
            <script type='text/javascript'>
            $('#round_flightSearch').click(function() {

                $('#flightSection').empty();
                var searchurl = 'https://api.sandbox.amadeus.com/v1.2/flights/low-fare-search?apikey=rGJGDv5ZYPbi9VJuAw0Dv6kWNJjibKmK';
                var getDepartureCity = '&origin='+fromAirport;
                var getArrivalCity = '&destination='+ toAirport;
                var getDepartureDate = '&departure_date='+document.getElementById("round_departureDate").value;
                var getArrivalDate = '&return_date='+document.getElementById("round_returnDate").value;
                var getAdult="";
                var getChildren="";
                var getNonstop='&nonstop=TRUE';
                var getFlightClass="";

                if(document.getElementById("adult").value !=null){
                    getAdult='&adult='+document.getElementById("adult").value;
                }
                if(document.getElementById("children").value !=null){
                    getChildren='&children='+document.getElementById("children").value;
                }
                /*if(document.getElementById("nonstop").value !=null){
                    getNonstop='&nonstop='+document.getElementById("nonstop").value;
                }*/
                if(document.getElementById("flightclass").value !=null){
                    getFlightClass='&travel_class='+document.getElementById("flightclass").value;
                }
                else{
                    getAdult="";
                    getChildren="";
                    getFlightClass="";

                }

                var apiurl=searchurl+getDepartureCity + getArrivalCity + getDepartureDate+getArrivalDate+ getAdult+getChildren+getNonstop+getFlightClass;

                console.log(apiurl);		//This is url for search result


                var requestURL=apiurl;
                var request = new XMLHttpRequest();
                request.open('GET',requestURL);
                request.responseType='json';
                request.send();
                request.onload=function(){
                    var flightResults=request.response;
                    showFlights(flightResults);
                }
                function showFlights(jsonObj){
                    var results = jsonObj['results'];
                    if(results.length==0){
                        $('#flightSection').append("No result");
                    }
                    else{
                        var table="";
                        table +='<table id="resultTable" border="1" style="width:100%; border-radius: 5px;"><tr style="padding:8px"><th style="padding:8px; width:5%">#</th><th style="padding:8px; width:25%">depart time</th><th style="padding:8px; width:25%">arrival time</th><th style="padding:8px; width:12.5%">origin</th><th style="padding:8px; width:12.5%">destination</th><th style="padding:8px; width:10%">seats</th><th style="padding:8px; width:10%">Price</th></tr>';
                        $('#flightSection').append(table);

                        for (var i=0; i<results.length; i++){
                            var myArticle ="";
                            myArticle += '<table id="resultTable" border="1" style="width:100%"><tr style="padding:8px; width:5%">';
                            var myPara1 ="";
                            myPara1 += '<td style="padding:8px; width:5%">';
                            var myPara2 ="";
                            myPara2 += '</td><td style="padding:8px; width:25%">';
                            var myPara3 ="";
                            myPara3 += '</td><td style="padding:8px; width:25%">';
                            var myPara4 ="";
                            myPara4 += '</td><td style="padding:8px; width:12.5%">';
                            var myPara5 ="";
                            myPara5 += '</td><td style="padding:8px; width:12.5%">';
                            var myPara6 ="";
                            myPara6 += '</td><td style="padding:8px; width:10%">';
                            
                            var myPara7 ="";
                            myPara7 += '<tr style="padding:8px; width:5%"><td style="padding:8px; width:5%">';
                            var myPara8 ="";
                            myPara8 += '</td><td style="padding:8px; width:25%">';
                            var myPara9 ="";
                            myPara9 += '</td><td style="padding:8px; width:25%">';
                            var myPara10 = "";
                            myPara10 += '</td><td style="padding:8px; width:12.5%">';
                            var myPara11 = "";
                            myPara11 += '</td><td style="padding:8px; width:12.5%">';
                            var myPara12 = "";
                            myPara12 += '</td><td style="padding:8px; width:10%">';
                            
                            var myPara13 = "";
                            myPara13 += '</td><td style="padding:8px; width:10%"></tr>';
                            var myPara14 = "";
                            myPara14 += '</td><td style="padding:8px; width:10%">';
                            
            /*index*/			var index = i+1;
                                myPara1 += index.toString();
/*outbound depart time*/		myPara2+= results[i].itineraries[0].outbound.flights[0].departs_at;
/*outbound arrival time*/		myPara3+= results[i].itineraries[0].outbound.flights[0].arrives_at;
/*outbound origin airport*/		myPara4+= results[i].itineraries[0].outbound.flights[0].origin.airport;	
/*outbound destination airport*/myPara5+= results[i].itineraries[0].outbound.flights[0].destination.airport;
/*outbound seats remaining*/	myPara6+= results[i].itineraries[0].outbound.flights[0].booking_info.seats_remaining;
                            

/*inbound depart time*/	    	myPara8+= results[i].itineraries[0].inbound.flights[0].departs_at;
/*inbound arrival time*/		myPara9+= results[i].itineraries[0].inbound.flights[0].arrives_at;
/*inbound origin airport*/		myPara10+= results[i].itineraries[0].inbound.flights[0].origin.airport;	
/*inbound destination airport*/	myPara11+= results[i].itineraries[0].inbound.flights[0].destination.airport;
/*inbound seats remaining*/		myPara12+= results[i].itineraries[0].inbound.flights[0].booking_info.seats_remaining;
/*total fare*/					myPara14+= results[i].fare.total_price + " USD" + "</td></tr></table>";
                            
                            myArticle += myPara1 + myPara2 + myPara3 + myPara4 + myPara5 + myPara6 + myPara13 + myPara7 + myPara8 + myPara9 + myPara10 + myPara11 + myPara12 + myPara14;


                            $('#flightSection').append(myArticle);
                        }
                        $('#flightSection').append('</table>');
                    }

                }
            });
            </script>	
        </div>
        
<!--Hotels-->        
        <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
            <p class="row"></p>
            <h2>&nbsp;&nbsp;&nbsp;&nbsp;Search for Hotels!</h2>
            <!-- search box -->
            <div class="FHContainer">
                <div class="FHPadding">
                    <p class="row"></p>
                    <div class="row">
                        <div class="col-3">
                            <h6>&nbsp;&nbsp;Destination</h6>
                        </div>
                        <div class="col-9">
                            <input class="FHInput" type="text" id="checkinCity" required>
                        </div>
                        <script>
                        var options3 = {
                        		url: "js/airports.json",
								getValue: "label",
								list: {
                        			match: {
                        				enabled: true
                        			},
			                        onSelectItemEvent: function() {
			                        	checkinHotel = $("#checkinCity").getSelectedItemData().value;
			                        }
								}
                        	};
                        $("#checkinCity").easyAutocomplete(options3);
                        </script>

                    </div>
                    <div class="row">
                        <div class="col-4">
                            <h6>&nbsp;&nbsp;Check in</h6>
                        </div>
                        <div class="col-4">
                            <h6>Check out</h6>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-4">
                            &nbsp;&nbsp;<input class="FHInput" type="text" id="checkinDate" required>   <script>
                                  $( function() {
                                	  $jQuery_1_12_4( "#checkinDate" ).datepicker({ dateFormat: 'yy-mm-dd' }).val();
                                  } );
                            </script>
                        </div>
                        <div class="col-4">
                            <input type="text" class="FHInput" id="checkoutDate" required>
                            <script>
                                  $( function() {
                                	  $jQuery_1_12_4( "#checkoutDate" ).datepicker({ dateFormat: 'yy-mm-dd' }).val();
                                  } );
                            </script>
                        </div>
                    </div>
                    <div class="col-12" align="right">
                        <input type="submit" value="Search" id="hotelSearch" class=" round-button" /> 
                    </div>
                    <p class="row"></p>
                </div>
            </div>

            <!-- Getting data -->            
            <div class="FHPadding" >
                <div class="hotelSearchResults">
                    <div id="hotelSection"></div>
                </div>
            </div>
            
            <!-- get search url -->
            <script type='text/javascript'>
                    $('#hotelSearch').click(function() {
                        $('#hotelSection').empty();
                        var searchurl = 'https://api.sandbox.amadeus.com/v1.2/hotels/search-airport?apikey=rGJGDv5ZYPbi9VJuAw0Dv6kWNJjibKmK';
                        var getCheckinCity = '&location='+checkinHotel;
                        var getCheckinDate = '&check_in='+document.getElementById("checkinDate").value;
                        var getCheckoutDate = '&check_out='+document.getElementById("checkoutDate").value;

                        var apiurl=searchurl+getCheckinCity + getCheckinDate + getCheckoutDate;

                        console.log(apiurl);		//This is url for search result


                        var requestURL=apiurl;
                        var request = new XMLHttpRequest();
                        request.open('GET',requestURL);
                        request.responseType='json';
                        request.send();
                        request.onload=function(){
                            var hotelResults=request.response;
                            showHotels(hotelResults);
                        }
                        function showHotels(jsonObj){
                            var hotels = jsonObj['results'];
                            if(hotels.length==0){
                                $('#hotelSection').append("No result");
                            }
                            else{
                                var table="";
                                table +='<table id="resultTable" border="1" style="width:100%; border-radius: 5px;"><tr style="padding:8px"><th style="padding:8px; width:10%">Index</th><th style="padding:8px; width:30%">Hotel</th><th style="padding:8px; width:15%">City</th><th style="padding:8px; width:35%">Address</th><th style="padding:8px; width:10%">Price</th></tr>';
                                
                                $('#hotelSection').append(table);

                                for (var i=0; i<hotels.length; i++){
                                    var myArticle ="";
                                    myArticle += '<table id="resultTable" border="1" style="width:100%"><tr>';
                                    var myPara1 ="";
                                    myPara1 += '<td style="padding:8px; width:10%">';
                                    var myPara2 ="";
                                    myPara2 += '</td><td style="padding:8px; width:30%">';
                                    var myPara3 ="";
                                    myPara3 += '</td><td style="padding:8px; width:15%">';
                                    var myPara4 ="";
                                    myPara4 += '</td><td style="padding:8px; width:35%">';
                                    var myPara5 ="";
                                    myPara5 += '</td><td style="padding:8px; width:10%">';

                                    var index = i+1;
                                    myPara1 += index.toString();
                                    myPara2+= hotels[i].property_name;
                                    myPara3+= hotels[i].address.city;
                                    myPara4+= hotels[i].address.line1;
                                    myPara5+= hotels[i].total_price.amount + " " + hotels[i].total_price.currency + "</td></tr></table>";

                                    myArticle += myPara1 + myPara2 + myPara3 + myPara4 + myPara5;
                                    $('#hotelSection').append(myArticle);
                                }
                                $('#hotelSection').append('</table>');
                            }

                        }
                    });
            </script>        
        </div>
    </div>





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