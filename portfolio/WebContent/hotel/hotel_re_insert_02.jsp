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
<title>리뷰 저장</title>

</head>
<body>
<%
		
	request.setCharacterEncoding("UTF-8");
	
	String hot_main_num=request.getParameter("hot_main_num");
	System.out.println(hot_main_num+" insert02");
	
	String mb_id=(String)session.getAttribute("mb_id");
	String hot_re_rate=request.getParameter("hot_re_rate");		

	
	String hot_re_content=request.getParameter("hot_re_content");   // insert_02에서 가져옴.
	
	Hotel_DAO ins = new Hotel_DAO();
	
	ins.insert_01(hot_main_num,mb_id,hot_re_content,hot_re_rate);
	
	response.sendRedirect("../hotel/hotelRoomForm.ho?hot_main_num="+hot_main_num); 
	
	
%>
</body>
</html>