<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ page import="java.util.*"%>
	<%@page import="vo.FlightTicketBean"%>
	<%@page import="vo.PageInfo"%>
	<%@ page import="java.text.SimpleDateFormat"%>
	<%
		ArrayList<FlightTicketBean> ticketBeanList3 = (ArrayList<FlightTicketBean>)request.getAttribute("ticketBeanList3"); 
		
		String people =request.getParameter("flight_people2");
		String seat = request.getParameter("seatGrade2");
		
		PageInfo pageInfo3 = (PageInfo)request.getAttribute("pageInfo3");
		int listCount3=pageInfo3.getListCount();
		int nowPage3=pageInfo3.getPage();
		int maxPage3=pageInfo3.getMaxPage();
		int startPage3=pageInfo3.getStartPage();
		int endPage3=pageInfo3.getEndPage();
	%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="../css/header_footer.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script src="http://use.fontawesome.com/releases/v6.1.2/js/all.js"></script>
	
	<title></title>
	<style>
		.people {
			width: 120px;
			padding: 5px;
			border-style: solid;
			border-width: 0;
			background: url(../img/icon/people.png);
			background-position: 100px;
			background-size: 15px;
			background-repeat: no-repeat;
			border-color: black;
			-webkit-appearance: none;
			-moz-appearance: none;
			appearance: none;
			position: relative;
			left: 30px;
		}
		#tab-2 {
			position: relative;
			height: 160px;
		}
		#tab-2 h3 {
			position: relative;
			right: 10px;
		}
		.seatGrade {
			width:120px;
			padding:5px;
			border-style: solid;
			border-width: 0;
			background:url(../img/icon/seat.png);
			background-position: 100px;
			background-size: 15px;
			background-repeat: no-repeat;
			border-color: black;
			-webkit-appearance: none;
			-moz-appearance: none;
			appearance : none;
			position: relative;
			left: 30px;
		}
		.seatGrade2 {
			width:150px;
			padding:5px;
			border-style: solid;
			border-width: 0;
			background:url(../img/icon/seat.png);
			background-position: 100px;
			background-size: 15px;
			background-repeat: no-repeat;
			border-color: black;
			-webkit-appearance: none;
			-moz-appearance: none;
			appearance : none;
			position: relative;
			left: 70px;
		}
		.searchBot {
			position: relative;
			left: 20px;
			padding-right: 50px;
		}
		.airplainchoice {
			float: left;
			margin-top: 10px;
		}
		.searchBot div{
			width: 1080px;
			height: 60px;
			border-style: solid;
			border-color: #E7E7E7;
			border-width: 1px;
			position: relative;
			padding-right: 50px;
		}
		.searchBot input {
			height: 40px;
			font-size: 12pt;
			border-style: none;
			background-color: white;
			border-top: 0px;
			border-left: 0px;
			border-right: 0px;
		}
		.departure {
			width: 200px;
			background-position: 5px;
			background-size: 30px;
			background-repeat: no-repeat;
		}
		.arrive {
			width: 200px;
			background-position: 5px;
			background-size: 20px;
			background-repeat: no-repeat;
			position: relative;
			left: 10px;
		}
		#datechoice1 {
			width: 120px;
			position: relative;
			left: 40px;
		}
		#datechoice2 {
			width: 120px;
			position: relative;
			left: 60px;
		}
		#datechoice5 {
			width: 150px;
			position: relative;
			left: 80px;
		}
		.searchicon1 {
			position: relative;
			left: 80px;
			width: 50px;
			height: 40px;
			border-style: none;
			background-color: white;
			background:url(../img/icon/loupe.png);
			background-position: center;
			background-size: 20px;
			background-repeat: no-repeat;
		}
		.searchicon2 {
			position: relative;
			left: 70px;
			width: 50px;
			height: 40px;
			border-style: none;
			background-color: white;
			background:url(../img/icon/loupe.png);
			background-position: center;
			background-size: 20px;
			background-repeat: no-repeat;
		}
		.searchicon3 {
			position: relative;
			left: 120px;
			width: 50px;
			height: 40px;
			border-style: none;
			background-color: white;
			background:url(../img/icon/loupe.png);
			background-position: center;
			background-size: 20px;
			background-repeat: no-repeat;
		}
		.people1 {
			background-image: url(img/icon/people.png);
			background-position: 1px center;
			background-size: 20px;
			background-repeat: no-repeat;
			width: 100px;
			position: relative;
			left: 20px;
			text-align: right;
			/*filter: opacity(0.5) drop-shadow(0 0 0 white);*/
		}
		.people2 {
			background-image: url(img/icon/people.png);
			background-position: 1px center;
			background-size: 20px;
			background-repeat: no-repeat;
			width: 100px;
			position: relative;
			left: 20px;
			text-align: right;
			/*filter: opacity(0.5) drop-shadow(0 0 0 white);*/
		}

		.airplaneDate {
			width: 150px;
			position: relative;
			padding-left: 30px;
			font-size: 10pt;
			left: 40px;
			bottom: 3px;
		}
		.tabset {
			position: relative;
			height: 140px;
		}
		.tab-panels {
			position: relative;
			bottom: 20px;
		}
		.tabset > input[type="radio"] {
			position: absolute;
			left: -200vw;
		}
		.tabset .tab-panel {
			display: none;
		}
		.tabset > input:first-child:checked ~ .tab-panels > .tab-panel:first-child,
		.tabset > input:nth-child(3):checked ~ .tab-panels > .tab-panel:nth-child(2) {
			display: block;
		}
		.tabset > label {
			position: relative;
			display: inline-block;
			padding: 15px 15px 25px;
			border-bottom: 0;
			cursor: pointer;
			font-weight: 600;
		}

		.tabset > label::after {
			content: "";
			position: absolute;
			left: 13px;
			bottom: 10px;
			width: 30px;
			height: 4px;
			background: #8d8d8d;
		}
		.tabset > label:hover,
		.tabset > input:focus + label {
			color: #003399;
		}

		.tabset > label:hover::after,
		.tabset > input:focus + label::after,
		.tabset > input:checked + label::after {
			background: #003399;
		}
		.tabset > input:checked + label {
			border-color: #ccc;
			border-bottom: 1px solid #fff;
			margin-bottom: -1px;
		}
		.tab-panel {
			padding: 30px 0;
		}
		#horizontalTab li img {
			filter: invert(100%) sepia(0%) saturate(7500%) hue-rotate(253deg) brightness(105%) contrast(108%);
		}
		.travel{
			padding-top: -10px;
		}
		.travelbtn{
			border-style: none;background-color: white;width: 200px;height: 25px;
		}
		#flightdiv1{
			width: 1200px; margin: 20px auto; height: 150px;

		}
		#flightdiv2{
			width: 290px;
			height: 600px;
			margin-right: 10px;
			float: left;
			overflow-y: scroll;
			/* background-color: orange; */
			
		}
		/* ???????????? ??????*/
		#flightdiv2::-webkit-scrollbar{
		    width: 6px;
		}

		/* ???????????? ?????? ??????*/
		#flightdiv2::-webkit-scrollbar-thumb{
		    height: 17%;
		    background-color: rgba(33,133,133,1);
		    border-radius: 10px;  
		}

		/* ???????????? ??? ?????? ??????*/
		#flightdiv2::-webkit-scrollbar-track{
		    background-color: rgba(33,133,133,0.33);
		}
		.flightdiv2_indiv{
			width: 265px;
			margin: 5px;
			border-bottom: solid 1px rgba(0, 0, 0, 0.2);
		}
		#flightdiv3{
			width: 900px;
			height: fit-content;
			float: left;
		}
		#flightdivmain{
			width: 1200px; height: 1000px; margin: 0 auto;
		}
		.flightlistdiv{
			border-bottom: solid 1px rgba(0,0,0,0.3);
			width: 880px;
			height: 100px;
			margin: 10px;
		}
		.td1{
			height: 80px;
		}
		.listtable{
			text-align:center;
			width :850px;			
			height: 100px;
			position:relative;
		}
		.td1{
		 	border-spacing: 0px;
			margin: 0px;
			padding: 0px;
		}
		.listtable  tr  td:nth-child(odd){
			width: 80px;
		}
		.listtable  tr  td:nth-child(even){
			width: 200px;
		}
		.flightimg{
			width: 50px;
			height: 50px;
			background-color: white;
		}
		.time{
			font-weight: bold;
		}
		.airport{
			font-size: 10pt;
			color: rgba(0, 0, 0, 0.3);
		}
		.choicebtn{
			border-radius: 5px;
			height: 30px;
			width: 70px;
			margin-left:20px;
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
</head>
<script>	
$(document).ready(function() {
	
	$('.choicebtn').on('click',function(){
		var str = ""
		var tdArr = new Array();	// ?????? ??????
		var checkBtn = $(this);
	
		
		var tr = checkBtn.parent().parent();
		var td = tr.children();
		
		var numberStr3 = td.eq(5).text();
		
		var number3 = numberStr3.replace(/,/g, "");		
		
		alert(number3);
		
		$('#total').val(number3);
		
		myform.action = "../flight/flightDetail.air"
		myform.submit();
	});
	
	<%-- <% if( people.equals("1")){ %>
		$('#flight_people2').val('1').prop("selected",true);
	<%}else if(people.equals("2")){%>
		$('#flight_people2').val('2').prop("selected",true);
	<%}else if(people.equals("3")){%>
		$('#flight_people2').val('3').prop("selected",true);	
	<%}%>
	<% if( seat.equals("???????????? ?????????")){ %>
		$('#seatGrade2').val('???????????? ?????????').prop("selected",true);
	<%}else if(seat.equals("???????????? ?????????")){%>
		$('#seatGrade2').val('???????????? ?????????').prop("selected",true);
	<%}else if(seat.equals("????????? ?????????")){%>
		$('#seatGrade2').val('????????? ?????????').prop("selected",true);	
	<%}%> --%>
});	


</script>
<script>
/* window.onload=function(){
	document.getElementById('datechoice1').value = new Date().toISOString().substring(0, 10);
	document.getElementById('datechoice2').value = new Date().toISOString().substring(0, 10);
	var today = new Date().toISOString().substring(0, 10);
	document.getElementById('datechoice1').setAttribute("min", today);
}
function changeDate1(){
	document.getElementById('datechoice2').setAttribute("min", document.getElementById('datechoice1').value);
	document.getElementById('datechoice2').value = document.getElementById('datechoice1').value;
} */

function getPost(mode)
{
	var myform = document.myform;
	/* 02 ?????? ?????? , 03 ?????? ?????? */
	if(mode == '02'){
		myform.action = "../flight/flightTicketSearch_go.air";
	}
	else if(mode == '03'){
		myform.action ="../flight/flightTicketSearch_oneway.air";
	}
	myform.submit();
};
</script>
<body>
	<form name="myform" action="../flight/flightTicketDetail.air">
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
	<div id="footerprice">
	<div id="textdiv">
		<div class="footer_amount">
		<input type="hidden" id="total" value='' name="total">
			<span class="span1">?????? ?????? ??????</span>
			<input type="button" class="footer_backchoice" value="?????? ??? ??????">
			<span class="span3">???</span>
			<input class="span2" name="totalprice" value='0' readonly>
		</div>
		
	</div>
</div>

		<div id="flightdiv1">
			<div class="tabset">
							<!-- Tab 1 -->
							<input type="radio" name="tabset" id="tab1"
								aria-controls="marzen" name='' checked> <label
								for="tab1">??????</label>
							<!-- Tab 2 -->
							<input type="radio" name="tabset" id="tab2"
								aria-controls="rauchbier" name=''> <label for="tab2">??????</label>
							<div class="tab-panels">
								<section id="marzen" class="tab-panel">
									<div class="searchBot">
										<div
											style="float: left; width: 1080px; border: 1px solid #E7E7E7;">
											<section class="airplainchoice">
										<img src="../img/icon/take-off.png" width="20" height="20" class="flighticon"> 
										
												<input type="text" placeholder="?????????" class="departure"
													name='departure1' value="<%= request.getParameter("departure1") %>">
											</section>
											<section class="airplainchoice">
												<img src="../img/icon/landing.png" width="20" height="20" class="flighticon"> 
												<input type="text" placeholder="?????????" class="arrive"
													name='arrive1' value="<%= request.getParameter("arrive1") %>"> 
													<select class="people"
													name="flight_people1">
													<option>?????????</option>
													<option>1</option>
													<option>2</option>
													<option>3</option>
												</select> <select class="seatGrade" name='seatGrade1'>
													<option>????????????</option>
													<option>???????????? ?????????</option>
													<option>???????????? ?????????</option>
													<option>????????? ?????????</option>
												</select>
											</section>
											<section class="airplainchoice">
												<input type="date" placeholder="?????????" id="datechoice1"
													name='departureDay1' value="<%= request.getParameter("departureDay1") %>" onchange="changeDate1()">
											</section>
											<section class="airplainchoice">
												<input type="date" placeholder="?????????" id="datechoice2"
													name='arrivalDay1' value="<%= request.getParameter("arrivalDay1") %>">
											</section>
											<section class="airplainchoice">
												<input type='button' class="searchicon2"
													onClick="getPost('02')">
											</section>
										</div>
									</div>
								</section>
								<section id="rauchbier" class="tab-panel">
									<div class="searchBot">
										<div>
											<section class="airplainchoice">
											<img src="../img/icon/take-off.png" width="20" height="20" class="flighticon"> 
												<input type="text" placeholder="?????????" class="departure" value="<%= request.getParameter("departure2") %>" name='departure2'>
											</section>
											<section class="airplainchoice">
											<img src="../img/icon/landing.png" width="20" height="20" class="flighticon"> 
												<input type="text" placeholder="?????????" class="arrive" value="<%= request.getParameter("arrive2") %>" name='arrive2'>
												<select class="people" name="flight_people2">
													<option>?????????</option>
													<option>1</option>
													<option>2</option>
													<option>3</option>
												</select> <select class="seatGrade" name="seatGrade2">
													<option>????????????</option>
													<option>???????????? ?????????</option>
													<option>???????????? ?????????</option>
													<option>????????? ?????????</option>
												</select>
											</section>
											<section class="airplainchoice">
												<input type="date" placeholder="?????????" id="datechoice5"
													name='departureDay2' value="<%= request.getParameter("departureDay2") %>">
											</section>
											<section class="airplainchoice">

												<input type='button' class="searchicon3"
													onClick="getPost('03')">
											</section>
										</div>
									</div>
								</section>
				</div>
			</div>
		</div>
		<div id="flightdivmain">
			<div id="flightdiv2">
				<div class="flightdiv2_indiv">
					<h4>?????????</h4>
					<p>
						<input type="checkbox" name=""> ?????? <br><br>
						<input type="checkbox" name=""> ????????????
					</p>
				</div>
				<div class="flightdiv2_indiv">
					<h4>??????</h4>
					<p>
						<input type="checkbox" name="">
					</p>
				</div>
				<div class="flightdiv2_indiv">
					<h4>?????? ????????? ??????</h4>
					<p>
						<input type="checkbox" name="">
					</p>
				</div>
				<div class="flightdiv2_indiv">
					<h4>??? ????????????</h4>
					<p>
						<input type="checkbox" name="">
					</p>
				</div>
			</div>
			<div id="flightdiv3">

			 	<% for(int i = 0; i< ticketBeanList3.size(); i++){
					
				%> 
				<input type='hidden' value='<%= ticketBeanList3.get(i).getFlight_Ticket_Num() %>'>
				<div class="flightlistdiv">
					<table class="listtable">
			<tr class="tr1">
				<td class="td1">
				<% 
				String flightimg1 = "";
				if(ticketBeanList3.get(i).getFlight_name().equals("??????")){ 
					flightimg1 = "jejuair.png";
				}else if(ticketBeanList3.get(i).getFlight_name().equals("????????????")){
					flightimg1 = "asiana.png";
				}else if(ticketBeanList3.get(i).getFlight_name().equals("")){
					
				}else if(ticketBeanList3.get(i).getFlight_name().equals("")){
					
				}
				%>
				<img src="../img/flight/<%= flightimg1 %>" class="flightimg"></td>
				
				<td class="td1" style="text-align: left;"><%= ticketBeanList3.get(i).getFlight_name() %></td>
				<td class="td1"><span class="time"><%= ticketBeanList3.get(i).getFlight_departureTime()%></span><br><span class="airport"><%= ticketBeanList3.get(i).getFlight_departure() %></span></td>
				<td class="td1"><span class="airport">????????????</span><br><img src="aaa.jpg"></td>
				<td class="td1"><span class="time"><%= ticketBeanList3.get(i).getFlight_arrivalTime() %></span><br><span class="airport"><%= ticketBeanList3.get(i).getFlight_arrival() %></span></td>

				<td class="td1" rowspan="2"><fmt:formatNumber value="<%= ticketBeanList3.get(i).getFlight_Ticket_Price() %>" groupingUsed="true" />???<input type="button" value="??????" class="choicebtn"></td>
			</tr>
			

		</table>
					
				</div>
				<%} %> 
				<section id="pageList">
		<%if(nowPage3<=1){ %>
		[??????]&nbsp;
		<%}else{ %>
		<a href="flightTicketSearch_oneway.air?page3=<%=nowPage3-1 %>&departure2=<%= request.getParameter("departure2") %>&arrive2=<%= request.getParameter("arrive2") %>&departureDay2=<%= request.getParameter("departureDay2") %>">[??????]</a>&nbsp;
		<%} %>

		<%for(int a=startPage3;a<=endPage3;a++){
				if(a==nowPage3){%>
		[<%=a %>]
		<%}else{ %>
		<a href="flightTicketSearch_oneway.air?page3=<%=a %>&departure2=<%= request.getParameter("departure2") %>&arrive2=<%= request.getParameter("arrive2") %>&departureDay2=<%= request.getParameter("departureDay2") %>">[<%=a %>]
		</a>&nbsp;
		<%} %>
		<%} %>

		<%if(nowPage3>=maxPage3){ %>
		[??????]
		<%}else{ %>
		<a href="flightTicketSearch_oneway.air?page3=<%=nowPage3+1 %>&departure2=<%= request.getParameter("departure2") %>&arrive2=<%= request.getParameter("arrive2") %>&departureDay2=<%= request.getParameter("departureDay2") %>">[??????]</a>
		<%} %>
	</section>
				
			</div>
		</div>
		<jsp:include page="../overlap/footer.jsp"/>
	</form>
</body>
</html>