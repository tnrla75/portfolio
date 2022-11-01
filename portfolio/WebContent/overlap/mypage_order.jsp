<%@page import="vo.Mypage_qna"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.Member_info"%>
<%@page import="vo.ItemOrder"%>

<%
	ArrayList<ItemOrder> list = (ArrayList<ItemOrder>)request.getAttribute("item_orderList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Cairo&family=Indie+Flower&family=Koulen&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../css/header_footer.css">
<link type="text/css" rel="stylesheet" href="../css/responsive-tabs.css" />
<link type="text/css" rel="stylesheet" href="../css/style2.css" />
<script src="http://use.fontawesome.com/releases/v6.1.2/js/all.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
		display:table;
		width: 1200px;
		min-height: 850px;
		height: fit-content;
		margin: 10px auto;
		block-size: min-content;
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
	#no_order div {
		width: 400px;
		margin: 30px auto;
		padding: 70px;
		text-align: center;
	}
	#no_order span {
		margin-top: 70px;
	}
	#detail_box {
		margin-top: 50px;
		height: 200px;
		font-weight: bold;
		font-size: 10pt;
	}
	#num {
		border-bottom: 2px solid #8C8C8C;
		margin: 0 auto;
		width: 745px;
	}
	#num span:first-of-type {
		font-size: 17pt;
		margin-left: 10px;
	}
	#num span:last-of-type {
		color: #8C8C8C;
		margin-left: 10px;
	}

	#detail_box #img {
		float: left;
		margin-top: 15px;
		margin-left: 10px;
	}
	#detail_box #detail {
		float: left;
		margin-top: 25px;
		margin-left: 25px;
		line-height: 16pt;
	}
	#detail span:nth-of-type(3) {
		color: #A6A6A6;
		font-size: 9pt;
	}
	#detail span:last-of-type {
		font-size: 11pt;
	}
	#review {
		float: right;
		padding: 35px;
		margin-top: 20px;
	}
	#review input {
		width: 100px;
		height: 40px;
		background-color: white;
		border: 1px solid #050099;
		color: #050099;
	}
</style>
</head>
<script>
	$(document).ready(function() {

		slide();
	  
	 	$('#nav-icon1,#nav-icon2,#nav-icon3,#nav-icon4').click(function(){
			$(this).toggleClass('open');
		});
	 	
	 	
	});
</script>
<body>
	<form action="mypage_qna.mypage?command=item_qna" method="post" onsubmit="return signupchk()">
		<%
			String mb_id = (String)session.getAttribute("mb_id");
			if(mb_id == null){
				%>
				<jsp:include page="../overlap/header_login.jsp"/>
				<script>
					location.href="../index.jsp";
				</script>
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
					<h2>주문 내역</h2>
				</div>
				<div id="wrap">
					<% if(list.size() == 0) { %>
						<div id="no_order">
							<div>
								<span>주문하신 내역이 없습니다.</span></br>
							</div>
						</div>
					<% } else { 
							for(int i=0; i<list.size(); i++) { 
								double discount = (double)list.get(i).getDiscount()/(double)100; 
								double discountDollar = list.get(i).getItemDollar()*(1-discount); %>
								<div id="detail_box">
									<div id="num">
										<span>주문번호 : <%= list.get(i).getOrder_no() %></span>
										<span><%= list.get(i).getOrder_date() %></span>
									</div>
									<a href="../shopping/itemDetail.shop?itemCode=<%= list.get(i).getItemCode()%>">
										<div id="img"><img src="<%= list.get(i).getItemImg()%>" width="120px" height="120px"></div>
										<div id="detail">
											<span><%= list.get(i).getBrandName() %></span></br>
											<span><%= list.get(i).getItemName() %></span></br>
											<span>옵션 : <%= list.get(i).getOption() %>&nbsp|&nbsp<%= list.get(i).getCount()%>개</span></br>
											<span>
												<b>$<fmt:formatNumber value="<%= discountDollar %>" pattern='0.0' /></b>
												<b>(<fmt:formatNumber value="<%= list.get(i).getDiscountWon() %>" groupingUsed="true"/>원)</b>
											</span>
										</div>
									</a>
									
									<div id="review">
										<input type="button" value="상품평 쓰기">
									</div>
								</div>
						<% } %>
					<% } %>
					<%-- 	
						<% } else {
							for(int i=0; i<list.size(); i++) {
						
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
						
						<% } }%>
						</table> --%>
				</div>
			</div>
		</section>
		<div style="width: 1200px; height: 100px; margin-top: 10px;"></div>
		
	</form>
	<jsp:include page="../overlap/footer.jsp"/>
</body>
</html>