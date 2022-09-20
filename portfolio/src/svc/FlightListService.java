package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;
import dao.Flightdao;
import vo.FlightTicketBean;

public class FlightListService {
	public ArrayList<FlightTicketBean> getArticle_go(String departure, String arrive, String people, String seat, String departureday, int page, int limit) throws Exception{
		
		ArrayList<FlightTicketBean> articleList = null;
		
		Connection con = getConnection();
		Flightdao flightdao = Flightdao.getInstance();
		flightdao.setConnection(con);
		articleList = flightdao.selectArticleList(departure, arrive, people, seat, departureday, page,limit);
		
		close(con);
		return articleList;
	}
	public ArrayList<FlightTicketBean> getArticle_back(String arrive, String departure,String people, String seat, String arrivalday, int page, int limit) throws Exception{
		
		ArrayList<FlightTicketBean> articleList = null;
		
		Connection con = getConnection();
		Flightdao flightdao = Flightdao.getInstance();
		flightdao.setConnection(con);
		
		articleList = flightdao.selectArticleList_turn(departure, arrive, people, seat, arrivalday, page,limit);
		
		close(con);
		return articleList;
	}
	public ArrayList<FlightTicketBean> getArticle_oneway(String departure,String arrive, String people, String seat, String departureday, int page, int limit) throws Exception{
		
		ArrayList<FlightTicketBean> articleList = null;
		
		Connection con = getConnection();
		Flightdao flightdao = Flightdao.getInstance();
		flightdao.setConnection(con);
		
		articleList = flightdao.selectArticleList_oneway(departure, arrive, people, seat, departureday , page,limit);
		
		close(con);
		return articleList;
	}
	
	public ArrayList<FlightTicketBean> getArticle_fliter(String departure, String arrive, String people, String seat, String departureday, int page, int limit, String arr) throws Exception{
		
		ArrayList<FlightTicketBean> articleList = null;
		
		
		Connection con = getConnection();
		Flightdao flightdao = Flightdao.getInstance();
		flightdao.setConnection(con);
		articleList = flightdao.selectArticleFliter(departure, arrive, people, seat, departureday, page, limit, arr);
		
		close(con);
		return articleList;
	}
	
	public int getListCount(String departure, String arrive, String people, String seat, String departureday) throws Exception{
		int listCount = 0;
		Connection con = getConnection();
		Flightdao flightdao = Flightdao.getInstance();
		flightdao.setConnection(con);
		listCount = flightdao.selectListCount(departure, arrive, people, seat, departureday);
		close(con);
		return listCount;
		
	}
	public int getListCountFilter(String departure, String arrive, String people, String seat, String departureday, String arr) throws Exception{
		int listCount = 0;
		Connection con = getConnection();
		Flightdao flightdao = Flightdao.getInstance();
		flightdao.setConnection(con);
		listCount = flightdao.selectListCountFilter(departure, arrive, people, seat, departureday, arr);
		close(con);
		return listCount;
		
	}
}