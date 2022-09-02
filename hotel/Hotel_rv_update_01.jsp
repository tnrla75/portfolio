<%@page import="hotel_package.Java_main"%>
<%@page import="hotel_package.Hotel_review_DB"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>리뷰 수정</title>
	<meta charset="utf-8">
	<link href="https://fonts.googleapis.com/css2?family=Cairo&family=Indie+Flower&family=Koulen&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="../css/style.css" />
	<link rel="stylesheet" type="text/css" href="../css/header_footer.css">
	
    <script src="http://use.fontawesome.com/releases/v6.1.2/js/all.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<body>
<%
		String mb_id = (String)session.getAttribute("mb_id"); 
		if(mb_id == null){
			%>
			<jsp:include page="../overlap/header_login.jsp"/>
			<%
		}else{
			%>
			<jsp:include page="../overlap/header_logout.jsp"/>
			<%
		}
	%>
<jsp:useBean id="members" class="hotel_package.Java_main"/>
<script>
date =  new Date().toISOString().substring(0, 10);
$("#hotel_rv_date").val(date);
alert(hotel_rv_date);
</script>
<%
	request.setCharacterEncoding("UTF-8");

	String hotel_review_num=request.getParameter("hotel_review_num");
	String hotel_add=request.getParameter("hotel_add");
	String hotel_name=request.getParameter("hotel_name");
	String hotel_rv_title=request.getParameter("hotel_rv_title");
	request.setAttribute("hotel_review_num", hotel_review_num);
	
	ArrayList<Hotel_review_DB> arr=members.select_01();
	
%>
	<form action=Hotel_rv_update_02.jsp>
	<h1>게시판</h1>
	<table border="1">
		<input type="hidden" name="hotel_review_num" value=<%= hotel_review_num %>>
		<input type="hidden" name="hotel_rv_date" id="hotel_rv_date"  />
		
		<tr>
			<td>지역</td>
			<td>
				<input class="text" type="text" name="hotel_add" placeholder="title 입력">
			</td>
		</tr>
		
		<tr>
			<td>호텔 이름</td>
			<td>
				<input class="text" type="text" name="hotel_name" placeholder="name 입력">
			</td>
		</tr>
		<tr>
			<td>타이틀</td>
			<td>
				<input class="text" type="text" name="hotel_rv_title" placeholder="date 입력">
			</td>
		</tr>
		<tr>
			<td>상세 내용</td>
			<td>
				<input class="text" type="text" name="hotel_rv_content" placeholder="content 입력">
			</td>
		</tr>
		<tr>
			<td>=======</td>
			
			<td>
				<input class="text" type="submit" value="등록">
			</td>
		</tr>
	</table>
		<jsp:include page="../overlap/footer.jsp"/>
	</form>
	
</body>
<script>
	date =  new Date().toISOString().substring(0,10);
	$("#hotel_rv_date").val(date);
		
</script>
</html>