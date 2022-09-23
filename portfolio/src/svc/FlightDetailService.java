package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.Flightdao;
import vo.FlightTicketBean;

public class FlightDetailService {
	public ArrayList<FlightTicketBean> getArticle_detail_go(int ticketNum1) throws Exception{
		
		ArrayList<FlightTicketBean> articleList1 = null;
		
		Connection con = getConnection();
		Flightdao flightdao = Flightdao.getInstance();
		flightdao.setConnection(con);
		articleList1 = flightdao.TicketNum(ticketNum1);
		
		close(con);
		return articleList1;
	}

	public ArrayList<FlightTicketBean> getArticle_detail_back(int ticketNum2) throws Exception{
		
		ArrayList<FlightTicketBean> articleList2 = null;
		
		Connection con = getConnection();
		Flightdao flightdao = Flightdao.getInstance();
		flightdao.setConnection(con);
		articleList2 = flightdao.TicketNum(ticketNum2);
		
		close(con);
		return articleList2;
	}
}
