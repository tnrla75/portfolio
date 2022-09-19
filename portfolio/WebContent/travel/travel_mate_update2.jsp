<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="travel_package.MateController" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
			String id= (String)session.getAttribute("mb_id");
			String travelmateTitle= request.getParameter("travelmateTitle");
			String destination= request.getParameter("destination");
			String travelmateMember= request.getParameter("travelmateMember");
			String travelmateContent= request.getParameter("travelmateContent");
			String departureDate= request.getParameter("startdate");
			String arriveDate= request.getParameter("arrivedate");
			String reservation= request.getParameter("reservation");
			String travelmateDate= request.getParameter("writedate");
			String travelmateNum= request.getParameter("travelmateNum");
			MateController mc = new MateController();
			mc.update(id, travelmateTitle,destination,travelmateMember,travelmateContent,departureDate,arriveDate,reservation,travelmateDate,travelmateNum);
			response.sendRedirect("travel_mate.jsp");
	%>
</body>
</html>