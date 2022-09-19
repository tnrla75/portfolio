package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.sql.DataSource;

import vo.Hotel_main_DB;
import vo.Hotel_review_DB;
import vo.Hotel_room_DB;

public class Hotel_DAO {

	static Connection conn=null;
	static Statement stmt=null;
	DataSource ds;
	static Connection con;
	
	private static Hotel_DAO hotel_DAO;
	
	public static void up() {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/portfolio?characterEncoding=utf8","root","1234"); 
			stmt=conn.createStatement();
			
		}catch (Exception e) {
			
		}
	}
	public static void down(){
		try{
			stmt.close();
		}catch(Exception e){
		}try{
				conn.close();
			}catch(Exception c){
				
			}
		}	
	
	
	 
//	 호텔 메인 페이지 select

	public static ArrayList<Hotel_main_DB> selectArticleList(int page,int limit){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String board_list_sql=("select * from hot_info order by hot_main_num desc limit ?,?");
		ArrayList<Hotel_main_DB> mainList = new ArrayList<Hotel_main_DB>();
		
		Hotel_main_DB board = null;
		int startrow=(page-1)*limit;  
		
		try{
			up();
			pstmt = con.prepareStatement(board_list_sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, limit);
			
			rs = pstmt.executeQuery();		
			
			while(rs.next()){				
				board = new Hotel_main_DB();
				
				board.setHot_main_num(rs.getInt("hot_main_num"));	
				
				board.setHot_main_img(rs.getString("hot_main_img"));
				board.setAtt_Num(rs.getInt("att_Num"));				
				board.setHot_name(rs.getString("hot_name"));
				board.setHot_nation(rs.getString("hot_nation"));
				board.setHot_address(rs.getString("hot_address"));
				board.setHot_checkin_date(rs.getString("hot_checkin_date"));
				board.setHot_checkout_date(rs.getString("hot_checkout_date"));
				board.setHot_latitude(rs.getInt("hot_latitude"));
				board.setHot_longitude(rs.getInt("hot_longitude"));
			
				mainList.add(board);
			
			}
			
		}catch(Exception ex){
			
		}finally{
			close(rs);
			close(pstmt);
		}

		return mainList;

	}
	public static ArrayList<Hotel_main_DB> main_roomList(int page,int limit){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String board_list_sql=("select * from hot_info order by hot_main_num desc limit ?,?");
		ArrayList<Hotel_main_DB> mainList = new ArrayList<Hotel_main_DB>();
		
		Hotel_main_DB board = null;
		int startrow=(page-1)*limit;  
		
		try{
			up();
			pstmt = con.prepareStatement(board_list_sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, limit);
			
			rs = pstmt.executeQuery();		
			
			while(rs.next()){				
				board = new Hotel_main_DB();
				
				board.setHot_main_num(rs.getInt("hot_main_num"));	
				
				board.setHot_main_img(rs.getString("hot_main_img"));
				board.setAtt_Num(rs.getInt("att_Num"));				
				board.setHot_name(rs.getString("hot_name"));
				board.setHot_nation(rs.getString("hot_nation"));
				board.setHot_address(rs.getString("hot_address"));
				board.setHot_checkin_date(rs.getString("hot_checkin_date"));
				board.setHot_checkout_date(rs.getString("hot_checkout_date"));
				board.setHot_latitude(rs.getInt("hot_latitude"));
				board.setHot_longitude(rs.getInt("hot_longitude"));
			
				mainList.add(board);
			
			}
			
		}catch(Exception ex){
			
		}finally{
			close(rs);
			close(pstmt);
		}

		return mainList;

	}
	public ArrayList<Hotel_room_DB> room_select(int hot_main_num){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Hotel_room_DB> members= new ArrayList<Hotel_room_DB>();
		
		try{			
			up();
			pstmt = con.prepareStatement("select * from hot_room where hot_main_num=?;");
			pstmt.setInt(1, hot_main_num);
			rs= pstmt.executeQuery();
			
			while(rs.next()){
				
				Hotel_room_DB hotel_room_DB = new Hotel_room_DB();
				
				hotel_room_DB.setHot_room_num(rs.getInt("hot_room_num"));
				hotel_room_DB.setHot_main_num(rs.getInt("hot_main_num"));
				hotel_room_DB.setHot_room_img(rs.getString("hot_room_img"));
				hotel_room_DB.setHot_room_name(rs.getString("hot_room_name"));
				hotel_room_DB.setHot_room_info(rs.getString("hot_room_info"));
				hotel_room_DB.setHot_room_amount(rs.getInt("hot_room_amount"));
				hotel_room_DB.setHot_room_price(rs.getInt("hot_room_price"));
				hotel_room_DB.setHot_room_maxpeople(rs.getString("hot_room_maxpeople"));
				hotel_room_DB.setHot_room_bedsort(rs.getString("hot_room_bedsort"));				
			
				members.add(hotel_room_DB);	

				System.out.println(members+" : DAO room");
			}
		}catch(Exception ex){
		}finally{
			down();
		}
		return members;
	}
	public ArrayList<Hotel_room_DB> room_select_sippai(int hot_main_num){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Hotel_room_DB> members= new ArrayList<Hotel_room_DB>();
		
		try{			
			up();
			pstmt = con.prepareStatement("select * from hot_room a, hot_info b, hot_review c where a.hot_main_num = b.hot_main_num =c.hot_main_num and a.hot_main_num=?;");
			pstmt.setInt(1, hot_main_num);
			rs= pstmt.executeQuery();
			
			while(rs.next()){
				
				Hotel_room_DB hotel_room_DB = new Hotel_room_DB();
				
				hotel_room_DB.setHot_room_num(rs.getInt("hot_room_num"));
				hotel_room_DB.setHot_main_num(rs.getInt("hot_main_num"));
				hotel_room_DB.setHot_room_img(rs.getString("hot_room_img"));
				hotel_room_DB.setHot_room_name(rs.getString("hot_room_name"));
				hotel_room_DB.setHot_room_info(rs.getString("hot_room_info"));
				hotel_room_DB.setHot_room_amount(rs.getInt("hot_room_amount"));
				hotel_room_DB.setHot_room_price(rs.getInt("hot_room_price"));
				hotel_room_DB.setHot_room_maxpeople(rs.getString("hot_room_maxpeople"));
				hotel_room_DB.setHot_room_bedsort(rs.getString("hot_room_bedsort"));				
			
				
				hotel_room_DB.setHot_main_img(rs.getString("hot_main_img"));
				hotel_room_DB.setAtt_Num(rs.getInt("att_Num"));				
				hotel_room_DB.setHot_name(rs.getString("hot_name"));
				hotel_room_DB.setHot_nation(rs.getString("hot_nation"));
				hotel_room_DB.setHot_address(rs.getString("hot_address"));
				hotel_room_DB.setHot_checkin_date(rs.getString("hot_checkin_date"));
				hotel_room_DB.setHot_checkout_date(rs.getString("hot_checkout_date"));
				hotel_room_DB.setHot_latitude(rs.getInt("hot_latitude"));
				hotel_room_DB.setHot_longitude(rs.getInt("hot_longitude"));
				
				
				hotel_room_DB.setHot_room_num(rs.getInt("hot_re_num"));
				hotel_room_DB.setHot_re_id(rs.getString("hot_re_id"));
				hotel_room_DB.setHot_country(rs.getString("hot_country"));
				hotel_room_DB.setHot_re_grade(rs.getInt("hot_re_grade"));
			
				hotel_room_DB.setHot_re_title(rs.getString("hot_re_title"));
				
				hotel_room_DB.setHot_re_content(rs.getString("hot_re_content"));
				
				hotel_room_DB.setHot_re_comments(rs.getString("hot_re_comments"));
				
				hotel_room_DB.setHot_re_date(rs.getDate("hot_re_date"));
				
				
				members.add(hotel_room_DB);	
			
			}
		}catch(Exception ex){
		}finally{
			down();
		}
		return members;
	}
	
	public static Hotel_DAO getInstance(){
		if(hotel_DAO == null){
			hotel_DAO = new Hotel_DAO(); // 객체가 없으면 만들어라 (싱글던패턴?) 한번만들고 쭈욱 씀.
		}
		return hotel_DAO;
	}
	
	public void setConnection(Connection con){
		this.con = con;
	}
	
	public int selectListCount() {

		int listCount= 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{
			up();
			
			pstmt=con.prepareStatement("select count(*) from hot_info");
			rs = pstmt.executeQuery();

			if(rs.next()){
				listCount=rs.getInt(1);
			}
		}catch(Exception ex){

		}finally{
			down();
		}

		return listCount;

	}
	public ArrayList<Hotel_main_DB> jjinmainDAO(int hot_main_num) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Hotel_main_DB> members= new ArrayList<Hotel_main_DB>();
		
		try{			
			up();
			pstmt = con.prepareStatement("select*from hot_info where hot_main_num=?;");
			pstmt.setInt(1, hot_main_num);
			rs= pstmt.executeQuery();
		
			while(rs.next()){
				
				Hotel_main_DB hotel_main_DB = new Hotel_main_DB();
				
				hotel_main_DB.setHot_main_num(rs.getInt("hot_main_num"));
				
				hotel_main_DB.setHot_main_img(rs.getString("hot_main_img"));
				
				hotel_main_DB.setHot_nation(rs.getString("hot_nation"));
			
				hotel_main_DB.setHot_name(rs.getString("hot_name"));
				
				hotel_main_DB.setHot_address(rs.getString("hot_address"));
				
				hotel_main_DB.setHot_checkin_date(rs.getString("hot_checkin_date"));
				
				hotel_main_DB.setHot_checkout_date(rs.getString("hot_checkout_date"));				
			
				members.add(hotel_main_DB);	

			
			}
		}catch(Exception ex){
		}finally{
			down();
		}
		return members;
	}
	public int reviewCount(int hot_main_num) {

		int listCount= 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		

		try{
			up();
			pstmt=con.prepareStatement("select*from hot_review where hot_main_num=?;");
			pstmt.setInt(1, hot_main_num);
			rs = pstmt.executeQuery();
			System.out.println("main");
			if(rs.next()){
				listCount=rs.getInt(1);
			
			}
		}catch(Exception ex){

		}finally{
			down();
		}
		System.out.println(listCount+" : DAO reviewCount");
		return listCount;

	}
	
	public int updateReadCount(int hot_room_num){
		
		PreparedStatement pstmt = null;
		int updateCount = 0;
		String sql="update hot_review=? set hot_re_num = "+
				hot_room_num+" where hot_re_num = hot_re_num,";

		try{
			up();
			
			pstmt=con.prepareStatement(sql);
			updateCount = pstmt.executeUpdate();
		}catch(SQLException ex){
		}
		finally{
			down();

		}

		return updateCount;

	}

