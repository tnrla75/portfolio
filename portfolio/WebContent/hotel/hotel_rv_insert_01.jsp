<%@page import="vo.Hotel_review_DB"%>
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
 	.form{
 		width:1200px;
		height:600px;
		margin: 30px auto;
		border-style: solid;
		text-align: center;
 	}
 	.head_h2{
 		font-size:30px;
 	}
 	.reviwbox{
 		margin: 0 auto;
		text-align: center;
		width:800px;
		height:400px;
		
		border-style: solid;
 	}
 	#centerbox{
 		width:800px;
		height:40px;
		margin: 15px auto;
		text-align: center;
		
 	}
 	#ratebox{
 		width:800px;
		height:80px;
		margin: 0 auto;
		border-style: solid;
		text-align: center;
		font-size:20px;
		float:left;
 	}
 	.rate_left{
 		width:100px;
		height:80px;
 		border-style: solid;
 		text-align: center;
 		font-size:20px;
 		margin: 0 auto;
 		float:left;
 	}
 	.rate_right{
 		width:590px;
		height:80px;
 		border-style: solid;
 		text-align: center;
 		font-size:20px;
 		margin: 0 auto;
 		float:left;
 	}
 	
 	#contentbox{
 		width:800px;
		height:150px;
		border-style: solid;
		font-size:20px;
	
 	}
 	.contentbox_left{
 		clear:left;
 		width:100px;
		height:150px;
		border-style: solid;
		text-align: center;

		font-size:20px;
 		float:left;
 	}
 	.contentbox_right{
 		width:600px;
		height:150px;
 		border-style: solid;
 		
 		font-size:20px;
 	
 		float:left;
 	}
 	#content_ri_text{
 		width:580px;
		height:100px;
		
		border-style: solid;
		margin: 0 auto;
		font-size:20px;
		float:left;
 	}
 	
 	</style>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 입력란</title>
</head>
<body>
<%-- <%
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
	%> --%>
<jsp:useBean id="members" class="dao.Hotel_DAO"/>
<%
	request.setCharacterEncoding("UTF-8");

String hot_re_num=request.getParameter("hot_re_num");
String hot_main_num=request.getParameter("hot_main_num");

String hot_country=request.getParameter("hot_country");

String hot_re_content=request.getParameter("hot_re_content");   // insert_02에서 가져옴.

String hot_re_date=request.getParameter("hot_re_date");	
	
	ArrayList<Hotel_review_DB> arr=members.select_01();
	
%>
	<form action="hotel_rv_insert_02.jsp" class="form">
	<h2 id="head_h2">리뷰 작성</h2>
	
	<div class="reviwbox">
		<div id="ratebox">
						<div class="rate_left">
							평점
						</div>
						<div class="rate_right">
							<input type="radio" name="hosi">1
							<input type="radio" name="hosi">2
							<input type="radio" name="hosi">3
							<input type="radio" name="hosi">4
							<input type="radio" name="hosi">5
						</div>
		</div>
					
		<div class="centerbox">						
						<div class="contentbox_left">
							상세 내용
						</div>
						<div class="right">
							<input id="content_ri_text" id="content_text" type="text" name="hot_re_content" placeholder="content 입력">
						</div>
					</div>	
					
					<div id="contentbox">	
						<div class="contentbox_left">
							&nbsp;
						</div>
						<div class="contentbox_right">
							<input class="text" type="button" value="취소">
							<input class="text" type="submit"  value="등록">
						</div>
					</div>
		</div> 
	
	</form>	
	<jsp:include page="../overlap/footer.jsp"/>
	<script>
	date =  new Date().toISOString().substring(0,10);
	$("#hot_re_date").val(date);
		
</script>
</body>
</html>