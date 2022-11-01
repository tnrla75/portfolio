package svc;

import static db.JdbcUtil.close;

import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;


import dao.Hotel_DAO;
import vo.Hotel_main_DTO;
import vo.Hotel_review_DTO;
import vo.Hotel_room_DTO;
import vo.Hotel_yoyaku_DTO;


public class Hotel_RoomService {

	//	룸
	public ArrayList<Hotel_room_DTO> roomList(int hot_main_num) throws Exception{
		// TODO Auto-generated method stub
		
		ArrayList<Hotel_room_DTO> article = null;
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
	
	//	룸 메인 셀렉
	public ArrayList<Hotel_main_DTO> jjinmainService(int hot_main_num) throws Exception{
		
		ArrayList<Hotel_main_DTO> article = null;
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
	public ArrayList<Hotel_review_DTO> reviewList(int hot_main_num,int page, int limit) throws Exception{
		
		ArrayList<Hotel_review_DTO> reviewList = null;
		Connection con = getConnection();
		Hotel_DAO hotel_DAO = Hotel_DAO.getInstance();		
		hotel_DAO.setConnection(con);		
		reviewList = Hotel_DAO.reviewList(hot_main_num,page,limit);	
		
		System.out.println(reviewList+" : reviewList서비스 리뷰2");
		
		close(con);		
		return reviewList;
	}

	
}
