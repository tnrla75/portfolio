<%@page import="dao.Hotel_DAO"%>

<%@page import="vo.Hotel_review_DTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 저장</title>

</head>
<body>
<%
		
	request.setCharacterEncoding("UTF-8");
	
	String hot_qna_nation=request.getParameter("hot_qna_nation");

	
	
	String mb_id=(String)session.getAttribute("mb_id");
		

	
	String hot_qna_content=request.getParameter("hot_qna_content");   // insert_02에서 가져옴.
	
	Hotel_DAO ins = new Hotel_DAO();
	
	ins.qnainsert_01(mb_id,hot_qna_content,hot_qna_nation);
	
	response.sendRedirect("../hotel/qnaList.hot?command=qnaList"); 
	
	
%>
</body>
</html>