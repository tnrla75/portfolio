<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ page import="java.util.*"%>
	<%@page import="vo.FlightTicketBean"%>
	<%@page import="vo.FlightSeatBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/header_footer.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script src="http://use.fontawesome.com/releases/v6.1.2/js/all.js"></script>
<title>Insert title here</title>
<%
ArrayList<FlightTicketBean> ticketBeanList1 = (ArrayList<FlightTicketBean>)request.getAttribute("list1");
ArrayList<FlightTicketBean> ticketBeanList2 = (ArrayList<FlightTicketBean>)request.getAttribute("list2"); 
String[] lastname= request.getParameterValues("lastname");
String[] firstname= request.getParameterValues("firstname");
ArrayList<FlightSeatBean> SeatBeanList2 = (ArrayList<FlightSeatBean>)request.getAttribute("seat2");
String totalprice = request.getParameter("totalprice");
String[] box1 = request.getParameterValues("box1");
%>
</head>
<style>
	#maindiv{
		width:1200px;
		height:1000px;
		margin:0 auto;
		display: flex;
	}
	#mbinfo{
		width:300px;
		margin: 10px;
	}
	#mbinfo > div{
		width:200px;
		height:100px;
		border: 1px solid rgba(0, 0, 0, 0.3);
		padding:0 50px;
		line-height: 50px;
	}
	#seatdiv{
		width:850px;
		height:fit-content;
		margin: 10px auto;
		border-style:solid;
		box-sizing: border-box;
	}
	#ticketinfo{
		width:1200px;
		height:120px;
		margin:30px auto;
		display: flex;
	}	
	#ticketinfo > div:nth-child(1){
		background-color: #287DFA1A;
		width: 1200px;
		height:120px;
		border: 1px solid rgba(0, 0, 0, 0.3);
	}
	#ticketinfo > div:nth-child(2){
		background-color: white;
		width:200px;
		height: 120px;
		border: 1px solid rgba(0, 0, 0, 0.3);
	}
	#selectbox{
		border:solid 1px #000000;
		border-radius:3px;
		margin: 35px 20px;
		font-size: 12pt;
		width:150px;
		height:50px;
	}
	#selectbox > option{
		font-size: 12pt;
	}
	.ticketinfodiv1{
		height:50px;
		width: 950px;
		margin: 35px 25px;
		box-sizing: border-box;
		display: flex;
	}
	
	.ticketinfodiv2{
		height:50px;
		width:470px;
		display: flex;
	}
	#departure, #arrive{
		height:50px;
		width:200px;
		line-height: 45px;
	}
	#icon{
		height:50px;
		width:70px;
		line-height: 45px;
	}
	#date{
		width:450px;
		height:50px;
		margin-left: 20px;
	}
	#count{
		width:90px;
		height:50px;
		line-height: 45px;
		font-weight: bold;
		color: #0054FF;
	}
	table{
		margin:50px 0;
		
	}
	td{
		width:20px;
		height:20px;
		text-align: center;
	}
	.seats + label{
	 	display:block;
	 	width:40px;
	 	height:40px;
	 	background: url('../img/flight/legend-economy.svg') no-repeat 0 0px / contain; 

	}
	.seats:checked  + label{
		background-repeat: no-repeat;
		background: url('../img/flight/fl-icon-prefer.png') no-repeat 0 0px / contain;
	}
	.seats {
	    display:none;
	}
	
	.p_seatslabel{
		float: left;
	}
	.p_seats + label{
	 	display:block;
	 	width: 50px;
		height: 50px;
	 	background: url('../img/flight/legend-prestige.svg') no-repeat 0 0px / contain;
	 	float: left;
	 	margin: 0 7px;
	}
	.p_seats:checked  + label{
		background-repeat: no-repeat;
		background: url('../img/flight/prestige-selected.svg') no-repeat 0 0px / contain;
		width: 50px;
		height: 50px;
	}
	.p_seats {
	    display:none;
	}
	#seattable{
		border-right: solid 5px rgba(0,0,0,0.5);
		border-left: solid 5px rgba(0,0,0,0.5);
		padding: 80px 50px;
	}
	.wingleft, .wingright{
		margin: auto 0;
		width:100px;
		height:150px;
		background-color: #eaeaea;
	}
	.wingleft{
		float:right;
		transform: skewY(-25deg);
	}
	.wingright{
		float:left;
		transform: skewY(25deg);
	}
	.exit{
		transform: rotate(-90deg);
		width: 30px;
	}
	.note{
		background-color: #eaeaea;
		border-radius: 10px;
		margin:10px 0;
	}
	#footerprice {
        position: fixed;
        background-color: white;
        left: 0;
        right: 0;
        bottom: 0;
        height: 60px;
      	box-shadow: 0 0 4px rgba(0,0,0,0.5);
        z-index: 1000;
        }
        #textdiv{
        	margin: 0 auto;
        	width: 1200px;
        }
        
        .footer_amount > .span1{
       		height: 60px;
			line-height: 60px;
			font-size: 14pt;
			font-weight: bold;
        }
        .footer_amount > .span2{
        	height: 60px;
			line-height: 60px;
			font-size: 14pt;
			font-weight: bold;
			color: #002266;
			margin-right: 20px;
			float: right;
			border-style: none;
			text-align: right;
			outline: none;
        }
        .footer_amount > .span3{
        	height: 60px;

			line-height: 60px;
			font-size: 14pt;
			font-weight: bold;
			color: #002266;
			margin-right: 20px;
			margin-left: -15px;
			float: right;
			border-style: none;
			text-align: right;
        }
        .footer_backchoice{
        	height: 60px;
        	width: 250px;
        	font-weight:bold;
        	color: white;
        	font-size: 14pt;
        	background-color: #002266;
        	border-style: none;
        	float:right;
        }
	
