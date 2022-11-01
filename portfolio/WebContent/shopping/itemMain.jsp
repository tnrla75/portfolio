<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.ArrayList"%>
<%@ page import="vo.Item" %>    
<%
	ArrayList<Item> list = (ArrayList<Item>)request.getAttribute("itemMain"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Cairo&family=Indie+Flower&family=Koulen&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../css/header_footer.css">
<link type="text/css" rel="stylesheet" href="../css/style2.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link rel="stylesheet" href="bang.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="bang.js"></script>
<title>인터넷 면세점</title>
<style type="text/css">
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700;900&display=swap');
	a {
		text-decoration: none;
		text-decoration-line: none;
		color: black;
	}
	a:hover {
		color: black;
	}
	a:active {
		color: black;
	}
	a:visited {
		color: black;
	}

	/* side nav */
	#left_nav {
		background-color: rgba( 255, 255, 255, 0.8 );
		width: 270px;
		height: 833px;
		float: left;
		margin-top: 150px;
		position: absolute;
		z-index: 100;
	}
	#left_nav ul {
		list-style: none; 
		font-weight: bold;
	}
	#left_nav li {
		line-height: 30pt;
	}
	body {
	   font-family: 'Dosis', sans-serif;
	}
	#text {
		border-style: solid;
		width: 300px;
		height: 300px;
	}
	#menu-wrapper {
	    overflow: hidden;
	    width: 300px;
	    cursor: pointer;
	}
	.nav_btn {
		width: 70px;
		height: 70px;
		filter: invert(100%) sepia(100%) saturate(1%) hue-rotate(189deg) brightness(102%) contrast(102%);
		position: relative;
		left: 280px;
		top: 20px;	
	}
	#hamburger-menu {
	    position: relative;
	    width: 25px;
	    height: 20px;
	    margin: 15px;
	    color: black;
	    background-color: black;
	}
	#hamburger-menu span {
	    opacity: 1;
	    left: 0;
	    display: block;
	    width: 300px;
	    height: 2px;
	    border-radius: 10px;
	    color: black;
	    background-color: white;
	    position: absolute;
	    transform: rotate(0deg);
	    transition: .4s ease-in-out;
	}
	#hamburger-menu span:nth-child(1) {
	    top: 0;
	}
	#hamburger-menu span:nth-child(2) {
	    top: 9px;
	}
	#hamburger-menu span:nth-child(3) {
	    top: 18px;
	}
	#hamburger-menu.open span:nth-child(1) {
	    transform: translateY(9px) rotate(135deg);
	}
	#hamburger-menu.open span:nth-child(2) {
	    opacity: 0;
	    transform: translateX(-60px);
	}
	#hamburger-menu.open span:nth-child(3) {
	    transform: translateY(-9px) rotate(-135deg);
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
	    background: #fff !important;
	}
	
	.accordion-toggle a.active:after {
	    transform: rotate(180deg);
	    background: #fff !important;
	    opacity: 0;
	}
	
	/* Icon 1 */
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
	.slide h1 {
		font-size: 4rem;
		line-height: 5rem;
	}
	.slide h2 {
		font-size: 2.6rem;
		line-height: 2.4rem;
		margin-bottom: 1rem;
		color: #333;
		text-transform: uppercase;
	}
	.slide h3 {
		font-size: 1.8rem;
		line-height: 2.6rem;
		color: #444;
		font-weight: 400;
	}
	.slide h4 {
		font-size: 1.1rem;
		line-height: 2.4rem;
	}
	.slide h5 {
		font-size: 0.7rem;
		line-height: 0.7rem;
	}
	.slide a:link {
		color: #aaa;
		text-decoration: none;
	}
	.slide a:visited {
		color: #aaa;
	}
	.slide a:hover {
		color: #333;
	}
	.slide a:active {
		color: #333;
	}
	.slide ul, li {
		list-style: none;
	}
	.slide button {
		padding: 8px 20px;
		background: white;
		transition: 0.3s;
		font-weight: bold;
		text-transform: uppercase;
		border-radius: 20px;
	}
	.slide button:hover {
		background: #501B14;
		color: white;
		cursor: pointer;
	}
	.slide .flex {
		display: flex;
		justify-content: space-between;
	}
	.slide .wrap{
		width: 1000px;
		margin: 0 auto;
	}
	/*start*/
	main {
		height: 850px;
		position: relative;
		overflow: hidden;
		bottom: 15px;
	}
	/*---------------------------------------------*/
	.slide {
		position: relative;
		overflow: hidden;
	}
	.panel {
		width: 300%;
		height: 850px;
	}
	.panel:after {
		content: "";
		display: block;
		clear: both;
	}
	.panel>li {
		width: 33.333%;
		height: 850px;
		float: left;
		background-repeat: no-repeat;
		background-size: 100%;
		position: relative;
		bottom: 2px;
		right: 40px;
	}
	.panel>li:nth-of-type(1) {
		background: url('../img/dutyfree/itemMain/main1.jpg');
		background-size: cover;
		background-position: center center;
	}
	.panel>li:nth-of-type(2) {
		background: url('../img/dutyfree/itemMain/main8.jpg');
		background-size: cover;
		background-position: center;
	}
	.panel>li:nth-of-type(3) {
		background: url('../img/dutyfree/itemMain/main7.jpg');
		background-size: cover;
		background-position: right center;
	}
	.opa {
		background: rgba(0, 0, 0, 0.3);
		margin-top: -300px;
		width: 100%;
		height: 850px;
	}
	main .content {
		width: 1000px;
		margin: 300px 0 100px 500px;
		transform: translateX(-50%);
		color: #fff;
		text-align: left;
		width: 600px;
	}
	.content h1 {
		position: realtive;
		top: 230px;
		left: 100px;
		font-family: 'Roboto', sans-serif;
		font-size: 60px;
		font-weight: 400;
		margin-top: 24px;
		margin-bottom: 15px;
		color: #fff;
	}
	.content p {
		margin-top: 300px;
		margin-left: 105px;
		font-size: 20px;
		color: #fff;
		font-weight: 100;
	}
	.dot:after {
		content: "";
		display: block;
		clear: both;
	}
	.dot {
		position: absolute;
		left: 17%;
		top: 65%;
		transform: translateX(-50%);
	}
	.dot>li {
		float: left;
		width: 20px;
		height: 20px;
		border-radius: 50px;
		border: 1px solid #fff;
		margin-right: 8px;
		text-indent: -9999px;
		cursor: pointer;
	}
	.dot>li.on {
		background: #fff;
		width: 40px;
	}
	section {
		margin-top: 850px;
		height: 2000px;
		margin-bottom: 40px;
	} 
	#item_cate {
		width: 1200px;
		height: 250px;
		margin: 20px auto;
	} 
	.category {
		float: left;
		width: 180px;
		height: 180px;
		margin-top: 25px;
		margin-left: 30px;
		overflow: hidden;
		border: 1px solid #A6A6A6;
		border-radius: 150px;
	}
	.category:first-of-type {
		margin-left: 80px;
	}
	#wrap {
		width: 100%;
		height: 600px;
		margin-top: 70px;
		padding-top: 10px;
		background-color: #F6F6F6;
	}
	#item_wr {
		width: 1200px;
		height: 500px;
		margin: 30px auto;
	} 
	#item_wr h2 {
		margin-top: 15px;
	}
	#item1 {
		float: left;
		width: 285px;
		height: 445px;
		/* border: 1px solid #EAEAEA; */
		/* box-shadow: 7px 7px 7px #BDBDBD; */
		background-color: white;
		padding-top: 20px;
	}
	#item1:nth-of-type(2), #item1:nth-of-type(3) {
		margin-left: 15px;
	}
	#item1:last-of-type {
		float: right;
	}
	#item1 img {
		padding: 20px;
		margin-bottom: 40px;
	}
	.itemDetail {
		margin-left: 10px;
	}
	.itemDetail p {
		margin-top: 0px;
		margin-left: 24px;
		position: relative;
		bottom: 35px;
	}
	.itemDetail p:first-of-type {
		font-weight: bold;
		font-size: 12pt;
	}
	.itemDetail p:nth-of-type(2) {
		width: 240px;
		font-weight: bold;
		font-size: 10pt;
		color: #7474746;
		overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
	}
	.itemDetail b:first-of-type {
		font-weight: bold;
		font-size: 20pt;
		color: #CC3D3D;
		line-height: 10px;
	}
	.itemDetail b:last-of-type {
		font-weight: normal;
		font-size: 12pt;
		margin-left: 10px; 
		color: #8C8C8C;
	}
	#item2 {
		width: 1200px;
		height: 400px;
		margin: 70px auto;
	}
	#item2 div:first-of-type img:last-of-type{
		margin-left: 100px;
		padding-bottom: 70px;
	}
	#brand {
		margin-top: 30px;
	}
	#brand div:first-of-type {
		margin-top: 150px;
		margin-left: 90px;
		letter-spacing: 10px;
		float: left;
		font-weight: bold;
		line-height: 50pt;
		font-size: 30pt;
		text-decoration: underline;
		text-decoration-color: #DEB84F;
		text-decoration-thickness: 5px;
		text-underline-offset : 5px;
	}
	#brand div:last-of-type {
		float: right;
		margin-right: 20px;
		
	}
