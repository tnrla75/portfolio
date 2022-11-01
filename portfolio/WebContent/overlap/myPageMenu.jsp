<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="http://use.fontawesome.com/releases/v6.1.2/js/all.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<style>
	a{
		color: black;
	}
	a:link{
		color: black;
		text-decoration: none;
	}
	a:hover{
		color: black;
		text-decoration: none;
	}
	a:active{
		color: black;
		text-decoration: none;
	}
	#side div{
		float: left;
		width: 280px;
		height: fit-content;
		border-style: solid;
		border-color: #BDBDBD;
		border-width: 1px;
		margin-top: 70px;
	}
	#side ul {
		list-style: none; 
		font-weight: bold;
	}
	#side li {
		line-height: 30pt;
	}
	#menu-container .menu-list .menu-submenu {
	    padding-top: 20px;
	    padding-bottom: 20px;
	}
	#menu-container .menu-list li.accordion-toggle, #menu-container .menu-list .menu-login {
	    font-size: 16px;
	    padding: 20px;
	    text-transform: uppercase;
	    border-top: 1px solid #dbdcd2;
	}
	#menu-container .menu-list li:first-of-type {
	    border-top: 0;
	}
	
	.accordion-toggle, .accordion-content {
	    cursor: pointer;
	    font-size: 16px;
	    position: relative;
	    letter-spacing: 1px;
	}
	.accordion-content {
	    display: none;
	    font-size: 10pt;
	}
	.accordion-toggle a:before, .accordion-toggle a:after {
	    content: '';
	    display: block;
	    position: absolute;
	    top: 50%;
	    right: 30px;
	    width: 15px;
	    height: 2px;
	    margin-top: -1px;
	    background-color: #5a5858;
	    transform-origin: 50% 50%;
	    transition: all 0.3s ease-out;
	}
	
	.accordion-toggle a:before {
	    transform: rotate(-90deg);
	    opacity: 1;
	    z-index: 2;
	}
	
	.accordion-toggle.active-tab {
	  transition: all 0.3s ease;
	}
	.accordion-toggle a.active:before {
	    transform: rotate(0deg);
	    background: #fff black;
	}
	
	.accordion-toggle a.active:after {
	    transform: rotate(180deg);
	    background: #fff black;
	    opacity: 0;
	}

	#nav-icon1, #nav-icon2, #nav-icon3, #nav-icon4 {
		width: 60px;
		height: 45px;
		position: relative;
		margin: 50px auto;
		-webkit-transform: rotate(0deg);
		-moz-transform: rotate(0deg);
		-o-transform: rotate(0deg);
		transform: rotate(0deg);
		-webkit-transition: .5s ease-in-out;
		-moz-transition: .5s ease-in-out;
		-o-transition: .5s ease-in-out;
		transition: .5s ease-in-out;
		cursor: pointer;
	}
	#nav-icon1 span, #nav-icon3 span, #nav-icon4 span {
		 display: block;
	  	 position: absolute;
		 height: 9px;
		 width: 100%;
		 background: #d3531a;
		 border-radius: 9px;
		 opacity: 1;
		 left: 0;
		 -webkit-transform: rotate(0deg);
		 -moz-transform: rotate(0deg);
		 -o-transform: rotate(0deg);
		 transform: rotate(0deg);
		 -webkit-transition: .25s ease-in-out;
		 -moz-transition: .25s ease-in-out;
		 -o-transition: .25s ease-in-out;
		 transition: .25s ease-in-out;
	}
	
	#nav-icon1 span:nth-child(1) {
		top: 0px;
	}	
	#nav-icon1 span:nth-child(2) {
	    top: 18px;
	}
	
	#nav-icon1 span:nth-child(3) {
	    top: 36px;
	}
	
	#nav-icon1.open span:nth-child(1) {
		top: 18px;
	    -webkit-transform: rotate(135deg);
	 	-moz-transform: rotate(135deg);
	  	-o-transform: rotate(135deg);
	  	transform: rotate(135deg);
	}
	
	#nav-icon1.open span:nth-child(2) {
	  	opacity: 0;
	  	left: -60px;
	}
	
	#nav-icon1.open span:nth-child(3) {
		top: 18px;
		-webkit-transform: rotate(-135deg);
	  	-moz-transform: rotate(-135deg);
	    -o-transform: rotate(-135deg);
	    transform: rotate(-135deg);
	}
