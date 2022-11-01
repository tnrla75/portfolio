package travel_package;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import vo.Travel_selectroute;


public class RouteController {
	Connection conn = null;
	Statement stmt = null;
	
	public void routeinsert(String title,String content,String writer) {
		
		try{
			System.out.println("bb");
			conn();
			String command = String.format
					("insert into travel_route (routeTitle, routeContent, id) values ('%s','%s','%s');", title, content, writer);
			System.out.println(command);
			int rowNum = stmt.executeUpdate(command);

			System.out.println(title + " " + content + " aa " + writer);
		}catch(Exception e){
			System.out.println("aa");
		}
		close();
	}
	public ArrayList<Travel_selectroute> routeselect() {
		ArrayList<Travel_selectroute> arr = new ArrayList<Travel_selectroute>();
		
		try{
			conn();
			
			String command = "select travel_makeroute.*,travel_local.local_latitude,travel_local.local_longitude,local_img from travel_local left outer join travel_makeroute on travel_makeroute.local= travel_local.local_name where travel_makeroute.local = travel_local.local_name;";
			ResultSet rs = stmt.executeQuery(command);
			while(rs.next()) {
				Travel_selectroute select = new Travel_selectroute();
				select.setRoutetitle(rs.getString("routetitle"));
				select.setWritedate(rs.getString("writedate"));
				select.setMb_id(rs.getString("mb_id"));
				select.setLocal(rs.getString("local"));
				select.setLocal_img(rs.getString("local_img"));
				select.setLocal_latitude(rs.getString("local_latitude"));
				select.setLocal_longitude(rs.getString("local_longitude"));
				select.setRoute1_1(rs.getString("route1_1"));
				select.setRoute1_2(rs.getString("route1_2"));
				select.setRoute1_3(rs.getString("route1_3"));
				select.setRoute1_4(rs.getString("route1_4"));
				select.setRoute1_5(rs.getString("route1_5"));
				select.setRoute2_1(rs.getString("route2_1"));
				select.setRoute2_2(rs.getString("route2_2"));
				select.setRoute2_3(rs.getString("route2_3"));
				select.setRoute2_4(rs.getString("route2_4"));
				select.setRoute2_5(rs.getString("route2_5"));
				select.setRoute3_1(rs.getString("route3_1"));
				select.setRoute3_2(rs.getString("route3_2"));
				select.setRoute3_3(rs.getString("route3_3"));
				select.setRoute3_4(rs.getString("route3_4"));
				select.setRoute3_5(rs.getString("route3_5"));
				select.setRoute4_1(rs.getString("route4_1"));
				select.setRoute4_2(rs.getString("route4_2"));
				select.setRoute4_3(rs.getString("route4_3"));
				select.setRoute4_4(rs.getString("route4_4"));
				select.setRoute4_5(rs.getString("route4_5"));
				select.setRoute5_1(rs.getString("route5_1"));
				select.setRoute5_2(rs.getString("route5_2"));
				select.setRoute5_3(rs.getString("route5_3"));
				select.setRoute5_4(rs.getString("route5_4"));
				select.setRoute5_5(rs.getString("route5_5"));
				
				
				arr.add(select);
			}
		}catch(Exception e){
			System.out.println("catch");
		}
		close();
		return arr;
	}
	
	public ArrayList<RouteDTO> routeNumselect(String num) {
		ArrayList<RouteDTO> arr = new ArrayList<RouteDTO>();
		
		try{
			conn();
			String command = "select * from travel_route where routeNum="+num+";";
			ResultSet rs = stmt.executeQuery(command);
			while(rs.next()) {
				RouteDTO select = new RouteDTO();
				select.setRouteTitle(rs.getString("routeTitle"));
				select.setId(rs.getString("id"));
				select.setRouteContent(rs.getString("routeContent"));
				select.setRouteNum(rs.getString("routeNum"));
				
				arr.add(select);

			}
		}catch(Exception e){
			System.out.println("catch");
		}
		close();
		return arr;
	}
	public ArrayList<RouteDTO> routeupdate(String num, String routeContent, String title) {
		ArrayList<RouteDTO> arr = new ArrayList<RouteDTO>();
		
		try{
			conn();
			String command = String.format("update travel_route set routeContent :='%s', routeTitle :='%s' where routeNum="+num+";" ,routeContent, title);
			int rowNum = stmt.executeUpdate(command);
		}catch(Exception e){
			System.out.println("catch");
		}
		close();
		return arr;
	}
	public void routeRemove(String num) {
		
		try{
			conn();
			String command = "delete from travel_route where routeNum="+num+";";
			int rowNum = stmt.executeUpdate(command);
			
		}catch(Exception e){
			System.out.println("catch");
		}
		close();
		
	}
	
	void conn() {
		try{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/portfolio?characterEncoding=utf8","root","1645");
		stmt = conn.createStatement();
		}
		catch(Exception e){
		}
	}
	void close() {
		
		try{
			stmt.close();
		}
		catch(Exception e){
		}
		try{
			conn.close();
		}
		catch(Exception e){
		}
		
	}
}
