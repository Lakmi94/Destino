<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.*" %>
    <%@page import="java.sql.*" %>
<%@page import="javax.servlet.*"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.util.*" language="java" %>
<%@ page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><meta charset="utf-8" content="">
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
<div style="text-size:32px; align:center; padding-left:10px; padding-right:10px">
<div id='ppHeader' style="text-align:center;color:#03ddc7; text-size:30px;">Destino Privacy Policy</div>
<div id='ppBody' style="color:#fff">
   
  
    <div style='clear:both;height:10px;'></div>
    <div class='innerText'>This privacy policy has been compiled to better serve those who are concerned with how their 'Personally Identifiable
        Information' (PII) is being used online. PII, as described in US privacy law and information security, is information
        that can be used on its own or with other information to identify, contact, or locate a single person, or to identify
        an individual in context. Please read our privacy policy carefully to get a clear understanding of how we collect,
        use, protect or otherwise handle your Personally Identifiable Information in accordance with our website.
        <br>
    </div>
    <span id='infoCo'></span>
    <br>
    <div class='grayText' style="color:#03ddc7">
        <strong>What personal information do we collect from the people that visit our blog, website or app?</strong>
    </div>
    <br />
    <div class='innerText'>When ordering or registering on our site, as appropriate, you may be asked to enter your name, email address or other
        details to help you with your experience.</div>
    <br>
    <div class='grayText' style="color:#03ddc7">
        <strong>When do we collect information?</strong>
    </div>
    <br />
    <div class='innerText'>We collect information from you when you register on our site or enter information on our site.</div>
    <br>
    <span id='infoUs'></span>
    <br>
    <div class='grayText' style="color:#03ddc7">
        <strong>How do we use your information? </strong>
    </div>
    <br />
    <div class='innerText'> We may use the information we collect from you when you register, make a purchase, sign up for our newsletter, respond
        to a survey or marketing communication, surf the website, or use certain other site features in the following ways:
        <br>
        <br>
    </div>
    <div class='innerText'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <strong>&bull;</strong> To personalize your experience and to allow us to deliver the type of content and product offerings
        in which you are most interested.</div>
    <div class='innerText'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <strong>&bull;</strong> To improve our website in order to better serve you.</div>
    <span id='infoPro'></span>
    <br>
    <div class='grayText' style="color:#03ddc7">
        <strong>How do we protect your information?</strong>
    </div>
    <br />
    <div class='innerText'>We do not use vulnerability scanning and/or scanning to PCI standards.</div>
    <div class='innerText'>We only provide articles and information. We never ask for credit card numbers.</div>
    <div class='innerText'>We do not use Malware Scanning.
        <br>
        <br>
    </div>
    <div class='innerText'>We do not use an SSL certificate</div>
    <div class='innerText'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <strong>&bull;</strong> We do not need an SSL because:</div>
    <div class='innerText'>this is a demo website </div>
    <span id='coUs'></span>
    <br>
    <div class='grayText' style="color:#03ddc7">
        <strong>Do we use 'cookies'?</strong>
    </div>
    <br />
    <div class='innerText'>We do not use cookies for tracking purposes </div>
    <div class='innerText'>
        <br>You can choose to have your computer warn you each time a cookie is being sent, or you can choose to turn off all
        cookies. You do this through your browser settings. Since browser is a little different, look at your browser's Help
        Menu to learn the correct way to modify your cookies.
        <br>
    </div>
    <br>
   
    <span id='trDi'></span>
    <br>
    <div class='grayText' style="color:#03ddc7"> 
        <strong>Third-party disclosure</strong>
    </div>
    <br />
    <div class='innerText'>We do not sell, trade, or otherwise transfer to outside parties your Personally Identifiable Information.</div>
    <span
        id='trLi'></span>
        <br>
        <div class='grayText'style="color:#03ddc7">
            <strong>Third-party links</strong>
        </div>
        <br />
        <div class='innerText'>Occasionally, at our discretion, we may include or offer third-party products or services on our website. These third-party
            sites have separate and independent privacy policies. We therefore have no responsibility or liability for the
            content and activities of these linked sites. Nonetheless, we seek to protect the integrity of our site and welcome
            any feedback about these sites.</div>
        <span id='gooAd'></span>
        <br>
        <div class='blueText' style="color:#03ddc7">
            <strong>Google</strong>
        </div>
        <br />
        <div class='innerText'>Google's advertising requirements can be summed up by Google's Advertising Principles. They are put in place to provide
            a positive experience for users. https://support.google.com/adwordspolicy/answer/1316548?hl=en
            <br>
            <br>
        </div>
        <div class='innerText'>We have not enabled Google AdSense on our site but we may do so in the future.</div>
        <span id='calOppa'></span>
        <br>
        <div class='blueText' style="color:#03ddc7">
            <strong>California Online Privacy Protection Act</strong>
        </div>
        <br />
        <div class='innerText'>CalOPPA is the first state law in the nation to require commercial websites and online services to post a privacy
            policy. The law's reach stretches well beyond California to require any person or company in the United States
            (and conceivably the world) that operates websites collecting Personally Identifiable Information from California
            consumers to post a conspicuous privacy policy on its website stating exactly the information being collected
            and those individuals or companies with whom it is being shared. - See more at: http://consumercal.org/california-online-privacy-protection-act-caloppa/#sthash.0FdRbT51.dpuf
            <br>
        </div>
        <div class='innerText'>
            <br>
            <strong style="color:#03ddc7">According to CalOPPA, we agree to the following:</strong>
            <br>
        </div>
        <div class='innerText'>Users can visit our site anonymously.</div>
        <div class='innerText'>Once this privacy policy is created, we will add a link to it on our home page or as a minimum, on the first significant
            page after entering our website.
            <br>
        </div>
        <div class='innerText'>Our Privacy Policy link includes the word 'Privacy' and can easily be found on the page specified above.</div>
        <div
            class='innerText'>
            <br>You will be notified of any Privacy Policy changes:</div>
