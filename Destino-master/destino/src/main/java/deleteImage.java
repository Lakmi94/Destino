

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class deleteImage
 */
@WebServlet("/deleteImage")
public class deleteImage extends HttpServlet {
	Connection con;
	int TripID;
	int countryID;
	int imgID;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");

		HttpSession session = request.getSession(true);
		try{
        	
			TripID=Integer.parseInt(request.getParameter("deleteimgTID"));
			//TripID = (Integer) session.getAttribute("TripID");
			countryID=Integer.parseInt(request.getParameter("deleteimgCIDof"+TripID));
			imgID=Integer.parseInt(request.getParameter("deleteimgIIDof"+countryID));
			//TripID = (Integer) session.getAttribute("TripID");
			//countryID = (Integer) session.getAttribute("countryID");
			//imgID = (Integer) session.getAttribute("imageID");
			
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://166.62.29.165:3306/308db1?autoReconnect=true&useSSL=false","308db1","308db11234308db1");
			
			PreparedStatement deleteImage=con.prepareStatement("delete from image where imageID=? and countryID_image=? and TripID_image=?");
			deleteImage.setInt(1, imgID);
			deleteImage.setInt(2, countryID);
			deleteImage.setInt(3, TripID);
			
			int update=deleteImage.executeUpdate();
			if(update>0)
			{
				response.sendRedirect("trip.jsp?TripID="+TripID);
			
			}
		
		}	
        
        catch (Exception e) {
            }
	
		
	}

}
