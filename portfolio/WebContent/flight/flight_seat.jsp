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
ArrayList<FlightSeatBean> SeatBeanList1 = (ArrayList<FlightSeatBean>)request.getAttribute("seat1");

%>
</head>
<style>
	#maindiv{
		width:1200px;
		height:1000px;
		border-style:solid;
		box-sizing: border-box;
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
		height:1000px;
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
		width: 1000px;
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
	input[type=checkbox] + label{
	 	display:block;
	 	width:40px;
	 	height:40px;
	 	background: url('../img/flight/legend-economy.svg') no-repeat 0 0px / contain; 

	}
	input[type=checkbox]:checked  + label{
		background-repeat: no-repeat;
		background: url('../img/flight/fl-icon-prefer.png') no-repeat 0 0px / contain;
	}
	input[type=checkbox] {
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


function selectbox() {
	var selectbox = document.getElementById("selectbox");
	var value = selectbox.options[document.getElementById("selectbox").selectedIndex].value;
	var departure = document.getElementById("departure");
	var arrive = document.getElementById("arrive");
	var day = document.getElementById("day");
	var time = document.getElementById("time");
	var selectbox = document.getElementById("selectbox");
	
	// 가는편 오는편 좌석선택
	if(value==1){
		departure.innerText="<%= ticketBeanList1.get(0).getFlight_departure() %>";
		arrive.innerText="<%= ticketBeanList1.get(0).getFlight_arrival() %>";
		day.innerText="출발날 : <%= ticketBeanList1.get(0).getFlight_departureDay() %>";
		time.innerText="출발 시간 : <%= ticketBeanList1.get(0).getFlight_departureTime() %>";
	}else if(value ==2){
		departure.innerText="<%= ticketBeanList2.get(0).getFlight_departure()%>";
		arrive.innerText="<%= ticketBeanList2.get(0).getFlight_arrival() %>";
		day.innerText="출발날 : <%= ticketBeanList2.get(0).getFlight_departureDay() %>";
		time.innerText="출발 시간 : <%= ticketBeanList2.get(0).getFlight_departureTime() %>"; 
	} 
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
<section>
	<div id="ticketinfo">
		<div>
			<div class="ticketinfodiv1">
				<div class="ticketinfodiv2" style="border-right: solid 1px rgba(0,0,0,0.3)">
					<div id="departure">
						<%= ticketBeanList1.get(0).getFlight_departure() %>
					</div>
					<div id="icon">
						<i class="fa-solid fa-arrow-right-long"></i>
					</div>
					<div id="arrive">
						<%= ticketBeanList1.get(0).getFlight_arrival() %>
					</div>
				</div>
				<div class="ticketinfodiv2">
					<div id="date">
						<span> 항공기명 </span>
						<br>
						<span id="day">출발날 : <%= ticketBeanList1.get(0).getFlight_departureDay() %></span>
						<span id="time">출발 시간 : <%= ticketBeanList1.get(0).getFlight_departureTime() %></span>
					</div>
					<div id="count">
						
					</div>
				</div>
			</div>
		</div>
		<div>
			<select id="selectbox" onchange="selectbox()">
				<option value="1">항공편 선택 1 / 2</option>
				<option value="2">항공편 선택 2 / 2 </option>
			</select>
		</div>
	</div>
	<div id="maindiv">
		<div id="mbinfo">
		<% for(int i = 0; i<lastname.length; i++){ %>
		<div>
		<%= i+1 %> <%= lastname[i] %> <%= firstname[i] %>
		</div>
		<% }%>
			
		</div>
		<div id="seatdiv">
		<div style=" width:fit-content; display: flex; margin:0 auto;">
			<div class="wingleft">
			
			</div>
			<table id="seattable">
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
					<td><input type="checkbox" class="seats" value="boxa1" id="boxa1"><label for="boxa1"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxb1"><label for="boxb1"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxc1"><label for="boxc1"></label></td>
					<td></td><td></td>
					<td><input type="checkbox" class="seats" value="" id="boxd1"><label for="boxd1"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxe1"><label for="boxe1"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxf1"><label for="boxf1"></label></td>
				</tr>
				<tr>
					<td>2</td>
					<td><input type="checkbox" class="seats" value="" id="boxa2"><label for="boxa2"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxb2"><label for="boxb2"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxc2"><label for="boxc2"></label></td>
					<td></td><td></td>
					<td><input type="checkbox" class="seats" value="" id="boxd2"><label for="boxd2"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxe2"><label for="boxe2"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxf2"><label for="boxf2"></label></td>
				</tr>
				<tr>
					<td>3</td>
					<td><input type="checkbox" class="seats" value="" id="boxa3"><label for="boxa3"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxb3"><label for="boxb3"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxc3"><label for="boxc3"></label></td>
					<td></td><td></td>
					<td><input type="checkbox" class="seats" value="" id="boxd3"><label for="boxd3"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxe3"><label for="boxe3"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxf3"><label for="boxf3"></label></td>
				</tr>
				<tr>
					<td>4</td>
					<td><input type="checkbox" class="seats" value="" id="boxa4"><label for="boxa4"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxb4"><label for="boxb4"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxc4"><label for="boxc4"></label></td>
					<td></td><td></td>
					<td><input type="checkbox" class="seats" value="" id="boxd4"><label for="boxd4"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxe4"><label for="boxe4"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxf4"><label for="boxf4"></label></td>
				</tr>
				<tr>
					<td>5</td>
					<td><input type="checkbox" class="seats" value="" id="boxa5"><label for="boxa5"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxb5"><label for="boxb5"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxc5"><label for="boxc5"></label></td>
					<td></td><td></td>
					<td><input type="checkbox" class="seats" value="" id="boxd5"><label for="boxd5"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxe5"><label for="boxe5"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxf5"><label for="boxf5"></label></td>
				</tr>
				<tr>
					<td>6</td>
					<td><input type="checkbox" class="seats" value="" id="boxa6"><label for="boxa6"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxb6"><label for="boxb6"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxc6"><label for="boxc6"></label></td>
					<td></td><td></td>
					<td><input type="checkbox" class="seats" value="" id="boxd6"><label for="boxd6"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxe6"><label for="boxe6"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxf6"><label for="boxf6"></label></td>
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
					<td><input type="checkbox" class="seats" value="" id="boxa7"><label for="boxa7"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxb7"><label for="boxb7"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxc7"><label for="boxc7"></label></td>
					<td></td><td></td>
					<td><input type="checkbox" class="seats" value="" id="boxd7"><label for="boxd7"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxe7"><label for="boxe7"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxf7"><label for="boxf7"></label></td>
				</tr>
				<tr>
					<td>8</td>
					<td><input type="checkbox" class="seats" value="" id="boxa8"><label for="boxa8"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxb8"><label for="boxb8"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxc8"><label for="boxc8"></label></td>
					<td></td><td></td>
					<td><input type="checkbox" class="seats" value="" id="boxd8"><label for="boxd8"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxe8"><label for="boxe8"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxf8"><label for="boxf8"></label></td>
				</tr> 
				<tr>
					<td>9</td>
					<td><input type="checkbox" class="seats" value="" id="boxa9"><label for="boxa9"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxb9"><label for="boxb9"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxc9"><label for="boxc9"></label></td>
					<td></td><td></td>
					<td><input type="checkbox" class="seats" value="" id="boxd9"><label for="boxd9"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxe9"><label for="boxe9"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxf9"><label for="boxf9"></label></td>
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
					<td>10</td>
					<td><input type="checkbox" class="seats" value="" id="boxa10"><label for="boxa10"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxb10"><label for="boxb10"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxc10"><label for="boxc10"></label></td>
					<td></td><td></td>
					<td><input type="checkbox" class="seats" value="" id="boxd10"><label for="boxd10"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxe10"><label for="boxe10"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxf10"><label for="boxf10"></label></td>
				</tr> 
				<tr>
					<td>11</td>
					<td><input type="checkbox" class="seats" value="" id="boxa11"><label for="boxa11"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxb11"><label for="boxb11"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxc11"><label for="boxc11"></label></td>
					<td></td><td></td>
					<td><input type="checkbox" class="seats" value="" id="boxd11"><label for="boxd11"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxe11"><label for="boxe11"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxf11"><label for="boxf11"></label></td>
				</tr> 
				<tr>
					<td>12</td>
					<td><input type="checkbox" class="seats" value="" id="boxa12"><label for="boxa12"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxb12"><label for="boxb12"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxc12"><label for="boxc12"></label></td>
					<td></td><td></td>
					<td><input type="checkbox" class="seats" value="" id="boxd12"><label for="boxd12"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxe12"><label for="boxe12"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxf12"><label for="boxf12"></label></td>
				</tr> 
				<tr>
					<td>13</td>
					<td><input type="checkbox" class="seats" value="" id="boxa13"><label for="boxa13"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxb13"><label for="boxb13"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxc13"><label for="boxc13"></label></td>
					<td></td><td></td>
					<td><input type="checkbox" class="seats" value="" id="boxd13"><label for="boxd13"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxe13"><label for="boxe13"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxf13"><label for="boxf13"></label></td>
				</tr> 
				<tr>
					<td>14</td>
					<td><input type="checkbox" class="seats" value="" id="boxa14"><label for="boxa14"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxb14"><label for="boxb14"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxc14"><label for="boxc14"></label></td>
					<td></td><td></td>
					<td><input type="checkbox" class="seats" value="" id="boxd14"><label for="boxd14"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxe14"><label for="boxe14"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxf14"><label for="boxf14"></label></td>
				</tr> 
				<tr>
					<td>15</td>
					<td><input type="checkbox" class="seats" value="" id="boxa15"><label for="boxa15"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxb15"><label for="boxb15"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxc15"><label for="boxc15"></label></td>
					<td></td><td></td>
					<td><input type="checkbox" class="seats" value="" id="boxd15"><label for="boxd15"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxe15"><label for="boxe15"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxf15"><label for="boxf15"></label></td>
				</tr> 
			</table>
			<div class="wingright">
			
			</div>
			</div>
		</div>
	</div>
</section>
</body>
<script>
window.onload = function(){
	var seat = document.getElementsByClassName("seats");
	
	for(var i =0; i < seat.length; i++){
		<% 
		for(int i =0 ; i < SeatBeanList1.size(); i++){
		%>
		var seatNum = "<%= SeatBeanList1.get(i).getSeatNum() %>";
		if(seat[i].id == seatNum){
			document.getElementsByTagName('label')[i].style.background = "url('../img/flight/legend-unselectable.svg') no-repeat 0 0px / contain"; 
 			document.getElementById(seat[i].id).style.background = "url('../img/flight/legend-unselectable.svg') no-repeat 0 0px / contain"; 
		}
		<% }%>
	} 
}

$(document).ready(function() {
	$("input:checkbox[class='seats']").change(function(){
		if($("input:checkbox[class='seats']:checked").length == <%= lastname.length %>){
			$(":checkbox:not(:checked)").attr("disabled", "disabled");
		} else {
            $("input:checkbox[class='seats']").removeAttr("disabled");
        }
	});
});
</script>
</html>