package svc;

import static db.TravelDButil.close;
import static db.TravelDButil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.TravelDAO;
import travel_package.MateController;
import travel_package.MateDTO;
import vo.Travelatt;

public class TravelMateService {
	
	public ArrayList<MateDTO> travelmate(int page, int limit) throws Exception{                        //travelmate
		ArrayList<MateDTO> matedto = null;
		Connection con = getConnection();
		MateController mc = new MateController();
		matedto = mc.select(page, limit);
		close(con);
		return matedto;
	}
	
	public ArrayList<MateDTO> travelmate(int page, int limit, String search) throws Exception{                        //travelmate
		ArrayList<MateDTO> matedto = null;
		Connection con = getConnection();
		MateController mc = new MateController();
		matedto = mc.searchselect(page, limit, search);
		close(con);
		return matedto;
	}
	
	public static int getListCount() throws Exception{													//∆‰¿Ã¬°
		int listCount = 0;
		Connection con = getConnection();
		MateController mc = new MateController();
		listCount = mc.selectListattCount();
		close(con);
		return listCount;
	}
	
	public static int getListCount(String search) throws Exception{													//∆‰¿Ã¬°
		int listCount = 0;
		Connection con = getConnection();
		MateController mc = new MateController();
		listCount = mc.selectsearchListattCount(search);
		close(con);
		return listCount;
	}
}
