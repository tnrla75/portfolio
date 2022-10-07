package travel_package;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;


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
	public ArrayList<RouteDTO> routeselect() {
		ArrayList<RouteDTO> arr = new ArrayList<RouteDTO>();
		
		try{
			conn();
			
			String command = "select * from travel_route;";
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
