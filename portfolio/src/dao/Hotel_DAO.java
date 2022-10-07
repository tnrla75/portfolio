package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.TreeMap;

import javax.sql.DataSource;

import vo.Hotel_main_DTO;
import vo.Hotel_review_DTO;
import vo.Hotel_room_DTO;
import vo.Member_info;

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
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/portfolio?characterEncoding=utf8","root","1645"); 
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

	public static ArrayList<Hotel_main_DTO> mainList(int page,int limit){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String board_list_sql=("select * from hot_info order by hot_main_num desc limit ?,?;");
		ArrayList<Hotel_main_DTO> mainList = new ArrayList<Hotel_main_DTO>();
		
		Hotel_main_DTO board = null;
		int startrow=(page-1)*limit;  
		
		try{
			up();
			pstmt = con.prepareStatement(board_list_sql);
			
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, limit);
			
			rs = pstmt.executeQuery();		
			System.out.println(pstmt.toString());;
			while(rs.next()){				
				board = new Hotel_main_DTO();
				
				board.setHot_main_num(rs.getInt("hot_main_num"));	
				board.setAtt_Num(rs.getInt("att_Num"));	
				board.setHot_main_img(rs.getString("hot_main_img"));							
				board.setHot_nation(rs.getString("hot_nation"));
				board.setHot_name(rs.getString("hot_name"));				
				board.setHot_address(rs.getString("hot_address"));
				
				board.setHot_star(rs.getInt("hot_star"));
				board.setHot_wifi(rs.getString("hot_wifi"));
				board.setHot_meetRoom(rs.getString("hot_meetRoom"));				
				board.setHot_smoking(rs.getString("hot_smoking"));	
				board.setHot_Nosmoking(rs.getString("hot_Nosmoking"));
				
				board.setHot_restaurant(rs.getString("hot_restaurant"));	
				board.setHot_bar(rs.getString("hot_bar"));				
				board.setHot_cafe(rs.getString("hot_cafe"));	
				board.setHot_checkin_date(rs.getDate("hot_checkin_date"));
				board.setHot_checkout_date(rs.getDate("hot_checkout_date"));
				
				board.setHot_checkin_time(rs.getString("hot_checkin_time"));
				board.setHot_checkout_time(rs.getString("hot_checkout_time"));
				board.setHot_latitude(rs.getInt("hot_latitude"));
				board.setHot_longitude(rs.getInt("hot_longitude"));
				
				System.out.println("dao mainList04");
			
				
				mainList.add(board);
				System.out.println(mainList+"dao mainList05");
			}
			
		}catch(Exception ex){
			
		}finally{
			close(rs);
			close(pstmt);
		}
		
		return mainList;

	}
	// 호텔 성급 가져가기
	public static ArrayList<Hotel_main_DTO> starList(int page,int limit,int hot_star){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String board_list_sql=("select * from hot_info where hot_star<=? order by hot_star desc limit ?,?;");
		ArrayList<Hotel_main_DTO> mainList = new ArrayList<Hotel_main_DTO>();
		
		Hotel_main_DTO board = null;
		int startrow=(page-1)*limit;  
		
		try{
			up();
			pstmt = con.prepareStatement(board_list_sql);
			pstmt.setInt(1, hot_star);
			pstmt.setInt(2, startrow);
			pstmt.setInt(3, limit);
			
			rs = pstmt.executeQuery();		
			System.out.println(pstmt.toString());;
			while(rs.next()){				
				board = new Hotel_main_DTO();
				
				board.setHot_main_num(rs.getInt("hot_main_num"));	
				board.setAtt_Num(rs.getInt("att_Num"));	
				board.setHot_main_img(rs.getString("hot_main_img"));							
				board.setHot_nation(rs.getString("hot_nation"));
				board.setHot_name(rs.getString("hot_name"));				
				board.setHot_address(rs.getString("hot_address"));
				
				board.setHot_star(rs.getInt("hot_star"));
				board.setHot_wifi(rs.getString("hot_wifi"));
				board.setHot_meetRoom(rs.getString("hot_meetRoom"));				
				board.setHot_smoking(rs.getString("hot_smoking"));	
				board.setHot_Nosmoking(rs.getString("hot_Nosmoking"));
				
				board.setHot_restaurant(rs.getString("hot_restaurant"));	
				board.setHot_bar(rs.getString("hot_bar"));				
				board.setHot_cafe(rs.getString("hot_cafe"));	
				board.setHot_checkin_date(rs.getDate("hot_checkin_date"));
				board.setHot_checkout_date(rs.getDate("hot_checkout_date"));
				
				board.setHot_checkin_time(rs.getString("hot_checkin_time"));
				board.setHot_checkout_time(rs.getString("hot_checkout_time"));
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
	// 호텔 지역 가져가기
	public static ArrayList<Hotel_main_DTO> nationList(int page,int limit,String hot_nation){
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
																				// 오름차순은 asc로 써주면 됨
		String board_list_sql=("select * from hot_info where hot_nation=? order by hot_star desc limit ?,?;");
		ArrayList<Hotel_main_DTO> mainList = new ArrayList<Hotel_main_DTO>();
		
		Hotel_main_DTO board = null;
		int startrow=(page-1)*limit;  
		
		try{
			up();
			pstmt = con.prepareStatement(board_list_sql);
			pstmt.setString(1,hot_nation);
			pstmt.setInt(2, startrow);
			pstmt.setInt(3, limit);
			
			rs = pstmt.executeQuery();		
			System.out.println(pstmt.toString());;
			System.out.println(hot_nation+" : dao hot_nation");
			while(rs.next()){				
				board = new Hotel_main_DTO();
				System.out.println("0");
				board.setHot_main_num(rs.getInt("hot_main_num"));	
				board.setAtt_Num(rs.getInt("att_Num"));	
				board.setHot_main_img(rs.getString("hot_main_img"));							
				board.setHot_nation(rs.getString("hot_nation"));
				board.setHot_name(rs.getString("hot_name"));				
				board.setHot_address(rs.getString("hot_address"));
				System.out.println("1");
				board.setHot_star(rs.getInt("hot_star"));
				board.setHot_wifi(rs.getString("hot_wifi"));
				board.setHot_meetRoom(rs.getString("hot_meetRoom"));				
				board.setHot_smoking(rs.getString("hot_smoking"));	
				board.setHot_Nosmoking(rs.getString("hot_Nosmoking"));
				System.out.println("2");
				board.setHot_restaurant(rs.getString("hot_restaurant"));	
				board.setHot_bar(rs.getString("hot_bar"));				
				board.setHot_cafe(rs.getString("hot_cafe"));	
				board.setHot_checkin_date(rs.getDate("hot_checkin_date"));
				board.setHot_checkout_date(rs.getDate("hot_checkout_date"));
				System.out.println("3");
				board.setHot_checkin_time(rs.getString("hot_checkin_time"));
				board.setHot_checkout_time(rs.getString("hot_checkout_time"));
				board.setHot_latitude(rs.getInt("hot_latitude"));
				board.setHot_longitude(rs.getInt("hot_longitude"));
				System.out.println("4");
				mainList.add(board);
				System.out.println(mainList+" : DAO 지역");
			}
			
		}catch(Exception ex){
			System.out.println(ex);
		}finally{
			close(rs);
			close(pstmt);
		}
		
		return mainList;

	}
	public int mainListCount() {

		int listCount= 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{
			up();
			
			pstmt=con.prepareStatement("select count(*) from hot_info where hot_main_num");
			
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
	
	//메인 객실 가격
	public static ArrayList<Hotel_room_DTO> main_roomList(int page,int limit){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String board_list_sql=("select * from hot_info where hot_main_num order by hot_main_num desc limit ?,?");
		ArrayList<Hotel_room_DTO> main_roomList = new ArrayList<Hotel_room_DTO>();
		
		Hotel_room_DTO board = null;
		int startrow=(page-1)*limit;  
		
		try{
			up();
			pstmt = con.prepareStatement(board_list_sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, limit);
			
			rs = pstmt.executeQuery();		
			
			while(rs.next()){				
				board = new Hotel_room_DTO();
			
				board.setHot_room_num(rs.getInt("hot_room_num"));
				board.setHot_main_num(rs.getInt("hot_main_num"));
				board.setHot_re_num(rs.getInt("hot_re_num"));
				board.setHot_room_img(rs.getString("hot_room_img"));
				board.setHot_room_name(rs.getString("hot_room_name"));
				board.setHot_room_info(rs.getString("hot_room_info"));
				board.setHot_room_amount(rs.getInt("hot_room_amount"));
				board.setHot_room_price(rs.getInt("hot_room_price"));
				board.setHot_room_maxpeople(rs.getString("hot_room_maxpeople"));
				board.setHot_room_bedsort(rs.getString("hot_room_bedsort"));
				
				board.setHot_room_wifi(rs.getString("hot_room_wifi"));
				board.setHot_room_airCon(rs.getString("hot_room_airCon"));	
				board.setHot_room_shower(rs.getString("hot_room_shower"));
				board.setHot_room_refrigerator(rs.getString("hot_room_refrigerator"));
				board.setHot_room_TV(rs.getString("hot_room_TV"));
				board.setHot_room_bathtud(rs.getString("hot_room_bathtud"));
				board.setHot_room_breakfast(rs.getString("hot_room_room_breakfast"));	
				board.setHot_room_Nobreakfast(rs.getString("hot_room_Nobreakfast"));
				board.setHot_room_parking(rs.getString("hot_room_parking"));
				board.setHot_room_Noparking(rs.getString("hot_room_Noparking"));
			
				main_roomList.add(board);
			
			}
			
		}catch(Exception ex){
			
		}finally{
			close(rs);
			close(pstmt);
		}

		return main_roomList;

	}
	
	// 메인에서 룸 가져오기
public TreeMap<Integer, Hotel_room_DTO> main_roomselect(){
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		TreeMap<Integer, Hotel_room_DTO> members = new TreeMap<Integer, Hotel_room_DTO>();
		
		try{			
			up();
			pstmt = con.prepareStatement("select * , min(hot_room_price) as minPrice from hot_room group by hot_main_num;");
			
			rs= pstmt.executeQuery();
			
			while(rs.next()){
				
				Hotel_room_DTO hotel_room_DB = new Hotel_room_DTO();
				
				hotel_room_DB.setHot_room_num(rs.getInt("hot_room_num"));
				hotel_room_DB.setHot_main_num(rs.getInt("hot_main_num"));
				hotel_room_DB.setHot_room_img(rs.getString("hot_room_img"));
				hotel_room_DB.setHot_room_name(rs.getString("hot_room_name"));
				hotel_room_DB.setHot_room_info(rs.getString("hot_room_info"));
				hotel_room_DB.setHot_room_amount(rs.getInt("hot_room_amount"));
				hotel_room_DB.setHot_room_price(rs.getInt("minPrice"));
				hotel_room_DB.setHot_room_maxpeople(rs.getString("hot_room_maxpeople"));
				hotel_room_DB.setHot_room_bedsort(rs.getString("hot_room_bedsort"));

				hotel_room_DB.setHot_room_wifi(rs.getString("hot_room_wifi"));
				hotel_room_DB.setHot_room_airCon(rs.getString("hot_room_airCon"));	
				hotel_room_DB.setHot_room_shower(rs.getString("hot_room_shower"));
				hotel_room_DB.setHot_room_refrigerator(rs.getString("hot_room_refrigerator"));
				hotel_room_DB.setHot_room_TV(rs.getString("hot_room_TV"));
				hotel_room_DB.setHot_room_bathtud(rs.getString("hot_room_bathtud"));
				hotel_room_DB.setHot_room_breakfast(rs.getString("hot_room_breakfast"));	
				hotel_room_DB.setHot_room_Nobreakfast(rs.getString("hot_room_Nobreakfast"));
				hotel_room_DB.setHot_room_parking(rs.getString("hot_room_parking"));
				hotel_room_DB.setHot_room_Noparking(rs.getString("hot_room_Noparking"));
				
				members.put(hotel_room_DB.getHot_main_num(), hotel_room_DB);	

			}
		}catch(Exception ex){
		}finally{
			down();
		}
		return members;
	}

		// 객실
	public ArrayList<Hotel_room_DTO> room_select(int hot_main_num){
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Hotel_room_DTO> members= new ArrayList<Hotel_room_DTO>();
		
		try{			
			up();
			pstmt = con.prepareStatement("select * from hot_room where hot_main_num=?;");
			pstmt.setInt(1, hot_main_num);
			rs= pstmt.executeQuery();
			
			while(rs.next()){
				
				Hotel_room_DTO hotel_room_DB = new Hotel_room_DTO();
				
				hotel_room_DB.setHot_room_num(rs.getInt("hot_room_num"));
				hotel_room_DB.setHot_main_num(rs.getInt("hot_main_num"));
				hotel_room_DB.setHot_room_img(rs.getString("hot_room_img"));
				hotel_room_DB.setHot_room_name(rs.getString("hot_room_name"));
				hotel_room_DB.setHot_room_info(rs.getString("hot_room_info"));
				hotel_room_DB.setHot_room_amount(rs.getInt("hot_room_amount"));
				hotel_room_DB.setHot_room_price(rs.getInt("hot_room_price"));
				hotel_room_DB.setHot_room_maxpeople(rs.getString("hot_room_maxpeople"));
				hotel_room_DB.setHot_room_bedsort(rs.getString("hot_room_bedsort"));	
				
				hotel_room_DB.setHot_room_wifi(rs.getString("hot_room_wifi"));
				hotel_room_DB.setHot_room_airCon(rs.getString("hot_room_airCon"));	
				hotel_room_DB.setHot_room_shower(rs.getString("hot_room_shower"));
				hotel_room_DB.setHot_room_refrigerator(rs.getString("hot_room_refrigerator"));
				hotel_room_DB.setHot_room_TV(rs.getString("hot_room_TV"));
				hotel_room_DB.setHot_room_bathtud(rs.getString("hot_room_bathtud"));
				hotel_room_DB.setHot_room_breakfast(rs.getString("hot_room_breakfast"));	
				hotel_room_DB.setHot_room_Nobreakfast(rs.getString("hot_room_Nobreakfast"));
				hotel_room_DB.setHot_room_parking(rs.getString("hot_room_parking"));
				hotel_room_DB.setHot_room_Noparking(rs.getString("hot_room_Noparking"));
				
				members.add(hotel_room_DB);	

				System.out.println(members+" : DAO roomselect");
			}
		}catch(Exception ex){
		}finally{
			down();
		}
		return members;
	}
	public ArrayList<Hotel_room_DTO> room_select_sippai(int hot_main_num){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Hotel_room_DTO> members= new ArrayList<Hotel_room_DTO>();
		
		try{			
			up();
			pstmt = con.prepareStatement("select * from hot_room a, hot_info b, hot_review c where a.hot_main_num = b.hot_main_num =c.hot_main_num and a.hot_main_num=?;");
			pstmt.setInt(1, hot_main_num);
			rs= pstmt.executeQuery();
			
			while(rs.next()){
				
				Hotel_room_DTO hotel_room_DB = new Hotel_room_DTO();
				
				hotel_room_DB.setHot_room_num(rs.getInt("hot_room_num"));
				hotel_room_DB.setHot_main_num(rs.getInt("hot_main_num"));
				hotel_room_DB.setHot_room_num(rs.getInt("hot_re_num"));
				hotel_room_DB.setHot_room_img(rs.getString("hot_room_img"));
				hotel_room_DB.setHot_room_name(rs.getString("hot_room_name"));
				hotel_room_DB.setHot_room_info(rs.getString("hot_room_info"));
				hotel_room_DB.setHot_room_amount(rs.getInt("hot_room_amount"));
				hotel_room_DB.setHot_room_price(rs.getInt("hot_room_price"));
				hotel_room_DB.setHot_room_maxpeople(rs.getString("hot_room_maxpeople"));
				hotel_room_DB.setHot_room_bedsort(rs.getString("hot_room_bedsort"));
				
				hotel_room_DB.setHot_room_wifi(rs.getString("hot_room_wifi"));
				hotel_room_DB.setHot_room_airCon(rs.getString("hot_room_airCon"));
				hotel_room_DB.setHot_room_shower(rs.getString("hot_room_shower"));
				hotel_room_DB.setHot_room_refrigerator(rs.getString("hot_room_refrigerator"));
				hotel_room_DB.setHot_room_TV(rs.getString("hot_room_TV"));
				hotel_room_DB.setHot_room_bathtud(rs.getString("hot_room_bathtud"));
				hotel_room_DB.setHot_room_breakfast(rs.getString("hot_room_breakfast"));
				hotel_room_DB.setHot_room_Nobreakfast(rs.getString("hot_room_Nobreakfast"));
				hotel_room_DB.setHot_room_parking(rs.getString("hot_room_parking"));
				hotel_room_DB.setHot_room_Noparking(rs.getString("hot_room_Noparking"));
				
				
				
				
				hotel_room_DB.setHot_re_rate(rs.getInt("hot_re_rate"));
			
				hotel_room_DB.setHot_re_content(rs.getString("hot_re_content"));
				
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
	
	
	public ArrayList<Hotel_main_DTO> jjinmainDAO(int hot_main_num) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Hotel_main_DTO> members= new ArrayList<Hotel_main_DTO>();
		
		try{			
			up();
			pstmt = con.prepareStatement("select*from hot_info where hot_main_num=?;");
			pstmt.setInt(1, hot_main_num);
			rs= pstmt.executeQuery();
		
			while(rs.next()){
				
				Hotel_main_DTO hotel_main_DB = new Hotel_main_DTO();
				
				hotel_main_DB.setHot_main_num(rs.getInt("hot_main_num"));				
				hotel_main_DB.setHot_main_img(rs.getString("hot_main_img"));
				hotel_main_DB.setAtt_Num(rs.getInt("att_Num"));							
				hotel_main_DB.setHot_nation(rs.getString("hot_nation"));
				hotel_main_DB.setHot_name(rs.getString("hot_name"));
				hotel_main_DB.setHot_address(rs.getString("hot_address"));				
				hotel_main_DB.setHot_star(rs.getInt("hot_star"));
				hotel_main_DB.setHot_wifi(rs.getString("hot_wifi"));
				hotel_main_DB.setHot_meetRoom(rs.getString("hot_meetRoom"));
				hotel_main_DB.setHot_smoking(rs.getString("hot_smoking"));				
				hotel_main_DB.setHot_restaurant(rs.getString("hot_restaurant"));
				
				hotel_main_DB.setHot_cafe(rs.getString("hot_cafe"));
				hotel_main_DB.setHot_checkin_date(rs.getDate("hot_checkin_date"));
				hotel_main_DB.setHot_checkout_date(rs.getDate("hot_checkout_date"));
				hotel_main_DB.setHot_checkin_time(rs.getString("hot_checkin_time"));
				hotel_main_DB.setHot_checkout_time(rs.getString("hot_checkout_time"));
				hotel_main_DB.setHot_latitude(rs.getInt("hot_latitude"));
				hotel_main_DB.setHot_longitude(rs.getInt("hot_longitude"));
			
				
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
			pstmt=con.prepareStatement("select count(*) from hot_review where hot_main_num=?;");
			
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
		System.out.println(pstmt.toString());
		System.out.println(listCount+" : DAO reviewCount");
		return listCount;

	}
	public TreeMap<Integer, Hotel_room_DTO> yoyaku_Roomselect(int hot_room_num){	
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		TreeMap<Integer, Hotel_room_DTO> members = new TreeMap<Integer, Hotel_room_DTO>();
		
		try{			
			up();
			pstmt = con.prepareStatement("select * from hot_room where hot_room_num=?;");
			pstmt.setInt(1, hot_room_num);
			rs= pstmt.executeQuery();
			
			while(rs.next()){
			
				Hotel_room_DTO hotel_room_DB = new Hotel_room_DTO();
				
				
				hotel_room_DB.setHot_main_num(rs.getInt("hot_main_num"));
				hotel_room_DB.setHot_room_img(rs.getString("hot_room_img"));
			
				hotel_room_DB.setHot_room_name(rs.getString("hot_room_name"));
				hotel_room_DB.setHot_room_info(rs.getString("hot_room_info"));
				hotel_room_DB.setHot_room_amount(rs.getInt("hot_room_amount"));
			
				hotel_room_DB.setHot_room_price(rs.getInt("hot_room_price"));
				hotel_room_DB.setHot_room_maxpeople(rs.getString("hot_room_maxpeople"));
				hotel_room_DB.setHot_room_bedsort(rs.getString("hot_room_bedsort"));
				
				hotel_room_DB.setHot_room_wifi(rs.getString("hot_room_wifi"));
				hotel_room_DB.setHot_room_airCon(rs.getString("hot_room_airCon"));	
				hotel_room_DB.setHot_room_shower(rs.getString("hot_room_shower"));
				hotel_room_DB.setHot_room_refrigerator(rs.getString("hot_room_refrigerator"));
				hotel_room_DB.setHot_room_TV(rs.getString("hot_room_TV"));
				hotel_room_DB.setHot_room_bathtud(rs.getString("hot_room_bathtud"));
				hotel_room_DB.setHot_room_breakfast(rs.getString("hot_room_breakfast"));	
				hotel_room_DB.setHot_room_Nobreakfast(rs.getString("hot_room_Nobreakfast"));
				hotel_room_DB.setHot_room_parking(rs.getString("hot_room_parking"));
				hotel_room_DB.setHot_room_Noparking(rs.getString("hot_room_Noparking"));
				
				members.put(hotel_room_DB.getHot_room_num(), hotel_room_DB);
				
				System.out.println(members+"예약 DAO Room");
				
			}
		}catch(Exception ex){
		}finally{
			down();
		}
		
		return members;
		
	}
	public ArrayList<Hotel_main_DTO> yoyaku_Mainselect(int hot_main_num){	
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Hotel_main_DTO> members = new ArrayList<Hotel_main_DTO>();
		
		try{			
			up();
			pstmt = con.prepareStatement("select * from hot_info where hot_main_num=?;");
			pstmt.setInt(1, hot_main_num);
			rs= pstmt.executeQuery();
			
			while(rs.next()){
			
				Hotel_main_DTO hotel_main_DB = new Hotel_main_DTO();
				
				hotel_main_DB.setHot_main_num(rs.getInt("hot_main_num"));				
				
				hotel_main_DB.setAtt_Num(rs.getInt("att_Num"));	
				hotel_main_DB.setHot_main_img(rs.getString("hot_main_img"));
				hotel_main_DB.setHot_nation(rs.getString("hot_nation"));
				hotel_main_DB.setHot_name(rs.getString("hot_name"));
				hotel_main_DB.setHot_address(rs.getString("hot_address"));				
				hotel_main_DB.setHot_star(rs.getInt("hot_star"));
				hotel_main_DB.setHot_wifi(rs.getString("hot_wifi"));
				hotel_main_DB.setHot_meetRoom(rs.getString("hot_meetRoom"));
				hotel_main_DB.setHot_smoking(rs.getString("hot_smoking"));				
				hotel_main_DB.setHot_restaurant(rs.getString("hot_restaurant"));
				
				hotel_main_DB.setHot_cafe(rs.getString("hot_cafe"));
				hotel_main_DB.setHot_checkin_date(rs.getDate("hot_checkin_date"));
				hotel_main_DB.setHot_checkout_date(rs.getDate("hot_checkout_date"));
				hotel_main_DB.setHot_checkin_time(rs.getString("hot_checkin_time"));
				hotel_main_DB.setHot_checkout_time(rs.getString("hot_checkout_time"));
				hotel_main_DB.setHot_latitude(rs.getInt("hot_latitude"));
				hotel_main_DB.setHot_longitude(rs.getInt("hot_longitude"));
			
				
				members.add(hotel_main_DB);
				System.out.println(members+"예약 DAO");
				
			}
		}catch(Exception ex){
		}finally{
			down();
		}
		
		return members;
		
	}
	public ArrayList<Member_info> yoyaku_ListSelect(String mb_id){	
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Member_info> members = new ArrayList<Member_info>();
		
		try{			
			up();
			pstmt = con.prepareStatement("select * from member_info where mb_id=?;");
			pstmt.setString(1, mb_id);
			rs= pstmt.executeQuery();
			
			while(rs.next()){
			
				Member_info member_DTO = new Member_info();
				
				member_DTO.setMb_id(rs.getString("mb_id"));				
				member_DTO.setMb_pw(rs.getString("mb_pw"));	
				member_DTO.setMb_name(rs.getString("mb_name"));
				member_DTO.setMb_firstname(rs.getString("mb_firstname"));
				member_DTO.setMb_lastname(rs.getString("mb_lastname"));		
				
				member_DTO.setMb_passnum(rs.getString("mb_passnum"));				
				member_DTO.setMb_exdate(rs.getString("mb_exdate"));
				member_DTO.setMb_email(rs.getString("mb_email"));
				member_DTO.setMb_address(rs.getString("mb_address"));
				member_DTO.setMb_detailaddress(rs.getString("mb_detailaddress"));
				
				member_DTO.setMb_phonenum(rs.getString("mb_phonenum"));		
				member_DTO.setMb_gender(rs.getString("mb_gender"));				
				member_DTO.setMb_birth(rs.getString("mb_birth"));
				
				members.add(member_DTO);	
			}
		}catch(Exception ex){
		}finally{
			down();
		}
		
		return members;
		
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
		
public ArrayList<Hotel_review_DTO> select_01(){
		
		ArrayList<Hotel_review_DTO> members= new ArrayList<Hotel_review_DTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
			try {
				up();
				pstmt = con.prepareStatement("select*from hot_review");
				
				rs= pstmt.executeQuery();
				
				
				while(rs.next()) {
					Hotel_review_DTO student= new Hotel_review_DTO();
					student.setHot_re_num(rs.getInt("hot_re_num"));	
					
					student.setHot_main_num(rs.getInt("hot_main_num"));
					student.setHot_re_id(rs.getString("hot_re_id"));
					student.setHot_re_rate(rs.getInt("hot_re_rate"));
					
					student.setHot_re_content(rs.getString("hot_re_content"));
					
					student.setHot_re_date(rs.getDate("hot_re_date"));
					
					members.add(student);					
				}				
				System.out.println(pstmt.toString());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
			down();
			
			}
			return members;
}

public ArrayList<Hotel_review_DTO> select_02(int hot_main_num){
	
	ArrayList<Hotel_review_DTO> members= new ArrayList<Hotel_review_DTO>();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
		try {
			up();
			pstmt = con.prepareStatement("select*from hot_review where hot_main_num=?;");
			pstmt.setInt(1, hot_main_num);
			rs= pstmt.executeQuery();
			
			
			while(rs.next()) {
				Hotel_review_DTO student= new Hotel_review_DTO();
				student.setHot_re_num(rs.getInt("hot_re_num"));	
				
				student.setHot_main_num(rs.getInt("hot_main_num"));
				student.setHot_re_id(rs.getString("hot_re_id"));
				student.setHot_re_rate(rs.getInt("hot_re_rate"));
			
				student.setHot_re_content(rs.getString("hot_re_content"));
			
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
public static ArrayList<Hotel_review_DTO> reviewList(int hot_main_num,int page,int limit){
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String board_list_sql=("select * from hot_review where hot_main_num = ? order by hot_re_date desc, hot_main_num desc limit ?,5");
	ArrayList<Hotel_review_DTO> mainList = new ArrayList<Hotel_review_DTO>();
	
	Hotel_review_DTO board = null;
	int startrow=(page-1)*5;  
	
	try{
		up();
		pstmt = con.prepareStatement(board_list_sql);
		pstmt.setInt(1, hot_main_num);
		pstmt.setInt(2, startrow);
		
		
		
		rs = pstmt.executeQuery();		
		
		while(rs.next()){				
			board = new Hotel_review_DTO();
			board.setHot_re_num(rs.getInt("hot_re_num"));	
			board.setHot_main_num(rs.getInt("hot_main_num"));
			board.setHot_re_id(rs.getString("hot_re_id"));
			board.setHot_re_rate(rs.getInt("hot_re_rate"));
			board.setHot_re_content(rs.getString("hot_re_content"));
			
			board.setHot_re_date(rs.getDate("hot_re_date"));
		
			mainList.add(board);
		
		}
		
		System.out.println(pstmt.toString());
		
	}catch(Exception ex){
		
	}finally{
		close(rs);
		close(pstmt);
	}

	return mainList;

}	


	public void insert_01(String hot_main_num,String hot_re_id,String hot_re_content,String hot_re_rate) {
	try{
		
			up();
			System.out.println("aaaaaaaaaaaaaaaaaaaaaa");
			String command=String.format("insert into hot_review (hot_main_num,hot_re_id,hot_re_rate,hot_re_content,hot_re_date) values (%s,'%s',%s,'%s',now())",hot_main_num,hot_re_id,hot_re_rate,hot_re_content);
			System.out.println(command);
			int rowNum=stmt.executeUpdate(command);
			System.out.println("bbbbbbbbbbbbbbbbbbbbbbbbb");
		}catch (Exception e) {
		}finally{
			down();
		}

	}
	public void update_01(String hot_re_num,String hot_main_num,String hot_re_id,String hot_re_content,String hot_re_rate) {
		try{
			
				up();
				String command=String.format("update hot_review set hot_main_num :=%s,hot_re_id :='%s',hot_re_content :='%s',hot_re_rate :='%s' where hot_re_num = %s ",hot_main_num,hot_re_id,hot_re_content,hot_re_rate,hot_re_num);
				
								
				int rowNum=stmt.executeUpdate(command);
				
			}catch (Exception e) {
			}finally{
				down();
			}

	}
	
	
	public void delete_01(String hot_re_num) {
		
//		<script>location.href="Delete_sub.jsp";</script>
			try{
				System.out.println("asd=====asd");
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
