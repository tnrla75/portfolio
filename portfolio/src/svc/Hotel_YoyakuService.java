package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.TreeMap;

import dao.Hotel_DAO;
import vo.Hotel_main_DTO;
import vo.Hotel_room_DTO;
import vo.Member_info;

public class Hotel_YoyakuService {
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
	
	public TreeMap<Integer, Hotel_room_DTO> yoyakuRoom(int hot_room_num) throws Exception{
		// TODO Auto-generated method stub
		
		TreeMap<Integer, Hotel_room_DTO> article = null;
		Connection con = getConnection();
		Hotel_DAO hotel_DAO = Hotel_DAO.getInstance();
		hotel_DAO.setConnection(con);
		
		
		article = hotel_DAO.yoyaku_Roomselect(hot_room_num);
		
		
		
		close(con);
		return article;		
	}
	
}