</style>
<script>
	$(document).ready(function() {

		slide();
	  
	 	$('#nav-icon1,#nav-icon2,#nav-icon3,#nav-icon4').click(function(){
			$(this).toggleClass('open');
		});
	 	
	 	
	});
	
	$(function() {
		$('#left_nav').hide();
		function slideMenu() {
			var activeState = $("#menu-container .menu-list").hasClass("active");
		    $("#menu-container .menu-list").animate({left: activeState ? "0%" : "-100%"}, 1000);
		}
		$("#menu-wrapper").click(function(event) {
			event.stopPropagation();
		    $("#hamburger-menu").toggleClass("open");
		    $("#menu-container .menu-list").toggleClass("active");
		    slideMenu();
		    $("body").toggleClass("overflow-hidden");
		});
		$(".menu-list").find(".accordion-toggle").click(function() {
		    $(this).next().toggleClass("open").slideToggle("slow");
		    $(this).toggleClass("active-tab").find(".menu-link").toggleClass("active");
	
		    $(".menu-list .accordion-content").not($(this).next()).slideUp(1000).removeClass("open");
		    $(".menu-list .accordion-toggle").not(jQuery(this)).removeClass("active-tab").find(".menu-link").removeClass("active");
		});
	}); // jQuery load
</script>
<body>
	<% String mb_id =(String)session.getAttribute("mb_id"); %>
			<nav id="side"> 	
				<%-- <h3><%= member.getMb_id()%> 님</h3> --%>
				<div>
					<!-- menu-wrapper -->
					<ul class="menu-list accordion">
						<li id="nav1" class="toggle accordion-toggle"> 
							<span class="icon-plus"></span>
							<a class="menu-link" href="#">개인정보관리</a>
						</li>
						<!-- accordion-toggle -->
						<ul class="menu-submenu accordion-content">
							<li><a href="info.mypage?command=info&mb_id=<%= mb_id %>">회원정보 수정</a></li>
							<li><a href="boardpass.mypage?command=board&mb_id=<%= mb_id %>">여권정보 관리</a></li>
						</ul>
						<!-- menu-submenu accordon-content-->
						<li id="nav2" class="toggle accordion-toggle"> 
							<span class="icon-plus"></span>
							<a class="menu-link" href="#">주문/예약 내역</a>
						</li>
						<!-- accordion-toggle -->
						<ul class="menu-submenu accordion-content">
							<li><a class="head" href="mypage_attreserve.mypage?command=travel_reserveList">여행</a></li>
							<li><a class="head" href="#">항공</a></li>
							<li><a class="head" href="#">호텔</a></li>
							<li><a class="head" href="mypage_itemorder.mypage?command=item_orderList">면세점</a></li>
						</ul>
						<!-- menu-submenu accordon-content-->
						<li id="nav3" class="toggle accordion-toggle"> 
							<span class="icon-plus"></span>
							<a class="menu-link" href="#">MY ♡</a>
						</li>
						<!-- accordion-toggle -->
						<ul class="menu-submenu accordion-content">
							<li><a class="head" href="#">여행</a></li>
							<li><a class="head" href="#">호텔</a></li>
							<li><a class="head" href="mypage_itemWish.mypage?command=item_wish">면세점</a></li>
						</ul>
						<!-- menu-submenu accordon-content-->
						<li id="nav4" class="toggle accordion-toggle"> 
							<span class="icon-plus"></span>
							<a class="menu-link" href="#">내가 쓴 Q&A</a>
						</li>
						<!-- accordion-toggle -->
						<ul class="menu-submenu accordion-content">
							<li><a class="head" href="#">항공</a></li>
							<li><a class="head" href="#">호텔</a></li>
							<li><a class="head" href="mypage_itemqna.mypage?command=item_qna&mb_id=<%= mb_id %>">면세점</a></li>
						</ul>
						<!-- menu-submenu accordon-content-->
						<li id="nav4" class="toggle accordion-toggle"> 
							<span class="icon-plus"></span>
							<a class="menu-link" href="#">내가 쓴 리뷰</a>
						</li>
						<!-- accordion-toggle -->
						<ul class="menu-submenu accordion-content">
							<li><a class="head" href="mypage_AttractionReview.mypage?command=travel_Review&mb_id=<%= mb_id %>">여행</a></li>
							<li><a class="head" href="#">항공</a></li>
							<li><a class="head" href="#">호텔</a></li>	
							<li><a class="head" href="mypage_itemReview.mypage?command=item_Review&mb_id=<%= mb_id %>">면세점</a></li>
						</ul>
						<li id="nav4" class="toggle accordion-toggle"> 
							<span class="icon-plus"></span>
							<a class="menu-link" href="#">여행</a>
						</li>
						<ul class="menu-submenu accordion-content">
							<li><a class="menu-link" href="mypage_mateapply.mypage?command=travel_mateApply&mb_id=<%= mb_id %>">Travel Mate</a></li>
							<li><a class="head" href="mypage_myroute.mypage?command=myroute&mb_id=<%= mb_id %>">Travel Route</a></li>
						</ul>
					</ul>
				   	<!-- menu-list accordion-->
				</div>
			</nav>
</body>
</html>