//		여기부터는 전에 써놨던 게시판
		
public ArrayList<Hotel_review_DB> select_01(){
		
		ArrayList<Hotel_review_DB> members= new ArrayList<Hotel_review_DB>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
			try {
				up();
				pstmt = con.prepareStatement("select*from hot_review");
				
				rs= pstmt.executeQuery();
				
				
				while(rs.next()) {
					Hotel_review_DB student= new Hotel_review_DB();
					student.setHot_re_num(rs.getInt("hot_re_num"));	
					
					student.setHot_main_num(rs.getInt("hot_main_num"));
					student.setHot_re_id(rs.getString("hot_re_id"));
					student.setHot_re_grade(rs.getInt("hot_re_grade"));
					student.setHot_country(rs.getString("hot_country"));
					student.setHot_re_title(rs.getString("hot_re_title"));
					student.setHot_re_content(rs.getString("hot_re_content"));
					student.setHot_re_comments(rs.getString("hot_re_comments"));
					student.setHot_re_date(rs.getDate("hot_re_date"));
					
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

public ArrayList<Hotel_review_DB> select_02(int hot_main_num){
	
	ArrayList<Hotel_review_DB> members= new ArrayList<Hotel_review_DB>();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
		try {
			up();
			pstmt = con.prepareStatement("select*from hot_review where hot_main_num=?;");
			pstmt.setInt(1, hot_main_num);
			rs= pstmt.executeQuery();
			
			
			while(rs.next()) {
				Hotel_review_DB student= new Hotel_review_DB();
				student.setHot_re_num(rs.getInt("hot_re_num"));	
				
				student.setHot_main_num(rs.getInt("hot_main_num"));
				student.setHot_re_id(rs.getString("hot_re_id"));
				student.setHot_re_grade(rs.getInt("hot_re_grade"));
				student.setHot_country(rs.getString("hot_country"));
				student.setHot_re_title(rs.getString("hot_re_title"));
				student.setHot_re_content(rs.getString("hot_re_content"));
				student.setHot_re_comments(rs.getString("hot_re_comments"));
				student.setHot_re_date(rs.getDate("hot_re_date"));
				
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
public static ArrayList<Hotel_review_DB> reviewList(int page,int limit){
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String board_list_sql=("select * from hot_review order by hot_main_num desc limit ?,?");
	ArrayList<Hotel_review_DB> mainList = new ArrayList<Hotel_review_DB>();
	
	Hotel_review_DB board = null;
	int startrow=(page-1)*limit;  
	
	try{
		up();
		pstmt = con.prepareStatement(board_list_sql);
		pstmt.setInt(1, startrow);
		pstmt.setInt(2, limit);
		
		rs = pstmt.executeQuery();		
		
		while(rs.next()){				
			board = new Hotel_review_DB();
			board.setHot_re_num(rs.getInt("hot_re_num"));	
			board.setHot_main_num(rs.getInt("hot_main_num"));
			board.setHot_re_id(rs.getString("hot_re_id"));
			board.setHot_re_grade(rs.getInt("hot_re_grade"));
			board.setHot_country(rs.getString("hot_country"));
			board.setHot_re_title(rs.getString("hot_re_title"));
			board.setHot_re_content(rs.getString("hot_re_content"));
			board.setHot_re_comments(rs.getString("hot_re_comments"));
			board.setHot_re_date(rs.getDate("hot_re_date"));
		
			mainList.add(board);
		
		}
		
	}catch(Exception ex){
		
	}finally{
		close(rs);
		close(pstmt);
	}

	return mainList;

}	


	public void insert_01(String hot_re_num,String hot_main_num,String mb_id,String hot_country,String hot_re_title,String hot_re_content,String hot_re_comments,String hot_re_date) {
	try{
		
			up();
			String command=String.format("insert into hot_review (hot_re_num,hot_main_num,hot_re_id,hot_country,hot_re_title,hot_re_content,hot_re_comments,hot_re_date) values (%s,%s,'%s','%s','%s','%s','%s','%s');",hot_re_num,hot_main_num,mb_id,hot_country,hot_re_title,hot_re_content,hot_re_comments,hot_re_date);
			
			int rowNum=stmt.executeUpdate(command);
			
		}catch (Exception e) {
		}finally{
			down();
		}

}
	public void update_01(String hot_main_num,String hot_re_id,String hot_country,String hot_re_title,String hot_re_content,String hot_re_comments,String hot_re_date,String hot_re_num) {
		try{
			
	
				up();
				String command=String.format("update hot_review set hot_main_num :=%s,hotel_name :='%s',hot_re_id :='%s',hot_country :='%s',hot_re_title :='%s',hot_re_content :='%s',hot_re_comments :='%s',hot_re_date :='%s' where hot_re_num = %s ",hot_main_num,hot_re_id,hot_country,hot_re_title,hot_re_content,hot_re_comments,hot_re_date,hot_re_num);
				
								
				int rowNum=stmt.executeUpdate(command);
				
			}catch (Exception e) {
			}finally{
				down();
			}

	}
	
	
	public void delete_01(String hot_re_num) {
		
//		<script>location.href="Delete_sub.jsp";</script>
			try{
				
				up();
				String num=hot_re_num;
				String command="DELETE FROM `hot_review` WHERE (`hot_re_num` = "+num+");";
				
				int rowNum=stmt.executeUpdate(command);
				
				
				for(int i=0;i<rowNum;i++) {
					
				
				}
				
				
				
			}catch (Exception e) {
				
			
			}finally{
				down();
			}
			
	}


	
	
}
