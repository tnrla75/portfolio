<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.ItemCart" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.Member_info"%>
<%
	ArrayList<ItemCart> list = (ArrayList<ItemCart>)request.getAttribute("itemCart");
	String mb_id = (String)session.getAttribute("mb_id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" type="text/css" href="../css/header_footer.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="http://use.fontawesome.com/releases/v6.1.2/js/all.js"></script>

<title>Insert title here</title>
<style type="text/css">
	header h3 {
		margin-top: 130px;
		margin-bottom: 70px;
		text-align: center;
		font-size: 25pt;
	}
	table {
		margin-bottom: 100px;
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
		
	}
	.price div span:first-of-type {
		float: right;
		font-weight: bold;
		font-size: 14pt;
	}
	.price div span:last-of-type {
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
	.finish div span:first-of-type {
		float: right;
		font-weight: bold;
		font-size: 19pt;

		color: red;
	}
	.finish div span:last-of-type {

		margin-left: 10px;
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
	.title {
		width: 1000px;
		height: 20px;
		margin: 30px auto;
		padding-right: 150px;
		font-size: 15pt;
	}
	.cart {
		width: 900px;
		border-collapse: collapse;
		position: relative;
		bottom: 10px;
	}
	.cart .tableLine {
		border-style: solid;
		border-width: 1px 0 1px 0;
		border-color: #D5D5D5;
		padding: 10px;
		height: 80px;
	}
	#itemDetail div {
		float: left;
		text-align: left;
	}
	#itemDetail div:first-of-type input {
		position: relative;
		bottom: 90px;
	} 
	#itemDetail div:last-of-type {
		margin-top: 37px;
		width: 280px;
	} 
	#itemDetail div p {
		font-size: 10pt;
	}
	/* 옵션 */
	#optionSel {
		border: solid 2px #A6A6A6; 
		width: 80px;
		height: 40px;
	}
	#optionSel .result_count {
		float: left;
		width: 50px;
		height: 30px;
		padding-top: 10px;
		text-align: center;
	}
	#optionsel input {
		display: block;
	}
	#optionSel input[type=button]:first-of-type {
		width: 25px;
		height: 22px;
		background: url(../img/dutyfree/up-arrow.png);
		background-size: 11px;
		background-repeat: no-repeat;
		background-position: center;
		position: relative;
		left: 4px;
		bottom: 1px;
		border: solid 1px #A6A6A6; 
	}
	#optionSel input[type=button]:last-of-type {
		width: 25px;
		height: 22px;
		background: url(../img/dutyfree/arrow.png);
		background-size: 11px;
		background-repeat: no-repeat;
		background-position: center;
		position: relative;
		left: 4px;
		bottom: 6px;
		border: solid 1px #A6A6A6; 
	}
	#order input:first-of-type {
		width: 180px;
		height: 55px;
		font-size: 11pt;
		background-color: white;
		border-style: solid;
		font-weight: bold;
	}
	#order input:last-of-type {
		width: 180px;
		height: 55px;
		font-size: 11pt;
		border-style: none;
		background-color: #5D5D5D;
		color: white;
		font-weight: bold;
		margin-left: 10px;
	}
