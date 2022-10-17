<%@page import="vo.Hotel_review_DTO"%>
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
<style>
	body{
 		margin:0;
 		padding:0;
 	}
 	.form{
 		width:800px;
		height:600px;
		margin: 0 auto;
		border-style: solid;
		text-align: center;
 	}
 	.section{
 		width:1000px;
		height:1200px;
		border-style: solid;
		margin: 0 auto;
		text-align: center;
 	}
 	.table{
 		margin: 0 auto;
		text-align: center;
 	}
</style>
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
<jsp:useBean id="members" class="dao.Hotel_DAO"/>
<script>
date =  new Date().toISOString().substring(0, 10);
$("#hotel_rv_date").val(date);
alert(hotel_rv_date);
</script>
<%
	request.setCharacterEncoding("UTF-8");
	String hot_country=request.getParameter("hot_country");
	String hot_re_num=request.getParameter("hot_re_num");
	String hot_main_num=request.getParameter("hot_main_num");
	String hot_address=request.getParameter("hot_address");
	String hot_name=request.getParameter("hot_name");
	String hot_re_title=request.getParameter("hot_re_title");
	request.setAttribute("hot_re_num", hot_re_num);
	
	ArrayList<Hotel_review_DTO> arr = members.select_01();
	
%>
	<form action=Hotel_rv_update_02.jsp>
	<h2>리뷰 수정</h2>
	<table border="1" class="table">
		<input type="hidden" name="hot_re_num" value=<%= hot_re_num %>>
		<input type="hidden" name="hot_re_date" id="hot_re_date"  />
		
		<tr>
			<td>지역</td>
			<td>
				<select name="hot_address" style="border-radius: 7px;height:30px;">
					<option value='한국'>한국</option>
					<option value='일본'>일본</option>
					<option value='중국'>중국</option>
					<option value='미국'>미국</option>
					<option value='러시아'>러시아</option>
					<option value='베트남'>베트남</option>
					<option value='태국'>태국</option>
					<option value='필리핀'>필리핀</option>
				</select>
			</td>
		</tr>
		
		<tr>
			<td>호텔 이름</td>
			<td>
				<input class="text" type="text" name="hot_name" placeholder="name 입력">
			</td>
		</tr>
		<tr>
			<td>타이틀</td>
			<td>
				<input class="text" type="text" name="hot_re_title" placeholder="date 입력">
			</td>
		</tr>
		<tr>
			<td>상세 내용</td>
			<td>
				<input class="text" type="text" name="hot_rd_content" placeholder="content 입력">
			</td>
		</tr>
		<tr>
			<td>=======</td>
			
			<td>
				<input class="text" type="button" value="취소">
				<input class="text" type="submit" value="등록">
			</td>
			
		</tr>
	</table>
		<jsp:include page="../overlap/footer.jsp"/>
	</form>
	
</body>
<script>
	date =  new Date().toISOString().substring(0,10);
	$("#hot_re_date").val(date);
		
</script>
</html>