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
	
	String remove_num = request.getParameter("remove_num");
	
	RouteController control = new RouteController();
	control.routeRemove(remove_num);
	response.sendRedirect("travel_route.jsp");
	%>
</body>
</html>