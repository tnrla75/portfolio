<%@page import="hotel_package.Java_main"%>
<%@page import="hotel_package.Hotel_review_DB"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*"%>

<jsp:useBean id="members" class="hotel_package.Java_main"/>
<%
	request.setCharacterEncoding("UTF-8");
	
	String hotel_review_num=request.getParameter("hotel_review_num");

	members.delete_01(hotel_review_num);
	
	response.sendRedirect("Hotel_review_01.jsp");
%>
