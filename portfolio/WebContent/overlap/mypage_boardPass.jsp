<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="vo.Member_info"%>

<%
	Member_info member = (Member_info)request.getAttribute("member");
	String mb_id = (String)session.getAttribute("mb_id");
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
		width: 1200px;
		height: 490px;
		margin: 20px auto;
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
	#infoBox table {
		margin-top: 50px;
		margin-bottom: 30px;
	}
	input:hover {
		background-color: white;
		border-color: #A3AFC9;
	}
	input:focus {
		outline: none;
		background-color: white;
		border-width: 2px;
		border-color: #A3AFC9;
	}
	select {
		border: #D5D5D5 1px solid; 
		height: 45px; 
		border-radius: 5px; 
		width: 125px; 
	}
	select:hover {
		border-color: #A3AFC9;
	}
	select:active {
		border-color: #A3AFC9;
	}
	#signupdiv2 {
		width: 750px;
		height: fit-content;
		margin: 0 auto;
		border-bottom: solid;
	}
	/* 약관동의 문제 생길때 height 바꾸면 됩니다 */
	#signupdiv2 >div{
		margin-left: 70px;
	}
	.signuplabel{
		width: 130px;
		height: 55px;
		float: left;
		line-height: 50px;
		margin: 5px;
		font-size: 10pt;
	}
	

	.signupinputbirth{
		margin: 11px 5px 10px 5px;
		border: none;
		float: left;
	}
	#signupdiv3{
		width: 600px;
		height: 200px;
		margin: 0 auto;
	}
	.signupbotdiv{
		width: 450px;
		height: 50px;
		line-height: 60px;
		float: left;
	}
	.signupradio{
		margin: 15px;
	}
	.signindiv{
		width: 600px;
		height: 100px;
		margin: 0 auto;
	}
	.signinbtn{
		float: left;
		width: 250px;
		height: 50px;
		margin-left: 180px;
		line-height: 50px;
		border-radius: 5px;
		cursor: pointer;
		background-color: white;
		font-size: 14pt;
	}
	#header{
		box-shadow: 0px 1px grey;
	}
	.errortextdiv{
		width: 320px;
		height: 0px;
		margin: 0 auto;
		text-align: left;
		font-size: 8pt;
		float: left;
	}
	.infomessage{
		border-style: none;
		position: relative;
		bottom: 13px;
		font-size: 6pt;
		width: 320px;
		left: 160px;
	}
	#email3{
		width: 100px; float: right;
	}



	.order_info {
		width: 700px;
		border-collapse: collapse;
		margin-top: 50px;
		font-size: 10pt;
		
	}
	.order_info .tableLine {
		border-style: solid;
		border-width: 1px 0 1px 0;
		border-color: #D5D5D5;
		padding: 10px;
		height: 60px;
	}
	.order_info .td1 {
		font-weight: bold;
		width: 90px;
		color: #002266;
		background-color: rgba(237,239,243, 0.7);
	}
	.order_info .td2 {
		width: 200px;
	}
	.eng-name {
		height: 35px;
		width: 200px;
	}
	
	.passnum {
		height: 35px;
		width: 200px;
	}
	.passDate {
		width: 200px;
		height: 35px;
	}
	#order_info:last-of-type {
		margin-bottom: 80px;
	}
</style>
</head>
<script>
	var hiddenidchk = document.getElementById("hiddenidchk");
	$(document).ready(function() {
		
		$(".all").click(function() {
				if($(".all").is(":checked")) $("input[name=check]").prop("checked", true);
				else $("input[name=check]").prop("checked", false);
			});
			$("input[name=check]").click(function() {
				var total = $("input[name=check]").length;
				var checked = $("input[name=check]:checked").length;
				if(total != checked) $(".all").prop("checked", false);
				else $(".all").prop("checked", true); 
			});

	});
	
	function selectEmail(ele){
	    var $ele = $(ele);
	    var $email2 = $('input[name=mb_email2]');

	    // '1'인 경우 직접입력
	    if($ele.val() == "1"){
	        $email2.attr('readonly', false);
	        $email2.val('');
	    } else {
	        $email2.attr('readonly', true);
	        $email2.val($ele.val());
	    }
	}