</style>
</head>
<script>
	//옵션
	function plus(i, discountWon) {
		var count = document.getElementsByClassName('result_count');
		var count_input = document.getElementsByClassName('count');
		var total1 = document.getElementsByClassName('dollar')[i].innerText;
		var number = count[i].innerText;
		number = parseInt(number) + 1;
		count[i].innerText = number;
		count_input[i].value = number;
		
		document.getElementsByClassName('total1')[i].innerText = (total1*number).toFixed(1);
		document.getElementsByClassName('total2')[i].innerText = (discountWon*number).toLocaleString();
	}
	function minus(i, discountWon) {
		var count = document.getElementsByClassName('result_count');
		var count_input = document.getElementsByClassName('count');
		var total1 = document.getElementsByClassName('dollar')[i].innerText;
		var total2 = document.getElementsByClassName('won')[i].innerText;
		var number = count[i].innerText;
		if (number>1) {
			number = parseInt(number) - 1;
		}
		count[i].innerText = number;
		count_input[i].value = number;
		
		/* $('input[name=count]').attr('value',count[i].innerText); */
		document.getElementsByClassName('total1')[i].innerText = (total1*number).toFixed(1);
		document.getElementsByClassName('total2')[i].innerText = (discountWon*number).toLocaleString();
	}
	
	function check(i) {
		var arr = "";
		var check_arr = [];
		var count_input = document.getElementsByClassName('count');
		var option_input =  document.getElementsByClassName('option');
		var option =  document.getElementsByClassName('optionSel');

		var result_count = document.getElementsByClassName('result_count');
		var count = parseInt(result_count[i].innerText);
		
		var check = document.getElementsByClassName("itemSelect");
		
		var total_dol1 = document.getElementById('total_dol').innerText;
		var total_dol2 = parseInt(total_dol1);

		var total_won1 = document.getElementById('total_won').innerText;
		var total_won2 = parseInt(total_won1)*count;
		
		var total_sale_dol1 = document.getElementById('total_sale_dol').innerText;
		var total_sale_dol2 = parseInt(total_sale_dol1);
		
		var result_dol1 = document.getElementById('result_dol').innerText;
		var result_dol2 = parseInt(result_dol1);
		
		var result_won1 = document.getElementById('result_won').innerText;
		var result_won2 = parseInt(result_won1);
		
		$("input[type=checkbox][name=itemSelect]:checked").each(function() {
			arr += $(this).val();
			if (count_input[i].value == "") {
				count_input[i].value = 1;
			}
			option_input[i].value = option[i].innerText;
		});
		if (check[i].checked == false) {
			count_input[i].value = "";
			option_input[i].value = "";
		}
		check_arr = arr.split('/');
		total_dol2 = 0;
		total_won2 = 0;
		result_dol2 = 0;
		result_won2 = 0;
		var itemCode = "";
		for (var i=1; i<check_arr.length; i++) {
			if ((i+1)%5 == 0) { 
				result_won2 += parseInt(check_arr[i])*count;
			}
			if ((i+2)%5 == 0) { 
				total_dol2 += parseInt(check_arr[i])*count;
			}
			if ((i+3)%5 == 0) { 
				total_won2 += parseInt(check_arr[i])*count;
			}
			if ((i+5)%5 == 0) { 
				result_dol2 += parseFloat(check_arr[i])*count;
			}
			if ((i+4)%5 == 0) { 
				itemCode += check_arr[i]+"/";
			}
			$('input[name=itemCode]').attr('value',itemCode);
			document.getElementById('total_dol').innerText = total_dol2;
			document.getElementById('total_won').innerText = total_won2.toLocaleString();
			document.getElementById('result_dol').innerText = result_dol2.toFixed(1);
			document.getElementById('result_won').innerText = result_won2.toLocaleString();
			document.getElementById('total_sale_dol').innerText = (total_dol2-result_dol2).toFixed(1);
			document.getElementById('total_sale_won').innerText = (total_won2-result_won2).toLocaleString();
		}
		/* alert(document.querySelector('input[type=checkbox][name=itemSelect]:checked').value); */
	}

</script>
<script>
	$(document).ready(function() {
		$(window).scroll(function(){    
			$("#result").css("margin-top",Math.max(-250,0-$(this).scrollTop()));});
		});
	});
	
