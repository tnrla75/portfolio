
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
		margin: 35px;
		width: 1100px;
		height: 50px;
	}
	.routeinput{
		border-radius: 3px;
		height: 30px;
	}
	.routeinputdiv input:first-of-type {
			width: 950px;
			height: 50px;
			border-style: solid;
			border-color: #E7E7E7;
			position: relative;
			font-size: 10pt;
			top: 10px;
			left: 30px;
	}
	.routeinputdiv input:last-of-type {
		width:80px;
		height: 52px;
		border-style: solid;
		border-radius: 5px;
		font-weight: bold;
		background-color: #002266;
		color: white;
		position: relative;
		font-size: 13pt;
		top: 13px;
		left: 30px;
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
		width: 1200px;
		height: 700px;
	}
	.routelistindiv{
		border: solid 2px blue;
		box-sizing: border-box;
		width: 1100px;
		height: 180px;
		margin: 20px 40px;
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
		width:900px;
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
	.routelistdiv a:link{
		text-decoration: none;
	}
	.routemakebtn{
		text-align: center;
	}
	.routemakebtn > input{
		border-style: none;
		border-radius: 8px;
		width:100px;
		height: 50px;
		font-size: 14pt;
		color: white;
		background-color: blue;
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
		<input type="text" class="routeinput" placeholder="원하는 루트를 검색하세요.">
		<input type="button" value="검색">
	</div>
	<div class="bestroutediv">
		<div class="bestroutediv1">
			<h2>인기 루트</h2>
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
				out.print("<a href=travel_routedetail.jsp?routeNum='"+arr.get(i).getRouteNum()+"'><div class='routelistindiv'><div class='div1'>이미지 파일</div><div class='div2'><div class='div3'><span class='span1'>"+arr.get(i).getRouteTitle()+"</span><span class='span2'>"+arr.get(i).getId()+"</span></div><div class='div4'><span>"+arr.get(i).getRouteContent()+"</span></div></div></div></a>");
			}; 
				/* out.print(arr.get(i).getRouteTitle()+" "+arr.get(i).getId()+" "+"<a href=boardpage_call.jsp?z='"+arr.get(i).getRouteContent()+"'></a>"); */
		%>
		
		<div class="routemakebtn">
			<input type="button" value="글쓰기" onclick="mypage_check()" >
		</div>
	</div>
</div>
<div class="travel">
				<div class="contents3">
					<h5 style="margin-left: 65px;">인기 호텔</h5>
					<a href="">
						<div  class="travellist3">
							<div><img src="../img/hotel/hotel01.jpg" width="280px" height="230px"></div>
							<p>서울 신라호텔
								<img src="../img/icon/star.png" width="15px" height="15px">
								<img src="../img/icon/star.png" width="15px" height="15px">
								<img src="../img/icon/star.png" width="15px" height="15px">
								<img src="../img/icon/star.png" width="15px" height="15px">
							</p>
							<p><b style="padding: 5px; background-color: #002266; color: white;">4.5/5</b> 이용자 리뷰 795개</p>
							<p><b style="color: black; font-size: 10pt;">최저가</b> 380,000원</p>
						</div>
					</a>
					<a href="">
						<div  class="travellist3">
							<div><img src="../img/hotel/hotel02.jpg" width="280px" height="230px"></div>
							<p>시그니엘 부산
								<img src="../img/icon/star.png" width="15px" height="15px">
								<img src="../img/icon/star.png" width="15px" height="15px">
								<img src="../img/icon/star.png" width="15px" height="15px">
								<img src="../img/icon/star.png" width="15px" height="15px">
							</p>
							<p><b style="padding: 5px; background-color: #002266; color: white;">4.5/5</b> 이용자 리뷰 795개</p>
							<p><b style="color: black; font-size: 10pt;">최저가</b> 380,000원</p>
						</div>
					</a>
					<a href="">
						<div  class="travellist3">
							<div><img src="../img/hotel/hotel03.jpg" width="280px" height="230px"></div>
							<p>그랜드 하얏트 제주
								<img src="../img/icon/star.png" width="15px" height="15px">
								<img src="../img/icon/star.png" width="15px" height="15px">
								<img src="../img/icon/star.png" width="15px" height="15px">
								<img src="../img/icon/star.png" width="15px" height="15px">
							</p>
							<p><b style="padding: 5px; background-color: #002266; color: white;">4.5/5</b> 이용자 리뷰 795개</p>
							<p><b style="color: black; font-size: 10pt;">최저가</b> 380,000원</p>
						</div>
					</a>
					<a href="">
						<div  class="travellist3">
							<div><img src="../img/hotel/hotel04.jpg" width="280px" height="230px"></div>
							<p>파라다이스 시티 인천
								<img src="../img/icon/star.png" width="15px" height="15px">
								<img src="../img/icon/star.png" width="15px" height="15px">
								<img src="../img/icon/star.png" width="15px" height="15px">
								<img src="../img/icon/star.png" width="15px" height="15px">
							</p>
							<p><b style="padding: 5px; background-color: #002266; color: white;">4.5/5</b> 이용자 리뷰 795개</p>
							<p><b style="color: black; font-size: 10pt;">최저가</b> 380,000원</p>
						</div>
					</a>
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