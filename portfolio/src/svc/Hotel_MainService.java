package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import dao.Hotel_DAO;
import vo.Hotel_main_DB;

public class Hotel_MainService {
	
	
	public int getListCount() throws Exception{
		int listCount = 0;
		Connection con = getConnection();
		Hotel_DAO hotel_DAO = Hotel_DAO.getInstance();
		hotel_DAO.setConnection(con);
		listCount = hotel_DAO.selectListCount();
		close(con);
		return listCount;
		
	}

	public ArrayList<Hotel_main_DB> mainList(int page, int limit) throws Exception{
		
		ArrayList<Hotel_main_DB> mainList = null;
		Connection con = getConnection();
		Hotel_DAO hotel_DAO = Hotel_DAO.getInstance();		
		hotel_DAO.setConnection(con);		
		mainList = Hotel_DAO.selectArticleList(page,limit);		
		close(con);
		return mainList;
		
	}
	
	

}
