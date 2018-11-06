

import java.io.IOException;
import java.io.InputStream;
import java.io.NotSerializableException;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javax.servlet.annotation.MultipartConfig; 
import javax.servlet.http.Part;

import utilities.PasswordService;
/**
 * Servlet implementation class editProfile
 */
@WebServlet("/editProfile")
@MultipartConfig(maxFileSize = 16177215) //size of uploded file
public class editProfile extends HttpServlet {
	static Connection con; 
	static PreparedStatement ps;
	static PreparedStatement ps1;
	static PreparedStatement psPW;
	static PreparedStatement noPic;
	private static final long serialVersionUID = 1L;
	Part  ProfilePic;
	//byte []imgdata=null;
	//Blob image = null;
	String userID=null;
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	/* (non-Javadoc)
	 * @see javax.servlet.http.HttpServlet#doPost(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		// TODO Auto-generated method stub
		response.setContentType("text/html");  
	    PrintWriter out = response.getWriter();
	    
	    //Save changes submit type
	    String submitType=request.getParameter("submit");
	    
	    HttpSession session = request.getSession(false);
	    String Sessionemail = (String)session.getAttribute("email");
	    
	    try{
	    	Class.forName("com.mysql.jdbc.Driver");  
		    Connection con=DriverManager.getConnection("jdbc:mysql://166.62.29.165:3306/308db1?autoReconnect=true&useSSL=false","308db1","308db11234308db1"); 
			if(submitType.equals("save")){
				PreparedStatement statement=con.prepareStatement("select * from users where email=?");

				statement.setString(1, Sessionemail);
				//CHECKING FOR RESULT 
				ResultSet rr=statement.executeQuery();
				if(rr.next())
				{
					//GETTING THE userID from the Trip
					userID=rr.getString(1);
				}
				String email= request.getParameter("email");
				String fname= request.getParameter("fname");
				String lname= request.getParameter("lname");
				String password = request.getParameter("password");
				String bio = request.getParameter("bio");
				String datePicker1 = request.getParameter("datePicker1");
				String datePicker2 = request.getParameter("datePicker2");
				String newPW = request.getParameter("newPW");
				String ConfirmPW = request.getParameter("ConfirmPW");
				ProfilePic = request.getPart("ProfilePic");
				String facebook=request.getParameter("facebook");
				String twitter=request.getParameter("twitter");
				InputStream inputStream=null;
				inputStream = ProfilePic.getInputStream();
				
				//encrypt the password to check against what's stored in DB
				PasswordService pws = new PasswordService();
				String encryptedPassw = pws.encrypt(password);

				//get Password from DB
				psPW=con.prepareStatement("select password from users where userID=?;");
				psPW.setString(1, userID);
				ResultSet rsPW = psPW.executeQuery();
				
				//Check Password matches with password from DB
				if(rsPW.next())
				{
					
					String pw=rsPW.getString(1);
					// check if it is the same pw as the one in the DB
					if(encryptedPassw.equals(pw))
					{
						
							//if they are empty, do not update password	
							if((newPW.isEmpty())&&(ConfirmPW.isEmpty()))
							{
								//If date of birth is empty, do not update date of birth
								if(datePicker1.isEmpty())
								{
									//If there is a change in Profile picture, change and update profile picture
									if(inputStream!=null)
									{
										ps = con.prepareStatement("update users set email=?, first_name = ?, last_name =?, description =?,ProfilePic=?,facebook=?,twitter=? where userID = ?;");
										
										ps.setString(1, email);
										ps.setString(2, fname);
										ps.setString(3, lname);
										ps.setString(4, bio);
										ps.setBlob(5,inputStream);
										ps.setString(6, facebook);
										ps.setString(7, twitter);
										ps.setString(8, userID);
										
										int rs = ps.executeUpdate();
										
										if(rs>0)
										{
											session.setAttribute("fname",fname);
											session.setAttribute("lname",lname);
											session.setAttribute("bio", bio);
											session.setAttribute("email",email);
											session.setAttribute("facebook",facebook);
											session.setAttribute("twitter",twitter);
											
											response.sendRedirect("profile.jsp");
										
										}
									}
									//If there is no change in profile picture, do not update profile picture
									else
									{
										noPic = con.prepareStatement("update users set email=?, first_name = ?, last_name =?, description =?,facebook=?,twitter=? where userID = ?;");
										
										noPic.setString(1, email);
										noPic.setString(2, fname);
										noPic.setString(3, lname);
										noPic.setString(4, bio);
										noPic.setString(5, facebook);
										noPic.setString(6, twitter);
										noPic.setString(7, userID);
										
									}
								
								}
								//If there is a change in date of birth, change and update date of birth
								else
								{

									ps1 = con.prepareStatement("update users set email=?, first_name = ?, last_name =?, description =?, birthday =?, ProfilePic=?,facebook=?,twitter=?  where userID=?;");
									
									ps1.setString(1, email);
									ps1.setString(2, fname);
									ps1.setString(3, lname);
									ps1.setString(4, bio);
									ps1.setString(5, datePicker1);
									ps1.setBlob(6, inputStream);
									ps1.setString(7, facebook);
									ps1.setString(8, twitter);
									ps1.setString(9, userID);
									
									int rs1 = ps1.executeUpdate();
									
									if(rs1>0)
									{
										session.setAttribute("fname",fname);
										session.setAttribute("lname",lname);
										session.setAttribute("bio", bio);
										session.setAttribute("email",email);
										session.setAttribute("datePicker1", datePicker1);
										session.setAttribute("facebook",facebook);
										session.setAttribute("twitter",twitter);
										
								
										response.sendRedirect("profile.jsp");
										
									}
								}
							}
							//If they are not empty, update the password
							else if(newPW.equals(ConfirmPW))
							{
								//encrypt the password to check against what's stored in DB
								PasswordService pwd = new PasswordService();
								String encryptedPw = pwd.encrypt(newPW);
								newPW=encryptedPw;
								ConfirmPW=encryptedPw;
								if(datePicker1.isEmpty())
								{
									if(datePicker1.isEmpty())
									{
										
										if(inputStream!=null)
										{
											ps = con.prepareStatement("update users set email=?, first_name = ?, last_name =?,password=?, description =?, ProfilePic=?,facebook=?,twitter=?  where userID=?;");
											
											ps.setString(1, email);
											ps.setString(2, fname);
											ps.setString(3, lname);
											ps.setString(4, newPW);
											ps.setString(5, bio);
											ps.setBlob(6, inputStream);
											ps.setString(7, facebook);
											ps.setString(8,twitter);
											ps.setString(9, userID);
											
											int rs = ps.executeUpdate();
											
											if(rs>0)
											{
												session.setAttribute("fname",fname);
												session.setAttribute("lname",lname);
												session.setAttribute("bio", bio);
												session.setAttribute("email",email);
												session.setAttribute("newPW", newPW);
												session.setAttribute("facebook",facebook);
												session.setAttribute("twitter",twitter);
												
												response.sendRedirect("profile.jsp");
											
											}
											else
											{
												noPic = con.prepareStatement("update users set email=?, first_name = ?, last_name =?, password=?, description =?,facebook=? twitter=? where userID = ?;");
												noPic.setString(1, email);
												noPic.setString(2, fname);
												noPic.setString(3, lname);
												noPic.setString(4, newPW);
												noPic.setString(5, bio);
												noPic.setString(6, facebook);
												noPic.setString(7, twitter);
												noPic.setString(8, userID);
											}
										}
									}
									else
									{
										ps1 = con.prepareStatement("update users set email=? first_name = ?, last_name =?,description =?, birthday =?, password=?, ProfilePic=?, facebook=?, twitter=? where userID =?;");
										
										ps1.setString(1, email);
										ps1.setString(2, fname);
										ps1.setString(3, lname);
										ps1.setString(4, bio);
										ps1.setString(5, datePicker1);
										ps1.setString(6, newPW);
										ps1.setBlob(7, inputStream);
										ps1.setString(8, facebook);
										ps1.setString(9, twitter);
										ps1.setString(10, userID);
										
										int rs1 = ps1.executeUpdate();
										
										if(rs1>0)
										{
											session.setAttribute("fname",fname);
											session.setAttribute("lname",lname);
											session.setAttribute("bio", bio);
											session.setAttribute("email",email);
											session.setAttribute("datePicker1", datePicker1);
											session.setAttribute("newPW", newPW);
											session.setAttribute("facebook", facebook);
											session.setAttribute("twitter", twitter);
											
											
											response.sendRedirect("profile.jsp");
										}
									}
							}
							else
							{
								String error= "New Password and Confirmation password do not match! ";
								response.sendRedirect("editProfile.jsp?error="+error);
							}
					}
					else{
						String error= "There seem to be a problem with the server. Please try again! ";
						
						request.getServletContext().getRequestDispatcher("editProfile.jsp?error="+error).forward(request, response);
					}
				}
					else{
						String error= "There seem to be a problem with the server. Please try again! ";	
						request.setAttribute("error", error);
						request.getRequestDispatcher("editProfile.jsp").forward(request, response);
					}
					
				}	
			}
			
			if(submitType.equals("deleteAccount")) {
				PreparedStatement deleteAccount=con.prepareStatement("delete from users where email=?");

				deleteAccount.setString(1, Sessionemail);
				//CHECKING FOR RESULT 
				int update=deleteAccount.executeUpdate();
				if(update>0)
				{
					//GETTING THE userID from the Trip
					response.sendRedirect("index.jsp");
				}
			}
	    }catch (Exception e){
	    	try {
	    	Class.forName("com.mysql.jdbc.Driver");  
		    Connection con=DriverManager.getConnection("jdbc:mysql://166.62.29.165:3306/308db1?autoReconnect=true&useSSL=false","308db1","308db11234308db1"); 
		    
		    ps=con.prepareStatement("insert into Errors values(?,?,?)");
		    ps.setString(1, userID);
		    ps.setString(2, e.getMessage());
		    ps.setString(3, "Profile.java");
		    request.getRequestDispatcher("editProfile.jsp?error="+e.getMessage());
	    	}
	    	catch(Exception exception)
	    	{
	    		
	    	}
	    }
	    out.close();  
	    
	}
	
}
