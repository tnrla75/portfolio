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
    <link type="text/css" rel="stylesheet" href="../css/travel_route.css" />
    
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
	
	$('.writebutton').click(function(){
		String id = (String)session.getAttribute("id");
		if(id== null){
			alert("로그인을 하세요!");
		}else{
			location.replace("route_write.jsp");
		}
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
				<a href="../overlap/indexpage.jsp">
					<header style="width: 250px;height: 150px; z-index: -2;position: relative;">
						<img src="../img/logo/logo1.png">
					</header>
				</a>
			</div>
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
								<li><a href="../travel/travel_route.jsp">여행루트</a></li>
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
<div class="contents1">
					<h4>추천 여행 경로</h4>
					<a href="">
						<div class="travellist2">
							<img src="../img/travel/phuket.jpg" width="280px" height="350px">
							<div class="detail">
								<p>푸켓 4박5일 일정!</p>
							</div>
						</div>
					</a>
					<a href="">
						<div class="travellist2">
							<img src="../img/travel/guam.jpg" width="280px" height="350px">
							<div class="detail">
								<p>괌 5박6일 일정!</p>
							</div>
						</div>
					</a>
					<a href="">
						<div class="travellist2">
							<img src="../img/travel/berlin.jpg" width="280px" height="350px">
							<div class="detail">
								<p>베를린</p>
							</div>
						</div>
					</a>
					<a href="">
						<div class="travellist2">
							<img src="../img/travel/cebu.jpg" width="280px" height="350px">
							<div class="detail">
								<p>세부</p>
							</div>
						</div>
					</a>
				</div>
				<div class="contents2">
					<div class="detailcontents">
						<img src="">
						<div></div>
					</div>
					<div class="detailcontents">
						<img src="">
						<div></div>
					</div>
					<div class="detailcontents">
						<img src="">
						<div></div>
					</div>
					<div class="writebutton"><input type="button" class="wrtiebutton" value="글쓰기"></div>
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