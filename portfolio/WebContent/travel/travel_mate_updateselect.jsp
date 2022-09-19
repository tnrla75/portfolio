<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="travel_package.MateController" %> 
    <%@ page import= "java.util.ArrayList"%> 
    <%@ page import="travel_package.MateDTO" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	String num= request.getParameter("num");
	MateController mc = new MateController();
	ArrayList<MateDTO> customer2 =mc.Updateselect(num);
	response.sendRedirect("travel_mate_update.jsp?customer2="+customer2+";");
	%>
</body>
</html>