</style>
<script>
$(document).ready(function() {
	$('#count').text('<%= lastname.length %>명 신청');
	
	$("input:checkbox[class='seats']").change(function(){
		if($("input:checkbox[class='seats']:checked").length > <%= lastname.length %>){
			alert("더이상 좌석을 선택할수없습니다.");
		} 
	});
});

function nextstep() {
	var myform = document.myform;
	myform.action = "flight_seat.do?command=flight_bag_meal";
	alert(myform.action);
	myform.submit();
}

</script>
<body>

<%


String id = (String)session.getAttribute("mb_id"); 
if(id == null){
	%>
	<jsp:include page="../overlap/header_login.jsp"/>
	<%
}else{
	%>
	<jsp:include page="../overlap/header_logout.jsp"/>
	<%
}
%>
<form name="myform" onsubmit="seat()"  method="post" >
<input type="hidden" value="<%= ticketBeanList1.get(0).getFlight_Ticket_Num() %>" name="ticketNum1">
<input type="hidden" value="<%= ticketBeanList2.get(0).getFlight_Ticket_Num() %>" name="ticketNum2">
<div id="footerprice">
	<div id="textdiv">
		<div class="footer_amount">
			<input type="hidden" value="<%= request.getParameter("hiddenprice") %>" id="hiddenprice" name="hiddenprice">
			<span class="span1">예상 결제 금액</span>
			<input type="button" class="footer_backchoice" value="수화물 / 기내식 선택" onclick="nextstep()">
			<span class="span3">원</span>
			<input class="span2" name="totalprice" value='<%= totalprice %>' readonly>
		</div>
	</div>
