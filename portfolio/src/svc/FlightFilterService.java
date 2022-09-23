package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.Flightdao;
import vo.FlightTicketBean;

public class FlightFilterService {
	public ArrayList<FlightTicketBean> getArticle_fliter(String departure, String arrive, String people, String seat, String departureday, int page, int limit, String arr) throws Exception{
		
		ArrayList<FlightTicketBean> articleList = null;
		
		
		Connection con = getConnection();
		Flightdao flightdao = Flightdao.getInstance();
		flightdao.setConnection(con);
		articleList = flightdao.selectArticleFliter(departure, arrive, people, seat, departureday, page, limit, arr);
		
		close(con);
		return articleList;
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
