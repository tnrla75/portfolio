package Item;
import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;

public class DBconnect {
	Connection conn = null;
	Statement stmt = null;
	LocalDate now = LocalDate.now();
	
	public ArrayList<Review> db() {
		ArrayList<Review> arr = new ArrayList<Review>();
		
		try {
			x();
			String command = "select * from itemReview;";
			ResultSet rs = stmt.executeQuery(command);
			
			while (rs.next()) {
				Review review = new Review();
				
				review.setReviewNo(rs.getString("reviewNo"));
				review.setMb_id(rs.getString("mb_id"));
				review.setItemCode(rs.getString("itemCode"));
				review.setReRate(rs.getInt("reRate"));
				review.setReText(rs.getString("reText"));
				review.setRePhoto1(rs.getString("rePhoto1"));
				review.setRePhoto2(rs.getString("rePhoto2"));
				review.setRePhoto2(rs.getString("rePhoto3"));
				review.setReDate(rs.getDate("reDate"));
				
				arr.add(review);
			} 
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("실패");
		}
		y();
		return arr;
	}
	
	//review
	public void insert(String mb_id, String itemCode, int reRate, String reText, String rePhoto1,String rePhoto2, String rePhoto3) {
		try {
			x();
			String command = String.format
					("insert into itemReview (mb_id, itemCode, reRate, reText, rePhoto1, rePhoto2, rePhoto3, reDate) "
							+ "values ('%s','%s','%d','%s','%s','%s','%s',now());",mb_id,itemCode,reRate,reText,rePhoto1,rePhoto2,rePhoto3);
			int rowNum = stmt.executeUpdate(command); 
			System.out.println("성공");
		} catch (Exception e) {
			System.out.println("실패");
		} finally {
			y();
		}
	}
	
	//qna
	public void qnaInsert(String mb_id, String itemCode, String qsubject, String question) {
		try {
			System.out.println("==bbb");
			x();
			String command = String.format
					("insert into itemQna (mb_id, itemCode, qsubject, question, qupdate) "
							+ "values ('%s','%s','%s','%s',now());",mb_id,itemCode,qsubject,question);
			System.out.println(command+"==33");
			int rowNum = stmt.executeUpdate(command); 
			System.out.println("성공");
		} catch (Exception e) {
			System.out.println("실패");
		} finally {
			y();
		}
	}
	
	public void delete(String reviewNo) {
		try{
			x();
	
			String command = String.format
					("delete from itemReview where reviewNo = " + reviewNo +";");
			System.out.println(command);
			int rowNum = stmt.executeUpdate(command); 
			System.out.println("성공");
		}catch(Exception e){
			System.out.println("실패");
		}
		y();
	}
	public void update(int reRate, String reText, String rePhoto1, String rePhoto2, String rePhoto3, String reviewNo) {
		try{
			x();
			String command = String.format
					("update itemReview set reRate := '%d', reText := '%s', rePhoto1 := '%s', rePhoto2 := '%s', rePhoto3 := '%s', reDate := now() where reviewNo = "+reviewNo+";",
							reRate, reText, rePhoto1, rePhoto2, rePhoto3, reviewNo);   
			int rowNum = stmt.executeUpdate(command);
			System.out.println(command);
			System.out.println("리뷰 수정 성공");
		}catch(Exception e){
			System.out.println("리뷰 수정 실패");
		}
		y();
	}
	
	private void x() {
		// TODO Auto-generated method stub
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/portfolio?characterEncoding=utf8","root","0000");
			stmt = conn.createStatement();
		} catch (Exception e) {
		}
	}

	private void y() {
		// TODO Auto-generated method stub
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
}
