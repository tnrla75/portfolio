package Connect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Connect {
	Connection conn = null;
	Statement stmt = null;
	
	public String login(String login_id,String login_pw){
		String data=null;
	try {
		dbc();
		ResultSet rs = stmt.executeQuery("select*from member_info;");
		
		
		while(rs.next()){
			String id = rs.getString("mb_id");
			String pw = rs.getString ("mb_pw");
			if((id.equals(login_id))&&(pw.equals(login_pw))){
				data="1";
				break;
			}else{
				data=null;
			}		
		}	
	}catch(Exception e){	
	}
	finally{
		try{
			stmt.close();
		}
		catch(Exception e){	
		}
		try{
			conn.close();
		}
		catch(Exception e){
		}
	}
	return data;                         
	}

	public void dbc() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/portfolio?characterEncoding=utf8","root","1645");
			stmt=conn.createStatement();
		}catch(Exception e){
		}
	}
}