</style>
</head>
<% 
	String mb_id = (String)session.getAttribute("mb_id");
	String reviewNo=request.getParameter("reviewNo");
%>
<script type="text/javascript">
  	//>>>>>>메인 슬라이드
	$(document).ready(function() {		
		slide();
	 	$('#nav-icon1,#nav-icon2,#nav-icon3,#nav-icon4').click(function(){
			$(this).toggleClass('open');
		});
	});
	
	function slide() {
		 var wid = 0;
		 var now_num = 0;
		 var slide_length = 0;
		 var auto = null;
		 var $dotli = $('.dot>li');
		 var $panel = $('.panel');
		 var $panelLi = $panel.children('li');
	
		 // 변수 초기화
		 function init() {
		 	wid = $('.slide').width();
		    now_num = $('.dot>li.on').index();
		    slide_length = $dotli.length;
		 }

		 // 이벤트 묶음
		 function slideEvent() {
		
		 	// 슬라이드 하단 dot버튼 클릭했을때
		    $dotli.click(function() {
		    	now_num = $(this).index();
		    	slideMove();
		    });
		    // 오토플레이
		    autoPlay();
		    // 오토플레이 멈춤
		    autoPlayStop();
		    // 오토플레이 재시작
		    autoPlayRestart();
		    // 화면크기 재설정 되었을때
		    resize();
		  }

		  // 자동실행 함수
		  function autoPlay() {
		  	auto = setInterval(function() {
				nextChkPlay();
		    }, 3000);
		  }

		  // 자동실행 멈춤
		  function autoPlayStop() {
		  	$panelLi.mouseenter(function() {
		    	clearInterval(auto);
		    });
		  }
		  
		  // 자동실행 멈췄다가 재실행
		  function autoPlayRestart() {
		  	$panelLi.mouseleave(function() {
		    	auto = setInterval(function() {
		        	nextChkPlay();
		   		 }, 5000);
		    });
		  }

		  // 이전 버튼 클릭시 조건 검사후 슬라이드 무브
		  function prevChkPlay() {
		  	if (now_num == 0) {
		    	now_num = slide_length - 1;
		    } else {
		      	now_num--;
		    }
		    slideMove();
		  }

		  // 이후 버튼 클릭시 조건 검사후 슬라이드 무브
		  function nextChkPlay() {
		 	if (now_num == slide_length - 1) {
		    	now_num = 0;
		    } else {
		    	now_num++;
		    }
		    slideMove();
		  }

		  // 슬라이드 무브
		  function slideMove() {
		  	$panel.stop().animate({
		    	'margin-left': -wid * now_num
		    });
		    $dotli.removeClass('on');
		    $dotli.eq(now_num).addClass('on');
		  }
		
		  // 화면크기 조정시 화면 재설정
		  function resize() {
		 	$(window).resize(function() {
		    	init();
		      	$panel.css({
		       	'margin-left': -wid * now_num
		      	});
		    });
		  }
		  init();
		  slideEvent();
	}
	
	function doDisplay1(){
        var con = document.getElementById("left_nav"); 	
        if(con.style.display=='none'){ 	
            con.style.display = 'block'; 	
        }else{ 		
            con.style.display = 'none'; 	
        } 
    } 
