package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;
import java.sql.Connection;
import dao.ItemDAO;
import vo.ItemOption;;

public class ItemOptionService {
	public ItemOption getArticle(String itemCode) throws Exception{
		// TODO Auto-generated method stub
		
		ItemOption article = null;
		Connection con = getConnection();
		ItemDAO itemDAO = ItemDAO.getInstance();
		itemDAO.setConnection(con);
		
		//해당 아이템에 대한 옵션 select
		article = itemDAO.optionSelectArticle(itemCode);
		close(con);
		return article;
		
	}

}