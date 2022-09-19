package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Locale;

import javax.sql.DataSource;

import jdk.nashorn.internal.ir.RuntimeNode.Request;

import vo.FlightTicketBean;

public class Flightdao {
	
	DataSource ds;
	Connection con;
	
	private static Flightdao Flightdao;

	private Flightdao() {
	}

	public static Flightdao getInstance(){
		if(Flightdao == null){
			Flightdao = new Flightdao();
		}
		return Flightdao;
	}
	// �떛湲��넠�뙣�꽩 = 媛앹껜 �븳踰� 留뚮뱾怨� 洹몄씠�썑濡� �븞留뚮벉

	public void setConnection(Connection con){
		this.con = con;
	}

	public ArrayList<FlightTicketBean> selectArticleList(String departure,String arrive, String people, String seat, String departureday, int page,int limit){
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String FlightTicket_sql="select * from flight_ticket where flight_departure=? and flight_arrival=? and flight_departureDay=? order by flight_Ticket_Price asc limit ?, 10 ;";
		ArrayList<FlightTicketBean> ticketBeanList = new ArrayList<FlightTicketBean>();
		FlightTicketBean ticketBean = null;
		int startrow=(page-1)*10;
		SimpleDateFormat f = new SimpleDateFormat("HH:mm");
		Date d1 = null;
		Date d2 = null;
		try{
			
			pstmt = con.prepareStatement(FlightTicket_sql);
			
			pstmt.setString(1, departure);
			pstmt.setString(2, arrive);
			pstmt.setString(3, departureday);
			pstmt.setInt(4, startrow);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				System.out.println(pstmt);
				ticketBean = new FlightTicketBean();
				d1 = f.parse(rs.getString("flight_departureTime"));
				d2 = f.parse(rs.getString("flight_arrivalTime"));
				long time = d2.getTime()-d1.getTime();
				long timeM = time/60000;
				long timeH = time/3600000;
				if(timeM > 60) {
					timeM = timeM-60;
				}
				if(timeH ==0) {
					ticketBean.setEstimated_time(timeM+"분");
				}
				else{
					ticketBean.setEstimated_time(timeH+"시간"+timeM+"분");
				}
				ticketBean.setFlight_Ticket_Num(rs.getString("flight_Ticket_Name"));
				ticketBean.setFlight_name(rs.getString("flight_name"));
				ticketBean.setFlight_departure(rs.getString("flight_departure"));
				ticketBean.setFlight_arrival(rs.getString("flight_arrival"));
				ticketBean.setFlight_departureDay(rs.getDate("flight_departureDay"));
				ticketBean.setFlight_departureTime(rs.getString("flight_departureTime"));
				ticketBean.setFlight_arrivalTime(rs.getString("flight_arrivalTime"));
				ticketBean.setFlight_Ticket_Price(rs.getInt("flight_Ticket_Price"));

				ticketBeanList.add(ticketBean);
				
			}
		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}
		System.out.println(ticketBeanList);
		return ticketBeanList;
	}
	public ArrayList<FlightTicketBean> selectArticleList_turn(String departure,String arrive, String people, String seat, String arrivalday , int page,int limit){
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String FlightTicket_sql="select * from flight_ticket where flight_departure=? and flight_arrival=? and flight_departureDay=? ;";
		ArrayList<FlightTicketBean> ticketBeanList = new ArrayList<FlightTicketBean>();
		FlightTicketBean ticketBean = null;
		SimpleDateFormat f = new SimpleDateFormat("HH:mm");
		Date d1 = null;
		Date d2 = null;

		try{
			pstmt = con.prepareStatement(FlightTicket_sql);
			pstmt.setString(1, arrive);
			pstmt.setString(2, departure);
			pstmt.setString(3, arrivalday);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				ticketBean = new FlightTicketBean();
				d1 = f.parse(rs.getString("flight_departureTime"));
				d2 = f.parse(rs.getString("flight_arrivalTime"));
				long time = d2.getTime()-d1.getTime();
				long timeM = time/60000;
				long timeH = time/3600000;
				if(timeM > 60) {
					timeM = timeM-60;
				}
				if(timeH ==0) {
					ticketBean.setEstimated_time(timeM+"遺�");
				}
				else{
					ticketBean.setEstimated_time(timeH+"�떆媛�"+timeM+"遺�");
				}
				
				
				ticketBean.setFlight_Ticket_Num(rs.getString("flight_Ticket_Name"));
				ticketBean.setFlight_name(rs.getString("flight_name"));
				ticketBean.setFlight_departure(rs.getString("flight_departure"));
				ticketBean.setFlight_arrival(rs.getString("flight_arrival"));
				ticketBean.setFlight_departureDay(rs.getDate("flight_departureDay"));
				ticketBean.setFlight_departureTime(rs.getString("flight_departureTime"));
				ticketBean.setFlight_arrivalTime(rs.getString("flight_arrivalTime"));
				ticketBean.setFlight_Ticket_Price(rs.getInt("flight_Ticket_Price"));

				ticketBeanList.add(ticketBean);
			}
		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}
		return ticketBeanList;
	}
