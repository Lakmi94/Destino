package destino;

import java.sql.Connection;
import java.sql.DriverManager;


public class ConnectionProvider implements Provider {
	
	static Connection con = null;
	
	public static Connection getCon(){
		try{
			Class.forName("com.mysql.jdbc.Driver");  
		    Connection con=DriverManager.getConnection("jdbc:mysql://166.62.29.165:3306/308db1","308db1","308db11234308db1"); 
			
		}catch(Exception e){
			System.out.println(e);
		}
		return con;
	}
}
