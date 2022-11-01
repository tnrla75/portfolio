package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.TreeMap;

import dao.Hotel_DAO;
import vo.Hotel_main_DTO;
import vo.Hotel_review_DTO;
import vo.Hotel_room_DTO;

public class Hotel_MainService {
	
	
	public int getListCount() throws Exception{
		int listCount = 0;
		Connection con = getConnection();
		Hotel_DAO hotel_DAO = Hotel_DAO.getInstance();
		hotel_DAO.setConnection(con);
		listCount = hotel_DAO.mainListCount();
		close(con);
		return listCount;
		
	}
	
	// 스타 서비스
	public ArrayList<Hotel_main_DTO> starList(int page, int limit,int hot_star) throws Exception{
		
		ArrayList<Hotel_main_DTO> starList = null;
		Connection con = getConnection();
		Hotel_DAO hotel_DAO = Hotel_DAO.getInstance();		
		hotel_DAO.setConnection(con);		
		starList = Hotel_DAO.starList(page,limit,hot_star);	
		
		System.out.println(starList+" : starList 서비스");
		close(con);
		
		
		
		return starList;
		
	}
	
	// 지역 서비스
	public ArrayList<Hotel_main_DTO> nationList(int page, int limit,String hot_nation) throws Exception{
			
			ArrayList<Hotel_main_DTO> nationList = null;
			Connection con = getConnection();
			Hotel_DAO hotel_DAO = Hotel_DAO.getInstance();		
			hotel_DAO.setConnection(con);		
			nationList = Hotel_DAO.nationList(page,limit,hot_nation);	
			
			System.out.println(nationList+" : nationList 서비스");
			System.out.println("서비스 hot_nation >>> " + hot_nation);
			
			close(con);
			
			
			
			return nationList;
			
	}
	
	// 메인 서비스
	public ArrayList<Hotel_main_DTO> mainList(int page, int limit) throws Exception{
		
		ArrayList<Hotel_main_DTO> mainList = null;
		Connection con = getConnection();
		Hotel_DAO hotel_DAO = Hotel_DAO.getInstance();		
		hotel_DAO.setConnection(con);		
		mainList = Hotel_DAO.mainList(page,limit);		
		System.out.println(mainList+" : mainList 서비스");
		close(con);
		
		return mainList;
		
	}
	
	// 인덱스 검색 후 호텔 메인 서비스
		public ArrayList<Hotel_main_DTO> mainkensaku(int page, int limit) throws Exception{
			
			ArrayList<Hotel_main_DTO> mainList = null;
			Connection con = getConnection();
			Hotel_DAO hotel_DAO = Hotel_DAO.getInstance();		
			hotel_DAO.setConnection(con);		
			mainList = Hotel_DAO.mainList(page,limit);		
			System.out.println(mainList+" : mainList 서비스");
			close(con);
			
			return mainList;
			
		}
	
	// 메인에서 룸 가격 가져오는 트리맵
	public TreeMap<Integer, Hotel_room_DTO> main_roomList() throws Exception{
		
		TreeMap<Integer, Hotel_room_DTO> main_room_lsit = null;
		Connection con = getConnection();
		Hotel_DAO hotel_DAO = Hotel_DAO.getInstance();
		hotel_DAO.setConnection(con);
		
		main_room_lsit = hotel_DAO.main_roomselect();
		
		close(con);
		return main_room_lsit;		
	}	
	

}
