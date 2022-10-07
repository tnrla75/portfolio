package svc;

import static db.TravelDButil.close;
import static db.TravelDButil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.TravelDAO;
import vo.Travelattandimg;
import vo.Travellocal;

public class IndexselectService {
	
		public static ArrayList<Travellocal> indextravel_select() throws Exception{
			
			ArrayList<Travellocal> travellocal = null;
			Connection con = getConnection();
			TravelDAO travelDAO = TravelDAO.getInstance();
			travelDAO.setConnection(con);
			travellocal = travelDAO.Index_travel_select();
			close(con);
			return travellocal;
		}
}
