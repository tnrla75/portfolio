<%@page import="hotel_package.Hotel_review_DB"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*"%>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>호텔 리뷰</title>
	<meta charset="utf-8">
	<link href="https://fonts.googleapis.com/css2?family=Cairo&family=Indie+Flower&family=Koulen&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="../css/style.css" />
	<link rel="stylesheet" type="text/css" href="../css/header_footer.css">
	
    <script src="http://use.fontawesome.com/releases/v6.1.2/js/all.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
 	<style>
 	body{
 		margin:0;
 		padding:0;
 	}
 	.section{
 		width:1000px;
		height:1200px;
		border-style: solid;
		margin: 0 auto;
		text-align: center;
 	}
 	
 	</style>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 입력란</title>
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
<%
	request.setCharacterEncoding("UTF-8");

	String hotel_review_num=request.getParameter("hotel_review_num");
	String hotel_add=request.getParameter("hotel_add");
	String hotel_name=request.getParameter("hotel_name");
	String hotel_rv_title=request.getParameter("hotel_rv_title");
	
	ArrayList<Hotel_review_DB> arr=members.select_01();
	
%>
	<form action="Hotel_rv_insert_02.jsp">
	<h1>게시판</h1>
	<table border="1">
		<input type="hidden" name="hotel_rv_id" value="<%= mb_id %>"/>
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
				<input class="text" type="submit" id="hotel_rv_date" value="등록">
			</td>
		</tr>
	</table>
	</form>	
	<jsp:include page="../overlap/footer.jsp"/>
	<script>
	date =  new Date().toISOString().substring(0,10);
	$("#hotel_rv_date").val(date);
		
</script>
</body>
</html>