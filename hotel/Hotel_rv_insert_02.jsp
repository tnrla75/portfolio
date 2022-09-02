<%@page import="hotel_package.Java_main"%>
<%@page import="hotel_package.Hotel_review_DB"%>
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
	
	String hotel_review_num =request.getParameter("hotel_review_num");
	String hotel_add=request.getParameter("hotel_add");
	String hotel_name=request.getParameter("hotel_name");
	String hotel_rv_title=request.getParameter("hotel_rv_title");
	
	String hotel_rv_content=request.getParameter("hotel_rv_content");
	String hotel_rv_date=request.getParameter("hotel_rv_date");
	String mb_id=(String)session.getAttribute("mb_id");
	
	Java_main ins = new Java_main();
	
	
	ins.insert_01(hotel_review_num,hotel_add,hotel_name,hotel_rv_title,hotel_rv_content,mb_id,hotel_rv_date);
	

	response.sendRedirect("Hotel_review_01.jsp"); 
	
	
%>
</body>
</html>