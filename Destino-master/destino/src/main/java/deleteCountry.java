

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
 * Servlet implementation class deleteCountry
 */
@WebServlet("/deleteCountry")
public class deleteCountry extends HttpServlet {
	Connection con;
	int TripID;
	int countryID;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		HttpSession session = request.getSession(true);
		
		try{
        	
			TripID=Integer.parseInt(request.getParameter("deletecountryTID"));
			//TripID = (Integer) session.getAttribute("TripID");
			countryID=Integer.parseInt(request.getParameter("deletecountryCIDof"+TripID));
			
			//TripID = (Integer) session.getAttribute("TripID");
			//countryID = (Integer) session.getAttribute("countryID");
			
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://166.62.29.165:3306/308db1?autoReconnect=true&useSSL=false","308db1","308db11234308db1");
			
			PreparedStatement deleteCountry=con.prepareStatement("delete from Country where countryID=? and TripID_country=?");
			deleteCountry.setInt(1, countryID);
			deleteCountry.setInt(2, TripID);		
			
			int update=deleteCountry.executeUpdate();
			if(update>0)
			{
				//request.getRequestDispatcher("trip.jsp?TripID="+TripID).forward(request, response);
				response.sendRedirect("trip.jsp?TripID="+TripID);
			
			}
			
		
		}	
        
        catch (Exception e) {
            }
	
		
	}

}
