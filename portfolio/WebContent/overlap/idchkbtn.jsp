<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%
	String mb_id = request.getParameter("mb_id");
	Connection conn = null;
	Statement stmt = null;
	int data = -1;
	try{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/portfolio","root","1645");
		stmt = conn.createStatement();
		String command = "select * from member_info where mb_id= '" + mb_id + "'";
		ResultSet rs = stmt.executeQuery(command);
		while(rs.next()){
			String id = rs.getString("mb_id");
			if(id.equals(mb_id)){
				data = 0;
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
	<%= data %>