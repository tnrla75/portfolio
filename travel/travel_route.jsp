<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="route_package.RouteDTO" %>
<html>
<head>
	<title></title>
	<meta charset="utf-8">
	<link href="https://fonts.googleapis.com/css2?family=Cairo&family=Indie+Flower&family=Koulen&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="../css/header_footer.css">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<style>
	.maindiv{
		border: solid 2px black;
		box-sizing: border-box;
		margin: 0 auto;
		width: 1200px;
		height: 1200px;
	}
	.routeinputdiv{
		margin: 20px;
		width: 1200px;
		height: 50px;
	}
	.routeinput{

	}
	.bestroutediv{
		margin: 20px;
		width: 1200px;
		height: 400px;
	}
	.bestroutediv1{
		width: 1200px;
	}
	.bestroutediv2{
		width: 1200px;
	}
	.listdiv{
		width: 250px;
		height: 300px;
		float: left;
		margin: 0 20px;
		border: solid 2px red;
		box-sizing: border-box;
	}
	.imgdiv{
		width: 250px;
		height: 250px;
	}
	.textdiv{
		width: 250px;
		height: 50px;
	}
	.routelistdiv{
		border: solid 2px black;
		box-sizing: border-box;
		width: 1000px;
		height: 650px;
	}
	.routelistindiv{
		border: solid 2px black;
		box-sizing: border-box;
		width: 900px;
		height: 180px;
		margin: 20px;
		display: flex;
	}
	.routelistindiv .div1{
		border: solid 2px black;
		box-sizing: border-box;
		width: 150px;
		height: 150px;
		margin: 10px;
		float: left;
	}
	.routelistindiv .div2{
		width: 900px;
		height: 150px;
		margin: 10px;
	}
	.div3{
		width:700px;
		height: 30px;
	}
	.div3 > .span1{
		float: left;
	}
	.div3 > .span2{
		float: right;
	}
	.div4{
		width:700px;
		height: 100px;
	}
	
</style>

<script>
	$(document).ready(function() {
		
		$('#main > li > ul').hide();
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
	
	 function mypage_check(){ 
	    var uid = '<%=(String)session.getAttribute("id")%>';
	    

	     if(uid=="null"){ 
	        alert("로그인을 해주세요");
	     }
	     else{ 
	        location.replace("travel_routemake.jsp");
	     } 
	}    

</script>
<body>

	<form>	
<div style="width:100%; height: 150px; box-shadow: 0px 5px 1px 1px #030066; ">
		<div style="width: 1200px; height: 150px; margin: 0 auto; ">
		<header>
			<div id="header">
			<div id="title">
				<a href="../overlap/indexpage.jsp">
					<header style="width: 250px;height: 250px; z-index: -2;position: relative;">
						<img src="../img/logo/logo1.png">
					</header>
				</a>
			</div>
			<div id="nav">
				<div id="nav">
				<nav>
					<ul id="top">
						<li class="commonnav"><a href="../overlap/login.jsp">로그인</a></li>
						<li class="commonnav"><a href="../overlap/signuppage.jsp">회원가입</a></li>
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
								<li><a href="#">호텔 검색</a></li>
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
							<p><a class="commonlink" href="travel_2.html" id="main1">여행</a></p>
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
<div class="maindiv">
	<div class="routeinputdiv">
		<span>여행 루트</span><input type="text" class="routeinput">
	</div>
	<div class="bestroutediv">
		<div class="bestroutediv1">
			<h3>인기 리뷰</h3>
		</div>
		<div class="bestroutediv2">
			<div class="listdiv">
				<div class="imgdiv">
					img
				</div>
				<div class="textdiv">
					text
				</div>
			</div>
			<div class="listdiv">
				<div class="imgdiv">
					img
				</div>
				<div class="textdiv">				
					text
				</div>
			</div>
			<div class="listdiv">
				<div class="imgdiv">
					img
				</div>
				<div class="textdiv">			
					text
				</div>
			</div>
			<div class="listdiv">
				<div class="imgdiv">
					img
				</div>
				<div class="textdiv">	
					text
				</div>
			</div>
		</div>
	</div>
<jsp:useBean id="control" class="route_package.RouteController">
</jsp:useBean>
	<div class="routelistdiv">
	<% 
	ArrayList<RouteDTO> arr = control.routeselect();
		for(int i=0; i<arr.size(); i++){
			out.print("<div class='routelistindiv'><div class='div1'>	이미지 파일</div><div class='div2'><div class='div3'><span class='span1'>"+arr.get(i).getRouteTitle()+"</span><span class='span2'>"+arr.get(i).getId()+"</span></div><div class='div4'><span>"+arr.get(i).getRouteContent()+"</span></div></div></div>");
		};
		
		
			
			
				/* out.print(arr.get(i).getRouteTitle()+" "+arr.get(i).getId()+" "+"<a href=boardpage_call.jsp?z='"+arr.get(i).getRouteContent()+"'></a>"); */
		
		%>
		
		<div>
			<input type="button" value="글쓰기" onclick="mypage_check()">
		</div>
	</div>
</div>
<footer style="bottom: -139px;">
		<div id="footer">
			<div class="footerIn">
				<ul>
					<li>회사소개</li>
					<li>회사에 대하여</li>
					<li>기업지배구조</li>
					<li>채용정보</li>
					<li>홍보채널</li>
				</ul>
				<ul>
					<li>자주 묻는 질문</li>
					<li>고객지원</li>
					<li>공지사항</li>
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
					<li>파트너제휴 플랫폼</li>
					<li>호텔 등록</li>
					<li>모든호텔</li>
					<li>IR</li>
				</ul>

			</div>
		</div>
	</footer>
	</form>
</body>
</html>