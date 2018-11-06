<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.Connection"%>
<%@page import="java.sql.*" %>
<%@page import="javax.servlet.*"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.util.*" language="java" %>
<%@ page import="java.io.*"%>
<%@ page import="java.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<!-- Custom styles for this template -->
<link href="css/agency.min.css" rel="stylesheet">

</head>
<body>
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
	
	

<section class="bg-dark">

<div style="text-size:32px; align:center; padding-left:10px; padding-right:10px;color:#fff">


<h2 style="color:#03ddc7; text-align:center;">Welcome to Destino</h2>
	<p>These terms and conditions outline the rules and regulations for the use of Destino's Website.</p> <br /> 
	<span style="text-transform: capitalize;"> Destino</span> is located at:<br /> 
	<address> www.destino.com
	</address>
	<p>By accessing this website we assume you accept these terms and conditions in full. Do not continue to use Destino's website 
	if you do not accept all of the terms and conditions stated on this page.</p>
	<p>The following terminology applies to these Terms and Conditions, Privacy Statement and Disclaimer Notice
	and any or all Agreements: “Client”, “You” and “Your” refers to you, the person accessing this website
	and accepting the Company’s terms and conditions. “The Company”, “Ourselves”, “We”, “Our” and “Us”, refers
	to our Company. “Party”, “Parties”, or “Us”, refers to both the Client and ourselves, or either the Client
	or ourselves. All terms refer to the offer, acceptance and consideration of payment necessary to undertake
	the process of our assistance to the Client in the most appropriate manner, whether by formal meetings
	of a fixed duration, or any other means, for the express purpose of meeting the Client’s needs in respect
	of provision of the Company’s stated services/products, in accordance with and subject to, prevailing law
	of . Any use of the above terminology or other words in the singular, plural,
	capitalisation and/or he/she or they, are taken as interchangeable and therefore as referring to same.</p><h4 style="color:#03ddc7">Cookies</h4>
	<p>We employ the use of cookies. By using Destino's website you consent to the use of cookies 
	in accordance with Destino’s privacy policy.</p><p>Most of the modern day interactive web sites
	use cookies to enable us to retrieve user details for each visit. Cookies are used in some areas of our site
	to enable the functionality of this area and ease of use for those people visiting. Some of our 
	affiliate / advertising partners may also use cookies.</p><h4 style="color:#03ddc7">License</h4>
	<p>Unless otherwise stated, Destino and/or it’s licensors own the intellectual property rights for
	all material on Destino. All intellectual property rights are reserved. You may view and/or print
	pages from http://www.destino.com for your own personal use subject to restrictions set in these terms and conditions.</p>
	<p>You must not:</p>
	<ol>
		<li>Republish material from http://www.destino.com</li>
		<li>Sell, rent or sub-license material from http://www.destino.com</li>
		<li>Reproduce, duplicate or copy material from http://www.destino.com</li>
	</ol>
	<p>Redistribute content from Destino (unless content is specifically made for redistribution).</p>
