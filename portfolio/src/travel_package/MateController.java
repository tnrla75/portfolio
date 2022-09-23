package travel_package;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import travel_package.MateDTO;

public class MateController {
	Connection conn = null;
	Statement stmt = null;
	
	public ArrayList<MateDTO> select(){
		ArrayList<MateDTO> dbal = new ArrayList<MateDTO>();
		try {
			dbc();
			ResultSet rs = stmt.executeQuery("select*from travel_mate;");    
			while(rs.next()){
				MateDTO nmd = new MateDTO();  
				nmd.setTravelmateNum(rs.getString("travelmateNum"));
				nmd.setRouteNum(rs.getString("routeNum"));
				nmd.setId(rs.getString("id"));
				nmd.setTravelmateTitle(rs.getString("travelmateTitle"));
				nmd.setTravelmateDate(rs.getString("travelmateDate"));
				nmd.setTravelmateContent(rs.getString("travelmateContent"));
				nmd.setDestination(rs.getString("destination"));
				nmd.setTravelmateMember(rs.getString("travelmateMember"));
				nmd.setDepartureDate(rs.getString("departureDate"));
				nmd.setArriveDate(rs.getString("arriveDate"));
				nmd.setReservationstatus(rs.getString("reservationstatus"));
				dbal.add(nmd);
			}
		}catch(Exception e){	
		}
		finally{
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
		System.out.println(dbal);
		return dbal;                         
		}
	
	public void insert(String id,String travelmateTitle,String destination,String travelmateMember,String travelmateContent,String departureDate,String arriveDate,String reservation,String travelmateDate){
		try{
			dbc();
			String command = String.format("insert into travel_mate (id, travelmateTitle,destination,travelmateMember,travelmateContent,departureDate,arriveDate,reservationstatus,travelmateDate) values ('%s','%s','%s','%s','%s','%s','%s','%s','%s')"
											,id, travelmateTitle,destination,travelmateMember,travelmateContent,departureDate,arriveDate,reservation,travelmateDate);
			System.out.println(command+"=df");
			int rowNum = stmt.executeUpdate(command);
		}catch(Exception e){	
		}
		finally{
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
	
	public void update(String id,String travelmateTitle,String destination,String travelmateMember,String travelmateContent,String departureDate,String arriveDate,String reservation,String travelmateDate,String travelmateNum){
		try{
			dbc();
			String command = String.format("update travel_mate set id :='%s', travelmateTitle :='%s',destination :='%s',travelmateMember :='%s',travelmateContent :='%s',departureDate :='%s',arriveDate :='%s',reservationstatus :='%s',travelmateDate :='%s' where travelmateNum="+travelmateNum+";"
											,id, travelmateTitle,destination,travelmateMember,travelmateContent,departureDate,arriveDate,reservation,travelmateDate);
			int rowNum = stmt.executeUpdate(command);
		}catch(Exception e){	
		}
		finally{
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
	
	public ArrayList<MateDTO> Updateselect(String num){
		ArrayList<MateDTO> dbal = new ArrayList<MateDTO>();
		try {
			dbc();
			ResultSet rs = stmt.executeQuery("select*from travel_mate where travelmateNum="+num+";");    
			while(rs.next()){
				MateDTO nmd = new MateDTO();  
				nmd.setTravelmateNum(rs.getString("travelmateNum"));
				nmd.setRouteNum(rs.getString("routeNum"));
				nmd.setId(rs.getString("id"));
				nmd.setTravelmateTitle(rs.getString("travelmateTitle"));
				nmd.setTravelmateDate(rs.getString("travelmateDate"));
				nmd.setTravelmateContent(rs.getString("travelmateContent"));
				nmd.setTravelmateComents(rs.getString("travelmateComents"));
				nmd.setTravelmatePhoto(rs.getString("travelmatePhoto"));
				nmd.setDestination(rs.getString("destination"));
				nmd.setTravelmateMember(rs.getString("travelmateMember"));
				nmd.setDepartureDate(rs.getString("departureDate"));
				nmd.setArriveDate(rs.getString("arriveDate"));
				nmd.setReservationstatus(rs.getString("reservationstatus"));
				dbal.add(nmd);
			}
		}catch(Exception e){	
		}
		finally{
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
		return dbal;                         
		}
	
	public ArrayList<MateDTO> detail(String travelNum){
		ArrayList<MateDTO> dbal = new ArrayList<MateDTO>();
		try {
			dbc();
			ResultSet rs = stmt.executeQuery("select*from travel_mate where travelmateNum="+travelNum+";");    
			while(rs.next()){
				MateDTO nmd2 = new MateDTO();  
				nmd2.setTravelmateNum(rs.getString("travelmateNum"));
				nmd2.setRouteNum(rs.getString("routeNum"));
				nmd2.setId(rs.getString("id"));
				nmd2.setTravelmateTitle(rs.getString("travelmateTitle"));
				nmd2.setTravelmateDate(rs.getString("travelmateDate"));
				nmd2.setTravelmateContent(rs.getString("travelmateContent"));
				nmd2.setDestination(rs.getString("destination"));
				nmd2.setTravelmateMember(rs.getString("travelmateMember"));
				nmd2.setDepartureDate(rs.getString("departureDate"));
				nmd2.setArriveDate(rs.getString("arriveDate"));
				nmd2.setReservationstatus(rs.getString("reservationstatus"));
				dbal.add(nmd2);
			}
		}catch(Exception e){	
		}
		finally{
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
		return dbal;                         
		}
	
	public void delete(String travelmateNum){
		try{
			dbc();
			System.out.println("bb");
			String command = String.format("delete from travel_mate where travelmateNum='%s'",travelmateNum);
			int rowNum = stmt.executeUpdate(command);
		}catch(Exception e){	
		}
		finally{
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
	
	
	public void dbc() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/portfolio?characterEncoding=utf8","root","0000");
			stmt=conn.createStatement();
		}catch(Exception e){
		}
	}
}
