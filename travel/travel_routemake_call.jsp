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
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String writer = (String) session.getAttribute("id");
	
	RouteController control = new RouteController();
	control.routeinsert(title, content, writer);
	
	System.out.println(title + " " + content + " " + writer);
	
	response.sendRedirect("travel_route.jsp");
	%>
</body>
</html>