</div>
<section>
	<div id="ticketinfo">
		<div>
			<div class="ticketinfodiv1">
				<div class="ticketinfodiv2" style="border-right: solid 1px rgba(0,0,0,0.3)">
					<div id="departure">
						<%= ticketBeanList2.get(0).getFlight_departure() %>
					</div>
					<div id="icon">
						<i class="fa-solid fa-arrow-right-long"></i>
					</div>
					<div id="arrive">
						<%= ticketBeanList2.get(0).getFlight_arrival() %>
					</div>
				</div>
				<div class="ticketinfodiv2">
					<div id="date">
						<span> <%= ticketBeanList2.get(0).getFlight_airplaneName() %> </span>
						<br>
						<span id="day">출발날 : <%= ticketBeanList2.get(0).getFlight_departureDay() %></span>
						<span id="time">출발 시간 : <%= ticketBeanList2.get(0).getFlight_departureTime() %></span>
					</div>
					<div id="count">
						
					</div>
				</div>
			</div>
		</div>
		
	</div>
	<div id="maindiv">
		<div id="mbinfo">
		<% for(int i = 0; i<lastname.length; i++){ %>
		<div>
			<input type="hidden" value="<%= lastname[i] %>" name="lastname">
			<input type="hidden" value="<%= firstname[i] %>" name="firstname">
			<input type="hidden" value="<%= box1[i] %>" name="box1">
			
		<%= i+1 %> <%= lastname[i] %> <%= firstname[i] %>
		</div>
		<% }%>
		</div>
		<div id="seatdiv">
		<div style=" width:fit-content; display: flex; margin:0 auto;">
			<div class="wingleft">
			</div>
			<table id="seattable">
				<tr rowspan="2">
					<td></td>
					<td colspan="3"><div class="note"><img src="../img/flight/toilet.png"></div></td>
					<td></td>
					<td></td>
					<td colspan="3"><div class="note"><img src="../img/flight/toilet.png"></div></td>
				</tr>
				<tr>
					<td colspan="2"><img src="../img/flight/plane-exit.svg" class="exit"></td>
					<td></td>
					<td></td><td></td>
					<td></td>
					<td></td>
					<td></td>
					<td><img src="../img/flight/plane-exit.svg" class="exit"></td>
				</tr>
				<tr rowspan="2">
					<td></td>
					<td colspan="2"><div  class="note"><img src="../img/flight/galley.png"></div></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td colspan="2"><div class="note"><img src="../img/flight/galley.png"></div></td>
				</tr>
				<tr>
					<td></td>
					<td style="text-align: right;">A</td>
					<td></td>
					<td style="text-align: left;">B</td>
					<td></td>
					<td></td>
					<td style="text-align: right;">C</td>
					<td></td>
					<td style="text-align: left;">D</td>
				</tr>
				<tr>
					<td></td>
					<td colspan="3">
						<input type="checkbox" class="p_seats seats" value="p_boxa1" id="p_boxa1" name="box2"><label for="p_boxa1" class="p_seatslabel seatslabel"></label>
						<input type="checkbox" class="p_seats seats" value="p_boxb1" id="p_boxb1" name="box2"><label for="p_boxb1" class="p_seatslabel seatslabel"></label>
					</td>
					<td></td>
					<td></td>
					<td colspan="3">
						<input type="checkbox" class="p_seats seats" value="p_boxc1" id="p_boxc1" name="box2"><label for="p_boxc1" class="p_seatslabel seatslabel"></label>
						<input type="checkbox" class="p_seats seats" value="p_boxd1" id="p_boxd1" name="box2"><label for="p_boxd1" class="p_seatslabel seatslabel"></label>
					</td>
				</tr>
				<tr>
					<td></td>
					<td colspan="3">
						<input type="checkbox" class="p_seats seats" value="p_boxa2" id="p_boxa2" name="box2"><label for="p_boxa2" class="p_seatslabel seatslabel"></label>
						<input type="checkbox" class="p_seats seats" value="p_boxb2" id="p_boxb2" name="box2"><label for="p_boxb2" class="p_seatslabel seatslabel"></label>
					</td>
					<td></td>
					<td></td>
					<td colspan="3">
						<input type="checkbox" class="p_seats seats" value="p_boxc2" id="p_boxc2" name="box2"><label for="p_boxc2" class="p_seatslabel seatslabel"></label>
						<input type="checkbox" class="p_seats seats" value="p_boxd2" id="p_boxd2" name="box2"><label for="p_boxd2" class="p_seatslabel seatslabel"></label>
					</td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td>A</td>
					<td>B</td>
					<td>C</td>
					<td></td><td></td>
					<td>D</td>
					<td>E</td>
					<td>F</td>
				</tr>
				<tr>
					<td>1</td>
					<td><input type="checkbox" class="seats" value="boxa1" id="boxa1" name="box2"><label for="boxa1" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxb1" id="boxb1" name="box2"><label for="boxb1" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxc1" id="boxc1" name="box2"><label for="boxc1" class="seatslabel"></label></td>
					<td></td><td></td>
					<td><input type="checkbox" class="seats" value="boxd1" id="boxd1" name="box2"><label for="boxd1" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxe1" id="boxe1" name="box2"><label for="boxe1" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxf1" id="boxf1" name="box2"><label for="boxf1" class="seatslabel"></label></td>
				</tr>
				<tr>
					<td>2</td>
					<td><input type="checkbox" class="seats" value="boxa2" id="boxa2" name="box2"><label for="boxa2" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxb2" id="boxb2" name="box2"><label for="boxb2" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxc2" id="boxc2" name="box2"><label for="boxc2" class="seatslabel"></label></td>
					<td></td><td></td>
					<td><input type="checkbox" class="seats" value="boxd2" id="boxd2" name="box2"><label for="boxd2" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxe2" id="boxe2" name="box2"><label for="boxe2" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxf2" id="boxf2" name="box2"><label for="boxf2" class="seatslabel"></label></td>
				</tr>
				<tr>
					<td>3</td>
					<td><input type="checkbox" class="seats" value="boxa3" id="boxa3" name="box2"><label for="boxa3" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxb3" id="boxb3" name="box2"><label for="boxb3" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxc3" id="boxc3" name="box2"><label for="boxc3" class="seatslabel"></label></td>
					<td></td><td></td>
					<td><input type="checkbox" class="seats" value="boxd3" id="boxd3" name="box2"><label for="boxd3" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxe3" id="boxe3" name="box2"><label for="boxe3" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxf3" id="boxf3" name="box2"><label for="boxf3" class="seatslabel"></label></td>
				</tr>
				<tr>
					<td>4</td>
					<td><input type="checkbox" class="seats" value="boxa4" id="boxa4" name="box2"><label for="boxa4" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxb4" id="boxb4" name="box2"><label for="boxb4" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxc4" id="boxc4" name="box2"><label for="boxc4" class="seatslabel"></label></td>
					<td></td><td></td>
					<td><input type="checkbox" class="seats" value="boxd4" id="boxd4" name="box2"><label for="boxd4" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxe4" id="boxe4" name="box2"><label for="boxe4" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxf4" id="boxf4" name="box2"><label for="boxf4" class="seatslabel"></label></td>
				</tr>
				<tr>
					<td>5</td>
					<td><input type="checkbox" class="seats" value="boxa5" id="boxa5" name="box2"><label for="boxa5" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxb5" id="boxb5" name="box2"><label for="boxb5" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxc5" id="boxc5" name="box2"><label for="boxc5" class="seatslabel"></label></td>
					<td></td><td></td>
					<td><input type="checkbox" class="seats" value="boxd5" id="boxd5" name="box2"><label for="boxd5" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxe5" id="boxe5" name="box2"><label for="boxe5" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxf5" id="boxf5" name="box2"><label for="boxf5" class="seatslabel"></label></td>
				</tr>
				<tr>
					<td>6</td>
					<td><input type="checkbox" class="seats" value="boxa6" id="boxa6" name="box2"><label for="boxa6" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxb6" id="boxb6" name="box2"><label for="boxb6" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxc6" id="boxc6" name="box2"><label for="boxc6" class="seatslabel"></label></td>
					<td></td><td></td>
					<td><input type="checkbox" class="seats" value="boxd6" id="boxd6" name="box2"><label for="boxd6" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxe6" id="boxe6" name="box2"><label for="boxe6" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxf6" id="boxf6" name="box2"><label for="boxf6" class="seatslabel"></label></td>
				</tr>
				<tr>
					<td colspan="2"><img src="../img/flight/plane-exit.svg" class="exit"></td>
					<td></td>
					<td></td><td></td>
					<td></td>
					<td></td>
					<td></td>
					<td><img src="../img/flight/plane-exit.svg" class="exit"></td>
				</tr>
				<tr>
					<td>7</td>
					<td><input type="checkbox" class="seats" value="boxa7" id="boxa7" name="box2"><label for="boxa7" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxb7" id="boxb7" name="box2"><label for="boxb7" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxc7" id="boxc7" name="box2"><label for="boxc7" class="seatslabel"></label></td>
					<td></td><td></td>
					<td><input type="checkbox" class="seats" value="boxd7" id="boxd7" name="box2"><label for="boxd7" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxe7" id="boxe7" name="box2"><label for="boxe7" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxf7" id="boxf7" name="box2"><label for="boxf7" class="seatslabel"></label></td>
				</tr>
				<tr>
					<td>8</td>
					<td><input type="checkbox" class="seats" value="boxa8" id="boxa8" name="box2"><label for="boxa8" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxb8" id="boxb8" name="box2"><label for="boxb8" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxc8" id="boxc8" name="box2"><label for="boxc8" class="seatslabel"></label></td>
					<td></td><td></td>
					<td><input type="checkbox" class="seats" value="boxd8" id="boxd8" name="box2"><label for="boxd8" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxe8" id="boxe8" name="box2"><label for="boxe8" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxf8" id="boxf8" name="box2"><label for="boxf8" class="seatslabel"></label></td>
				</tr> 
				<tr>
					<td>9</td>
					<td><input type="checkbox" class="seats" value="boxa9" id="boxa9" name="box2"><label for="boxa9" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxb9" id="boxb9" name="box2"><label for="boxb9" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxc9" id="boxc9" name="box2"><label for="boxc9" class="seatslabel"></label></td>
					<td></td><td></td>
					<td><input type="checkbox" class="seats" value="boxd9" id="boxd9" name="box2"><label for="boxd9" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxe9" id="boxe9" name="box2"><label for="boxe9" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxf9" id="boxf9" name="box2"><label for="boxf9" class="seatslabel"></label></td>
				</tr> 
				<tr>
					<td>10</td>
					<td><input type="checkbox" class="seats" value="boxa10" id="boxa10" name="box2"><label for="boxa10" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxb10" id="boxb10" name="box2"><label for="boxb10" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxc10" id="boxc10" name="box2"><label for="boxc10" class="seatslabel"></label></td>
					<td></td><td></td>
					<td><input type="checkbox" class="seats" value="boxd10" id="boxd10" name="box2"><label for="boxd10" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxe10" id="boxe10" name="box2"><label for="boxe10" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxf10" id="boxf10" name="box2"><label for="boxf10" class="seatslabel"></label></td>
				</tr> 
				<tr>
					<td>11</td>
					<td><input type="checkbox" class="seats" value="boxa11" id="boxa11" name="box2"><label for="boxa11" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxb11" id="boxb11" name="box2"><label for="boxb11" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxc11" id="boxc11" name="box2"><label for="boxc11" class="seatslabel"></label></td>
					<td></td><td></td>
					<td><input type="checkbox" class="seats" value="boxd11" id="boxd11" name="box2"><label for="boxd11" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxe11" id="boxe11" name="box2"><label for="boxe11" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxf11" id="boxf11" name="box2"><label for="boxf11" class="seatslabel"></label></td>
				</tr> 
				<tr>
					<td>12</td>
					<td><input type="checkbox" class="seats" value="boxa12" id="boxa12" name="box2"><label for="boxa12" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxb12" id="boxb12" name="box2"><label for="boxb12" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxc12" id="boxc12" name="box2"><label for="boxc12" class="seatslabel"></label></td>
					<td></td><td></td>
					<td><input type="checkbox" class="seats" value="boxd12" id="boxd12" name="box2"><label for="boxd12" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxe12" id="boxe12" name="box2"><label for="boxe12" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxf12" id="boxf12" name="box2"><label for="boxf12" class="seatslabel"></label></td>
				</tr> 
				<tr>
					<td>13</td>
					<td><input type="checkbox" class="seats" value="boxa13" id="boxa13" name="box2"><label for="boxa13" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxb13" id="boxb13" name="box2"><label for="boxb13" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxc13" id="boxc13" name="box2"><label for="boxc13" class="seatslabel"></label></td>
					<td></td><td></td>
					<td><input type="checkbox" class="seats" value="boxd13" id="boxd13" name="box2"><label for="boxd13" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxe13" id="boxe13" name="box2"><label for="boxe13" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxf13" id="boxf13" name="box2"><label for="boxf13" class="seatslabel"></label></td>
				</tr> 
				<tr>
					<td>14</td>
					<td><input type="checkbox" class="seats" value="boxa14" id="boxa14" name="box2"><label for="boxa14" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxb14" id="boxb14" name="box2"><label for="boxb14" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxc14" id="boxc14" name="box2"><label for="boxc14" class="seatslabel"></label></td>
					<td></td><td></td>
					<td><input type="checkbox" class="seats" value="boxd14" id="boxd14" name="box2"><label for="boxd14" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxe14" id="boxe14" name="box2"><label for="boxe14" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxf14" id="boxf14" name="box2"><label for="boxf14" class="seatslabel"></label></td>
				</tr> 
				<tr>
					<td>15</td>
					<td><input type="checkbox" class="seats" value="boxa15" id="boxa15" name="box2"><label for="boxa15" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxb15" id="boxb15" name="box2"><label for="boxb15" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxc15" id="boxc15" name="box2"><label for="boxc15" class="seatslabel"></label></td>
					<td></td><td></td>
					<td><input type="checkbox" class="seats" value="boxd15" id="boxd15" name="box2"><label for="boxd15" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxe15" id="boxe15" name="box2"><label for="boxe15" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxf15" id="boxf15" name="box2"><label for="boxf15" class="seatslabel"></label></td>
				</tr>
				<tr>
					<td colspan="2"><img src="../img/flight/plane-exit.svg" class="exit"></td>
					<td></td>
					<td></td>
					<td></td><td></td>
					<td></td>
					<td></td>
					<td><img src="../img/flight/plane-exit.svg" class="exit"></td>
				</tr>
				<tr>
					<td>16</td>
					<td><input type="checkbox" class="seats" value="boxa16" id="boxa16" name="box2"><label for="boxa16" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxb16" id="boxb16" name="box2"><label for="boxb16" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxc16" id="boxc16" name="box2"><label for="boxc16" class="seatslabel"></label></td>
					<td></td><td></td>
					<td><input type="checkbox" class="seats" value="boxd16" id="boxd16" name="box2"><label for="boxd16" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxe16" id="boxe16" name="box2"><label for="boxe16" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxf16" id="boxf16" name="box2"><label for="boxf16" class="seatslabel"></label></td>
				</tr>
				<tr>
					<td>17</td>
					<td><input type="checkbox" class="seats" value="boxa17" id="boxa17" name="box2"><label for="boxa17" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxb17" id="boxb17" name="box2"><label for="boxb17" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxc17" id="boxc17" name="box2"><label for="boxc17" class="seatslabel"></label></td>
					<td></td><td></td>
					<td><input type="checkbox" class="seats" value="boxd17" id="boxd17" name="box2"><label for="boxd17" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxe17" id="boxe17" name="box2"><label for="boxe17" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxf17" id="boxf17" name="box2"><label for="boxf17" class="seatslabel"></label></td>
				</tr>
				<tr>
					<td>18</td>
					<td><input type="checkbox" class="seats" value="boxa18" id="boxa18" name="box2"><label for="boxa18" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxb18" id="boxb18" name="box2"><label for="boxb18" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxc18" id="boxc18" name="box2"><label for="boxc18" class="seatslabel"></label></td>
					<td></td><td></td>
					<td><input type="checkbox" class="seats" value="boxd18" id="boxd18" name="box2"><label for="boxd18" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxe18" id="boxe18" name="box2"><label for="boxe18" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxf18" id="boxf18" name="box2"><label for="boxf18" class="seatslabel"></label></td>
				</tr>
				<tr>
					<td>19</td>
					<td><input type="checkbox" class="seats" value="boxa19" id="boxa19" name="box2"><label for="boxa19" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxb19" id="boxb19" name="box2"><label for="boxb19" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxc19" id="boxc19" name="box2"><label for="boxc19" class="seatslabel"></label></td>
					<td></td><td></td>
					<td><input type="checkbox" class="seats" value="boxd19" id="boxd19" name="box2"><label for="boxd19" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxe19" id="boxe19" name="box2"><label for="boxe19" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxf19" id="boxf19" name="box2"><label for="boxf19" class="seatslabel"></label></td>
				</tr>
				<tr>
					<td>20</td>
					<td><input type="checkbox" class="seats" value="boxa20" id="boxa20" name="box2"><label for="boxa20" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxb20" id="boxb20" name="box2"><label for="boxb20" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxc20" id="boxc20" name="box2"><label for="boxc20" class="seatslabel"></label></td>
					<td></td><td></td>
					<td><input type="checkbox" class="seats" value="boxd20" id="boxd20" name="box2"><label for="boxd20" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxe20" id="boxe20" name="box2"><label for="boxe20" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxf20" id="boxf20" name="box2"><label for="boxf20" class="seatslabel"></label></td>
				</tr>
				<tr>
					<td>21</td>
					<td><input type="checkbox" class="seats" value="boxa21" id="boxa21" name="box2"><label for="boxa21" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxb21" id="boxb21" name="box2"><label for="boxb21" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxc21" id="boxc21" name="box2"><label for="boxc21" class="seatslabel"></label></td>
					<td></td><td></td>
					<td><input type="checkbox" class="seats" value="boxd21" id="boxd21" name="box2"><label for="boxd21" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxe21" id="boxe21" name="box2"><label for="boxe21" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="boxf21" id="boxf21" name="box2"><label for="boxf21" class="seatslabel"></label></td>
				</tr>
				<tr rowspan="2">
					<td></td>
					<td colspan="2"><div  class="note"><img src="../img/flight/galley.png"></div></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td colspan="2"><div class="note"><img src="../img/flight/galley.png"></div></td>
				</tr>
				<tr rowspan="2">
					<td></td>
					<td colspan="3"><div class="note"><img src="../img/flight/toilet.png"></div></td>
					<td></td>
					<td></td>
					<td colspan="3"><div class="note"><img src="../img/flight/toilet.png"></div></td>
				</tr>
			</table>
			<div class="wingright">
			
			</div>
			</div>
		</div>
	</div>
