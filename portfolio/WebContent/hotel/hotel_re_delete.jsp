<%@page import="dao.Hotel_DAO"%>
<%@page import="vo.Hotel_review_DTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*"%>

<jsp:useBean id="members" class="dao.Hotel_DAO"/>
<%
	request.setCharacterEncoding("UTF-8");
	String hot_re_num=request.getParameter("hot_re_num");
	String hot_main_num=request.getParameter("hot_main_num");
	members.delete_01(hot_re_num);
	
	response.sendRedirect("../hotel/hotelRoomForm.ho?hot_main_num="+hot_main_num);
%>
