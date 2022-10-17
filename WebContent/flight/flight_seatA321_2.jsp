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
	 	width: 53px;
		height: 53px;
	 	background: url('../img/flight/legend-prestige.svg') no-repeat 0 0px / contain;
	 	float: left;
	 	margin: 0px;
	 	padding: 0px;
	}
	.p_seats:checked  + label{
		background-repeat: no-repeat;
		background: url('../img/flight/prestige-selected.svg') no-repeat 0 0px / contain;
		width: 53px;
		height: 53px;
	}
	.p_seats {
	    display:none;
	}
	#seattable{
		border-right: solid 5px rgba(0,0,0,0.5);
		border-left: solid 5px rgba(0,0,0,0.5);
		padding: 80px 50px;
	}
	#p_seattable{
		border-right: solid 5px rgba(0,0,0,0.5);
		border-left: solid 5px rgba(0,0,0,0.5);
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
	
</style>
<script>
$(document).ready(function() {
	$('#count').text('<%= lastname.length %>명 신청');
	
	$("#selectbox").change(function(){    
		var selectVal =  $(this).val();
		if(selectVal == 2){
			var airplaneName = "<%= ticketBeanList2.get(0).getFlight_airplaneName() %>";
			var myform = document.myform;
			if(airplaneName == "Boeing 737"){
				myform.action = "flight_seat.do?command=flightseatB737_2";
				alert(myform.action);
				myform.submit();
			}
			else if(airplaneName == "A321"){
				myform.action = "flight_seat.do?command=flightseatA321_2";
				alert(myform.action);
				myform.submit();
			}
		}
	});
	
	$("input:checkbox[class='seats']").change(function(){
		if($("input:checkbox[class='seats']:checked").length > <%= lastname.length %>){
			alert("더이상 좌석을 선택할수없습니다.");
		} 
	});
});

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
<input type="hidden" value="aa" name="bool">
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
			<input type="hidden" value="<%= lastname[i] %>" name="lastname">
			<input type="hidden" value="<%= firstname[i] %>" name="firstname">
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
					<td colspan="2"><img src="../img/flight/plane-exit.svg" class="exit"></td>
					<td></td>
					<td></td>
					<td colspan="2"><div class="note"><img src="../img/flight/galley.png"></div></td>
					<td></td>
					<td></td>
					<td colspan="2"><img src="../img/flight/plane-exit.svg" class="exit"></td>
				</tr>
				<tr>
					<td></td>
					<td colspan="2"><div class="note"><img src="../img/flight/toilet.png"></div></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td colspan="2"><div class="note"><img src="../img/flight/toilet.png"></div></td>
				</tr>
				<tr>
					<td></td>
					<td colspan="3">
						A&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;B
					</td>
					<td colspan="4">
						C&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;D
					</td>
					<td colspan="3">
						E&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;F
					</td>
				</tr>
				<tr>
					<td>9</td>
					<td colspan="3">
						<input type="checkbox" class="p_seats seats" value="" id="p_boxa9"><label for="p_boxa9" class="p_seatslabel seatslabel"></label>
						<input type="checkbox" class="p_seats seats" value="" id="p_boxb9"><label for="p_boxb9" class="p_seatslabel seatslabel"></label>
					</td>
					<td colspan="4" style="">
						<div style="width:fit-content; margin: 0 auto;">
							<input type="checkbox" class="p_seats seats" value="" id="p_boxc9"><label for="p_boxe9" class="p_seatslabel seatslabel"></label>
							<input type="checkbox" class="p_seats seats" value="" id="p_boxd9"><label for="p_boxf9" class="p_seatslabel seatslabel"></label>
						</div>
					</td>
					<td colspan="3">
						<input type="checkbox" class="p_seats seats" value="" id="p_boxe9"><label for="p_boxe9" class="p_seatslabel seatslabel"></label>
						<input type="checkbox" class="p_seats seats" value="" id="p_boxf9"><label for="p_boxf9" class="p_seatslabel seatslabel"></label>
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
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>10</td>
					<td colspan="3">
						<input type="checkbox" class="p_seats seats" value="" id="p_boxa10"><label for="p_boxa10" class="p_seatslabel seatslabel"></label>
						<input type="checkbox" class="p_seats seats" value="" id="p_boxb10"><label for="p_boxb10" class="p_seatslabel seatslabel"></label>
					</td>
					<td colspan="4" style="">
						<div style="width:fit-content; margin: 0 auto;">
							<input type="checkbox" class="p_seats seats" value="" id="p_boxc10"><label for="p_boxc10" class="p_seatslabel seatslabel"></label>
							<input type="checkbox" class="p_seats seats" value="" id="p_boxd10"><label for="p_boxd10" class="p_seatslabel seatslabel"></label>
						</div>
					</td>
					<td colspan="3">
						<input type="checkbox" class="p_seats seats" value="" id="p_boxe10"><label for="p_boxe10" class="p_seatslabel seatslabel"></label>
						<input type="checkbox" class="p_seats seats" value="" id="p_boxf10"><label for="p_boxf10" class="p_seatslabel seatslabel"></label>
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
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td>A</td>
					<td>B</td>
					<td></td>
					<td>C</td>
					<td>D</td>
					<td>E</td>
					<td>F</td>
					<td></td>
					<td>G</td>
					<td>H</td>
				</tr>
			
				<tr>
					<td>28</td>
					<td><input type="checkbox" class="seats" value="" id="boxa28"><label for="boxa28" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxb28"><label for="boxb28" class="seatslabel"></label></td>
					<td></td>
					<td><input type="checkbox" class="seats" value="" id="boxc28"><label for="boxc28" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxd28"><label for="boxd28" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxe28"><label for="boxe28" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxf28"><label for="boxf28" class="seatslabel"></label></td>
					<td></td>
					<td><input type="checkbox" class="seats" value="" id="boxg28"><label for="boxg28" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxh28"><label for="boxh28" class="seatslabel"></label></td>
				</tr>
				<tr>
					<td>29</td>
					<td><input type="checkbox" class="seats" value="" id="boxa29"><label for="boxa29" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxb29"><label for="boxb29" class="seatslabel"></label></td>
					<td></td>
					<td><input type="checkbox" class="seats" value="" id="boxc29"><label for="boxc29" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxd29"><label for="boxd29" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxe29"><label for="boxe29" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxf29"><label for="boxf29" class="seatslabel"></label></td>
					<td></td>
					<td><input type="checkbox" class="seats" value="" id="boxg29"><label for="boxg29" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxh29"><label for="boxh29" class="seatslabel"></label></td>
				</tr>
				<tr>
					<td>30</td>
					<td><input type="checkbox" class="seats" value="" id="boxa30"><label for="boxa30" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxb30"><label for="boxb30" class="seatslabel"></label></td>
					<td></td>
					<td><input type="checkbox" class="seats" value="" id="boxc30"><label for="boxc30" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxd30"><label for="boxd30" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxe30"><label for="boxe30" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxf30"><label for="boxf30" class="seatslabel"></label></td>
					<td></td>
					<td><input type="checkbox" class="seats" value="" id="boxg30"><label for="boxg30" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxh30"><label for="boxh30" class="seatslabel"></label></td>
				</tr>
				<tr>
					<td>31</td>
					<td><input type="checkbox" class="seats" value="" id="boxa31"><label for="boxa31" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxb31"><label for="boxb31" class="seatslabel"></label></td>
					<td></td>
					<td><input type="checkbox" class="seats" value="" id="boxc31"><label for="boxc31" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxd31"><label for="boxd31" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxe31"><label for="boxe31" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxf31"><label for="boxf31" class="seatslabel"></label></td>
					<td></td>
					<td><input type="checkbox" class="seats" value="" id="boxg31"><label for="boxg31" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxh31"><label for="boxh31" class="seatslabel"></label></td>
				</tr>
				<tr>
					<td>32</td>
					<td><input type="checkbox" class="seats" value="" id="boxa32"><label for="boxa32" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxb32"><label for="boxb32" class="seatslabel"></label></td>
					<td></td>
					<td><input type="checkbox" class="seats" value="" id="boxc32"><label for="boxc32" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxd32"><label for="boxd32" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxe32"><label for="boxe32" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxf32"><label for="boxf32" class="seatslabel"></label></td>
					<td></td>
					<td><input type="checkbox" class="seats" value="" id="boxg32"><label for="boxg32" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxh32"><label for="boxh32" class="seatslabel"></label></td>
				</tr>
				<tr>
					<td>33</td>
					<td><input type="checkbox" class="seats" value="" id="boxa33"><label for="boxa33" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxb33"><label for="boxb33" class="seatslabel"></label></td>
					<td></td>
					<td><input type="checkbox" class="seats" value="" id="boxc33"><label for="boxc33" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxd33"><label for="boxd33" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxe33"><label for="boxe33" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxf33"><label for="boxf33" class="seatslabel"></label></td>
					<td></td>
					<td><input type="checkbox" class="seats" value="" id="boxg33"><label for="boxg33" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxh33"><label for="boxh33" class="seatslabel"></label></td>
				</tr>
				<tr>
					<td>34</td>
					<td><input type="checkbox" class="seats" value="" id="boxa34"><label for="boxa34" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxb34"><label for="boxb34" class="seatslabel"></label></td>
					<td></td>
					<td><input type="checkbox" class="seats" value="" id="boxc34"><label for="boxc34" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxd34"><label for="boxd34" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxe34"><label for="boxe34" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxf34"><label for="boxf34" class="seatslabel"></label></td>
					<td></td>
					<td><input type="checkbox" class="seats" value="" id="boxg34"><label for="boxg34" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxh34"><label for="boxh34" class="seatslabel"></label></td>
				</tr>
				<tr>
					<td>35</td>
					<td><input type="checkbox" class="seats" value="" id="boxa35"><label for="boxa35" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxb35"><label for="boxb35" class="seatslabel"></label></td>
					<td></td>
					<td><input type="checkbox" class="seats" value="" id="boxc35"><label for="boxc35" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxd35"><label for="boxd35" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxe35"><label for="boxe35" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxf35"><label for="boxf35" class="seatslabel"></label></td>
					<td></td>
					<td><input type="checkbox" class="seats" value="" id="boxg35"><label for="boxg35" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxh35"><label for="boxh35" class="seatslabel"></label></td>
				</tr>
				<tr>
					<td>36</td>
					<td><input type="checkbox" class="seats" value="" id="boxa36"><label for="boxa36" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxb36"><label for="boxb36" class="seatslabel"></label></td>
					<td></td>
					<td><input type="checkbox" class="seats" value="" id="boxc36"><label for="boxc36" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxd36"><label for="boxd36" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxe36"><label for="boxe36" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxf36"><label for="boxf36" class="seatslabel"></label></td>
					<td></td>
					<td><input type="checkbox" class="seats" value="" id="boxg36"><label for="boxg36" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxh36"><label for="boxh36" class="seatslabel"></label></td>
				</tr>
				<tr>
					<td>37</td>
					<td><input type="checkbox" class="seats" value="" id="boxa37"><label for="boxa37" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxb37"><label for="boxb37" class="seatslabel"></label></td>
					<td></td>
					<td><input type="checkbox" class="seats" value="" id="boxc37"><label for="boxc37" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxd37"><label for="boxd37" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxe37"><label for="boxe37" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxf37"><label for="boxf37" class="seatslabel"></label></td>
					<td></td>
					<td><input type="checkbox" class="seats" value="" id="boxg37"><label for="boxg37" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxh37"><label for="boxh37" class="seatslabel"></label></td>
				</tr>
				<tr>
					<td>38</td>
					<td><input type="checkbox" class="seats" value="" id="boxa38"><label for="boxa38" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxb38"><label for="boxb38" class="seatslabel"></label></td>
					<td></td>
					<td><input type="checkbox" class="seats" value="" id="boxc38"><label for="boxc38" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxd38"><label for="boxd38" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxe38"><label for="boxe38" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxf38"><label for="boxf38" class="seatslabel"></label></td>
					<td></td>
					<td><input type="checkbox" class="seats" value="" id="boxg38"><label for="boxg38" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxh38"><label for="boxh38" class="seatslabel"></label></td>
				</tr>
				<tr>
					<td>39</td>
					<td><input type="checkbox" class="seats" value="" id="boxa39"><label for="boxa39" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxb39"><label for="boxb39" class="seatslabel"></label></td>
					<td></td>
					<td><input type="checkbox" class="seats" value="" id="boxc39"><label for="boxc39" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxd39"><label for="boxd39" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxe39"><label for="boxe39" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxf39"><label for="boxf39" class="seatslabel"></label></td>
					<td></td>
					<td><input type="checkbox" class="seats" value="" id="boxg39"><label for="boxg39" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxh39"><label for="boxh39" class="seatslabel"></label></td>
				</tr>
				<tr>
					<td></td>
					<td colspan="2"><div class="note"><img src="../img/flight/toilet.png"></div></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td colspan="2"><div class="note"><img src="../img/flight/toilet.png"></div></td>
				</tr>
				<tr>
					<td></td>
					<td colspan="2"><img src="../img/flight/plane-exit.svg" class="exit"></td>
					<td></td>
					<td colspan="2"><div class="note"><img src="../img/flight/toilet.png"></div></td>
					<td colspan="2"><div class="note"><img src="../img/flight/toilet.png"></div></td>
					<td></td>
					<td colspan="2"><img src="../img/flight/plane-exit.svg" class="exit"></td>
				</tr>
				<tr>
					<td>41</td>
					<td><input type="checkbox" class="seats" value="" id="boxa41"><label for="boxa41" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxb41"><label for="boxb41" class="seatslabel"></label></td>
					<td></td>
					<td><input type="checkbox" class="seats" value="" id="boxc41"><label for="boxc41" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxd41"><label for="boxd41" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxe41"><label for="boxe41" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxf41"><label for="boxf41" class="seatslabel"></label></td>
					<td></td>
					<td><input type="checkbox" class="seats" value="" id="boxg41"><label for="boxg41" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxh41"><label for="boxh41" class="seatslabel"></label></td>
				</tr>
				<tr>
					<td>42</td>
					<td><input type="checkbox" class="seats" value="" id="boxa42"><label for="boxa42" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxb42"><label for="boxb42" class="seatslabel"></label></td>
					<td></td>
					<td><input type="checkbox" class="seats" value="" id="boxc42"><label for="boxc42" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxd42"><label for="boxd42" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxe42"><label for="boxe42" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxf42"><label for="boxf42" class="seatslabel"></label></td>
					<td></td>
					<td><input type="checkbox" class="seats" value="" id="boxg42"><label for="boxg42" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxh42"><label for="boxh42" class="seatslabel"></label></td>
				</tr>
				<tr>
					<td>43</td>
					<td><input type="checkbox" class="seats" value="" id="boxa43"><label for="boxa43" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxb43"><label for="boxb43" class="seatslabel"></label></td>
					<td></td>
					<td><input type="checkbox" class="seats" value="" id="boxc43"><label for="boxc43" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxd43"><label for="boxd43" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxe43"><label for="boxe43" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxf43"><label for="boxf43" class="seatslabel"></label></td>
					<td></td>
					<td><input type="checkbox" class="seats" value="" id="boxg43"><label for="boxg43" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxh43"><label for="boxh43" class="seatslabel"></label></td>
				</tr>
				<tr>
					<td>44</td>
					<td><input type="checkbox" class="seats" value="" id="boxa44"><label for="boxa44" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxb44"><label for="boxb44" class="seatslabel"></label></td>
					<td></td>
					<td><input type="checkbox" class="seats" value="" id="boxc44"><label for="boxc44" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxd44"><label for="boxd44" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxe44"><label for="boxe44" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxf44"><label for="boxf44" class="seatslabel"></label></td>
					<td></td>
					<td><input type="checkbox" class="seats" value="" id="boxg44"><label for="boxg44" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxh44"><label for="boxh44" class="seatslabel"></label></td>
				</tr>
				<tr>
					<td>45</td>
					<td><input type="checkbox" class="seats" value="" id="boxa45"><label for="boxa45" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxb45"><label for="boxb45" class="seatslabel"></label></td>
					<td></td>
					<td><input type="checkbox" class="seats" value="" id="boxc45"><label for="boxc45" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxd45"><label for="boxd45" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxe45"><label for="boxe45" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxf45"><label for="boxf45" class="seatslabel"></label></td>
					<td></td>
					<td><input type="checkbox" class="seats" value="" id="boxg45"><label for="boxg45" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxh45"><label for="boxh45" class="seatslabel"></label></td>
				</tr>
				<tr>
					<td>46</td>
					<td><input type="checkbox" class="seats" value="" id="boxa46"><label for="boxa46" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxb46"><label for="boxb46" class="seatslabel"></label></td>
					<td></td>
					<td><input type="checkbox" class="seats" value="" id="boxc46"><label for="boxc46" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxd46"><label for="boxd46" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxe46"><label for="boxe46" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxf46"><label for="boxf46" class="seatslabel"></label></td>
					<td></td>
					<td><input type="checkbox" class="seats" value="" id="boxg46"><label for="boxg46" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxh46"><label for="boxh46" class="seatslabel"></label></td>
				</tr>
				<tr>
					<td>47</td>
					<td><input type="checkbox" class="seats" value="" id="boxa47"><label for="boxa47" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxb47"><label for="boxb47" class="seatslabel"></label></td>
					<td></td>
					<td><input type="checkbox" class="seats" value="" id="boxc47"><label for="boxc47" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxd47"><label for="boxd47" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxe47"><label for="boxe47" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxf47"><label for="boxf47" class="seatslabel"></label></td>
					<td></td>
					<td><input type="checkbox" class="seats" value="" id="boxg47"><label for="boxg47" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxh47"><label for="boxh47" class="seatslabel"></label></td>
				</tr>
				<tr>
					<td>48</td>
					<td><input type="checkbox" class="seats" value="" id="boxa48"><label for="boxa48" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxb48"><label for="boxb48" class="seatslabel"></label></td>
					<td></td>
					<td><input type="checkbox" class="seats" value="" id="boxc48"><label for="boxc48" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxd48"><label for="boxd48" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxe48"><label for="boxe48" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxf48"><label for="boxf48" class="seatslabel"></label></td>
					<td></td>
					<td><input type="checkbox" class="seats" value="" id="boxg48"><label for="boxg48" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxh48"><label for="boxh48" class="seatslabel"></label></td>
				</tr>
				<tr>
					<td>49</td>
					<td><input type="checkbox" class="seats" value="" id="boxa49"><label for="boxa49" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxb49"><label for="boxb49" class="seatslabel"></label></td>
					<td></td>
					<td><input type="checkbox" class="seats" value="" id="boxc49"><label for="boxc49" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxd49"><label for="boxd49" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxe49"><label for="boxe49" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxf49"><label for="boxf49" class="seatslabel"></label></td>
					<td></td>
					<td><input type="checkbox" class="seats" value="" id="boxg49"><label for="boxg49" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxh49"><label for="boxh49" class="seatslabel"></label></td>
				</tr>
				<tr>
					<td>50</td>
					<td><input type="checkbox" class="seats" value="" id="boxa50"><label for="boxa50" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxb50"><label for="boxb50" class="seatslabel"></label></td>
					<td></td>
					<td><input type="checkbox" class="seats" value="" id="boxc50"><label for="boxc50" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxd50"><label for="boxd50" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxe50"><label for="boxe50" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxf50"><label for="boxf50" class="seatslabel"></label></td>
					<td></td>
					<td><input type="checkbox" class="seats" value="" id="boxg50"><label for="boxg50" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxh50"><label for="boxh50" class="seatslabel"></label></td>
				</tr>
				<tr>
					<td>51</td>
					<td><input type="checkbox" class="seats" value="" id="boxa51"><label for="boxa51" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxb51"><label for="boxb51" class="seatslabel"></label></td>
					<td></td>
					<td><input type="checkbox" class="seats" value="" id="boxc51"><label for="boxc51" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxd51"><label for="boxd51" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxe51"><label for="boxe51" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxf51"><label for="boxf51" class="seatslabel"></label></td>
					<td></td>
					<td><input type="checkbox" class="seats" value="" id="boxg51"><label for="boxg51" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxh51"><label for="boxh51" class="seatslabel"></label></td>
				</tr>
				<tr>
					<td>52</td>
					<td><input type="checkbox" class="seats" value="" id="boxa52"><label for="boxa52" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxb52"><label for="boxb52" class="seatslabel"></label></td>
					<td></td>
					<td><input type="checkbox" class="seats" value="" id="boxc52"><label for="boxc52" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxd52"><label for="boxd52" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxe52"><label for="boxe52" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxf52"><label for="boxf52" class="seatslabel"></label></td>
					<td></td>
					<td><input type="checkbox" class="seats" value="" id="boxg52"><label for="boxg52" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxh52"><label for="boxh52" class="seatslabel"></label></td>
				</tr>
				<tr>
					<td>53</td>
					<td><input type="checkbox" class="seats" value="" id="boxa53"><label for="boxa53" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxb53"><label for="boxb53" class="seatslabel"></label></td>
					<td></td>
					<td><input type="checkbox" class="seats" value="" id="boxc53"><label for="boxc53" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxd53"><label for="boxd53" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxe53"><label for="boxe53" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxf53"><label for="boxf53" class="seatslabel"></label></td>
					<td></td>
					<td><input type="checkbox" class="seats" value="" id="boxg53"><label for="boxg53" class="seatslabel"></label></td>
					<td><input type="checkbox" class="seats" value="" id="boxh53"><label for="boxh53" class="seatslabel"></label></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td colspan="2"><div class="note"><img src="../img/flight/toilet.png"></div></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td colspan="2"><img src="../img/flight/plane-exit.svg" class="exit"></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td colspan="2"><img src="../img/flight/plane-exit.svg" class="exit"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td colspan="2"><div class="note"><img src="../img/flight/galley.png"></div></td>
					<td></td>
					<td></td>
					<td colspan="2"><div class="note"><img src="../img/flight/galley.png"></div></td>
					<td></td>
					<td></td>
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