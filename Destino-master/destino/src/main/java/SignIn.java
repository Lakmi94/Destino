
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utilities.PasswordService;

/**
 * Servlet implementation class SignIn
 */
@WebServlet("/Home")
public class SignIn extends HttpServlet {
	static Connection con; 
	static PreparedStatement ps;
	String error="";
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignIn() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");  
	    PrintWriter out = response.getWriter(); 
	    
		//Submit type is either "login or sign up"
		String submitType=request.getParameter("submit");

		HttpSession session = request.getSession();
		
		try{  
			Class.forName("com.mysql.jdbc.Driver");  
		    Connection con=DriverManager.getConnection("jdbc:mysql://166.62.29.165:3306/308db1?autoReconnect=true&useSSL=false","308db1","308db11234308db1"); 
			
		    if(submitType.equals("Sign Up"))
		    {
		    	String fname= request.getParameter("first_name");
				String lname= request.getParameter("last_name");
				String email= request.getParameter("email");
				String password = request.getParameter("password");
				
				 //encrypt the password to check against what's stored in DB
				PasswordService pws = new PasswordService();
				String encryptedPassw = pws.encrypt(password);
				
				ps = con.prepareStatement("insert into users(first_name,last_name,email,password) values(?,?,?,?)");
				ps.setString(1, fname);
				ps.setString(2, lname);
				ps.setString(3, email);
		        ps.setString(4, encryptedPassw);  
		        
		        //Execute the query command
		        int i=ps.executeUpdate();

		      //check if it returns something
		        if(i>0)
		        {
					session.setAttribute("fname",fname);
					session.setAttribute("lname",lname);
					session.setAttribute("email",email);
				
					response.sendRedirect("home.jsp");
					response.sendRedirect("home.jsp?fname="+fname);
		        }
		
		    }
		    else if(submitType.equals("Login"))
		    {
		    	String em= request.getParameter("em");
				String pass = request.getParameter("ps");
				
				//Encrypt
				PasswordService pws = new PasswordService();
				String encryptedPass = pws.encrypt(pass);
				
		    	ps = con.prepareStatement("select * from users where email=? and password=?");
				ps.setString(1, em);
				ps.setString(2, encryptedPass);
				
				//Get the results
				ResultSet rs = ps.executeQuery();
				
				//check if it returns something
				if(rs.next())
				{
					String checkAdmin = "apl.destino@gmail.com";
					session.setAttribute("userID", rs.getString(1));
					session.setAttribute("fname",rs.getString(2));
					session.setAttribute("lname",rs.getString(3));
					session.setAttribute("email",rs.getString(4));
					session.setAttribute("ProfilePic",rs.getString(8));
					session.setAttribute("bio",rs.getString(7));
					session.setAttribute("birthday", rs.getString(9));
					session.setAttribute("facebook",rs.getString(10));
					session.setAttribute("twitter", rs.getString(11));
					
							
					if(rs.getString(4).equals(checkAdmin)) {
						response.sendRedirect("adminHome.jsp");
					}
					else {
						response.sendRedirect("home.jsp");
					}
				}
				else
				{
					error="Check if the Email and Password that you enterd is Correct";
					request.getRequestDispatcher("SignUp.jsp?error="+error).forward(request, response);
				}
		    } 
		    else if(submitType.equals("LOGOUT")|| submitType.equals("Logout"))
		    {
		    	session.invalidate();
		    	request.getRequestDispatcher("index.jsp").forward(request, response);
		    }
		          
		}catch (Exception e2) {
			System.out.println(e2);
			out.print(e2); 
		}  
		          
		out.close();  
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}