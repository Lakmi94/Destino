

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class editTrip
 */
@WebServlet("/editTrip")
public class editTrip extends HttpServlet {
	Connection con;
	int TripID;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		try{
        	String edittitle=request.getParameter("triptitle");
			String editdesc=request.getParameter("editTripDesc");

			TripID=Integer.parseInt(request.getParameter("editTrip"));
			
			
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://166.62.29.165:3306/308db1?autoReconnect=true&useSSL=false","308db1","308db11234308db1");
			
			PreparedStatement editTrip=con.prepareStatement("update trip set title=?, Tripdescription=? where TripID=?");
			editTrip.setString(1, edittitle);
			editTrip.setString(2,  editdesc);
			editTrip.setInt(3, TripID);		
			
			int update=editTrip.executeUpdate();
			
			
			
			if(update>0)
			{
				response.sendRedirect("trip.jsp?TripID="+TripID);
			
			}
		}	
        
        catch (Exception e) {
            }
	
		
	}

}
