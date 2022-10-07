
<%@page import="dao.Hotel_DAO"%>
<%@page import="vo.Hotel_review_DB"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
		
	request.setCharacterEncoding("UTF-8");
	
	String hot_re_num =request.getParameter("hot_re_num");
	String hot_main_num=request.getParameter("hot_main_num");
	/* String hotel_review_num = (String) request.getAttribute("hotel_review_num"); */
	
	String hot_re_id=request.getParameter("hot_re_id");
	String hot_country=request.getParameter("hot_country");
	String hot_re_title=request.getParameter("hot_re_title");
	String hot_re_content=request.getParameter("hot_re_content");
	String hot_re_comments=request.getParameter("hot_re_comments");
	String hot_re_date=request.getParameter("hot_re_date");
	
	
	String id=(String)session.getAttribute("id");
	
	
	
	Hotel_DAO upddate = new Hotel_DAO();
	
	upddate.update_01(hot_re_num, hot_main_num, hot_re_id, hot_re_content, hot_re_date);
	

	 response.sendRedirect("Hotel_review_01.jsp"); 
	
	
%>
</body>
</html>