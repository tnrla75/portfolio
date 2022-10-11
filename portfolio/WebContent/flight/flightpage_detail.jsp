<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ page import="java.util.*"%>
	<%@page import="vo.FlightTicketBean"%>
	
	
	
	<%
		ArrayList<FlightTicketBean> articleList_go=(ArrayList<FlightTicketBean>)request.getAttribute("ticketBeanList_go");
		ArrayList<FlightTicketBean> articleList_back=(ArrayList<FlightTicketBean>)request.getAttribute("ticketBeanList_back");
		String totalprice= request.getParameter("totalprice");
		
		System.out.println(articleList_go.get(0).getFlight_airplaneName());
		System.out.println(articleList_back.get(0).getFlight_airplaneName());
		
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

#flightdiv1 {
	width: 900px;
	height: fit-content;
	background-color: white;
	position: relative;
}

#flightdiv2 {
	width: 300px;
	height: fit-content;
	position: fixed;
	top: 170px;
	margin-left: 900px;
	background-color: rgba(231,231,231,0.2);
	border-radius: 10px;
}

#flightdiv2_indiv1 {
	width: 270px;
	margin: 10px;
	border-bottom: 1px dotted rgba(0, 0, 0, 0.2);
}

#flightdiv2_indiv2 {
	width: 270px;
	border-bottom: 1px dotted rgba(0, 0, 0, 0.2);
		margin: 10px;
}
#flightdiv2_indiv2 > div{
	width:250px;
	margin: 20px 10px;
}
#flightdiv2_indiv2 > div > span:nth-child(2n){
	float: right;
}
#flightdiv2_indiv3 {
	width: 270px; 
	margin: 10px;
	float: left;
}
#flightdiv2_indiv3 > span > .span2{
	border-style:none;
	outline: none;
	font-weight: bold;
	font-size: 14pt;
	width:100px;
	text-align: right;
	background-color: rgba(0,0,0,0);
	
}

#flightdiv2_indiv3>span {
	margin: 10px 0;
	font-weight: bold;
	font-size: 14pt;
}

.flightdiv1_indiv1 {
	/* margin-top: 10px;
	padding: 10px;  */
	padding:0px;
	margin: 20px 0px 0px 0px;
	width: 880px;
	height: 440px;
	border:solid 1px rgba(0, 0, 0, 0.3);
}

.flightdiv1_indiv1 h2, .flightdiv1_indiv1 h3 {
	margin-left: 30px;
}

.flightdiv1_indiv1 > .infodiv {
	border-bottom: solid 1px rgba(0, 0, 0, 0.3);
	width: 340px;
	float: left;
	margin: 25px 45px;
}

