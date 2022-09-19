package svc;

import java.sql.Connection;

import static db.TravelDButil.*;
import dao.TravelDAO;
import vo.Travelattre;

public class TravelattRe_insertService {

	public boolean registArticle(Travelattre travelattre) throws Exception{
		System.out.println("bb");
		boolean isWriteSuccess = false;
		Connection con = getConnection();
		TravelDAO travelDAO = TravelDAO.getInstance();
		travelDAO.setConnection(con);
		System.out.println("cc");
		System.out.println(travelattre.getAtt_reContent());
		int Count = travelDAO.insertArticle(travelattre);
		
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
