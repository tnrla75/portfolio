
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@ page trimDirectiveWhitespaces="true" %>


<%
		
		String login_id = request.getParameter("login_id");
		String login_pw = request.getParameter("login_pw");
		Connection conn = null;
		Statement stmt = null;
		String data = null;
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/portfolio","root","1645");  //DB
			stmt=conn.createStatement();
			
			ResultSet rs = stmt.executeQuery("select*from member_info;");
			
			
			while(rs.next()){
				String id = rs.getString("mb_id");
				String pw = rs.getString ("mb_pw");
				if((id.equals(login_id))&&(pw.equals(login_pw))){
					data="1";
					break;
				}else{
					data="0";
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
	System.out.println(data);
	%>
	<%=data %>