</script>
<script>
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
	<form action="itemList.shop" method="post">
		<div id="left_nav">
			<div id="menu-container">  		
				<!-- menu-wrapper -->
				
				<ul class="menu-list accordion">
					<li id="nav1" class="toggle accordion-toggle"> 
						<span class="icon-plus"></span>
						<a class="menu-link" href="#">카테고리</a>
					</li>
					<!-- accordion-toggle -->
					<ul class="menu-submenu accordion-content">
						<li><a href="itemList.shop?category=스킨케어">스킨케어</a></li>
						<li><a href="itemList.shop?category=메이크업">메이크업</a></li>
						<li><a href="itemList.shop?category=향수/헤어/바디">향수/헤어/바디</a></li>
						<li><a href="itemList.shop?category=기초케어">가방/지갑</a></li>
						<li><a href="itemList.shop?category=기초케어">시계/쥬얼리</a></li>
						<li><a href="itemList.shop?category=기초케어">패션/잡화</a></li>
					</ul>
					<!-- menu-submenu accordon-content-->
					<li id="nav2" class="toggle accordion-toggle"> 
						<span class="icon-plus"></span>
						<a class="menu-link" href="#">Best 샵</a>
					</li>
					<!-- accordion-toggle -->
					<ul class="menu-submenu accordion-content">
						<li><a class="head" href="#">Submenu1</a></li>
						<li><a class="head" href="#">Submenu2</a></li>
					</ul>
					<!-- menu-submenu accordon-content-->
					<li id="nav3" class="toggle accordion-toggle"> 
						<span class="icon-plus"></span>
						<a class="menu-link" href="#">Sale</a>
					</li>
					<!-- accordion-toggle -->
					<ul class="menu-submenu accordion-content">
						<li><a class="head" href="#">Submenu1</a></li>
						<li><a class="head" href="#">Submenu2</a></li>
						<li><a class="head" href="#">Submenu3</a></li>
						<li><a class="head" href="#">Submenu4</a></li>
					</ul>
					<!-- menu-submenu accordon-content-->
					<li id="nav4" class="toggle accordion-toggle"> 
						<span class="icon-plus"></span>
						<a class="menu-link" href="#">명품관</a>
					</li>
					<!-- accordion-toggle -->
					<ul class="menu-submenu accordion-content">
						<li><a class="head" href="#">Submenu1</a></li>
						<li><a class="head" href="#">Submenu2</a></li>

					</ul>
				</ul>
			   	<!-- menu-list accordion-->
			</div>
		</div>
		
		<div>
		<%
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
		<main>
	    <div class="slide">
	    	<ul class="panel">
		      	<li>
		          <div class="opa">
		            <section class="content">
		              <h1>Bring Beauty To<br>The Moment</h1>
		              <p>Clothes that are sure to heat up your winter.</p>
		            </section>
		          </div>
		        </li>
		        <li>
		          <div class="opa">
		            <section class="content">
		              <h1>ANC headphones with long battery life</h1>
		              <p>Maecenas ligula massa, tristique </p>
		            </section>
		          </div>
		        </li>
		        <li>
		          <div class="opa">
		            <section class="content">
		              <h1>Ut accumsan massa Sed magna risus,</h1>
		              <p>nec lorem elementum sit amet porta massa pharetra.</p>
		            </section>
		          </div>
		        </li>
	      	  </ul>
		      <ul class="dot">
		        <li class="on"></li>
		        <li></li>
		        <li></li>
		      </ul>
			</div>
	  	</main>
	  	</div>
	  	<div class='nav_btn'>
	  		<a href="javascript:doDisplay1();" ><img src="../img/dutyfree/menu.png" width="35px" height="35px;"></a>
		</div>
		<section>
			<div id="item_cate">
				<div class="category"><a href="itemList.shop?category=스킨케어"><img src="../img/dutyfree/cate1.jpg" width="180px" height="190px;" style="position: relative; bottom: 10px;"></a></div>
				<div class="category"><a href="itemList.shop?category=메이크업"><img src="../img/dutyfree/cate2.jpg" width="180px" height="210px;" style="position: relative; bottom: 13px;"></a></div>
				<div class="category"><a href="itemList.shop?category=향수/헤어/바디"><img src="../img/dutyfree/cate3.jpg" width="180px" height="210px;"></a></div>
				<div class="category"><img src="../img/dutyfree/cate4.jpg" width="180px" height="180px"></div>
				<div class="category"><img src="../img/dutyfree/cate5.jpg" width="180px" height="230px;" style="position: relative; bottom: 15px;"></div>
			</div>
			<div id="wrap">
				<div id="item_wr">
					<h2>NEW NOW</h2>
					<% for (int i=0; i<list.size(); i++) { 
						 double discount = (double)list.get(i).getDiscount()/(double)100; 
						 double discountDollar = list.get(i).getItemDollar()*(1-discount);
					%>
					<div id="item1">
						<a href="itemDetail.shop?itemCode=<%= list.get(i).getItemCode()%>" class="itemDetail">
							<img src="<%= list.get(i).getItemImg() %>" width="220px" height="230px;"></br>
							<p><%= list.get(i).getBrandName() %></p>
							<p><%= list.get(i).getItemName() %></p>
							<p>
								<span style="color: #8C8C8C; text-decoration: line-through;">$<%= list.get(i).getItemDollar() %></span>
								<span style="font-weight: bold;"><%= list.get(i).getDiscount()+"%" %></span>
							</p>
							<p>
								<b>$<fmt:formatNumber value="<%= discountDollar %>" pattern='0.0' /></b>
								<b>(<fmt:formatNumber value="<%= list.get(i).getDiscountWon() %>"  groupingUsed="true"/>원)</b>
							</p>
						</a>
					</div>	 
						<% } %>		
				</div>
			</div>
			<div id="item2">
				<div>
					<img src="../img/dutyfree/item1.jpg" width="470px" height="526px;">
					<img src="../img/dutyfree/item3.png" width="500px" height="366px;">
				</div>
				<div id="brand">
					<div>
						<span> ABOUT </span></br>
						<span> DIPTYQUE </span>
					</div>
					<div>
						<img src="../img/dutyfree/item4.jpg" width="690px" height="370px;">
					</div>
				</div>				
			</div>
		</section>
		<jsp:include page="../overlap/footer.jsp"/>
	  </form>
	  
</body>
</html>