</script>
<body>
 	<form name="itemCart" action="itemBuyList.dutyfree?command=orderList" method="post">
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
		
 		<header>
			<h3>SHOPPING BAG</h3>
			<div class="order_wr">
				<div class="order1">1</div><b class="order_sel1">장바구니	<img src="../img/dutyfree/right-arrow.png" width="25px" height="25px"></b>
				<div class="order2">2</div><b class="order_sel2">주문결제	<img src="../img/dutyfree/right-arrow.png" width="25px" height="25px"></b>
				<div class="order2">3</div><b class="order_sel2">주문완료</b>
			</div>	
		</header>
		<section>
			<div id="result_wr">
				<div id="result">
					<h3>최종결제금액</h3>
					<div class="price">
						<input type="hidden" name="itemCode" value=""> 
						<span>총 주문 금액 합계</span>
						<div>
							<span><b>$</b><b id="total_dol">0</b></span></br>
							<span><b id="total_won">0</b><b>원</b></span>
						</div>
					</div>
					<div class="price">
						<span>총 할인 금액</span>
						<div>	
							<span><b>$</b><b id="total_sale_dol">0</b></span></br>
							<span><b id="total_sale_won">0</b><b>원</b></span>
						</div>
					</div>
					<div class="finish">
						<span>최종 결제 금액</span>
						<div>
							<span><b>$</b><b id="result_dol">0</b></span></br>
							<span><b id="result_won">0</b><b>원</b></span>
						</div>
					</div>
					<input type="submit" value="선택상품 주문하기" onclick="buy()">				
				</div>
			</div>
			<div class="title">
				<h3>쇼핑백 상품</h3>
			</div>
			<table align="center" cellpadding="5px" class="cart">
				<tr class="tableLine" align="center">
					<td width="450px">상품 정보</td>
					<td width="100px">수량</td>
					<td width="100px">가격</td>
					<td width="100px">상품금액</td>
				</tr>
				<% if (list.size()==0) { %>
				<tr class="tableLine">
					<td colspan="4" align="center" height="300px;">쇼핑백에 담긴 상품이 없습니다.</td>
				</tr>
				<% } else { %>
				<% for (int i=0; i<list.size(); i++) { 
					double discount = (double)list.get(i).getDiscount()/(double)100;
				%>
				<tr class="tableLine">
					<td id="itemDetail">
						<div><input type="checkbox" name="itemSelect" id="itemSelect" class="itemSelect" onclick="check(<%=i%>)" value="/<%= list.get(i).getItemCode()%>/<%=list.get(i).getItemWon()%>/<%=list.get(i).getItemDollar()%>/<%=list.get(i).getDiscountWon()%>/<%=list.get(i).getItemDollar()*(1-discount)%>"><img src="<%= list.get(i).getItemImg()%>" width="170px" height="180px"></div>
						<div>
							<p><%= list.get(i).getBrandName() %></p>
							<p><%= list.get(i).getItemName() %></p>
							<p>옵션 : <span class="optionSel"><%= list.get(i).getItemOption() %></span></p>
							<input type="hidden" value="" name="option" class="option">
						</div>
					</td>
					<td align="center">
						<div id="optionSel">
							<div class='result_count'>1</div>
							<input type='button' onclick='plus(<%=i%>, <%= list.get(i).getDiscountWon()%>)' class="count_btn"></br>
							<input type='button' onclick='minus(<%=i%>, <%= list.get(i).getDiscountWon()%>)' class="count_btn">	
						</div>
						<input type="hidden" value="" name="count" class="count">
					</td>
					<td align="center">
						<span style="color: #8C8C8C; text-decoration: line-through;">$<%= list.get(i).getItemDollar() %></span></br>
						<font size="4" style="font-weight: bold;">$</font><font size="4" style="font-weight: bold;" class="dollar"><fmt:formatNumber value='<%=list.get(i).getItemDollar()*(1-discount) %>' pattern='.0' /></font></br>
						<font size="2" class="won"><fmt:formatNumber value='<%=list.get(i).getDiscountWon() %>' groupingUsed="true" /></font><font size="2">원</font>
					</td>
					<td align="center">
						<font size="4" style="font-weight: bold;">$</font><font size="4" style="font-weight: bold;" class="total1"><fmt:formatNumber value='<%=list.get(i).getItemDollar()*(1-discount) %>' pattern='.0' /></font></br>
						<font size="2" class="total2"><fmt:formatNumber value='<%=list.get(i).getDiscountWon() %>' groupingUsed="true" /></font><font size="2">원</font>
					</td>
				</tr>
				<%} } %>
			</table>
			<div id="order">
				<input type="button" value="선택상품 주문하기">
				<input type="button" value="전체상품 주문하기">
			</div>
		</section>
		<jsp:include page="../overlap/footer.jsp"/>
 	</form>
</body>
</html>