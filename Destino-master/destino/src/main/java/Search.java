
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Search
 */
@WebServlet("/Search")
public class Search extends HttpServlet {
	static Connection con; 
	static PreparedStatement ps;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Search() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");  
	    PrintWriter out = response.getWriter(); 
	    
		HttpSession session = request.getSession();
	
		  String fsearch1= request.getParameter("f_search"); //take the tring from the navigation bar 
		  request.setAttribute("fsearch2",fsearch1);
		  RequestDispatcher dp=request.getRequestDispatcher("/SearchResult.jsp");//send the string to Searchresult.jsp
	  dp.forward(request,response);

	}
	}


