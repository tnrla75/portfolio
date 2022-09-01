<%@page import="portfolio_02.Hotel_review_DB"%>
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
<% String mb_id=(String)session.getAttribute("mb_id"); // 로그인할때 저장된 값 %>
<script>
	$(document).ready(function() {
		$('#main > li > ul').hide();
		$('.insert').hide();
		
		$('.commonnav1').mouseenter(function(){
 			$('.commonnav1 > ul').slideDown(200);
 			$('.commonnav1 > p').css("border-bottom","solid 5px #CC3D3D");
 			$('.commonnav1 > ul').show();
 		});
 		$('.commonnav1').mouseleave(function(){
 			$('.commonnav1 > ul').slideUp(200);
 			$('.commonnav1 > p').css("border-bottom","solid 5px white");
 		});
 		$('.commonnav2').mouseenter(function(){
 			$('.commonnav2 > ul').slideDown(200);
 			$('.commonnav2 > p').css("border-bottom","solid 5px #CC3D3D");
 			$('.commonnav2 > ul').show();
 		});
 		$('.commonnav2').mouseleave(function(){
 			$('.commonnav2 > ul').slideUp(200);
 			$('.commonnav2 > p').css("border-bottom","solid 5px white");
 		});
 		$('.commonnav3').mouseenter(function(){
 			$('.commonnav3 > ul').slideDown(200);
 			$('.commonnav3 > p').css("border-bottom","solid 5px #CC3D3D");
 			$('.commonnav3 > ul').show();
 		});
 		$('.commonnav3').mouseleave(function(){
 			$('.commonnav3 > ul').slideUp(200);
 			$('.commonnav3 > p').css("border-bottom","solid 5px white");
 		});
 		$('.commonnav4').mouseenter(function(){
 			$('.commonnav4 > ul').slideDown(200);
 			$('.commonnav4 > p').css("border-bottom","solid 5px #CC3D3D");
 			$('.commonnav4 > ul').show();
 		});
 		$('.commonnav4').mouseleave(function(){
 			$('.commonnav4 > ul').slideUp(200);
 			$('.commonnav4 > p').css("border-bottom","solid 5px white");
 		});
	});
 	</script>
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
<div style="width:100%; height: 150px; box-shadow: 0px 5px 1px 1px #030066; ">
		<div style="width: 1200px; height: 150px; margin: 0 auto; ">
		<header>
			<div id="header">
			<div id="title">
				<a href="indexpage.jsp">
					<header style="width: 250px;height: 250px; z-index: -2;position: relative;">
						<img src="../img/logo/logo1.png">
					</header>
				</a>
			</div>
			<div id="nav">
				<nav>
					<ul id="top">
						
						<li class="commonnav_login"><%
							if(mb_id == null){
								out.println("<li class='commonnav'><a href='login.jsp'>로그인</a></li>");
								
							}else{
								out.println(mb_id+"님이 로그인 중...!!"); 
								out.println("<li class='commonnav'><a href='indexpage.jsp'>로그아웃</a></li>");
							}
						
						%></li>
						
						<li class="commonnav"><a href="signuppage.jsp">회원가입</a></li>
						<li class="commonnav"><a href="#">마이페이지</a></li>
						<li class="commonnav"><a href="#">즐겨찾기</a></li>
						<li class="commonnav"><a href="#">고객센터</a></li>
					</ul>
					<ul id="main">
						
						<li class="commonnav2">
							<p><a class="commonlink" href="flight_main.html">항공</a></p>
							<ul class="list">
								<li><a href="#">최저가 항공권</a></li>
								<li><a href="#">부가 서비스 안내</a></li>
								<li><a href="#">좌석 안내</a></li>
							</ul>
						</li>
						<li class="commonnav3">
							<p><a class="commonlink" href="hotel_main.html">호텔</a></p>
							<ul class="list">
								<li><a href="#">추천 호텔</a></li>
								<li><a href="../hotel/Review_01.jsp">호텔 검색</a></li>
								<li><a href="#">호텔 게시판</a></li>
								<li><a href="#">계절별 할인</a></li>
							</ul>
						</li>
						<li class="commonnav4">
							<p><a class="commonlink" href="dutyfree_main.html">면세점</a></p>
							<ul class="list">
								<li><a href="#">카테고리</a></li>
								<li><a href="#">Best샵</a></li>
								<li><a href="#">세일</a></li>
								<li><a href="#">명품관</a></li>
							</ul>
						</li>
						<li class="commonnav1">
							<p><a class="commonlink" href="../travel/travel_2.html" id="main1">여행</a></p>
							<ul class="list">
								<li><a href="#">지역</a></li>
								<li><a href="#">관광명소</a></li>
								<li><a href="#">맛집</a></li>
								<li><a href="travel_route.jsp">여행루트</a></li>
								<li><a href="#">여행메이트</a></li>
							</ul>
						</li>
					</ul>
				</nav>
			</div>
		</div>
		</header>
	</div>
<jsp:useBean id="members" class="portfolio_02.Java_main"/>
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
	<footer style="top: 350px;">
		<div id="footer" >
			<div class="footerIn">
				<ul>
					<li>회사소개</li>
					<li>회사에 대하여</li>
					<li>기업지배구조</li>
					<li>채용정보</li>
					<li>홍보채널</li>
				</ul>
				<ul>
					<li>고객지원</li>
					<li>공지사항</li>
					<li>자주 묻는 질문</li>
					<li>고객의 말씀</li>
					<li>서비스 센터</li>
				</ul>
				<ul>
					<li>약관 및 규정</li>
					<li>개인정보 처리방침</li>
					<li>이용약관</li>
					<li>고객의 말씀</li>
				</ul>
				<ul>
					<li>기타 서비스</li>
					<li>IR</li>
					<li>파트너제휴 플랫폼</li>
					<li>호텔 등록</li>
					<li>모든호텔</li>
				</ul>

			</div>
		</div>
	</footer>
	<script>
	date =  new Date().toISOString().substring(0,10);
	$("#hotel_rv_date").val(date);
		
</script>
</body>
</html>