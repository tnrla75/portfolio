<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="travel_package.RouteController" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	
	String routeNum = request.getParameter("routeNum");
	String content = request.getParameter("content");
	String title = request.getParameter("title");
	
	System.out.println(routeNum +" "+ content+ " "+ title);
	
	RouteController control = new RouteController();
	
	control.routeupdate(routeNum, content, title);
	
	response.sendRedirect("travel_route.jsp");
	%>
</body>
</html>