.infodiv > .infoinput {
	border-style: none;
	line-height: 30px;
	float:left;
	width: 340px;
}
#btndiv1{
	width: 860px;
	height: 50px;
	line-height: 50px;
	text-align: center;
	padding: 10px;
	font-weight:bold;
	font-size: 14pt;
	border-bottom:solid 1px rgba(0, 0, 0, 0.3);
	border-right:solid 1px rgba(0, 0, 0, 0.3);
	border-left:solid 1px rgba(0, 0, 0, 0.3);
}
#btndiv2{
	width: 860px;
	line-height: 50px;
	text-align: center;
	padding: 0px;
	margin: 0px;
	font-weight:bold;
	font-size: 14pt;
	height: 60px;
}
#btndiv1:hover{
	background-color: #287DFA1A ;
}
#submitbtn{
	border:none;
	width: 880px;
	height: 50px;
	margin: 5px auto;
	background-color: #002266;
	font-size:12pt;
	font-weight:bold;
	color:white;
	cursor: pointer;
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
        .flightlistdiv{
			border-bottom: solid 1px rgba(0,0,0,0.2); 
			
			background-color:white;
			width: 880px;
			height: 120px;
			
		
			margin:4px;
		}
		.td1{
			height: 80px;
		}
		.td2{
			height: 80px;
		}
		.listtable{
			text-align:center;
			width :850px;			
			height: 100px;
			position:relative;
			margin: 20px;
			border-radius: 10px;
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
			box-shadow: rgba(0, 0, 0, 0.05) 0px 6px 24px 0px, rgba(0, 0, 0, 0.08) 0px 0px 0px 1px; 
			
			width: 50px;
			height: 50px;
			background-color: white;
		}
		.time{
			font-weight: bold;
		}
		.airport{
			font-size: 10pt;
			color: rgba(0, 0, 0, 0.6);
		}
		.airplanename{
			font-size: 10pt;
			color: rgba(0, 0, 0, 0.6);
		}
		.flightname{
			font-weight: bold;
			font-size: 14pt;
		}
		.maindiv{
			width: 1200px; margin: 30px auto 0 auto; height: 1200px; 
		}
		.aa{
			border-style:none;
		}
		.infonum{
			width:880px;
			height:60px;
			background-color: #002266;
			color:white;
			margin-bottom: 20px;
		}
		.numspan{
			font-weight:bold;
			font-size:18pt;
			margin-left: 20px;
			line-height: 60px;
		}
		.numspan:nth-child(1){
			right:-15px;
			position:relative;
		}
		.numbtn{
			left: 550px;
			position:relative;
			border-style:none;
			background-color: #002266;
			color: white;
			font-size:12pt;
			width: 80px;
			height: 30px;
			line-height:20px;
		}
		.numbtn:hover{
			border:solid white 1px;
			cursor: pointer;
		
		}
		#tickettitle{
		    width: 850px;
		    height: 60px;
		    background-color: #002266;
		    color: white;
		    font-size: 14pt;
		    line-height: 60px;
		    padding-left: 30px;
		    font-weight: bold;
		}
		#ticketinfo1{
			border-bottom: dotted 1px black;
			
		}
		#ticketmaindiv{
			width: 879px;
			border: solid 1px rgba(0,0,0,0.3);
		}
		h4 > span{
			color:red;
		}
</style>
</head>

<script>
$(document).ready(function() {
	
});

function seat() {
	var myform = document.myform;
	alert(myform.action);
	var flight1 = "<%= articleList_go.get(0).getFlight_airplaneName() %>" ;
	if(flight1 == "Boeing 737"){
		alert(flight1);
		myform.action = "flight_seat.do?command=flightseatB737_1";
		alert(myform.action);
		return true;
	}
	else if(flight1 == "A321"){
		myform.action = "flight_seat.do?command=flightseatA321_1";
		return true;
	}
	return false; 
}