<h4 style="color:#03ddc7">Hyperlinking to our Content</h4>
	<ol>
		<li>The following organizations may link to our Web site without prior written approval:
			<ol>
			<li>Government agencies;</li>
			<li>Search engines;</li>
			<li>News organizations;</li>
			<li>Online directory distributors when they list us in the directory may link to our Web site in the same
				manner as they hyperlink to the Web sites of other listed businesses; and</li>
			<li>Systemwide Accredited Businesses except soliciting non-profit organizations, charity shopping malls,
				and charity fundraising groups which may not hyperlink to our Web site.</li>
			</ol>
		</li>
	</ol>
	<ol start="2">
		<li>These organizations may link to our home page, to publications or to other Web site information so long
			as the link: (a) is not in any way misleading; (b) does not falsely imply sponsorship, endorsement or
			approval of the linking party and its products or services; and (c) fits within the context of the linking
			party's site.
		</li>
		<li>We may consider and approve in our sole discretion other link requests from the following types of organizations:
			<ol>
				<li>commonly-known consumer and/or business information sources such as Chambers of Commerce, American
					Automobile Association, AARP and Consumers Union;</li>
				<li>dot.com community sites;</li>
				<li>associations or other groups representing charities, including charity giving sites,</li>
				<li>online directory distributors;</li>
				<li>internet portals;</li>
				<li>accounting, law and consulting firms whose primary clients are businesses; and</li>
				<li>educational institutions and trade associations.</li>
			</ol>
		</li>
	</ol>
	<p>We will approve link requests from these organizations if we determine that: (a) the link would not reflect
	unfavorably on us or our accredited businesses (for example, trade associations or other organizations
	representing inherently suspect types of business, such as work-at-home opportunities, shall not be allowed
	to link); (b)the organization does not have an unsatisfactory record with us; (c) the benefit to us from
	the visibility associated with the hyperlink outweighs the absence of <?=$companyName?>; and (d) where the
	link is in the context of general resource information or is otherwise consistent with editorial content
	in a newsletter or similar product furthering the mission of the organization.</p>

	<p>These organizations may link to our home page, to publications or to other Web site information so long as
	the link: (a) is not in any way misleading; (b) does not falsely imply sponsorship, endorsement or approval
	of the linking party and it products or services; and (c) fits within the context of the linking party's
	site.</p>

	<p>If you are among the organizations listed in paragraph 2 above and are interested in linking to our website,
	you must notify us by sending an e-mail to <a href="mailto:apl.destino@gmail.com" title="send an email to apl.destino@gmail.com">apl.destino@gmail.com</a>.
	Please include your name, your organization name, contact information (such as a phone number and/or e-mail
	address) as well as the URL of your site, a list of any URLs from which you intend to link to our Web site,
	and a list of the URL(s) on our site to which you would like to link. Allow 2-3 weeks for a response.</p>

	<p>Approved organizations may hyperlink to our Web site as follows:</p>

	<ol>
		<li>By use of our corporate name; or</li>
		<li>By use of the uniform resource locator (Web address) being linked to; or</li>
		<li>By use of any other description of our Web site or material being linked to that makes sense within the
			context and format of content on the linking party's site.</li>
	</ol>
	<p>No use of Destino’s logo or other artwork will be allowed for linking absent a trademark license
	agreement.</p>
<h4 style="color:#03ddc7">Reservation of Rights</h4>
	<p>We reserve the right at any time and in its sole discretion to request that you remove all links or any particular
	link to our Web site. You agree to immediately remove all links to our Web site upon such request. We also
	reserve the right to amend these terms and conditions and its linking policy at any time. By continuing
	to link to our Web site, you agree to be bound to and abide by these linking terms and conditions.</p>
<h4 style="color:#03ddc7">Removal of links from our website</h4>
	<p>If you find any link on our Web site or any linked web site objectionable for any reason, you may contact
	us about this. We will consider requests to remove links but will have no obligation to do so or to respond
	directly to you.</p>
	<p>Whilst we endeavour to ensure that the information on this website is correct, we do not warrant its completeness
	or accuracy; nor do we commit to ensuring that the website remains available or that the material on the
	website is kept up to date.</p>
<h4 style="color:#03ddc7">Content Liability</h4>
	<p>We shall have no responsibility or liability for any content appearing on your Web site. You agree to indemnify
	and defend us against all claims arising out of or based upon your Website. No link(s) may appear on any
	page on your Web site or within any context containing content or materials that may be interpreted as
	libelous, obscene or criminal, or which infringes, otherwise violates, or advocates the infringement or
	other violation of, any third party rights.</p>
<h4 style="color:#03ddc7">Disclaimer</h4>
	<p>To the maximum extent permitted by applicable law, we exclude all representations, warranties and conditions relating to our website and the use of this website (including, without limitation, any warranties implied by law in respect of satisfactory quality, fitness for purpose and/or the use of reasonable care and skill). Nothing in this disclaimer will:</p>
	<ol>
	<li>limit or exclude our or your liability for death or personal injury resulting from negligence;</li>
	<li>limit or exclude our or your liability for fraud or fraudulent misrepresentation;</li>
	<li>limit any of our or your liabilities in any way that is not permitted under applicable law; or</li>
	<li>exclude any of our or your liabilities that may not be excluded under applicable law.</li>
	</ol>
	<p>The limitations and exclusions of liability set out in this Section and elsewhere in this disclaimer: (a)
	are subject to the preceding paragraph; and (b) govern all liabilities arising under the disclaimer or
	in relation to the subject matter of this disclaimer, including liabilities arising in contract, in tort
	(including negligence) and for breach of statutory duty.</p>
	<p>To the extent that the website and the information and services on the website are provided free of charge,
	we will not be liable for any loss or damage of any nature.</p>
<h4></h4>
	<p></p>
<h4 style="color:#03ddc7">Credit & Contact Information</h4>
	<p>This Terms and conditions page was created at <a style="color:inherit;text-decoration:none;cursor:text;"
		href="https://termsandconditionstemplate.com">termsandconditionstemplate.com</a> generator. If you have
	any queries regarding any of our terms, please contact us.</p>		
</div>

</section>
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