<div class='innerText'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <strong>&bull;</strong> On our Privacy Policy Page
    <br>
</div>
<div class='innerText'>Can change your personal information:</div>
<div class='innerText'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <strong>&bull;</strong> By logging in to your account</div>
<div class='innerText'>
    <br>
    <strong style="color:#03ddc7">How does our site handle Do Not Track signals?</strong>
    <br>
</div>
<div class='innerText'>We honor Do Not Track signals and Do Not Track, plant cookies, or use advertising when a Do Not Track (DNT) browser mechanism
    is in place. </div>
<div class='innerText'>
    <br>
    <strong style="color:#03ddc7"> Does our site allow third-party behavioral tracking?</strong>
    <br>
</div>
<div class='innerText'>It's also important to note that we do not allow third-party behavioral tracking</div>
<span id='coppAct'></span>
<br>
<div class='blueText' style="color:#03ddc7">
    <strong>COPPA (Children Online Privacy Protection Act)</strong>
</div>
<br />
<div class='innerText'>When it comes to the collection of personal information from children under the age of 13 years old, the Children's Online
    Privacy Protection Act (COPPA) puts parents in control. The Federal Trade Commission, United States' consumer protection
    agency, enforces the COPPA Rule, which spells out what operators of websites and online services must do to protect children's
    privacy and safety online.
    <br>
    <br>
</div>
<div class='innerText'>We do not specifically market to children under the age of 13 years old.</div>
<span id='ftcFip'></span>
<br>
<div class='blueText' style="color:#03ddc7">
    <strong>Fair Information Practices</strong>
</div>
<br />
<div class='innerText'>The Fair Information Practices Principles form the backbone of privacy law in the United States and the concepts they include
    have played a significant role in the development of data protection laws around the globe. Understanding the Fair Information
    Practice Principles and how they should be implemented is critical to comply with the various privacy laws that protect
    personal information.
    <br>
    <br>
</div>
<div class='innerText' style="color:#03ddc7">
    <strong>In order to be in line with Fair Information Practices we will take the following responsive action, should a data breach
        occur:</strong>
</div>
<div class='innerText'>We will notify you via email</div>
<div class='innerText'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <strong>&bull;</strong> Within 1 business day</div>
<div class='innerText'>
    <br>We also agree to the Individual Redress Principle which requires that individuals have the right to legally pursue enforceable
    rights against data collectors and processors who fail to adhere to the law. This principle requires not only that individuals
    have enforceable rights against data users, but also that individuals have recourse to courts or government agencies
    to investigate and/or prosecute non-compliance by data processors.</div>
<span id='canSpam'></span>
<br>
<div class='blueText' style="color:#03ddc7">
    <strong>CAN SPAM Act</strong>
</div>
<br />
<div class='innerText'>The CAN-SPAM Act is a law that sets the rules for commercial email, establishes requirements for commercial messages, gives
    recipients the right to have emails stopped from being sent to them, and spells out tough penalties for violations.
    <br>
    <br>
</div>
<div class='innerText' style="color:#03ddc7">
    <strong>We collect your email address in order to:</strong>
</div>
<div class='innerText'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <strong>&bull;</strong> Send information, respond to inquiries, and/or other requests or questions</div>
<div class='innerText'>
    <br>
    <strong style="color:#03ddc7">To be in accordance with CANSPAM, we agree to the following:</strong>
</div>
<div class='innerText'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <strong>&bull;</strong> Not use false or misleading subjects or email addresses.</div>
<div class='innerText'>
    <p>
        <br>If at any time you would like to unsubscribe from receiving future emails, you can email us at <strong>apl.destino@gmail.com</strong> and we will promptly remove you from
<strong>ALL</strong> correspondence.<p></div>
<br>
<span id='ourCon'></span>
<br>
<div class='blueText' style="color:#03ddc7">
    <strong>Contacting Us</strong>
</div>
<br />
<div class='innerText'>If there are any questions regarding this privacy policy, you may contact us using the information below.
    <br>
    <br>
</div>
<div class='innerText'>destino.com</div>

<div class='innerText'>apl.destino@gmail.com</div>
<div class='innerText'>
    <br>Last Edited on 2018-06-16</div>
    </div>
</div>
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