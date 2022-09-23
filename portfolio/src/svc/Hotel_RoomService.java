package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;
import java.sql.Connection;
import java.util.ArrayList;

import dao.Hotel_DAO;
import vo.Hotel_main_DB;
import vo.Hotel_review_DB;
import vo.Hotel_room_DB;


public class Hotel_RoomService {

	//	룸
	public ArrayList<Hotel_room_DB> getArticle(int hot_main_num) throws Exception{
		// TODO Auto-generated method stub
		
		ArrayList<Hotel_room_DB> article = null;
		Connection con = getConnection();
		Hotel_DAO hotel_DAO = Hotel_DAO.getInstance();
		hotel_DAO.setConnection(con);
		
		
		article = hotel_DAO.room_select(hot_main_num);
		
		System.out.println(article+"서비스 룸");
		
		close(con);
		return article;		
	}
	
	//	리뷰
//	public ArrayList<Hotel_review_DB> reviewService(int hot_main_num) throws Exception{
//		// TODO Auto-generated method stub
//		
//		ArrayList<Hotel_review_DB> article = null;
//		Connection con = getConnection();
//		Hotel_DAO hotel_DAO = Hotel_DAO.getInstance();
//		hotel_DAO.setConnection(con);
//		
//		
//		article = hotel_DAO.select_02(hot_main_num);
//		
//		System.out.println(article+"서비스 리뷰");
//		
//		close(con);
//		return article;
//		
//	}
	
	//	메인 셀렉
	public ArrayList<Hotel_main_DB> jjinmainService(int hot_main_num) throws Exception{
		
		ArrayList<Hotel_main_DB> article = null;
		Connection con = getConnection();
		Hotel_DAO hotel_DAO = Hotel_DAO.getInstance();
		hotel_DAO.setConnection(con);
		
		
		article = hotel_DAO.jjinmainDAO(hot_main_num);
		
		System.out.println(article+"서비스 jjin");
		
		close(con);
		return article;
		
	}
	//	리뷰1
	public int reviewListCount(int hot_main_num) throws Exception{
		int listCount = 0;
		Connection con = getConnection();
		Hotel_DAO hotel_DAO = Hotel_DAO.getInstance();
		hotel_DAO.setConnection(con);
		listCount = hotel_DAO.reviewCount(hot_main_num);
		
		System.out.println(listCount+" : listCount서비스 리뷰1");
		
		close(con);		
		return listCount;
	
	}
	
	//	리뷰2
	public ArrayList<Hotel_review_DB> reviewList(int hot_main_num,int page, int limit) throws Exception{
		
		ArrayList<Hotel_review_DB> reviewList = null;
		Connection con = getConnection();
		Hotel_DAO hotel_DAO = Hotel_DAO.getInstance();		
		hotel_DAO.setConnection(con);		
		reviewList = Hotel_DAO.reviewList(hot_main_num,page,limit);	
		
		System.out.println(reviewList+" : reviewList서비스 리뷰2");
		
		close(con);		
		return reviewList;
		
	}

	
	
	//	메인1
//	public int getListCount(int hot_main_num) throws Exception{
//		int listCount = 0;
//		Connection con = getConnection();
//		Hotel_DAO hotel_DAO = Hotel_DAO.getInstance();
//		hotel_DAO.setConnection(con);
//		listCount = hotel_DAO.main_roomCount(hot_main_num);
//		
//		System.out.println(listCount+"서비스 메인1");
//		
//		close(con);		
//		return listCount;
//	
//	}
	
	//	메인2
//	public ArrayList<Hotel_main_DB> mainList(int page, int limit) throws Exception{
//		
//		ArrayList<Hotel_main_DB> mainList = null;
//		Connection con = getConnection();
//		Hotel_DAO hotel_DAO = Hotel_DAO.getInstance();		
//		hotel_DAO.setConnection(con);		
//		mainList = Hotel_DAO.main_roomList(page,limit);	
//		
//		System.out.println(mainList+"서비스 메인2");
//		
//		close(con);		
//		return mainList;
//		
//	}

	
}
