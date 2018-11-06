

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
 * Servlet implementation class deleteTrip
 */
@WebServlet("/deleteTrip")
public class deleteTrip extends HttpServlet {
	Connection con;
	int TripID;
	String adminDelete;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		try{
        	
			TripID=Integer.parseInt(request.getParameter("deletetripTID"));
			adminDelete=request.getParameter("adminDelete");
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://166.62.29.165:3306/308db1?autoReconnect=true&useSSL=false","308db1","308db11234308db1");
			
			PreparedStatement deleteTrip=con.prepareStatement("delete from trip where TripID=?");
			deleteTrip.setInt(1, TripID);		
			
			int update=deleteTrip.executeUpdate();
			if(update>0)
			{
				if(adminDelete.equals("apl.destino@gmail.com")) {
					response.sendRedirect("adminHome.jsp");
				}
				else {
				response.sendRedirect("profile.jsp");
				}
			}
		
		}	
        
        catch (Exception e) {
            }
	
		
	}

}
