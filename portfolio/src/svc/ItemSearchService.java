package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import dao.ItemDAO;
import vo.Item;

public class ItemSearchService {
	public ArrayList<Item> getArticleList(String keyword) throws Exception{
		ArrayList<Item> articleList = null;
		Connection con = getConnection();
		ItemDAO itemDAO = ItemDAO.getInstance();
		itemDAO.setConnection(con);
		
		//아이템 검색
		articleList = itemDAO.searchSelectArticleList(keyword);
		close(con);
		return articleList;
	}
}
