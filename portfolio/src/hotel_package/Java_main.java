package hotel_package;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


import hotel_package.Hotel_review_DB;

public class Java_main {
	
	Connection conn=null;
	Statement stmt=null;
	
	public void up() {
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/portfolio?characterEncoding=utf8","root","0000"); 
			stmt=conn.createStatement();
			
		}catch (Exception e) {
			
		}
	}
	public void down(){
		try{
			stmt.close();
		}catch(Exception e){
		}try{
				conn.close();
			}catch(Exception c){
				
			}
		}	
	
	public ArrayList<Hotel_review_DB> select_01() {
		
		ArrayList<Hotel_review_DB> members= new ArrayList<Hotel_review_DB>();
					
			try {
				up();
				ResultSet rs=stmt.executeQuery("select*from hotel_review_main;");
				
				while(rs.next()) {
					Hotel_review_DB student= new Hotel_review_DB();
					student.setHotel_review_num(rs.getInt("hotel_review_num"));
					student.setHotel_add(rs.getString("hotel_add"));
					student.setHotel_name(rs.getString("hotel_name"));
					student.setHotel_rv_title(rs.getString("hotel_rv_title"));
					student.setHotel_rv_content(rs.getString("hotel_rv_content"));
					student.setHotel_rv_id(rs.getString("hotel_rv_id"));
					student.setHotel_rv_date(rs.getString("hotel_rv_date"));
					
					
					members.add(student);					
				}				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
			down();
			
			}
			return members;
}

	public ArrayList<Hotel_review_DB> select_02(int hotel_review_num) {
	
	ArrayList<Hotel_review_DB> members= new ArrayList<Hotel_review_DB>();
	try {
		up();
		
		ResultSet rs=stmt.executeQuery("select*from hotel_review_main where hotel_review_num="+hotel_review_num+";");
		
		while(rs.next()) {
			Hotel_review_DB student= new Hotel_review_DB();
			
			
			student.setHotel_review_num(rs.getInt("hotel_review_num"));
			student.setHotel_add(rs.getString("hotel_add"));
			student.setHotel_name(rs.getString("hotel_name"));
			student.setHotel_rv_title(rs.getString("hotel_rv_title"));
			student.setHotel_rv_content(rs.getString("hotel_rv_content"));
			student.setHotel_rv_id(rs.getString("hotel_rv_id"));
			student.setHotel_rv_date(rs.getString("hotel_rv_date"));
			
			members.add(student);
			
		}
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally{
	down();
	
	}
	return members;
}
	
	public void insert_01(String hotel_review_num,String hotel_add,String hotel_name,String hotel_rv_title,String hotel_rv_content,String mb_id,String hotel_rv_date) {
	try{
		
			up();
			String command=String.format("insert into hotel_review_main (hotel_add,hotel_name,hotel_rv_title,hotel_rv_content,hotel_rv_id,hotel_rv_date) values ('%s','%s','%s','%s','%s','%s');",hotel_add,hotel_name,hotel_rv_title,hotel_rv_content,mb_id,hotel_rv_date);
			System.out.println(command);
			int rowNum=stmt.executeUpdate(command);
			
		}catch (Exception e) {
		}finally{
			down();
		}

}
	public void update_01(String hotel_review_num,String hotel_add,String hotel_name,String hotel_rv_title,String hotel_rv_content,String hotel_rv_date) {
		try{
			
	
				up();
				String command=String.format("update hotel_review_main set hotel_add :='%s',hotel_name :='%s',hotel_rv_title :='%s',hotel_rv_content :='%s',hotel_rv_date :='%s' where hotel_review_num = %s ",hotel_add,hotel_name,hotel_rv_title,hotel_rv_content,hotel_rv_date,hotel_review_num);
				
				System.out.println(command);				
				int rowNum=stmt.executeUpdate(command);
				System.out.println(rowNum);
			}catch (Exception e) {
			}finally{
				down();
			}

	}
	
	
	public void delete_01(String hotel_review_num) {
		
//		<script>location.href="Delete_sub.jsp";</script>
			try{
				
				up();
				String num=hotel_review_num;
				String command="DELETE FROM `hotel_review_main` WHERE (`hotel_review_num` = "+num+");";
				
				int rowNum=stmt.executeUpdate(command);
				
				System.out.println(command);
				for(int i=0;i<rowNum;i++) {
					
					System.out.println(rowNum);
				}
				
				
				
			}catch (Exception e) {
				
			
			}finally{
				down();
			}
			
	}

}
