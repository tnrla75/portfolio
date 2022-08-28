<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<meta charset="utf-8">
	<link href="https://fonts.googleapis.com/css2?family=Cairo&family=Indie+Flower&family=Koulen&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="../css/style.css" />
	<link rel="stylesheet" type="text/css" href="../css/header_footer.css">
	<link type="text/css" rel="stylesheet" href="../css/responsive-tabs.css" />
    <link type="text/css" rel="stylesheet" href="../css/style.css" />
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<style>
	.mainsearch {
			margin: 20px auto;
			padding-bottom: 40px;
			width: 1200px;
			height: 140px;
			border: 3px #002266 solid;
			border-radius: 3px;
		}
		.mainsearch>h3{
			margin-left: 10px;
			font-size: 14pt;
		}
		.mainsearch input:first-of-type {
			width: 1060px;
			height: 50px;
			border-style: solid;
			border-color: #E7E7E7;
			position: relative;
			font-size: 10pt;
			top: 10px;
			left: 10px;
		}
		.mainsearch input:last-of-type {
			width:80px;
			height: 55px;
			border-style: solid;
			font-weight: bold;
			background-color: #002266;
			color: white;
			position: relative;
			font-size: 13pt;
			top: 13px;
			right: 10px;
		}
		.travel:last-of-type {
			position: relative;
			top: 50px;
		}
		.travel h5 {
			font-size: 22pt;
			text-align: center;
			font-weight: bold;
		}
		.contents2 {
			width: 1200px;
			height: 450px;
			margin:0 auto;
			position: relative;
			top: 10px;
			border-style: solid;
		}
		.travellist2 {
			float: left;
			border-style: solid;
			height: 350px;
			box-shadow: 7px 7px 7px #BDBDBD;
			border-width: 2px;
			border-color: #BDBDBD;
			margin-left: 10px;
			position: relative;
			bottom: 10px;
			overflow: hidden;
		}
	.travellist2 p:first-of-type {
			padding-top: 15px;
			font-size: 15pt;
			font-weight: bold;
			margin-left: 10px;
			line-height: 5pt;
		}
.travellist2 p:nth-of-type(2) {
			font-size: 11pt;
			margin-left: 10px;

		}
		.travellist2 p:last-of-type {
			font-size: 13pt;
			font-weight: bold;
			color: red;
			margin-left: 10px;
			line-height: 2pt;
		}
		.travellist2>img{
			transition: all 0.2s linear;
		}
		.travellist2>img:hover{
			transform: scale(1.04);
			overflow: hidden;
		}
		.detail {
			position: relative;
			height: 100px;
			bottom: 123px;
			border-style: 100px;
			background-color:rgba(0,0,0,.6);
			color: white;
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

</script>
<body>
	<form>	
<div style="width:100%; height: 150px; box-shadow: 0px 3px 1px 1px #030066; ">
		<div style="width: 1200px; height: 150px; margin: 0 auto; ">
		<header>
			<div id="header">
			<div id="title">
				<a href="indexpage.jsp">
					<header style="width: 250px;height: 150px; z-index: -2;position: relative;">
						<img src="../img/logo/logo1.png">
					</header>
				</a>
			</div>
			<div id="nav">
				<nav>
					<ul id="top">
						<li class="commonnav"><a href="login.jsp">로그인</a></li>
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
								<li><a href="#">여행루트</a></li>
								<li><a href="#">여행메이트</a></li>
							</ul>
						</li>
					</ul>
				</nav>
			</div>
		</div>
		</header>
	</div>
</div>
<div class="mainsearch">
	<h3>가고싶은 여행지, 명소를 검색해보세요.</h3>
	<input type="text" placeholder="여행지를 검색해보세요" size="150">
	<input type="button" name="btn" value="검색">
</div>
<div class="contents2">
					<h5 >추천 항공권</h5>
					<a href="">
						<div class="travellist2">
							<img src="../img/travel/phuket.jpg" width="280px" height="350px">
							<div class="detail">
								<p>푸켓</p>
								<p>일반석 왕복</p>
								<p>KRW 1,564,200~</p>
							</div>
						</div>
					</a>
					<a href="">
						<div class="travellist2">
							<img src="../img/travel/guam.jpg" width="280px" height="350px">
							<div class="detail">
								<p>괌</p>
								<p>일반석 왕복</p>
								<p>KRW 1,637,600~</p>
							</div>
						</div>
					</a>
					<a href="">
						<div class="travellist2">
							<img src="../img/travel/berlin.jpg" width="280px" height="350px">
							<div class="detail">
								<p>베를린</p>
								<p>일반석 왕복</p>
								<p>KRW 1,948,000~</p>
							</div>
						</div>
					</a>
					<a href="">
						<div class="travellist2">
							<img src="../img/travel/cebu.jpg" width="280px" height="350px">
							<div class="detail">
								<p>세부</p>
								<p>일반석 왕복</p>
								<p>KRW 1,878,200~</p>
							</div>
						</div>
					</a>
				</div>
<footer>
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