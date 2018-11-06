

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
 * Servlet implementation class AddMoreCountry
 */
@WebServlet("/AddMoreCountry")
@MultipartConfig(maxFileSize = 16177215) //size of uploded file
public class AddMoreCountry extends HttpServlet {
	
	Connection con;
	int TripID;
	int countryID;
	Part image1;
	Part image2;
	Part image3;
	Part image4;
	Part image5;
	Part image6;
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		
		try{
        	String addlocation=request.getParameter("addlocation");
			String desc=request.getParameter("adddescription");
			String transportMode=request.getParameter("transport_mode");

			//int TripID =(int)request.getAttribute("TID");
			TripID=Integer.parseInt(request.getParameter("TID"));
			
			
			image1=request.getPart("pic1");
			image2=request.getPart("pic2");
			image3=request.getPart("pic3");
			image4=request.getPart("pic4");
			image5=request.getPart("pic5");
			image6=request.getPart("pic6");
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://166.62.29.165:3306/308db1?autoReconnect=true&useSSL=false","308db1","308db11234308db1");
			
			PreparedStatement addCountry=con.prepareStatement("insert into Country(TripID_country,countryName,countryDescription,transportation) values(?,?,?,?)");

		addCountry.setInt(1, TripID);
		addCountry.setString(2, addlocation);
		addCountry.setString(3, desc);
		addCountry.setString(4, transportMode);

		int update=addCountry.executeUpdate();
		if(update>0)
		{
			
			PreparedStatement getCountryId=con.prepareStatement("select countryID from Country where TripID_country=? and countryName=? and countryDescription=? and transportation=?");

			getCountryId.setInt(1, TripID);
			getCountryId.setString(2, addlocation);
			getCountryId.setString(3, desc);
			getCountryId.setString(4, transportMode);
			//GET THE COUNTRY ID FOR IMAGE TABLE					
			ResultSet countryRows=getCountryId.executeQuery();

			if(countryRows.next())
			{
				countryID=countryRows.getInt(1);
			}
			
			
		}
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
			//request.getRequestDispatcher("trip.jsp?TripID="+TripID).forward(request, response);
			response.sendRedirect("trip.jsp?TripID="+TripID);
		}
		else {
			String message="We encountered a problem. Please try again later";
			response.sendRedirect("trip.jsp?TripID="+TripID + "?error="+message);
		}
		}	
        
        catch (Exception e) {
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
		
		ImageUpload.setInt(1, TripID);
		ImageUpload.setInt(2, countryID);
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
