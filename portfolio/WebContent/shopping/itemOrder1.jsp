<%@page import="vo.Member_info"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="vo.Item" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashSet" %>
<%@ page import="java.util.Set" %>
<%@ page import="vo.FlightReserveListBean" %>

<%
	Item item = (Item)request.getAttribute("item");
	Member_info member = (Member_info)request.getAttribute("member");
	ArrayList<FlightReserveListBean> airTicket = (ArrayList<FlightReserveListBean>)request.getAttribute("airTicket"); 
	ArrayList<String> ticketList = new ArrayList<String>();
	ArrayList<String> ticket = new ArrayList<>();
	
	for(int i=0; i<airTicket.size(); i++) {
		ticketList.add(airTicket.get(i).getFlight_Ticket_Num());
	}
	for(String ticketNum : ticketList){
        if(!ticket.contains(ticketNum))
        	ticket.add(ticketNum);
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Cairo&family=Indie+Flower&family=Koulen&display=swap" rel="stylesheet">
<link rel="stylesheet" href="../css/style.css" />
<link rel="stylesheet" type="text/css" href="../css/header_footer.css">
<link type="text/css" rel="stylesheet" href="../css/style2.css" />
<script src="http://use.fontawesome.com/releases/v6.1.2/js/all.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<title>상품 구매</title>
<style>
	header h3 {
		margin-top: 130px;
		margin-bottom: 70px;
		text-align: center;
		font-size: 25pt;
	}
	section {
		width: 1200px;
		height: fit-content;
		margin: 100px auto;
	}
	.order_wr {
		width: 650px;
		height: 20px; 
		margin: 80px auto;
		font-size: 16pt;
	}
	.order1 {
		float: left;
		width: 30px;
		height: 30px;
		border-radius: 30px;
		background-color: #002266;
		color: white;
		padding: 10px;
		text-align: center;
		font-weight: bold;
		margin-left: 30px;
		position: relative;
		bottom: 7px;
	}
	.order2 {
		float: left;
		width: 30px;
		height: 30px;
		border-radius: 30px;
		background-color: #BDBDBD;
		color: white;
		padding: 10px;
		text-align: center;
		font-weight: bold;
		margin-left: 30px;
		position: relative;
		bottom: 7px;
	}
	.order_sel1 {
		float: left;
		margin-left: 20px;
		color: #002266;
	}
	.order_sel2 {
		float: left;
		margin-left: 20px;
		color: #BDBDBD;
	}
	.order_sel1 img {	
		position: relative;
		top: 5px;
		filter: invert(13%) sepia(34%) saturate(4568%) hue-rotate(208deg) brightness(93%) contrast(112%);
	}
	.order_sel2 img {
		position: relative;
		top: 5px;
		filter: invert(100%) sepia(0%) saturate(5375%) hue-rotate(299deg) brightness(74%) contrast(100%);
	}
	.title {
		width: 1000px;
		height: 20px;
		margin: 30px auto;
		padding-right: 150px;
		font-size: 15pt;
	}
	.order_info {
		width: 900px;
		border-collapse: collapse;
		position: relative;
		bottom: 10px;
	}
	.order_info .tableLine {
		border-style: solid;
		border-width: 1px 0 1px 0;
		border-color: #D5D5D5;
		padding: 10px;
		height: 80px;
	}
	.order_info .td1 {
		font-weight: bold;
		font-size: 11pt;
		width: 150px;
		color: #002266;
		text-align: center;
		background-color: rgba(237,239,243, 0.7);
	}
	.order_info .td2 {
		width: 300px;
	}
	.order_info .td2 select {
		width: 150px;
	}
	.eng-name {
		width: 115px;
		height: 35px;
		font-size: 10pt;
	}
	.eng-name:last-of-type {
		margin-left: 15px;
	}
	.passnum {
		height: 35px;
		width: 280px;
	}
	.passDate {
		width: 280px;
		height: 35px;
	}
	.mb_phone {
		height: 35px;
		width: 280px;
	}
	#order_info:last-of-type {
		margin-bottom: 80px;
	}
	#next {
		width: 170px;
		height: 70px;
		text-align: center;
		color: white;
		margin: 20px auto;
		background-color: black;
		border-radius: 50px;
	}
	#next span {
		font-size: 17pt;
		position: relative;
		top: 16px;
		letter-spacing: 2pt;
	}
	#next img {
		position: relative;
		top: 16px;
		filter: invert(100%) sepia(0%) saturate(7449%) hue-rotate(143deg) brightness(95%) contrast(91%);
	}
	#result_wr {
		float: right;
		margin-left: 10px;
		width: 260px;
		height: 800px;
	}
	#result {
		width: 300px;
		height: 400px;
		margin-top: 39px;
		border-style: solid;
		border-color: #000054;
		border-width: 5px 0 0 0;
		position: fixed;
	}
	#result h3 {
		font-size: 17pt;
	}
	.price {
		float: left;
		width: 280px;
		height: 80px;
	}
	.price  div {
		float: right;
		position: relative;
		bottom: 20px;
	}
	.price div p:first-of-type {
		float: right;
		font-weight: bold;
		font-size: 14pt;
		margin-left: 10px;
	}
	.price div p:last-of-type {
		position: relative;
		bottom: 16px;
		font-size: 12pt;
		color: #8C8C8C;
	}
	.finish {
		float: left;
		width: 280px;
		height: 80px;
		border-style: solid;
		border-width: 1px 0 0 0;
		padding-top: 17px;
	}
	.finish  div {
		float: right;
		position: relative;
		bottom: 20px;
	}
	.finish span {
		color: red;
	}
	.finish div p:first-of-type {
		float: right;
		font-weight: bold;
		font-size: 19pt;
		position: relative;
		bottom: 12px;
		color: red;
	}
	.finish div p:last-of-type {
		position: relative;
		bottom: 35px;
		margin-left: 7px;
		font-size: 12pt;
		color: #8C8C8C;
	}
	#result_wr input[type=submit] {
		width: 280px;
		height: 60px;
		background-color: #000054;
		border-style: none;
		color: white;
		font-size: 13pt;
		font-weight: bold; 
	}
	.check {
		margin-top: 20px;
	}
	.check input{
		margin-bottom: 20px;
	}
	.check span{
		margin-left: 12px;
		margin-top: 5px;
	}
	.td2 select {
		height: 38px;
	}
	.tableLine td p:first-of-type {
		/* font-size: 16pt; */
		font-weight: bold;
	}
	.tableLine td p:last-of-type {
		color: #8C8C8C;
	}
	#itemDetail div {
		float: left;
		text-align: left;
	}
	#itemDetail div:last-of-type {
		margin-top: 58px;
		float: left;
		width: 270px;
	} 
	#itemDetail div p:first-of-type {
		font-size: 10pt;
	}
	#itemDetail div p:nth-of-type(2) {
		
	}
