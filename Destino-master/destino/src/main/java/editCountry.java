

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 * Servlet implementation class editCountry
 */
@WebServlet("/editCountry")
//@MultipartConfig(maxFileSize = 16177215) //size of uploded file
public class editCountry extends HttpServlet {
	Connection con;
	int TripID;
	int countryID;
	//Part image1;
	//Part image2;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		HttpSession session = request.getSession(true);
		
		try{
        	String editlocation=request.getParameter("editlocation");
			String editdesc=request.getParameter("editdescription");

			TripID=Integer.parseInt(request.getParameter("editcountryTID"));
			//TripID = (Integer) session.getAttribute("TripID");
			countryID=Integer.parseInt(request.getParameter("editcountryCIDof"+TripID));
			//TripID = (Integer) session.getAttribute("TripID");
			//countryID = (Integer) session.getAttribute("countryID");
			//image1=request.getPart("addpic1of"+countryID);
			//image2=request.getPart("addpic2of"+countryID);
			
			
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://166.62.29.165:3306/308db1?autoReconnect=true&useSSL=false","308db1","308db11234308db1");
			
			PreparedStatement editCountry=con.prepareStatement("update Country set countryName=?, countryDescription=? where countryID=? and TripID_country=?");
			editCountry.setString(1, editlocation);
			editCountry.setString(2,  editdesc);
			editCountry.setInt(3, countryID);
			editCountry.setInt(4, TripID);		
			
			int update=editCountry.executeUpdate();
			
			
			
			if(update>0)
			{
				response.sendRedirect("trip.jsp?TripID="+TripID);
			
			}
		}	
        
        catch (Exception e) {
            }
	
		
	}
	

}
