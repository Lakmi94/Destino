/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.http.HttpSession;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;

/**
 *
 * @author wareja
 */
@WebServlet(urlPatterns = {"/NewTrip"})
@MultipartConfig(maxFileSize = 16177215) //size of uploded file
public class NewTrip extends HttpServlet {
	//Connect to DB
	Connection con;
	//Declare global variables
	String id=null;
	String TripId=null;
	String countryID=null;
	
	//Declare the images 
	Part image1;
	Part image2;
	Part image3;
	Part image4;
	Part image5;
	Part image6;
	
	/**
	 * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
	 * methods.
	 *
	 * @param request servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException if an I/O error occurs
	 */

	// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

	/**
	 * Handles the HTTP <code>POST</code> method.
	 *
	 * @param request servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException if an I/O error occurs
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		HttpSession session=request.getSession(false);
		String email=(String)session.getAttribute("email");

		//CONEECT TO THE DB
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://166.62.29.165:3306/308db1?autoReconnect=true&useSSL=false","308db1","308db11234308db1");
			
			/**************************************Getting user email in order to get the user ID************************************************/       
			PreparedStatement statement=con.prepareStatement("select * from users where email=?");

			statement.setString(1, email);
			//CHECKING FOR RESULT 
			ResultSet rs=statement.executeQuery();
			if(rs.next())
			{
				//GETTING THE userID from the Trip
				id=rs.getString(1);
			}
			String title=request.getParameter("title");
			String location=request.getParameter("location");
			String date=request.getParameter("datePicker");
			String desc=request.getParameter("description");
			String tripType=request.getParameter("trip_type");
			String transportMode=request.getParameter("transport_mode");

			//POST THE TRIPS STUFFS
			PreparedStatement post=con.prepareStatement("insert into trip(title,Tripdescription,tripType,date,userID_trip) values(?,?,?,?,?)");
			post.setString(1, title);
			post.setString(2, desc);
			post.setString(3, tripType);
			post.setString(4, date);
			post.setString(5, id);

			int row=post.executeUpdate();

			//post=con.prepareStatement("insert into image()");

			if(row>0)
			{
				//REQUEST THE ID OF THE TRIP SO THAT WE CAN 
				PreparedStatement getID=con.prepareStatement("select TripID from trip where title=? and tripType=? and Tripdescription=?");
				getID.setString(1, title);
				getID.setString(2, tripType);
				getID.setString(3, desc);

				rs=getID.executeQuery();

				if(rs.next())
				{
					TripId=rs.getString(1);
				}
			}

			/****************************************Get the Image***************************************************************************/
			//get the uploaded images
			 image1=request.getPart("pic1");
			 image2=request.getPart("pic2");
			 image3=request.getPart("pic3");
			 image4=request.getPart("pic4");
			 image5=request.getPart("pic5");
			 image6=request.getPart("pic6");
			/***********************************************************************************************************************/ 
			PreparedStatement addCountry=con.prepareStatement("insert into Country(TripID_country,countryName,countryDescription,transportation) values(?,?,?,?)");

			addCountry.setString(1, TripId);
			addCountry.setString(2, location);
			addCountry.setString(3, desc);
			addCountry.setString(4, transportMode);

			int update=addCountry.executeUpdate();

			if(update>0)
			{
				PreparedStatement getCountryId=con.prepareStatement("select countryID from Country where TripID_country=? and countryName=? and countryDescription=? and transportation=?");

				getCountryId.setString(1, TripId);
				getCountryId.setString(2, location);
				getCountryId.setString(3, desc);
				getCountryId.setString(4, transportMode);
				//GET THE COUNTRY ID FOR IMAGE TABLE					
				ResultSet countryRows=getCountryId.executeQuery();

				if(countryRows.next())
				{
					countryID=countryRows.getString(1);
				}
			}
			
/******************************************IMAGE UPLOAD*********************************************************************************************************/
			int result=0;
			if (image1.getSize()!=0)
			{
				SubmitImages(image1);
			}
			if(image2.getSize()!=0)
			{
				SubmitImages(image2);
			}
			if(image3.getSize()!=0)
			{
				SubmitImages(image3);
			}
			if(image4.getSize()!=0)
			{
				SubmitImages(image4);
			}
			if(image5.getSize()!=0)
			{	            
				SubmitImages(image5);
			}
			if(image6.getSize()!=0)
			{
				SubmitImages(image6);
			}
				
			if(result>=0)
			{
				request.getRequestDispatcher("profile.jsp").forward(request, response);
			}

			else
			{
				String message="We encountered a problem. Please try again later";
				response.sendRedirect("newtrip.jsp?error="+message);
			}
		}
		catch(Exception e)
		{
			String message="We could not process your request due to "+e.getMessage();
			response.sendRedirect("newtrip.jsp?error="+message);
		}
	}

	public int SubmitImages(Part a)
	{ 
		int result = 0;
		//obtains input stream of the uploaded file
		InputStream inputStream=null;
		
		try {
		inputStream = a.getInputStream();
		
		PreparedStatement ImageUpload=con.prepareStatement("insert into image(TripID_image,countryID_image,image) values(?,?,?)");
		
		ImageUpload.setString(1, TripId);
		ImageUpload.setString(2, countryID);
		ImageUpload.setBlob(3, inputStream);
		
		result=ImageUpload.executeUpdate();
		return result;
	}
		catch(Exception e)
		{
			String error="We could not get your requests due to "+e.getMessage();
			result=-1;
			return result;
		}
}
}
