<%@page import="vo.Mypage_qna"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.Member_info"%>
<%@page import="vo.Item"%>

<%
	ArrayList<Item> list = (ArrayList<Item>)request.getAttribute("itemWish");
	String mb_id = (String)session.getAttribute("mb_id");
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
		height: fit-content;
		min-height: 600px;
		display: table;
		margin: 10px auto;
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
		border-bottom: 1px solid black;
	}
	/* #no_heart {
		height: 613px;
	} */
	#no_heart img {
		margin-top: 70px;
		margin-left: 350px;
	}
	#no_heart div {
		width: 400px;
		margin: 30px auto;
		text-align: center;
		line-height: 20pt;
	}
	#item_wr {
		float: left;
		border: 1px solid #D5D5D5;
		margin-top: 20px;
		margin-left: 10px;
		margin-bottom: 10px;
		width: 355px;
		height: 220px;
	}
	#img_box {
		float: left;
		width: 170px;
		margin-top: 30px;
		padding-left: 5px;
	}
	#detail_box {
		float: left;
		position: relative;
		right: 10px;
		width: 170px;
		margin-top: 28px;
		font-weight: bold;
		font-size: 10pt;
	}
	#detail_box p {
		width: 170px;
		color: #747474;
		position: relative;
		bottom: 5px;
		overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
	}
	#detail_box span:nth-of-type(3) {
		
	}
	#detail_box span:nth-of-type(4) {
		font-size: 11pt;
	}
	.select {
		width: 170px;
		height: 35px;
		margin-top: 10px;
		background-color: #F6F6F6;
		border-style: none;
		font-size: 8pt;
	}
	.select:hover {
		border-width: 1px;
	}
	.select:active {
		border-width: 1px;
	}
	.cartBtn {
		border-style: none;
		margin-top: 13px;
		background-color: white;
		float: right;
	}
	.detail_box img {		
		filter: invert(74%) sepia(10%) saturate(11%) hue-rotate(359deg) brightness(89%) contrast(87%);
	}
