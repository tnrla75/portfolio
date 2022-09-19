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
	System.out.print("make call");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String writer = (String) session.getAttribute("mb_id");
	RouteController control = new RouteController();
	control.routeinsert(title, content, writer);
	
	response.sendRedirect("travel_route.jsp");
	%>
</body>
</html>