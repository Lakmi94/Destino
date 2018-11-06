

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 * Servlet implementation class addmoreImage
 */
@WebServlet("/addmoreImage")
@MultipartConfig(maxFileSize = 16177215) //size of uploded file
public class addmoreImage extends HttpServlet {
	Connection con;
	int TripID;
	int countryID;
	Part image1;
	Part image2;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		HttpSession session = request.getSession(true);
		
		try{
        	//TripID = (Integer) session.getAttribute("TripID");
			TripID=Integer.parseInt(request.getParameter("addmoreimage"));
			countryID=Integer.parseInt(request.getParameter("addmoreimageCIDof"+TripID));
			image1=request.getPart("addpic1of"+countryID);
			image2=request.getPart("addpic2of"+countryID);
			
			
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://166.62.29.165:3306/308db1?autoReconnect=true&useSSL=false","308db1","308db11234308db1");
			
			int result=0;
			if (image1.getSize()!=0)
			{
				SubmitImages(image1);
			}
			if(image2.getSize()!=0)
			{
				SubmitImages(image2);
			}
			if(result>=0)
			{
				response.sendRedirect("trip.jsp?TripID="+TripID);
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
