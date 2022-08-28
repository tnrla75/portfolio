<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html>
<head>
	<title></title>
	<meta charset="utf-8">
	<link href="https://fonts.googleapis.com/css2?family=Cairo&family=Indie+Flower&family=Koulen&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="../css/header_footer.css">
	<link type="text/css" rel="stylesheet" href="../css/responsive-tabs.css" />
    <link type="text/css" rel="stylesheet" href="../css/style.css" />
    <link type="text/css" rel="stylesheet" href="../css/travel02.css" />
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
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
	<div id="mainframe">	
	<div id="subframe">
		
	<div id="main1">
		<section id="mainsection">
			<header>서울타워</header>
			<article class="maintext">
				<div class="openinghours">
					영업시간: <div>월요일-토요일 10:00~23:59</div>
				</div>
				<div class="touraddress"> 주소 : 서울특별시 용산구 용산 2가동 남산공원길 105</div>
				<div class="subtext">국내외 연간 1200만명의 관광객들이 방문하는 서울 제1의 관광명소</div>
			</article>
		</section>
		<article class="mainimage">
			<img src="../img/travel/seoul/seoultower.jpg">
		</article>
		<input type="submit" value="마이루트로 저장">
	</div>

	<div id="sub">
		<header>입장권 예약</header>

		<article>
			<div class="people">성인</div>
			<div class="money">₩ 15,000</div>
		</article>
		<article>
			<div class="people">중•고등학생</div>
			<div class="money">₩ 10,000</div>
		</article>
		<article>
			<div class="people">어린이</div>
			<div class="money">₩ 7,000</div>
		</article>
		<div style="width: 120px; height: 40px; margin: 0 auto;">
			<input type="submit" value="입장권 예약">
		</div>
	</div>

	<div id="final">
		
		<section class="reviewmain">
			<div>
				<
			</div>
			<!-- <div  class="subreview">
				<div class="review1">
					<div>이미지</div>
					<section>
						<header>제목</header>
						<article>내용</article>
					</section>	
				</div>
				<div class="review2">
					<div>이미지</div>
					<section>
						<header>제목</header>
						<article>내용</article>
					</section>	
				</div>
			</div>
			<div  class="subreview">
				<div class="review3">
					<div>이미지</div>
					<section>
						<header>제목</header>
						<article>내용</article>
					</section>	
					</div>
					<div class="review4" >
						<div>이미지</div>
							<section>
								<header>제목</header>
								<article>내용</article>
							</section>	
						</div>
					</div> -->
				</section>
					<div style="width: 250px; height: 40px; margin: 30px 0 0 0;float:right;">
					<input type="submit" value="리뷰 작성">
					<input type="submit" value="더 보기">
				</div>		
			</div>
		</div>
		<nav id="place">
			<div id="chooseplace">
				<select size="1">
					<option>주변 관광지</option>
					<option>주변 음식점</option>
					<option>주변 호텔</option>
				</select>		
			</div>
			<section><img src="../img/travel/seoul/Gyeongbokgung.jpg"></section>
			<article>경복궁</article>
			<section><img src="../img/travel/seoul/Gwanghwamun.jpg"></section>
			<article>광화문</article>
			<section><img src="../img/travel/seoul/Bukchon.jpg"></section>
			<article>북촌 한옥마을</article>
			<section><img src="../img/travel/seoul/Cheonggyecheon.jpg"></section>
			<article>청계천</article>
			<input type="submit" value="더 보러가기">
		</nav>
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