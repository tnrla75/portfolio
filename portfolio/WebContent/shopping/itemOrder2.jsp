<%@page import="vo.Member_info"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Cairo&family=Indie+Flower&family=Koulen&display=swap" rel="stylesheet">
<link rel="stylesheet" href="../css/style.css" />
<link rel="stylesheet" type="text/css" href="../css/header_footer.css">
<link type="text/css" rel="stylesheet" href="../css/responsive-tabs.css" />
<link type="text/css" rel="stylesheet" href="../css/style2.css" />
<script src="http://use.fontawesome.com/releases/v6.1.2/js/all.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link rel="stylesheet" href="bang.css">
<style type="text/css"></style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="bang.js"></script>
<script type="text/javascript"></script>
<title>상품 구매 확정</title>
<style>
	header h3 {
		margin-top: 130px;
		margin-bottom: 70px;
		text-align: center;
		font-size: 25pt;
	}
	section {
		width: 1500px;
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
	section {
		width: 1300px;
		height: 507px;
		border-style: solid;
		border-width: 5px 0 5px 0;
		margin: 110px auto;
		text-align: center;
	}
	h2 {
		font-size: 30pt;
		margin-top: 130px;
	}
	section b {
		font-size: 18pt;
	}
	input {
		width: 280px;
		height: 70px;
		font-size: 13pt;
		font-weight: bold;
		background-color: black;
		color: white;
		margin-top: 30px;
	}
</style>
</head>

<body>
	<%
		String mb_id = (String)session.getAttribute("mb_id");
		String order_no =(String)session.getAttribute("order_no");	
	
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
	
	<form>
		<header>
			<h3>CHECKOUT</h3>
			<div class="order_wr">
				<div class="order2">1</div><b class="order_sel2">장바구니	<img src="../img/dutyfree/right-arrow.png" width="25px" height="25px"></b>
				<div class="order2">2</div><b class="order_sel2">주문결제	<img src="../img/dutyfree/right-arrow.png" width="25px" height="25px"></b>
				<div class="order1">3</div><b class="order_sel1">주문완료</b>
			</div>	
		</header>
		<section>
			<h2>주문번호 : <%= order_no %></h2>
			<b>주문이 완료되었습니다.</b></br>
			<input type="button" value="주문내역 확인하러 가기">
		</section>
		
		<jsp:include page="../overlap/footer.jsp"/>
	</form>
	
</body>
</html>