function createAddRow() {
	
 	var divlist = document.getElementById("flightdiv1");
 	var i = document.getElementsByClassName('flightdiv1_indiv1').length;
	var name = document.createElement("div");
	var price1 = <%= articleList_go.get(0).getFlight_Ticket_Price() %>;
	var price2 = <%= articleList_back.get(0).getFlight_Ticket_Price() %>;
	var totalprice = (i+1)*(price1+price2);
	
	
	var resultprice = totalprice.toLocaleString();
	
	
	if(i<10){
		name.innerHTML += "<div class='flightdiv1_indiv1'><div class='infonum'><span class='numspan'>"+(i+1)+"</span><span class='numspan'>. 탑승객 정보</span><button type='button' class='numbtn' onclick='delbtn(this)'><i class='fa-solid fa-trash-can'></i>&nbsp;삭제</button></div><div class='infodiv'><input type='text' placeholder='성' class='infoinput'  name='lastname'></div><div class='infodiv'><input type='text' placeholder='이름' class='infoinput'  name='firstname'></div><div class='infodiv'><input type='text' placeholder='성별' class='infoinput'></div><div class='infodiv'><input type='text' placeholder='생년월일' class='infoinput'></div><div class='infodiv'><input type='text' placeholder='국적' class='infoinput'></div><div class='infodiv'><input type='text' placeholder='여권' class='infoinput'></div><div class='infodiv'><input type='text' placeholder='여권번호' class='infoinput'></div><div class='infodiv'><input type='text' placeholder='유효기간' class='infoinput'></div></div>";
		divlist.appendChild(name);
		document.getElementsByClassName('span2')[0].value = resultprice;
		document.getElementsByClassName('span2')[1].value = resultprice;
		document.getElementById("count").innerText = i+1+"명";
	}else{
		alert("더 이상 추가할 수 없습니다.");	
	}
}
function delbtn(e){
	var div1 = document.getElementsByClassName('flightdiv1_indiv1');
	var flightdiv1_indiv1 = e.parentNode.parentNode;
	flightdiv1_indiv1.remove();
	var num = document.getElementsByClassName('numspan');
	var price1 = <%= articleList_go.get(0).getFlight_Ticket_Price() %>;
	var price2 = <%= articleList_back.get(0).getFlight_Ticket_Price() %>;
	var totalprice = (div1.length)*(price1+price2);
	var resultprice = totalprice.toLocaleString();
	document.getElementsByClassName('span2')[0].value = resultprice;
	document.getElementsByClassName('span2')[1].value = resultprice;
	document.getElementById("count").innerText = div1.length+"명";
	
 	for(var i =1; i <= div1.length; i++){
 		num[i*2-1].innerText = i+1; 
	}  
 	alert("삭제되었습니다.");
} 



</script>
<body>
<form name="myform" action="flight_seat.do?command=flightseat" method="post" onsubmit="seat()">
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
			<input type="hidden" value="" id="hiddenprice">
			<span class="span1">예상 결제 금액</span>
			<input type="button" class="footer_backchoice" value="회원 정보 입력">
			<span class="span3">원</span>
			<input class="span2" name="totalprice" value='<%= totalprice %>' readonly>
			
		</div>
	</div>
