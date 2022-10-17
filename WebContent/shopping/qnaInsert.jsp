<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Item.DBconnect" %>
<!DOCTYPE html>


<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	 	request.setCharacterEncoding("utf-8");

		String mb_id = (String) session.getAttribute("mb_id");
		String itemCode = (String)session.getAttribute("itemCode");
		String qsubject = request.getParameter("qsubject");
		String question = request.getParameter("question");

		out.println(itemCode);
		DBconnect db = new DBconnect();
		db.qnaInsert(mb_id, itemCode, qsubject, question);

		
		response.sendRedirect("itemDetail.shop?itemCode="+itemCode);
	%>
	
</body>
</html>