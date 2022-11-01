package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.TreeMap;
import dao.Hotel_DAO;
import vo.Hotel_main_DTO;
import vo.Hotel_room_DTO;
import vo.Member_info;

public class Hotel_YoyakuService {
	
	// yoyaku Count
	public ArrayList<Hotel_main_DTO> yoyakuMain(int hot_main_num) throws Exception{
		// TODO Auto-generated method stub
		
		ArrayList<Hotel_main_DTO> article = null;
		Connection con = getConnection();
		Hotel_DAO hotel_DAO = Hotel_DAO.getInstance();
		hotel_DAO.setConnection(con);
		
		article = hotel_DAO.yoyaku_Mainselect(hot_main_num);
		
		close(con);
		return article;		
	}
	
	
	// yoyakuList
	public ArrayList<Member_info> yoyakuList(String mb_id) throws Exception{
		// TODO Auto-generated method stub
		
		ArrayList<Member_info> article = null;
		Connection con = getConnection();
		Hotel_DAO hotel_DAO = Hotel_DAO.getInstance();
		hotel_DAO.setConnection(con);
		
		article = hotel_DAO.yoyaku_ListSelect(mb_id);
		
		close(con);
		return article;		
	}
	
	// yoyakuDate 예약하기 전 날짜 저장 예약 카운트
	
		public Boolean yoyakuDate(Hotel_room_DTO yoyakudate) throws Exception{
			// TODO Auto-generated method stub
			Boolean date=false;
			int article=0;
			System.out.println(">>>>>>>>>>>>> yoyakuDate 서비스 들어옴");
			Connection con = getConnection();
			Hotel_DAO hotel_DAO = Hotel_DAO.getInstance();
			hotel_DAO.setConnection(con);
			System.out.println(yoyakudate.getHot_checkin_date()+" 서비스 예약데이터  111111111111");
			System.out.println(yoyakudate.getHot_checkout_date()+" 서비스 예약데이터 222222222222222");
			System.out.println(yoyakudate.getHot_room_num()+" 서비스 예약데이터 3333333333333");
			article=hotel_DAO.yoyaku_Date(yoyakudate);
			System.out.println(article+" : 서비스 Count값");
			if(article>0) {
			
				commit(con);
				date=true;
				
			}
			close(con);
			return date;
		}
	
	public TreeMap<Integer, Hotel_room_DTO> yoyakuRoom(int hot_room_num) throws Exception{
		// TODO Auto-generated method stub
		System.out.println(">>>>>>>>>>>>> yoyakuRoom 서비스 들어옴");
		TreeMap<Integer, Hotel_room_DTO> article = null;
		Connection con = getConnection();
		Hotel_DAO hotel_DAO = Hotel_DAO.getInstance();
		hotel_DAO.setConnection(con);
		
		article = hotel_DAO.yoyaku_Roomselect(hot_room_num);
		
		close(con);
		return article;		
	}
	
	// 예약 완료 후 객실 카운트
		public static int kanryo_room(int hot_room_num,String hot_checkin_date,String hot_checkout_date) throws Exception{
			// TODO Auto-generated method stub
			System.out.println(">>>>>>>>>>>>> kanryo_room 서비스 들어옴");
			int article = 0;
			Connection con = getConnection();
			Hotel_DAO hotel_DAO = Hotel_DAO.getInstance();
			hotel_DAO.setConnection(con);
			
			
			article = hotel_DAO.kanryo_room(hot_room_num,hot_checkin_date,hot_checkout_date);
			
			System.out.println(hot_room_num+"서비스 예약완료 룸 넘");
			System.out.println(hot_checkin_date+"서비스 예약완료 체크인");
			System.out.println(hot_checkout_date+"서비스 예약완료 체크아웃");
			
		
			
			close(con);
			return article;		
		}
		
	
	
}
