<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import= "java.util.ArrayList"%>   
<%@ page import="mate_package.MateConnect" %>    
<%@ page import="mate_package.MateDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<% 
	MateConnect user = new MateConnect();
	String travelmateNum= request.getParameter("num");
	user.delete(travelmateNum);
	response.sendRedirect("travel_mate.jsp");
	%>
</body>
</html>