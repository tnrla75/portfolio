<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%
	String mb_id = request.getParameter("mb_id");
	Connection conn = null;
	Statement stmt = null;
	int data =2;
	try{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/portfolio","root","1645");
		stmt = conn.createStatement();
		String command = "select * from member_info where mb_id= '" + mb_id + "'";
		ResultSet rs = stmt.executeQuery(command);
		// 중복됐을경우 0, 아직 중복버튼을안눌렀을 경우 2 , 가입가능한경우 1
		
		if(rs.next()){
			String id = rs.getString("mb_id");
			System.out.println("중복될경우 if문");
			data = 0;
			System.out.println("0 : " + data);
			
			
		}else{
			System.out.println("중복없을 경우 else문");
			data = 1;
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