</section>
</form>
</body>
<script>
window.onload = function(){
	var seat = document.getElementsByClassName("seats");
	var p_seats = document.getElementsByClassName("p_seats");
	for(var i =0; i < seat.length; i++){
		<% 
		for(int i =0 ; i < SeatBeanList2.size(); i++){
		%>
		var seatNum = "<%= SeatBeanList2.get(i).getSeatNum() %>";
		if(seat[i].id == seatNum){
			document.getElementsByClassName('seatslabel')[i].style.background = "url('../img/flight/legend-unselectable.svg') no-repeat 0 0px / contain"; 
 			document.getElementById(seat[i].id).style.background = "url('../img/flight/legend-unselectable.svg') no-repeat 0 0px / contain"; 
		}
		/* else(seats[i].id == seatNum){
			document.getElementsByClassName('p_seatslabel')[i].style.background = "url('../img/flight/legend-unselectable.svg') no-repeat 0 0px / contain"; 
 			document.getElementById(seats[i].id).style.background = "url('../img/flight/legend-unselectable.svg') no-repeat 0 0px / contain"; 
		}  */
		<% }%>
	} 
}

$(document).ready(function() {
	$("input:checkbox[class='seats']").change(function(){
		var seatlength = $("input:checkbox[class='seats']:checked").length;
		var p_seatlength = $("input:checkbox[class='p_seats']:checked").length;
		var lengthsum = seatlength + p_seatlength;
		if(lengthsum == <%= lastname.length %>){
			$(":checkbox:not(:checked)").attr("disabled", "disabled");
		} else {
            $("input:checkbox[class='seats']").removeAttr("disabled");
            $("input:checkbox[class='p_seats seats']").removeAttr("disabled");
        }
	});
	$("input:checkbox[class='p_seats seats']").change(function(){
		var seatlength = $("input:checkbox[class='seats']:checked").length;
		var p_seatlength = $("input:checkbox[class='p_seats seats']:checked").length;
		var lengthsum = seatlength + p_seatlength;
		if(lengthsum == <%= lastname.length %>){
			$(":checkbox:not(:checked)").attr("disabled", "disabled");
		} else {
            $("input:checkbox[class='p_seats seats']").removeAttr("disabled");
            $("input:checkbox[class='seats']").removeAttr("disabled");
        }
	});
});
</script>
</html>