</style>
</head>
<script>
	
		<%-- var mb_id = '<%= (String)session.getAttribute("mb_id") %>';
		$('.cart').on('click', function() {
			$('.select').on('change',function() {
				alert("a");
				if (this.value == "선택해 주세요.") {
					alert("옵션을 선택해 주세요.");		
				}
			}
		}); --%>
		
		/* var select =  document.getElementById('option').html;
		
		var count =  document.getElementById('result').innerHTML;
		var option = document.getElementById('option').innerHTML;
		
		var select = document.getElementById('option').innerText; */
		/*if (select == "선택해 주세요." || select == "") {
			alert("옵션을 선택해 주세요.");
		} else {
			 $("#dialog-message").dialog().parents(".ui-dialog").find(".ui-dialog-titlebar").remove();
			$('#dialog-message').dialog({
				modal: true, 
				width : '650',
				height : '350',
				resizeable : false,	
				buttons: {	
					"쇼핑 계속하기": function() { $(this).dialog('close'); },
					"쇼핑백 확인하기": function() { $(this).dialog('close'); }
				} 
			}); */
		
	
</script>
<script>
	var option;
	$(document).ready(function() {
		$('.select').on('change',function() {
			option = this.value
		});
	});
	function cart(i, itemCode) {
		if (option == null || option == "선택해 주세요.") {
			alert("옵션을 선택해 주세요.");
		} else {
			alert("쇼핑백에 상품이 담겼습니다.");
			location.href = "itemWish.mypage?command=cart&itemCode="+itemCode+"&mb_id=<%= mb_id%>&count=1&option="+option;
		}
		
	}
	function wish_del(i, itemCode) {
		location.href = "itemWish_del.mypage?command=itemWish_del&itemCode="+itemCode;
	}

	
</script>
<body>
	<form namae="itemWish">
		<%
			
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
					<h2>MY♡ITEM</h2>
				</div>
				<div id="wrap">
					<% if (list.size() == 0) { %>
						<div id="no_heart">
							<img src="../img/dutyfree/dislike.png" width="50px" height="50px"></br>
							<div>
								<span>저장된 관심 상품이 없습니다.</span></br>
								<span>마음에 드는 상품은 하트를 눌러 관심상품으로</br>
									저장해보세요.				
								</span>
							</div>
						</div>
						
					<% } else { 
						for (int i=0; i<list.size(); i++) {
							 double discount = (double)list.get(i).getDiscount()/(double)100; 
							 double discountDollar = list.get(i).getItemDollar()*(1-discount); %>
							<div id="item_wr">
								<a href="../shopping/itemDetail.shop?itemCode=<%= list.get(i).getItemCode()%>">
									<div id="img_box">
										<img src="<%= list.get(i).getItemImg() %>" width="150px" height="160px"> 
									</div>
								</a>
								<div id="detail_box">
									<a href="../shopping/itemDetail.shop?itemCode=<%= list.get(i).getItemCode()%>">
										<span><%= list.get(i).getBrandName() %></span>
										<p><%= list.get(i).getItemName() %></p>
									</a>
									<span style="color: #8C8C8C; text-decoration: line-through;">$<%= list.get(i).getItemDollar() %></span></br>
									<span>
										<b>$<fmt:formatNumber value="<%= discountDollar %>" pattern='0.0' /></b>
										<b>(<fmt:formatNumber value="<%= list.get(i).getDiscountWon() %>"  groupingUsed="true"/>원)</b>
										<b style="font-weight: bold; color:red; float: right;"><%= list.get(i).getDiscount()+"%" %></b>
									</span></br>
									<span>
										<select class="select" name="suntack" onchange="select(itemWish.suntack)">
											<option value="선택해 주세요." selected><%= list.get(i).getOptionName()%>을 선택해 주세요.</option>
											<% if(list.get(i).getOption2() == null) { %>
												<option value="<%=list.get(i).getOption1()%>"><%=list.get(i).getOption1()%></option>
											<% } 
											else if (list.get(i).getOption3() == null) {%>
												<option value="<%=list.get(i).getOption1() %>"><%=list.get(i).getOption1() %></option>
									    		<option value="<%=list.get(i).getOption2() %>"><%=list.get(i).getOption2() %></option>
									    	<% }
											else if (list.get(i).getOption4() == null) {%>
												<option value="<%=list.get(i).getOption1() %>"><%=list.get(i).getOption1() %></option>
										    	<option value="<%=list.get(i).getOption2() %>"><%=list.get(i).getOption2() %></option>
										    	<option value="<%=list.get(i).getOption3() %>"><%=list.get(i).getOption3() %></option>
										    <% } 
											else if (list.get(i).getOption5() == null) {%>
												<option value="<%=list.get(i).getOption1() %>"><%=list.get(i).getOption1() %></option>
										    	<option value="<%=list.get(i).getOption2() %>"><%=list.get(i).getOption2() %></option>
										    	<option value="<%=list.get(i).getOption3() %>"><%=list.get(i).getOption3() %></option>
										    	<option value="<%=list.get(i).getOption4() %>"><%=list.get(i).getOption4() %></option>
									   		<% }
											else if (list.get(i).getOption5() != null) {%>
												<option value="<%=list.get(i).getOption1() %>"><%=list.get(i).getOption1() %></option>
										    	<option value="<%=list.get(i).getOption2() %>"><%=list.get(i).getOption2() %></option>
										    	<option value="<%=list.get(i).getOption3() %>"><%=list.get(i).getOption3() %></option>
										    	<option value="<%=list.get(i).getOption4() %>"><%=list.get(i).getOption4() %></option>
										    	<option value="<%=list.get(i).getOption5() %>"><%=list.get(i).getOption5() %></option>
									   		<% }%>
									    </select>				
									</span></br>
									<!-- <div id="option" style="border-style: solid; width: 50px; height: 50px;"></div> -->
									<button type="button" onclick="cart(<%=i%>,<%=list.get(i).getItemCode()%>)" class="cartBtn">
										<img src="../img/dutyfree/shopping_cart.png" width="20px" height="20px" onclick="cart()">
									</button>
									<button type="button" onclick="wish_del(<%=i%>,<%=list.get(i).getItemCode()%>)" class="cartBtn">
										<img src="../img/dutyfree/recycle.png" width="19px" height="19px">
									</button>
								</div>
							</div>
						<% } %>
					<% } %>
				</div>			
			</div>
		</section>
		<jsp:include page="../overlap/footer.jsp"/>
	</form>
	
</body>
</html>