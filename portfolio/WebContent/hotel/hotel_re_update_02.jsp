
<%@page import="dao.Hotel_DAO"%>
<%@page import="vo.Hotel_review_DTO"%>
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
	
	String hot_re_id=request.getParameter("mb_id");
	String hot_country=request.getParameter("hot_country");
	
	String hot_re_content=request.getParameter("hot_re_content");
	
	
	String hot_re_rate=request.getParameter("hot_re_rate");		
	
	System.out.println(hot_main_num+" update 02");
	
	Hotel_DAO upddate = new Hotel_DAO();
	
	upddate.reviewupdate_01(hot_re_num,hot_main_num,hot_re_id,hot_re_content,hot_re_rate);
	
	response.sendRedirect("../hotel/hotelRoomForm.ho?hot_re_num="+hot_re_num+"&hot_main_num="+hot_main_num+"&hot_re_rate="+hot_re_rate); 
	
%>
</body>
</html>