public ArrayList<FlightTicketBean> selectArticleList_oneway(String departure,String arrive, String people, String seat, String departureday, int page,int limit){
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		String FlightTicket_sql="select * from flight_ticket where flight_departure=? and flight_arrival=? and flight_departureDay=? order by flight_Ticket_Price asc limit ?, 10 ;";

		int startrow=(page-1)*10;
		
		
		ArrayList<FlightTicketBean> ticketBeanList = new ArrayList<FlightTicketBean>();
		FlightTicketBean ticketBean = null;
		SimpleDateFormat f = new SimpleDateFormat("HH:mm");
		Date d1 = null;
		Date d2 = null;
		try{
			pstmt = con.prepareStatement(FlightTicket_sql);
			pstmt.setString(1, departure);
			pstmt.setString(2, arrive);
			pstmt.setString(3, departureday);
			pstmt.setInt(4, startrow);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				ticketBean = new FlightTicketBean();
				
				d1 = f.parse(rs.getString("flight_departureTime"));
				d2 = f.parse(rs.getString("flight_arrivalTime"));
				long time = d2.getTime()-d1.getTime();
				long timeM = time/60000;
				long timeH = time/3600000;
				if(timeM > 60) {
					timeM = timeM-60;
				}
				if(timeH ==0) {
					ticketBean.setEstimated_time(timeM+"遺�");
				}
				else{
					ticketBean.setEstimated_time(timeH+"�떆媛�"+timeM+"遺�");
				}
				
				ticketBean.setFlight_Ticket_Num(rs.getString("flight_Ticket_Name"));
				ticketBean.setFlight_name(rs.getString("flight_name"));
				ticketBean.setFlight_departure(rs.getString("flight_departure"));
				ticketBean.setFlight_arrival(rs.getString("flight_arrival"));
				ticketBean.setFlight_departureDay(rs.getDate("flight_departureDay"));
				ticketBean.setFlight_departureTime(rs.getString("flight_departureTime"));
				ticketBean.setFlight_arrivalTime(rs.getString("flight_arrivalTime"));
				ticketBean.setFlight_Ticket_Price(rs.getInt("flight_Ticket_Price"));
			
				ticketBeanList.add(ticketBean);
			}
		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}
		return ticketBeanList;
	}

	public ArrayList<FlightTicketBean> selectArticleFliter(String departure,String arrive, String people, String seat, String departureday, int page,int limit, String arr){
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String FlightTicket_sql ="";
		
		FlightTicket_sql ="select * from flight_ticket where flight_departure=? and flight_arrival=? and flight_departureDay=? ";
	
		int startrow=(page-1)*10;
		
		String[] filterArr = arr.split(",");
		
		for(int i=0; i<filterArr.length; i++) {
			if(filterArr[i].equals("�젣二�")) {
				FlightTicket_sql+=" and flight_name='�젣二�'";
			}else if(filterArr[i].equals("�븘�떆�븘�굹")) {
				FlightTicket_sql+=" or flight_name='�븘�떆�븘�굹'";
			}
		}
		FlightTicket_sql += " order by flight_Ticket_Price asc limit ?, 10 ;";
		
		ArrayList<FlightTicketBean> ticketBeanList = new ArrayList<FlightTicketBean>();
		FlightTicketBean ticketBean = null;
		SimpleDateFormat f = new SimpleDateFormat("HH:mm");
		Date d1 = null;
		Date d2 = null;
		try{
			pstmt = con.prepareStatement(FlightTicket_sql);
			pstmt.setString(1, departure);
			pstmt.setString(2, arrive);
			pstmt.setString(3, departureday);
			pstmt.setInt(4, startrow);
			
			rs = pstmt.executeQuery();
			while(rs.next()){
				ticketBean = new FlightTicketBean();
				d1 = f.parse(rs.getString("flight_departureTime"));
				d2 = f.parse(rs.getString("flight_arrivalTime"));
				long time = d2.getTime()-d1.getTime();
				long timeM = time/60000;
				long timeH = time/3600000;
				if(timeM > 60) {
					timeM = timeM-60;
				}
				if(timeH ==0) {
					ticketBean.setEstimated_time(timeM+"遺�");
				}
				else{
					ticketBean.setEstimated_time(timeH+"�떆媛�"+timeM+"遺�");
				}
				
				ticketBean.setFlight_Ticket_Num(rs.getString("flight_Ticket_Name"));
				ticketBean.setFlight_name(rs.getString("flight_name"));
				ticketBean.setFlight_departure(rs.getString("flight_departure"));
				ticketBean.setFlight_arrival(rs.getString("flight_arrival"));
				ticketBean.setFlight_departureDay(rs.getDate("flight_departureDay"));
				ticketBean.setFlight_departureTime(rs.getString("flight_departureTime"));
				ticketBean.setFlight_arrivalTime(rs.getString("flight_arrivalTime"));
				ticketBean.setFlight_Ticket_Price(rs.getInt("flight_Ticket_Price"));
			
				ticketBeanList.add(ticketBean);
			}
		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}
		System.out.println(ticketBeanList);
		return ticketBeanList;
	}
	public int selectListCountFilter(String departure,String arrive, String people, String seat, String departureday, String arr) {
		
		int listCount= 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String FlightTicket_sql="select count(*) from flight_ticket where flight_departure=? and flight_arrival=? and flight_departureDay=?";
		
		String[] filterArr = arr.split(",");
		for(int i=0; i<filterArr.length; i++) {
			if(filterArr[i].equals("�젣二�")) {
				FlightTicket_sql+=" and flight_name='�젣二�'";
			}else if(filterArr[i].equals("�븘�떆�븘�굹")) {
				FlightTicket_sql+=" or flight_name='�븘�떆�븘�굹'";
			}
		}
		
		try{
			pstmt=con.prepareStatement(FlightTicket_sql);
			pstmt.setString(1, departure);
			pstmt.setString(2, arrive);
			pstmt.setString(3, departureday);
			rs = pstmt.executeQuery();
			if(rs.next()){
				listCount=rs.getInt(1);
			}
		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}
		return listCount;
	}


	public int selectListCount(String departure,String arrive, String people, String seat, String departureday) {
	
		int listCount= 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String FlightTicket_sql="select count(*) from flight_ticket where flight_departure=? and flight_arrival=? and flight_departureDay=?";
		
		try{
			pstmt=con.prepareStatement(FlightTicket_sql);
			pstmt.setString(1, departure);
			pstmt.setString(2, arrive);
			pstmt.setString(3, departureday);
			rs = pstmt.executeQuery();
			if(rs.next()){
				listCount=rs.getInt(1);
			}
		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}
		return listCount;
	}
	
	
	
}
