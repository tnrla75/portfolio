package svc;
import static db.TravelDButil.*;
import java.sql.Connection;
import java.util.ArrayList;


import dao.TravelDAO;
import vo.Travelatt;
import vo.Travelattre;
import vo.Travelattandimg;
import vo.Travelimg;
import vo.Travellocal;

public class TravelattService {
	public ArrayList<Travelatt> attselect(String att) throws Exception{                        //관광지 메인 출력
		ArrayList<Travelatt> travelatt = null;
		Connection con = getConnection();
		TravelDAO travelDAO = TravelDAO.getInstance();
		int a = 0;
		travelDAO.setConnection(con);
		travelatt = travelDAO.selecttravelatt(att);
		close(con);
		return travelatt;
	}
	
	public ArrayList<Travelattre> review(int page, int limit) throws Exception{                        //관광지 메인 출력
		ArrayList<Travelattre> travelattre = null;
		Connection con = getConnection();
		TravelDAO travelDAO = TravelDAO.getInstance();
		travelDAO.setConnection(con);
		travelattre = travelDAO.att_review(page, limit);
		close(con);
		return travelattre;
	}

	public ArrayList<Travelattandimg> attselect_att() throws Exception{                        // 관광지 우측 사이드 출력
		ArrayList<Travelattandimg> travelattimg = null;
		Connection con = getConnection();
		TravelDAO travelDAO = TravelDAO.getInstance();
		int a = 0;
		travelDAO.setConnection(con);
		travelattimg = travelDAO.selectAtt_att();
		close(con);
		return travelattimg;
	}


	public Travelimg imgselect() throws Exception{                                               // 관광지 이미지 출력
		Travelimg travelimg = null;
		Connection con = getConnection();
		TravelDAO travelDAO = TravelDAO.getInstance();
		int a = 0;
		travelDAO.setConnection(con);
		travelimg = travelDAO.Selecttravelimg();
		close(con);
		return travelimg;
	}
	
	public int getListCount() throws Exception{													//페이징
		int listCount = 0;
		Connection con = getConnection();
		TravelDAO travelDAO = TravelDAO.getInstance();
		travelDAO.setConnection(con);
		listCount = travelDAO.selectListattCount();
		close(con);
		return listCount;
		
	}
	
}