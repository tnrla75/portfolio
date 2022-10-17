<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="vo.Member_info"%>   
<%
	Member_info list = (Member_info)request.getAttribute("list");
	if(list !=null){
%>
1
<%}else{%>
0
<%}%>