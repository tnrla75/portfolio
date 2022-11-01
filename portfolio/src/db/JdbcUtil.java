package db;

import java.sql.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class JdbcUtil {

	//DB connect
	public static Connection getConnection(){
		Connection con=null;
		System.out.println("con");
		try {
			Context initCtx = new InitialContext();
			System.out.println("con1");
			//context.xml 연결
			Context envCtx = (Context)initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource)envCtx.lookup("jdbc/MySQLDB");
			System.out.println("con2");
			con = ds.getConnection();
			con.setAutoCommit(false);
			System.out.println("con3");
		} catch (Exception e) {
			System.out.print(e);
		}
		
		return con;
	}
	
	public static void close(Connection con){
		
		try {
			con.close();
		} catch (Exception e) {
			System.out.print(e);
		}
		
	}
	
	public static void close(Statement stmt){
		
		try {
			stmt.close();
		} catch (Exception e) {
			System.out.print(e);
		}
		
	}
	
	public static void close(ResultSet rs){
		
		try {
			rs.close();
		} catch (Exception e) {
			System.out.print(e);
		}
		
	}
	
	public static void commit(Connection con){
		
		try {
			con.commit();
			System.out.println("commit success");
		} catch (Exception e) {
			System.out.print(e);
		}
		
	}
	
	public static void rollback(Connection con){
		
		try {
			con.rollback();
			System.out.println("rollback success");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
