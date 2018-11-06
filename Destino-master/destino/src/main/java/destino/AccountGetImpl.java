package destino;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class AccountGetImpl implements AccountGet {
	static Connection con; 
	static PreparedStatement ps;
	
	@Override
	public int insertAccount(Account a) {
		int status = 0;
		try{
			
			con = ConnectionProvider.getCon();
			ps = con.prepareStatement("insert into accounts values(?,?)");
			ps.setString(1, a.getFirst_name());
			ps.setString(2, a.getLast_name());
			ps.setString(3, a.getEmail());
			ps.setString(4, a.getPassword());
			status =ps.executeUpdate();
			con.close();
			
		}catch(Exception e){
			
			System.out.println(e);
			
		}
		return 0;
	}

	@Override
	public Account getAccount(String email, String password) {
		Account a = new Account();
		
		try{
			con = ConnectionProvider.getCon(); 
			ps = con.prepareStatement("select * from accounts where email=? and password=?");
			ps.setString(1, email);
			ps.setString(2, password);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				a.setFirst_name(rs.getString(1));
				a.setLast_name(rs.getString(2));
				a.setEmail(rs.getString(3));
				a.setPassword(rs.getString(4));
			}
			
		}catch(Exception e){
				
			System.out.println(e);
				
		}
		return null;
	}

}
