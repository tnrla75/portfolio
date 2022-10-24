package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.Flightdao;
import vo.FlightTicketBean;

public class FlightFilterService {
	public ArrayList<FlightTicketBean> getArticle_fliter_go(String departure, String arrive, String people, String seat, String departureday, String startleftval1 , String startrightval1 , String startleftval2 , String startrightval2, int page, int limit, String arr) throws Exception{
		
		ArrayList<FlightTicketBean> articleList = null;
		
		
		Connection con = getConnection();
		Flightdao flightdao = Flightdao.getInstance();
		flightdao.setConnection(con);
		articleList = flightdao.selectArticleFliter_go(departure, arrive, people, seat, departureday , startleftval1 , startrightval1 , startleftval2 , startrightval2 , page, limit, arr);
		
		close(con);
		return articleList;
	}
	public int getListCountFilter_go(String departure, String arrive, String people, String seat, String departureday, String startleftval1 , String startrightval1 , String startleftval2 , String startrightval2, String arr) throws Exception{
		int listCount = 0;
		Connection con = getConnection();
		Flightdao flightdao = Flightdao.getInstance();
		flightdao.setConnection(con);
		listCount = flightdao.selectListCountFilter_go(departure, arrive, people, seat, departureday , startleftval1 , startrightval1 , startleftval2 , startrightval2 , arr);
		close(con);
		return listCount;
		
	}
public ArrayList<FlightTicketBean> getArticle_fliter_back(String arrive, String departure, String people, String seat, String departureday, String startleftval1 , String startrightval1 , String startleftval2 , String startrightval2, int page, int limit, String arr) throws Exception{
		
		ArrayList<FlightTicketBean> articleList = null;
		
		
		Connection con = getConnection();
		Flightdao flightdao = Flightdao.getInstance();
		flightdao.setConnection(con);
		articleList = flightdao.selectArticleFliter_back(departure, arrive, people, seat, departureday , startleftval1 , startrightval1 , startleftval2 , startrightval2 , page, limit, arr);
		
		close(con);
		return articleList;
	}
	public int getListCountFilter_back(String arrive, String departure, String people, String seat, String departureday, String startleftval1 , String startrightval1 , String startleftval2 , String startrightval2, String arr) throws Exception{
		int listCount = 0;
		Connection con = getConnection();
		Flightdao flightdao = Flightdao.getInstance();
		flightdao.setConnection(con);
		listCount = flightdao.selectListCountFilter_back(departure, arrive, people, seat, departureday , startleftval1 , startrightval1 , startleftval2 , startrightval2 , arr);
		close(con);
		return listCount;
		
	}
}
