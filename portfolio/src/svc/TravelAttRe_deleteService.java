package svc;

import static db.TravelDButil.*;
import java.sql.Connection;

import dao.TravelDAO;

public class TravelAttRe_deleteService {

	public boolean removeArticle(int board_num) throws Exception{
		// TODO Auto-generated method stub
		
		boolean isRemoveSuccess = false;
		Connection con = getConnection();
		TravelDAO travelDAO = TravelDAO.getInstance();
		travelDAO.setConnection(con);
		int deleteCount = travelDAO.deleteArticle(board_num);
		
		if(deleteCount > 0){
			commit(con);
			isRemoveSuccess=true;
		}
		else{
			rollback(con);
		}
		
		close(con);
		return isRemoveSuccess;
	}
}