</style>
<script>
	$(document).ready(function() {
		$(window).scroll(function(){    
			$("#result").css("margin-top",Math.max(-250,0-$(this).scrollTop()));});
		}
		
		$('#ticket').on('change',function() {
			var departure = document.getElementById('departure');
			if (this.value != "항공편 선택") {
				 <%-- for (var i=0; i<<%=ticket.size()%>; i++ ) {
					if (<%=airTicket.get(i).getFlight_Ticket_Num()%> == this.value) {
						departure.innnerText = <%= airTicket.get(i).getFlight_departure()%>;
						alert("a")
					}
				} --%>
				<%-- <% for (int i=0; i<ticket.size(); i++) { %>
					if (<%=airTicket.get(i).getFlight_Ticket_Num()%> == this.value ) {
						departure.innnerText = <%= airTicket.get(i).getFlight_departure()%>;
					}
				%> --%>
			}
        });
		
	});
</script>
<script>
	

	function check() {
		var check = document.getElementById("agree");
		if (check.checked == false) {
			alert("주문 내역 확인에 동의해 주세요.");
			return false
		}
	}
	
	/* function select() {
		var ticket = document.getElementById('ticket').innerText;
		alert(ticket);
	} */
</script>
</head>
<body>
	<form action="itemBuy.dutyfree?command=order" method="post" onsubmit="return check()">
		<%
			String mb_id = (String)session.getAttribute("mb_id");
			String itemCode = request.getParameter("itemCode"); 
			String option = request.getParameter("option");
			String item_count = request.getParameter("count"); 
			
			session.setAttribute("itemCode", itemCode);
			session.setAttribute("option", option);
			session.setAttribute("count", item_count);
			
			int count = Integer.parseInt(item_count);
				
			double discount = (double)item.getDiscount()/(double)100;
			
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
		<header>
			<h3>CHECKOUT</h3>
			<div class="order_wr">
				<div class="order2">1</div><b class="order_sel2">장바구니	<img src="../img/dutyfree/right-arrow.png" width="25px" height="25px"></b>
				<div class="order1">2</div><b class="order_sel1">주문결제	<img src="../img/dutyfree/right-arrow.png" width="25px" height="25px"></b>
				<div class="order2">3</div><b class="order_sel2">주문완료</b>
			</div>	
		</header>
		<section>
			<div id="result_wr">
				<div id="result">
					<h3>최종결제금액</h3>
					<div class="price">
						<span>총 주문 금액 합계</span>
						<div>
							<p>$<%= count*item.getItemDollar() %></p>
							<p><fmt:formatNumber value="<%= count*item.getItemWon() %>" groupingUsed="true" />원</p>
						</div>
					</div>
					<div class="price">
						<span>총 할인 금액</span>
						<div>	
							<p>$<fmt:formatNumber value='<%= count*item.getItemDollar()*discount %>' pattern='.0' /></p>
							<p><fmt:formatNumber value="<%= count*item.getItemWon()-count*item.getDiscountWon() %>" groupingUsed="true" />원</p>
						</div>
					</div>
					<div class="finish">
						<span>최종 결제 금액</span>
						<div>
							<p>$<fmt:formatNumber value='<%= count*item.getItemDollar()*(1-discount) %>' pattern='.0' /></p>
							<p><fmt:formatNumber value="<%=count* item.getDiscountWon() %>" groupingUsed="true" />원</p>
						</div>
					</div>
					<input type="submit" value="결제하기">
					<div class="check">
						<input type="checkbox" id="agree">주문내역 확인 동의</br>
						<span> 주문할 상품의 정보를 확인하였으며,</span></br>
						<span> 해당 주문에 대한 구매에 동의 합니다.</span>
					</div>						
				</div> 
			</div>
			<div class="title">
				<h3>여권 정보</h3>
			</div>
			<table align="center" cellpadding="5px" class="order_info">
				<tr class="tableLine">
					<td class="td1">이름/성별</td>
					<td class="td2"><%= member.getMb_name() %></td>
					<td class="td1">생년월일</td>
					<td class="td2"><%= member.getMb_birth() %></td>
				</tr>
				<tr class="tableLine">
					<td class="td1">여권이름(영문)</td>
					<td class="td2">
						<input type="text" name="mb_lastname" placeholder="Last name(성)" class="eng-name" value="<%= member.getMb_lastname()%>">
						<input type="text" name="mb_firstname" placeholder="First name(이름)" class="eng-name" value="<%= member.getMb_firstname()%>">
					</td>
					<td class="td1">여권번호</td>
					<td class="td2"><input type="text" name="mb_passnum" class="passnum" value="<%= member.getMb_passnum()%>"></td>
				</tr>
				
			</table>
			<div class="title">
				<h3>출국 정보</h3>
			</div>
			<table align="center" cellpadding="10px" class="order_info">
				<tr class="tableLine">
					<td class="td1">항공편</td>
					<td class="td2">
						<select id="ticket" onchange="select()">
							<option value="항공편 선택">항공편 선택</option>
							<% for (int i=0; i<ticket.size(); i++) { %>
								<option value="<%= ticket.get(i) %>"><%= ticket.get(i) %></option>
							<% } %>
						</select>
					</td>
					<td class="td1">연락처</td>
					<td class="td2"><input type="text" name="mb_phone" class="mb_phone" value="<%= member.getMb_phonenum()%>"></td>
				</tr>
				<tr class="tableLine">
					<td class="td1">출발지</td>
					<td class="td2" id="departure">
						<!-- <select>
							<option>출발장소 선택</option>
							<option>인천국제공항</option>
							<option>김포국제공항</option>
							<option>김해(부산)국제공항</option>
							<option>제주국제공항</option>
						</select> -->
					</td>
					<td class="td1">출국일시</td>
					<td class="td2" id="departure_day"></td>
				</tr>
			</table>
			<div class="title">
				<h3>주문 상품</h3>
			</div>
			<table align="center" cellpadding="10px" class="order_info">
				<tr class="tableLine" align="center">
					<td width="530px">상품정보</td>
					<td width="40px">수량</td>
					<td width="80px">가격</td>
					<td width="100px">총 상품 금액</td>
					<td width="80px">할인 금액</td>
				</tr>
				<tr class="tableLine" align="center">
					<td id="itemDetail">
						<div><img src="<%= item.getItemImg()%>" width="230px" height="240px"></div>
						<div>
							<p><%= item.getBrandName() %></p>
							<p><%= item.getItemName() %></p>
							<p>옵션 : <%= option %></p>
						</div>
					</td>
					<td><%= count %></td>
					<td>
						<p>$<%= item.getItemDollar() %></p>
						<p><fmt:formatNumber value="<%= item.getItemWon() %>" groupingUsed="true" />원</p>
					</td>
					<td>
						<p>$<%= count*item.getItemDollar() %></p>
						<p><fmt:formatNumber value="<%= count*item.getItemWon() %>" groupingUsed="true" />원</p>
					</td>
					<td>
						<p>$<fmt:formatNumber value='<%= count*item.getItemDollar()*discount %>' pattern='.0' /></p>
						<p><fmt:formatNumber value="<%= count*item.getItemWon()-count*item.getDiscountWon() %>" groupingUsed="true" />원</p>	
					</td>
				</tr>
			</table>
			<!-- <div id="next">
				<span>다음&nbsp</span>&nbsp
				<img src="../img/dutyfree/arrow.png" width="15px" height="15px" >
			</div> -->
		</section>
		<jsp:include page="../overlap/footer.jsp"/>
	</form>
	
</body>
</html>