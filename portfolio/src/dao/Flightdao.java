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

public ArrayList<FlightTicketBean> selectArticleList_go(String departure,String arrive, String people, String seat, String departureday, int page,int limit){
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String FlightTicket_sql="select * from flight_ticket where flight_departure=? and flight_arrival=? and flight_departureDay=? order by flight_Ticket_Price asc limit ?, 10 ";
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
				ticketBean.setFlight_Ticket_Num(rs.getString("flight_Ticket_Num"));
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
			System.out.println("실패");
		}finally{
			close(rs);
			close(pstmt);
		}
		return ticketBeanList;
	}
	public ArrayList<FlightTicketBean> selectArticleList_back(String departure,String arrive, String people, String seat, String arrivalday , int page,int limit){
		System.out.println(departure + " / " + arrive + " / " + arrivalday);
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String FlightTicket_sql="select * from flight_ticket where flight_departure=? and flight_arrival=? and flight_departureDay=? order by flight_Ticket_Price asc limit ?, 10 ";
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
			pstmt.setString(3, arrivalday);
			pstmt.setInt(4, startrow);
			System.out.println(pstmt);
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
					ticketBean.setEstimated_time(timeM+"분");
				}
				else{
					ticketBean.setEstimated_time(timeH+"시간"+timeM+"분");
				}
				ticketBean.setFlight_Ticket_Num(rs.getString("flight_Ticket_Num"));
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
			System.out.println("실패");
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
					ticketBean.setEstimated_time(timeM+"분");
				}
				else{
					ticketBean.setEstimated_time(timeH+"시"+timeM+"분");
				}
				
				ticketBean.setFlight_Ticket_Num(rs.getString("flight_Ticket_Num"));
				ticketBean.setFlight_name(rs.getString("flight_name"));
				ticketBean.setFlight_departure(rs.getString("flight_departure"));
				ticketBean.setFlight_arrival(rs.getString("flight_arrival"));
				ticketBean.setFlight_departureDay(rs.getDate("flight_departureDay"));
				ticketBean.setFlight_departureTime(rs.getString("flight_departureTime"));
				ticketBean.setFlight_arrivalTime(rs.getString("flight_arrivalTime"));
				ticketBean.setFlight_Ticket_Price(rs.getInt("flight_Ticket_Price"));
				ticketBean.setFlight_airplaneName(rs.getString("flight_airplaneName"));
			
				ticketBeanList.add(ticketBean);
			}
		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}
		return ticketBeanList;
	}

	public ArrayList<FlightTicketBean> selectArticleFliter_go(String departure, String arrive, String people, String seat, String departureday, String startleftval1 , String startrightval1 , String startleftval2 , String startrightval2, int page,int limit, String arr){
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String FlightTicket_sql ="";
		
		FlightTicket_sql ="select * from flight_ticket where flight_departure=? and flight_arrival=? and flight_departureDay=? and (";
		
		System.out.println(startleftval1 + " / " + startrightval1 + " / " + startleftval2 + " / " + startrightval2 + " / ");
		
		int startrow=(page-1)*10;
		System.out.println(arr);
		String[] filterArr = arr.split(",");
		System.out.println("filterArr : " + filterArr.length);
		if(filterArr.length >= 2) {
			FlightTicket_sql+="(";
		}
		for(int i=0; i<filterArr.length; i++) {
			
			if(filterArr[i].equals("제주")) {
				FlightTicket_sql+="flight_name='제주'";
			}else if(filterArr[i].equals("아시아나")) {
				FlightTicket_sql+="flight_name='아시아나'";
			}else if(filterArr[i].equals("대한")) {
				FlightTicket_sql+="flight_name='대한'";
			}
			if(i < filterArr.length-1){
				FlightTicket_sql+= " or ";
			}
			
		}
		if(filterArr.length >= 2) {
			FlightTicket_sql+=")";
		}
		if(!(startleftval1.equals("00") && startrightval1.equals("24") && startleftval2.equals("00") && startrightval2.equals("24"))) {
			if(arr.length() >= 1) {
				FlightTicket_sql+= " and ";
			}
			FlightTicket_sql+="flight_departureTime between '"+startleftval1+ "' and '"+startrightval1+"' and flight_arrivalTime between '"+startleftval2+"' and '"+startrightval2+"'";
		}
		FlightTicket_sql += ") order by flight_Ticket_Price asc limit ?, 10 ;";
		System.out.println("bb");
		
		ArrayList<FlightTicketBean> ticketBeanList = new ArrayList<FlightTicketBean>();
		FlightTicketBean ticketBean = null;
		SimpleDateFormat f = new SimpleDateFormat("HH:mm");
		Date d1 = null;
		Date d2 = null;
		System.out.println("cc");
		try{
			pstmt = con.prepareStatement(FlightTicket_sql);
			pstmt.setString(1, departure);
			pstmt.setString(2, arrive);
			pstmt.setString(3, departureday);
			System.out.println("ff");
			pstmt.setInt(4, startrow);
			System.out.println(pstmt);
			rs = pstmt.executeQuery();
			System.out.println("dao filter pstmt : "+pstmt);
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
					ticketBean.setEstimated_time(timeM+"분");
				}
				else{
					ticketBean.setEstimated_time(timeH+"분"+timeM+"시");
				}
				ticketBean.setFlight_Ticket_Num(rs.getString("flight_Ticket_Num"));
				ticketBean.setFlight_name(rs.getString("flight_name"));
				ticketBean.setFlight_departure(rs.getString("flight_departure"));
				ticketBean.setFlight_arrival(rs.getString("flight_arrival"));
				ticketBean.setFlight_departureDay(rs.getDate("flight_departureDay"));
				ticketBean.setFlight_departureTime(rs.getString("flight_departureTime"));
				ticketBean.setFlight_arrivalTime(rs.getString("flight_arrivalTime"));
				ticketBean.setFlight_Ticket_Price(rs.getInt("flight_Ticket_Price"));
				ticketBean.setFlight_airplaneName(rs.getString("flight_airplaneName"));
			
				ticketBeanList.add(ticketBean);
			}
		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}
		return ticketBeanList;
	}
	public int selectListCountFilter_go(String departure,String arrive, String people, String seat, String departureday, String startleftval1 , String startrightval1 , String startleftval2 , String startrightval2, String arr) {
		
		int listCount= 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String FlightTicket_sql ="select count(*) from flight_ticket where flight_departure=? and flight_arrival=? and flight_departureDay=? and (";
		
		String[] filterArr = arr.split(",");
		if(filterArr.length >= 2) {
			FlightTicket_sql+="(";
		}
		for(int i=0; i<filterArr.length; i++) {
			
			if(filterArr[i].equals("제주")) {
				FlightTicket_sql+="flight_name='제주'";
			}else if(filterArr[i].equals("아시아나")) {
				FlightTicket_sql+="flight_name='아시아나'";
			}else if(filterArr[i].equals("대한")) {
				FlightTicket_sql+="flight_name='대한'";
			}
			if(i < filterArr.length-1){
				FlightTicket_sql+= " or ";
			}
			
		}
		if(filterArr.length >= 2) {
			FlightTicket_sql+=")";
		}
		if(!(startleftval1.equals("00") && startrightval1.equals("24") && startleftval2.equals("00") && startrightval2.equals("24"))) {
			if(arr.length() >= 1) {
				FlightTicket_sql+= " and ";
			}
			FlightTicket_sql+="flight_departureTime between "+startleftval1+ " and "+startrightval1+" and flight_arrivalTime between "+startleftval2+" and "+startrightval2;
		}
		FlightTicket_sql+= ")";
		try{
			pstmt=con.prepareStatement(FlightTicket_sql);
			pstmt.setString(1, departure);
			pstmt.setString(2, arrive);
			pstmt.setString(3, departureday);
			rs = pstmt.executeQuery();
			System.out.println(pstmt);
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
public ArrayList<FlightTicketBean> selectArticleFliter_back(String departure, String arrive, String people, String seat, String departureday, String startleftval1 , String startrightval1 , String startleftval2 , String startrightval2, int page,int limit, String arr){
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String FlightTicket_sql ="";
		
		FlightTicket_sql ="select * from flight_ticket where flight_departure=? and flight_arrival=? and flight_departureDay=? and (";
		
		System.out.println(startleftval1 + " / " + startrightval1 + " / " + startleftval2 + " / " + startrightval2 + " / ");
		
		int startrow=(page-1)*10;
		System.out.println(arr);
		String[] filterArr = arr.split(",");
		System.out.println("filterArr : " + filterArr.length);
		if(filterArr.length >= 2) {
			FlightTicket_sql+="(";
		}
		for(int i=0; i<filterArr.length; i++) {
			
			if(filterArr[i].equals("제주")) {
				FlightTicket_sql+="flight_name='제주'";
			}else if(filterArr[i].equals("아시아나")) {
				FlightTicket_sql+="flight_name='아시아나'";
			}else if(filterArr[i].equals("대한")) {
				FlightTicket_sql+="flight_name='대한'";
			}
			if(i < filterArr.length-1){
				FlightTicket_sql+= " or ";
			}
			
		}
		if(filterArr.length >= 2) {
			FlightTicket_sql+=")";
		}
		if(!(startleftval1.equals("00") && startrightval1.equals("24") && startleftval2.equals("00") && startrightval2.equals("24"))) {
			if(arr.length() >= 1) {
				FlightTicket_sql+= " and ";
			}
			FlightTicket_sql+="flight_departureTime between '"+startleftval1+ "' and '"+startrightval1+"' and flight_arrivalTime between '"+startleftval2+"' and '"+startrightval2+"'";
		}
		FlightTicket_sql += ") order by flight_Ticket_Price asc limit ?, 10 ;";
		System.out.println("bb");
		
		ArrayList<FlightTicketBean> ticketBeanList = new ArrayList<FlightTicketBean>();
		FlightTicketBean ticketBean = null;
		SimpleDateFormat f = new SimpleDateFormat("HH:mm");
		Date d1 = null;
		Date d2 = null;
		System.out.println("cc");
		try{
			pstmt = con.prepareStatement(FlightTicket_sql);
			pstmt.setString(1, departure);
			pstmt.setString(2, arrive);
			pstmt.setString(3, departureday);
			System.out.println("ff");
			pstmt.setInt(4, startrow);
			System.out.println(pstmt);
			rs = pstmt.executeQuery();
			System.out.println("dao filter back pstmt : "+pstmt);
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
					ticketBean.setEstimated_time(timeM+"분");
				}
				else{
					ticketBean.setEstimated_time(timeH+"분"+timeM+"시");
				}
				ticketBean.setFlight_Ticket_Num(rs.getString("flight_Ticket_Num"));
				ticketBean.setFlight_name(rs.getString("flight_name"));
				ticketBean.setFlight_departure(rs.getString("flight_departure"));
				ticketBean.setFlight_arrival(rs.getString("flight_arrival"));
				ticketBean.setFlight_departureDay(rs.getDate("flight_departureDay"));
				ticketBean.setFlight_departureTime(rs.getString("flight_departureTime"));
				ticketBean.setFlight_arrivalTime(rs.getString("flight_arrivalTime"));
				ticketBean.setFlight_Ticket_Price(rs.getInt("flight_Ticket_Price"));
				ticketBean.setFlight_airplaneName(rs.getString("flight_airplaneName"));
			
				ticketBeanList.add(ticketBean);
			}
		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}
		return ticketBeanList;
	}
	public int selectListCountFilter_back(String departure,String arrive, String people, String seat, String departureday, String startleftval1 , String startrightval1 , String startleftval2 , String startrightval2, String arr) {
	
		int listCount= 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String FlightTicket_sql ="select count(*) from flight_ticket where flight_departure=? and flight_arrival=? and flight_departureDay=? and (";
		
		String[] filterArr = arr.split(",");
		if(filterArr.length >= 2) {
			FlightTicket_sql+="(";
		}
		for(int i=0; i<filterArr.length; i++) {
			
			if(filterArr[i].equals("제주")) {
				FlightTicket_sql+="flight_name='제주'";
			}else if(filterArr[i].equals("아시아나")) {
				FlightTicket_sql+="flight_name='아시아나'";
			}else if(filterArr[i].equals("대한")) {
				FlightTicket_sql+="flight_name='대한'";
			}
			if(i < filterArr.length-1){
				FlightTicket_sql+= " or ";
			}
			
		}
		if(filterArr.length >= 2) {
			FlightTicket_sql+=")";
		}
		if(!(startleftval1.equals("00") && startrightval1.equals("24") && startleftval2.equals("00") && startrightval2.equals("24"))) {
			if(arr.length() >= 1) {
				FlightTicket_sql+= " and ";
			}
			FlightTicket_sql+="flight_departureTime between "+startleftval1+ " and "+startrightval1+" and flight_arrivalTime between "+startleftval2+" and "+startrightval2;
		}
		FlightTicket_sql+= ")";
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
	public int selectListCount_back(String departure,String arrive, String people, String seat, String departureday) {
		
		System.out.println("selectListCount_back 시작");
		int listCount= 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String FlightTicket_sql="select count(*) from flight_ticket where flight_departure=? and flight_arrival=? and flight_arrival=?";
		
		try{
			pstmt=con.prepareStatement(FlightTicket_sql);
			pstmt.setString(1, departure);
			pstmt.setString(2, arrive);
			pstmt.setString(3, departureday);
			rs = pstmt.executeQuery();
			System.out.println(pstmt);
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
	
	public ArrayList<FlightTicketBean> TicketNum(int ticketNum){
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String FlightTicket_sql="select * from flight_ticket where flight_Ticket_Num=?;";
		ArrayList<FlightTicketBean> ticketBeanList = new ArrayList<FlightTicketBean>();
		FlightTicketBean ticketBean = null;
		SimpleDateFormat f = new SimpleDateFormat("HH:mm");
		Date d1 = null;
		Date d2 = null;
		try{
			
			pstmt = con.prepareStatement(FlightTicket_sql);
			
			pstmt.setInt(1, ticketNum);
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
					ticketBean.setEstimated_time(timeM+"분");
				}
				else{
					ticketBean.setEstimated_time(timeH+"시간"+timeM+"분");
				}
				ticketBean.setFlight_Ticket_Num(rs.getString("flight_Ticket_Num"));
				ticketBean.setFlight_name(rs.getString("flight_name"));
				ticketBean.setFlight_departure(rs.getString("flight_departure"));
				ticketBean.setFlight_arrival(rs.getString("flight_arrival"));
				ticketBean.setFlight_departureDay(rs.getDate("flight_departureDay"));
				ticketBean.setFlight_departureTime(rs.getString("flight_departureTime"));
				ticketBean.setFlight_arrivalTime(rs.getString("flight_arrivalTime"));
				ticketBean.setFlight_Ticket_Price(rs.getInt("flight_Ticket_Price"));
				ticketBean.setFlight_airplaneName(rs.getString("flight_airplaneName"));

				ticketBeanList.add(ticketBean);
				
			}
		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}
		return ticketBeanList;
	}

	
}
