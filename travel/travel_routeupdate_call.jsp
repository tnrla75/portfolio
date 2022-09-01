<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="route_package.RouteController" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	
	String routeNum = request.getParameter("routeNum");
	
	RouteController control = new RouteController();
	System.out.println(routeNum);
	control.routeNumselect(routeNum);
	
	response.sendRedirect("travel_routemake.jsp?routeNum='"+routeNum);
	%>
</body>
</html>