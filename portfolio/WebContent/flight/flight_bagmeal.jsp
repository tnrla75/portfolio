<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
String[] lastname= request.getParameterValues("lastname");
String[] firstname= request.getParameterValues("firstname");
String totalprice = request.getParameter("totalprice");
String[] box1 = request.getParameterValues("box1");
String[] box2 = request.getParameterValues("box2");
%>
</head>
<body>
<% for(int i = 0; i<lastname.length; i++){ %>
	<h3><%= box1[i] %></h3>
	<h4><%= box2[i] %></h4>
	<h5><%= lastname[i]%></h5>
	<h6><%= firstname[i]%></h6>
	<%} %>
	
	
	
</body>
</html>
