<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import= "java.util.ArrayList"%>   
<%@ page import="travel_package.MateController" %>    
<%@ page import="travel_package.MateDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		MateController user = new MateController();
		String travelmateNum= request.getParameter("travelmateNum");
		System.out.println(travelmateNum);
		user.delete(travelmateNum);
		response.sendRedirect("travel_mate.jsp");
	%>
</body>
</html>
