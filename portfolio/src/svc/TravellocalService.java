package svc;

import static db.TravelDButil.close;
import static db.TravelDButil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.TravelDAO;
import vo.Travelatt;
import vo.Travelattandimg;
import vo.Travelimg;
import vo.Travellocal;

public class TravellocalService {
	public static Travellocal localselect(String local) throws Exception{
		
		Travellocal travellocal = null;
		Connection con = getConnection();
		TravelDAO travelDAO = TravelDAO.getInstance();
		travelDAO.setConnection(con);
		travellocal = travelDAO.Selecttravellocal(local);
		close(con);
		return travellocal;
	}
	
	public static ArrayList<Travelattandimg> Local_att() throws Exception{
		
		ArrayList<Travelattandimg> travelimg = null;
		Connection con = getConnection();
		TravelDAO travelDAO = TravelDAO.getInstance();
		travelDAO.setConnection(con);
		travelimg = travelDAO.selectlocalatt();
		close(con);
		return travelimg;
	}
}
