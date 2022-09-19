package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;
import java.sql.Connection;
import java.util.ArrayList;
import dao.ItemDAO;
import vo.Item;
import vo.ItemImg;

public class ItemListService {
	public int getListCount(String category) throws Exception{
		int listCount = 0;
		Connection con = getConnection();
		ItemDAO itemDAO = ItemDAO.getInstance();
		itemDAO.setConnection(con);
		
		//selectListCount 메소드 호출
		//데이터 개수 확인
		listCount = itemDAO.selectListCount(category);
		close(con);
		return listCount;
	}
	
	public ArrayList<Item> getArticleList(int page, int limit, String category) throws Exception{
	
		ArrayList<Item> articleList = null;
		Connection con = getConnection();
		ItemDAO itemDAO = ItemDAO.getInstance();
		itemDAO.setConnection(con);
		
		//모든 데이터 select
		articleList = itemDAO.selectArticleList(page,limit, category);
		close(con);
		return articleList;
	}
	
}
