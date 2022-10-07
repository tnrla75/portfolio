<%@page import="vo.Mypage_qna"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.Member_info"%>
<%@page import="vo.Mypage_review"%>

<%
	ArrayList<Mypage_review> list = (ArrayList<Mypage_review>)request.getAttribute("itemreview");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Cairo&family=Indie+Flower&family=Koulen&display=swap" rel="stylesheet">
<link rel="stylesheet" href="../css/style.css" />
<link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../css/header_footer.css">
<link type="text/css" rel="stylesheet" href="../css/responsive-tabs.css" />
<link type="text/css" rel="stylesheet" href="../css/style2.css" />
<script src="http://use.fontawesome.com/releases/v6.1.2/js/all.js"></script>
<link rel="stylesheet" href="bang.css">
<style type="text/css"></style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="bang.js"></script>
<script type="text/javascript"></script>
<title>마이 페이지</title>
<style type="text/css">
	#info {
		margin-top: 120px;
		text-align: center;
		font-size: 30pt;
		font-family: 'Poppins', sans-serif;
		letter-spacing: 5px;
	}
	section {
		width: 1300px;
		min-height: 900px;
		height: fit-content;
		margin: 10px auto;
	}
	#side div{
		float: left;
		width: 320px;
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
	#infoBox {
		float: left;
		width: 800px;
		height: fit-content;
	}	
	
	#info_title {
		width: 750px;
		height: fit-content;
		margin: 0 auto;
		border-bottom: solid;
	}
	#wrap {
		width: 750px;
		height: fit-content;
		margin: 0 auto;
	}
	#reTable {
		margin: 10px auto;
		width: 750px;
		border-collapse: collapse;
	}
	.reTableLine {
		border-bottom: 1px solid #D5D5D5;
		border-top: 1px solid #D5D5D5;
		height: 70px;
	}
	.item div{
		float: left;
	}
	.item div:last-of-type {
		margin-top: 15px;
		margin-left: 10px;
	}
	.item span:first-of-type {
		margin-top: 10px;
		font-size: 10pt;
		font-weight: bold;
	}
	.itemName {
		margin-top: 12px;
        display: block;
        color: #949494;
        width: 170px;
        font-size: 12px;
        font-weight: bolder !important;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }
    .item span:last-of-type {
		font-size: 10pt;
		color: #949494;
		position: relative;
		bottom: 13px;
	}
	.review_wr span:first-of-type {
		position: relative;
		bottom: 15px;
	}
	.review_wr span:nth-of-type(2) {
		float: right;
		font-size: 10pt;
		color: #8C8C8C;
		font-weight: bold;
		position: relative;
		bottom: 15px;
	}

	.reivew_wr span:last-of-type {
		font-size: 10pt;
	}	
	.star {
		filter: invert(84%) sepia(0%) saturate(1407%) hue-rotate(147deg) brightness(97%) contrast(76%);
		Loss: 0.7. This is a perfect result.
	}
</style>
</head>
<script>
	
	
</script>

</head>
<script>

</script>
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
	<form action="mypage_qna.mypage?command=item_qna" method="post" onsubmit="return signupchk()">
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
		<header id="info">
			<h3>MY PAGE</h3>
		</header>
		<section>
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
							<li><a class="head" href="#">여행</a></li>
							<li><a class="head" href="#">항공</a></li>
							<li><a class="head" href="#">호텔</a></li>
							<li><a class="head" href="#">면세점</a></li>
						</ul>
						<!-- menu-submenu accordon-content-->
						<li id="nav3" class="toggle accordion-toggle"> 
							<span class="icon-plus"></span>
							<a class="menu-link" href="#">MY ♡</a>
						</li>
						<!-- accordion-toggle -->
						<ul class="menu-submenu accordion-content">
							<li><a class="head" href="#">여행</a></li>
							<li><a class="head" href="#">항공</a></li>
							<li><a class="head" href="#">호텔</a></li>
							<li><a class="head" href="#">면세점</a></li>
						</ul>
						<!-- menu-submenu accordon-content-->
						<li id="nav4" class="toggle accordion-toggle"> 
							<span class="icon-plus"></span>
							<a class="menu-link" href="#">내가 쓴 Q&A</a>
						</li>
						<!-- accordion-toggle -->
						<ul class="menu-submenu accordion-content">
							<li><a class="head" href="#">여행</a></li>
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
							<li><a class="head" href="#">여행</a></li>
							<li><a class="head" href="#">항공</a></li>
							<li><a class="head" href="#">호텔</a></li>
							<li><a class="head" href="mypage_itemreview.mypage?command=item_review&mb_id=<%= mb_id %>">면세점</a></li>
						</ul>
					</ul>
				   	<!-- menu-list accordion-->
				</div>
			</nav>
			<div id="infoBox">
				<div id="info_title">
					<h2>내가 작성한 리뷰</h2>
				</div>
				<div id="wrap">
					<table id="reTable" cellpadding="10px">
						<tr>
							<td width="320px">상품 정보</td>
							<td>문의 내용</td>
						</tr>
						<% for(int i=0; i<list.size(); i++) {
							String star1 = "<img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'>";
							String star2 = "<img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'>";
							String star3 = "<img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'>";
							String star4 = "<img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'>";
							String star5 = "<img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'>";
							
							String star;
							if(list.get(i).getReRate() == 1){
								star = star1;
							} else if(list.get(i).getReRate() == 2){
								star = star2;
							} else if(list.get(i).getReRate() == 3){
								star = star3;
							} else if(list.get(i).getReRate() == 4){
								star = star4;
							}  else if(list.get(i).getReRate() == 5){
								star = star5;
							} else {
								star = "";
							}
						%>
						 	<tr class="reTableLine">
						 		<td class="item">
						 			<a href="../shopping/itemDetail.shop?itemCode=<%= list.get(i).getItemCode()%>">
						 				<div><img src="<%= list.get(i).getItemImg()%>" width="100px" height="100px"></div>
							 			<div>
							 				<span><%= list.get(i).getBrandName() %></span></br>
								 			<span class="itemName"><%= list.get(i).getItemName() %></span></br>
								 			<span>상품코드 : <%= list.get(i).getItemCode() %></span></br>
							 			</div>	
						 			</a>	
						 		</td>
						 		<td class="review_wr">
						 			<span><%= star %></span>
							 		<span><%= list.get(i).getReDate() %></span></br>	
							 		<span><%= list.get(i).getReText() %></span>		
						 		</td>
						 	</tr>
						
						<% } %>
						</table>
				</div>			
			</div>
		</section>
		<jsp:include page="../overlap/footer.jsp"/>
	</form>
</body>
</html>