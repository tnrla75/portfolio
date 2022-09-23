package svc;

import static db.TravelDButil.close;
import static db.TravelDButil.commit;
import static db.TravelDButil.getConnection;
import static db.TravelDButil.rollback;

import java.sql.Connection;

import dao.TravelDAO;
import vo.Travelattre;

public class TravelattRe_updateService {

	
	public boolean registArticle(Travelattre travelattre) throws Exception{
		boolean isWriteSuccess = false;
		Connection con = getConnection();
		TravelDAO travelDAO = TravelDAO.getInstance();
		travelDAO.setConnection(con);
		int Count = travelDAO.updateArticle(travelattre);
		
		if(Count > 0){
			commit(con);
			isWriteSuccess = true;
		}
		else{
			rollback(con);
		}
		
		close(con);
		return isWriteSuccess;
		
	}
	
}

