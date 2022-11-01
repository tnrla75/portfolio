<%@page import="vo.Mypage_qna"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.FlightReserveListBean" %>

<%
	ArrayList<FlightReserveListBean> list1=(ArrayList<FlightReserveListBean>)request.getAttribute("list1");
for(int i =0 ; i<list1.size(); i++){	
	System.out.println(list1.get(i).getSeatNum());
}
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
		display:table;
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
		margin-left: 50px;
	}	
	
	#info_title {
		width: 850px;
		height: fit-content;
		margin: 0 auto;
		border-bottom: solid;
	}
	#wrap {
		width: 850px;
		height: fit-content;
		margin: 0 auto;
		
	}
	#qnaTable {
		margin: 10px auto;
		width: 850px;
		border-collapse: collapse;
	}
	.qnaTableLine {
		border-bottom: 1px solid #D5D5D5;
		border-top: 1px solid #D5D5D5;
		height: 70px;
	}
	.item div{
		float: left;
	}
	.item div:last-of-type {
		margin-top: 15px;
		margin-left: 20px;
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
	#answer1 {
		float: right;
		width: 70px;
		height: 20px;
		color: #949494;
		margin-top: 10px;
		border-style: solid;
		border-width: 1px;
		border-color: #949494;
		font-weight: bold;
		text-align: center;
		font-size: 8pt;
		padding-top: 5px;
		
	}
	#answer2 {
		float: right;
		width: 70px;
		height: 20px;
		color: #4374D9;
		margin-top: 10px;
		border-style: solid;
		border-width: 1px;
		border-color: #4374D9;
		font-weight: bold;
		text-align: center;
		font-size: 8pt;
		padding-top: 5px;
	}
	.qna_text {
		margin-top: 7px;
	}
	.qna_text span:first-of-type {
		font-size: 10pt;
		color: #747474;
	}
	.qna_wr span:last-of-type {
		font-size: 10pt;
	}
	.question_line1 {
		background-color: #F6F6F6;
	}
	.question_line2 {
		background-color: #F6F6F6;
	}
	.question_line1 #question1 {
		width: 600px;
		height: fit-content;
		margin: 20px auto;
		padding-bottom: 30px;
		border-style: solid;
		border-width: 0 0 1px 0;
		border-color: #A6A6A6;
	}
	.question_line1 #question1 b:first-of-type{
		font-size: 40px;
		font-family: 'Montserrat', sans-serif;
		color: #747474;
	}
	.question_line1 #question1 b:last-of-type {
		font-size: 15px;
		font-weight: normal;
		margin-left: 50px;
		position: relative;
		bottom: 5px;
	}
	.question_line1 #question2 {
		width: 600px;
		heightL fit-content;
		margin: 20px auto;
		border-color: #A6A6A6;
	}
	.question_line1 #question2 b:first-of-type {
		font-size: 40px;
		font-family: 'Montserrat', sans-serif;
		color: #4641D9;
	}
	.question_line1 #question2 b:last-of-type {
		font-size: 15px;
		font-weight: normal;
		margin-left: 50px;
		position: relative;
		bottom: 5px;
	}
	
	.question_line2 b:first-of-type {
		font-size: 40px;
		font-family: 'Montserrat', sans-serif;
		color: #747474;
	}
	.question_line2 b:last-of-type {
		font-size: 15px;
		font-weight: normal;
		margin-left: 50px;
		position: relative;
		bottom: 5px;
	}
	.question_line2 div {
		width: 600px;
		heightL fit-content;
		margin: 20px auto;
		border-color: #A6A6A6;
	}	
		.listtable{
			text-align:center;
			width :850px;			
			height: 100px;
			position:relative;
			border-radius: 10px;
		}
		
		.td1{
		 	border-spacing: 0px;
			margin: 0px;
			padding: 0px;
			height: 150px;
			
		}
		.listtable tr td:nth-child(-n+2){
			width: 130px;
    		font-size: 10pt;
    		border-bottom: solid 2px rgba(0,0,0,0.3);
		}
		.listtable tr td:nth-child(n+3){
			width: 150px;
			font-size: 10pt;
			border-bottom: solid 2px rgba(0,0,0,0.3);
		}
		.flightimg{
			box-shadow: rgba(0, 0, 0, 0.05) 0px 6px 24px 0px, rgba(0, 0, 0, 0.08) 0px 0px 0px 1px; 
			width: 50px;
			height: 50px;
			background-color: white;
		}
		.flightname{
			font-size: 14pt;
    		font-weight: bold;
		}
</style>
</head>
<script>
	
	
</script>

</head>
<script>
	function doDisplay1(){
	    var con = document.getElementById("terms1"); 	
	    if(con.style.display=='none'){ 	
	        con.style.display = 'block'; 	
	    }else{ 		
	        con.style.display = 'none'; 	
	    } 
	} 
	
	function qnaDisplay(){
        var con = document.getElementsByName("qna_display"); 	
        if(con.style.display=='none'){ 	

            con.style.display = 'block'; 	
        }else{ 		
            con.style.display = 'none'; 	
        } 
    }
	
</script>
<script>
	$(document).ready(function() {
		$('.qna_display1').hide();
		$('.qna_display2').hide();
		
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
			<jsp:include page="myPageMenu.jsp" />
			<div id="infoBox">
				<div id="info_title">
					<h2>항공 예약 정보 확인</h2>
				</div>
				<div id="wrap">
				<table class="listtable" cellspacing="0">
							<tr class="tr1" style="font-weight: bold; font-size: 14pt; line-height: 50px;">
								<td colspan="2">항공사</td>
								<td> 출발시간 / 출발지</td>
								<td> 도착시간 / 도착지</td>
								<td>성/이름</td>
								<td>좌석</td>					
							</tr>
						<% for(int i =0; i<list1.size(); i++){ %>
							<tr class="tr1">
								<td class="td1">
								<% 
								String flightimg2 = "";
								if(list1.get(i).getFlight_name().equals("제주")){ 
									flightimg2 = "jejuair.png";
								}else if(list1.get(i).getFlight_name().equals("아시아나")){
									flightimg2 = "asiana.png";
								}else if(list1.get(i).getFlight_name().equals("대한")){
									flightimg2 = "koreanair.png";
								}
								%>
								<input type="hidden" value="<%= list1.get(i).getFlight_Ticket_Num() %>" name="ticketNum2">
								
								<img src="../img/flight/<%= flightimg2 %>" class="flightimg"></td>
								<td class="td1" style="text-align: left;"><span class="flightname"><%= list1.get(i).getFlight_name() %></span><br><span class="airplanename"><%= list1.get(i).getFlight_airplaneName() %></span></td>
								<td class="td1"><span class="time"><%= list1.get(i).getFlight_departureTime()%></span><br><span class="airport"><%= list1.get(i).getFlight_departure() %></span></td>
								<td class="td1"><span class="time"><%= list1.get(i).getFlight_arrivalTime() %></span><br><span class="airport"><%= list1.get(i).getFlight_arrival() %></span></td>
								<td class="td1"><%= list1.get(i).getFlight_Rfirstname() %> &nbsp; <%= list1.get(i).getFlight_Rlastname() %></td>			
								<td class="td1"><%= list1.get(i).getSeatNum() %></td>
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