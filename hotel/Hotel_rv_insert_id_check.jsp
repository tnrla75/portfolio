<%@page import="portfolio_02.Hotel_review_DB"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*"%>
   

<%
		
		String login_id = request.getParameter("login_id");
		String hotel_review_id=(String) session.getAttribute("id");
		Connection conn = null;
		Statement stmt = null;
		String data = null;
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/portfolio","root","1234");  //DB
			stmt=conn.createStatement();
			
			ResultSet rs = stmt.executeQuery("select*from hotel_review_sub;");
			
			while(rs.next()){
				String id = rs.getString("mb_id");
				String hotel_id = rs.getString ("hotel_id");
				if(id==null){
					data="0";
					
					
					break;
				}else{
					data="1";
					session.setAttribute("mb_id", id);
				}		
			}	
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
	%>    
    
 