<%@page import="vo.Mypage_qna"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.Member_info"%>
<%@page import="vo.Mypage_review"%>

<%
	ArrayList<Mypage_review> list = (ArrayList<Mypage_review>)request.getAttribute("itemreview");
	
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
		width: 1200px;
		min-height: 900px;
		height: fit-content;
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
	}
	#reTable {
		margin: 10px auto;
		width: 750px;
		border-collapse: collapse;
	}
	.reTableLine {
		border-bottom: 1px solid #D5D5D5;
		border-top: 1px solid #D5D5D5;
		height: 70px;
	}
	#no_review {
		text-align: center;
		padding: 80px;
		border-style: solid;
		border-width: 1px 0 1px 0;
	}
	#no_review img {
		margin-bottom: 20px;
	}
	.item div{
		float: left;
	}
	.item div:last-of-type {
		margin-top: 15px;
		margin-left: 10px;
	}
	.item span:first-of-type {
		margin-top: 10px;
		font-size: 10pt;
		font-weight: bold;
	}
	.itemName {
		margin-top: 12px;
        display: block;
        color: #949494;
        width: 170px;
        font-size: 12px;
        font-weight: bolder !important;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }
    .item span:last-of-type {
		font-size: 10pt;
		color: #949494;
		position: relative;
		bottom: 13px;
	}
	.review_wr span:first-of-type {
		position: relative;
		bottom: 15px;
	}
	.review_wr span:nth-of-type(2) {
		float: right;
		font-size: 10pt;
		color: #8C8C8C;
		font-weight: bold;
		position: relative;
		bottom: 15px;
	}

	.reivew_wr span:last-of-type {
		font-size: 10pt;
	}	
	.star {
		filter: invert(84%) sepia(0%) saturate(1407%) hue-rotate(147deg) brightness(97%) contrast(76%);
		Loss: 0.7. This is a perfect result.
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
					<h2>내가 작성한 리뷰</h2>
				</div>
				<div id="wrap">
					<table id="reTable" cellpadding="10px">
						<tr>
							<td width="320px">상품 정보</td>
							<td>리뷰 내용</td>
						</tr>
						<% if(list.size() == 0) { %>
						<tr>
							<td colspan="2" id="no_review">
								<img src="../img/icon/write.png" width="50px" height="50px"></br>
								<div>
									<span>작성하신 상품평이 없습니다.</span></br>
								</div>
							</td>
						</tr>
						<% } else {
							for(int i=0; i<list.size(); i++) {
							String star1 = "<img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'>";
							String star2 = "<img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'>";
							String star3 = "<img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'>";
							String star4 = "<img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'>";
							String star5 = "<img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'>";
							
							String star;
							if(list.get(i).getReRate() == 1){
								star = star1;
							} else if(list.get(i).getReRate() == 2){
								star = star2;
							} else if(list.get(i).getReRate() == 3){
								star = star3;
							} else if(list.get(i).getReRate() == 4){
								star = star4;
							}  else if(list.get(i).getReRate() == 5){
								star = star5;
							} else {
								star = "";
							}
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
						</table>
				</div>			
			</div>
		</section>
		<jsp:include page="../overlap/footer.jsp"/>
	</form>
</body>
</html>