</div>

	
	
	<div class="maindiv">
		<div id="ticketmaindiv">
			<div id="tickettitle">
				항공권 
			</div>
			
			 <div style="" id="ticketinfo1">
				<table class="listtable">
					<tr class="tr1">
						<td class="td1">
						<% 
						String flightimg1 = "";
						if(articleList_go.get(0).getFlight_name().equals("제주")){ 
							flightimg1 = "jejuair.png";
						}else if(articleList_go.get(0).getFlight_name().equals("아시아나")){
							flightimg1 = "asiana.png";
						}else if(articleList_go.get(0).getFlight_name().equals("대한")){
							flightimg1 = "koreanair.png";
						}else if(articleList_go.get(0).getFlight_name().equals("")){
							
						}
						%>
						<input type="hidden" value="<%= articleList_go.get(0).getFlight_Ticket_Num() %>" name="ticketNum1">
						
						<img src="../img/flight/<%= flightimg1 %>" class="flightimg"></td>
						<td class="td1" style="text-align: left;"><span class="flightname"><%= articleList_go.get(0).getFlight_name() %></span><br><span class="airplanename"><%= articleList_go.get(0).getFlight_airplaneName() %></span></td>
						<td class="td1"><span class="time"><%= articleList_go.get(0).getFlight_departureTime()%></span><br><span class="airport"><%= articleList_go.get(0).getFlight_departure() %></span></td>
						<td class="td1"><span class="airport"><%= articleList_go.get(0).getEstimated_time() %></span><br><img src="aaa.jpg"></td>
						<td class="td1"><span class="time"><%= articleList_go.get(0).getFlight_arrivalTime() %></span><br><span class="airport"><%= articleList_go.get(0).getFlight_arrival() %></span></td>
					</tr>
				</table>
			</div>
			
			<div id="ticketinfo2">
				<table class="listtable">
					<tr class="tr1">
						<td class="td1">
						<% 
						String flightimg2 = "";
						if(articleList_back.get(0).getFlight_name().equals("제주")){ 
							flightimg2 = "jejuair.png";
						}else if(articleList_back.get(0).getFlight_name().equals("아시아나")){
							flightimg2 = "asiana.png";
						}else if(articleList_back.get(0).getFlight_name().equals("")){
							
						}else if(articleList_back.get(0).getFlight_name().equals("")){
							
						}
						%>
						<input type="hidden" value="<%= articleList_back.get(0).getFlight_Ticket_Num() %>" name="ticketNum2">
						
						<img src="../img/flight/<%= flightimg2 %>" class="flightimg"></td>
						<td class="td1" style="text-align: left;"><span class="flightname"><%= articleList_back.get(0).getFlight_name() %></span><br><span class="airplanename"><%= articleList_back.get(0).getFlight_airplaneName() %></span></td>
						<td class="td1"><span class="time"><%= articleList_back.get(0).getFlight_departureTime()%></span><br><span class="airport"><%= articleList_back.get(0).getFlight_departure() %></span></td>
						<td class="td1"><span class="airport"><%= articleList_back.get(0).getEstimated_time() %></span><br><img src="aaa.jpg"></td>
						<td class="td1"><span class="time"><%= articleList_back.get(0).getFlight_arrivalTime() %></span><br><span class="airport"><%= articleList_back.get(0).getFlight_arrival() %></span></td>			
					</tr>
				</table>
			</div> 
		</div>
			<div id="flightdiv1">
				<h2>승객 정보</h2>
				<h4>[&nbsp;<span>*</span>&nbsp;는 필수 정보입니다.]</h4>
				<div class="flightdiv1_indiv1">
					<div class="infonum">
						<span class="numspan">1. 탑승객 정보</span>
					</div>
					<div class="infodiv">
						<input type="text" placeholder="성" class="infoinput" name="lastname">
					</div>
					<div class="infodiv">
						<input type="text" placeholder="이름" class="infoinput" name="firstname">
					</div>
					<div class="infodiv">
						<input type="text" placeholder="성별" class="infoinput" name="">
					</div>
					<div class="infodiv">
						<input type="text" placeholder="생년월일" class="infoinput" name="">
					</div>
					<div class="infodiv">
						<input type="text" placeholder="국적" class="infoinput" name="">
					</div>
					<div class="infodiv">
						<input type="text" placeholder="여권" class="infoinput" name="">
					</div>
					<div class="infodiv">
						<input type="text" placeholder="여권번호" class="infoinput" name="">
					</div>
					<div class="infodiv">
						<input type="text" placeholder="유효기간" class="infoinput" name="">
					</div>
				</div>
			</div>
			<div id="btndiv1" onclick="createAddRow()">
				<i class="fa-solid fa-plus"></i>&nbsp;탑승객 추가
			</div>
			<div id="btndiv2">
				<input type="submit" value="좌석 페이지 이동" id="submitbtn">
			</div>
			<div style="height:80px;">
			</div>
			<div id="flightdiv2">
				<div id="flightdiv2_indiv1">
					<h3>요금 상세 정보</h3>
				</div>
				<div id="flightdiv2_indiv2">
					<div>
						<span><i class="fa-solid fa-won-sign"></i>&nbsp;운임비용</span> <span><%= totalprice %>원</span>
					</div>
					<div>
						<span><i class="fa-solid fa-users"></i>&nbsp;탑승객 수</span> <span id="count" >1명</span>
					</div>
				</div>
				<div id="flightdiv2_indiv3">
					<span style="float: left;">총 금액</span> <span style="float: right;"><input readonly class="span2" name="totalprice" value='<%= totalprice %>' groupingUsed="true" />원</span>
				</div>
			</div>
		</div>

	

<%-- 		<jsp:include page="../overlap/footer.jsp"/> --%>
	</form>
</body>
</html>