</script>

</style>
</head>
<script>
	$(docunment).ready(function() {
	
	});
</script>
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
	});
</script>
<body>
	<form name="info" action="board_update.mypage?command=board_update&mb_id=<%= mb_id %>" method="post" onsubmit="return signupchk()">
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
							<li><a class="head" href="shop_qna.mypage?command=shop_qna&mb_id=<%= mb_id %>">면세점</a></li>
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
				<div id="signupdiv2">
					<h2>여권정보</h2>
				</div>
				<table align="center" cellpadding="10px" class="order_info">
					<tr class="tableLine">
						<td class="td1">Last Name<span style="color: red;">*</span></td>
						<% if (member.getMb_lastname() == null) { %>
							<td class="td2"><input type="text" name="mb_lastname" placeholder="Last name(성)" class="eng-name" id="elastname"></td>
						<% } else {%>
						<td class="td2"><input type="text" name="mb_lastname" placeholder="Last name(성)" class="eng-name" value="<%= member.getMb_lastname()%>" readonly style="background-color: rgba(213, 213, 213, 0.3);"></td>
						<% } %>
						<td class="td1">First Name<span style="color: red;">*</span></td>
						<% if (member.getMb_firstname() == null) { %>
							<td class="td2"><input type="text" name="mb_firstname" placeholder="First name(이름)" class="eng-name" id="efirstname"></td>
						<% } else {%>
							<td class="td2"><input type="text" name="mb_firstname" placeholder="First name(이름)" class="eng-name" value="<%= member.getMb_firstname()%>" readonly style="background-color: rgba(213, 213, 213, 0.3);"></td>
						<% } %>
					</tr>
					<tr class="tableLine">
						<td class="td1">여권번호<span style="color: red;">*</span></td>
						<% if (member.getMb_passnum() == null) { %>
							<td class="td2"><input type="text" name="mb_passnum" class="passnum"></td>
						<% } else {%>
							<td class="td2"><input type="text" name="mb_passnum" class="passnum" value="<%= member.getMb_passnum()%>"></td>
						<% } %>
						<td class="td1">여권만료일<span style="color: red;">*</span></td>
						<% if (member.getMb_exdate() == null) { %>
							<td class="td2"><input type="text" name="mb_exdate" class="passnum"></td>
						<% } else {%>
							<td class="td2"><input type="text" name="mb_exdate" class="passnum" value="<%= member.getMb_exdate()%>"></td>
						<% } %>					
					</tr>
				</table>
				<div class="signindiv">
					<input type="submit" class="signinbtn" style="background-color: #030066;color: white;" id="signupbtn2" value="수정하기">
				</div>
			</div>
			
		</section>
		<jsp:include page="../overlap/footer.jsp"/>
	</form>
<script>

	var elastname = document.getElementById("elastname");
	var efirstname = document.getElementById("efirstname");



	// 유효성 검사
	// 1 id, pwd / 소문자 대문자 4 ~ 12자리까지
	// 2 이름(영문) / 영어로만
	var reg1 = /^[a-zA-Z0-9]{4,12}$/
	var reg2 = /[a-zA-Z]/;

	elastname.onblur = function (){
		if(!reg2.test(elastname.value)){
			enamem.innerText="영어를 입력하세요.";
		}
		else if(reg2.test(elastname.value) && reg2.test(efirstname.value)){
			enamem.innerText="";
		}
	}
	efirstname.onblur = function (){
		if(!reg2.test(efirstname.value)){
			enamem.innerText="영어를 입력하세요.";
		}
		else if(reg2.test(elastname.value) && reg2.test(efirstname.value)){
			enamem.innerText="";
		}
	}
	

</script>
</body>
</html>