<%@page import="vo.ItemImg"%>
<%@page import="vo.ItemReview"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Item.Review" %>
<%@ page import="vo.Item" %>
<%@ page import="vo.PageInfo" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	ArrayList<Item> articleList = (ArrayList<Item>)request.getAttribute("articleList");
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");	

	String category = request.getParameter("category");
	session.setAttribute("category", category);
	
	int listCount=pageInfo.getListCount();
	int nowPage=pageInfo.getPage();
	int maxPage=pageInfo.getMaxPage();
	int startPage=pageInfo.getStartPage();
	int endPage=pageInfo.getEndPage();
%>

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
<title>상품 선택</title>
<style type="text/css">
	#search {
		width: 1200px;
		height: 50px;
		text-align: center;
		margin: 50px auto;
	}
	#search input[type=text] {
		float: left;
		width: 800px;
		height: 50px;
		margin-left: 200px;
		margin-top: 20px;
		border-width: 0 0 1px 0;
	}
	.searchIcon {
		float: left;
		width: 40px;
		height: 40px;
		border-style: none;
		background-color: white;
		background-image: url(../img/icon/loupe.png);
	    background-position: 1px center;
	    background-size: 20px;
	    background-repeat: no-repeat;
	    margin-top: 20px;
	    position: relative;
	    right: 40px;
	    top: 10px;
	}
	#sort {
		clear: left;
		width: 1200px;
		height: 50px;
		font-size: 7pt;
		margin: 30px auto;
		position: relative;
		top: 20px;
	}
	.sort1 {
		float: left;
		font-size: 10pt;
		line-height: 5pt;
	}
	.sort1:first-of-type {
		position: relative;
		bottom: 10px;
	}
	.sort1:first-of-type img {
		position: relative;
		top: 5px;
	}
	#sortBox {
		width: 1200px;
		height: fit-content;
		margin: 20px auto;
	}
	#sortBox h3{
		font-size: 20pt;
	}
	#sortBox table {
		width: 1200px;
	}
	#sortBox table td{
		width: 300px;
	}
	#sortBox a:hover {
		font-weight: bold;
	}
	#sortBox2 {
		margin-top: 20px;
		width: 1200px;
		height: fit-content;
		margin: 30px auto;
	}
	#sortBox2 table {
		border-style: solid;
		border-width: 3px 0 1px 0;
		border-top-color: #747474;
		border-bottom-color: #BDBDBD;
		border-collapse: collapse;
	}
	#sortBox2 table tr{
		border-style: solid;
		border-width: 0 0 1px 0;
		border-bottom-color: #BDBDBD;
	}
	.tableLine {
		border-style: solid;
		border-width: 0 1px 0 0;
		background-color: #F6F6F6;
		border-color: #D5D5D5;
		font-weight: bold;
		font-size: 13pt;
	}
	#sortBox2 table td:first-of-type{
		width: 30px;
	}
	#sortBox2 div {
		float: left;
		width: 150px;
		height: 30px;
		border-style: solid;
		border-width: 1px;
		padding: 5px;
	}
	#sortBox2 b {
		float: left;
		margin-top: 5px;
	}
	.price_op {
		float: right;
		width: 60px;
		height: 28px;
		text-align: right;
		border-style: none;
	}
	.price_op:hover {
		border-style: none;
		border-width: 1px;
	}
	.price_op:active {
		border-style: none;
	}
	#sortBox2 input[type=button] {
		width: 130px;
		height: 50px;
		background-color: black;
		color: white;
		font-weight: bold;
		font-size: 11pt;
		margin-top: 10px;
		margin-left: 12px;
		margin-bottom: 50px;
	}
	#sortBox2 input[type=reset] {
		width: 130px;
		height: 50px;
		background-color: white;
		font-weight: bold;
		font-size: 11pt;
		margin-top: 10px;
		margin-left: 500px;
		margin-bottom: 50px;
		background-image: url(../img/dutyfree/reset.png);
	    background-position: 25px center;
	    background-size: 20px;
	    background-repeat: no-repeat;
	}
	#filter {
		width: 1200px;
		height: 20px;
		border-style: solid;
		border-width: 0 0 2px 0;
		margin: 0 auto;
	}
	#filter a{
		border-style: none;
		background-color: white;
		position: relative;
		left: 870px;
		bottom: 20px;
	}
	#filter a:hover {
		font-weight: bold;
	}
	#filter img {
		position: relative;
		left: 870px;
		bottom: 20px;
	}
	#itemIndex td {
		margin-left: 10px;
	}
	.img {
		width: 260px;
		height: 330px;
		margin: 0 auto;
	}
	.img img {
		margin: 0 auto;
		padding-top: 40px;
		position: relative;
		left: 25px;
	}
	#item_wr {
		border-style: solid;
		border-width: 1px;
		border-color: white;
		width: 270px;
		height: 450px;
		overflow: hidden;
	}
	#item_wr:hover{
		border-style: solid;
		border-color: black;
		border-width: 1px;
	}
	.itemDetail p {
		margin-top: 0;
		margin-left: 10px;
		position: relative;
		bottom: 35px;
	}
	.itemDetail p:first-of-type {
		font-weight: bold;
		font-size: 12pt;
	}
	.itemDetail p:nth-of-type(2) {
		width: 240px;
		font-weight: bold;
		font-size: 10pt;
		color: #7474746;
		overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
	}
	.itemDetail b:first-of-type {
		font-weight: bold;
		font-size: 20pt;
		color: #CC3D3D;
		line-height: 10px;
	}
	.itemDetail b:last-of-type {
		font-weight: normal;
		font-size: 12pt;
		margin-left: 10px; 
		color: #8C8C8C;
	}
	.like {
		width: 40px;
		height: 40px;
		position: relative;
		bottom: 80px;
		left: 210px;
	}
	#pageList {
		margin: 40px auto;
		text-align: center;
	}
	.on {
		color: yellow;
	}
</style>
</head>
<% 
	String mb_id = (String)session.getAttribute("mb_id");
	String reviewNo=request.getParameter("reviewNo");
%>
<script>

	$(document).ready(function() {
		if(location.href.indexOf('item_countOrder.shop?category=스킨케어') > -1){ // location.href 로 현재 페이지 주소를 가져옵니다.
			alert("a");
		/* 	$(".filter_sort").addClass('on');; //매칭된 페이지에 한해 특정 요소에 스타일을 부여합니다. */
		}
        $(".filter_sort").on('click',function() {
      		toggleClass(".active-color");
        });	
        	

     	$('.filter_sort').click(function() {
	  		alert("click");
	  		$(this).addClass('bg');
	 	});

	});
</script>
<body>
	<form name="itemSelect" >
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
		<nav>
			<div id="search">
				<input type="text" name="keyword">
				<input type="submit" value="" onclick="javascript: form.action='search.shop';" class="searchIcon">
			</div>
			<div id="sort">
				<p class="sort1"><a href="../shopping/itemMain.dutyfree?command=itemMain"><img src="../img/dutyfree/home.png" width="20px" height="20px">	<</a></p>
				<p class="sort1"><%= category %></p>
				<!-- <p class="sort1">중분류 <</p>
				<p class="sort1">소분류</p> -->
			</div>
			<div id="sortBox">
				<h3><%= articleList.get(0).getBigCategory() %></h3>
				<div>
					<% if(articleList.get(0).getBigCategory().equals("스킨케어")) { %>
						<table border="1" cellpadding="10px" cellspacing="0">
							<tr align="center">
								<td><a href="itemList.shop?category=스킨케어">전체</a></td>
								<td><a href="itemList.shop?category=스킨/토너">스킨/토너</a></td>
								<td><a href="itemList.shop?category=에센스/세럼">에센스/세럼</a></td>
								<td><a href="itemList.shop?category=로션">로션</a></td>
							</tr>
							<tr align="center">
								<td><a href="itemList.shop?category=크림">크림</a></td>
								<td><a href="itemList.shop?category=페이스오일">페이스오일</a></td>
								<td><a href="itemList.shop?category=마스크/팩">마스크/팩</a></td>
								<td></td>
							</tr>
						</table>
					<%}%>		
				</div>
				<div id="sortBox2">
					<table cellpadding="15px">
						<tr>
							<td width="100px" class="tableLine">브랜드</td>
							<td>
								<input type="checkbox" value="SULWHASOO" name=brand_op>설화수
								<input type="checkbox" value="NEEDLY" name=brand_op>키엘
								<input type="checkbox" value="LA MER" name=brand_op>라 메르
								<input type="checkbox" value="YVES SAINT LAURENT" name=brand_op>입생로랑
								<input type="checkbox" value="KIEHL S" name=brand_op>니들리
							</td>
						</tr>
						<tr>
							<td class="tableLine">가격대</td>
							<td>
								<div><b>$</b><input type="text" name="price_op" value="" class="price_op" placeholder="0"></div>
								<b>&nbsp~&nbsp</b>
								<div>&nbsp<b>$</b><input type="text" name="price_op" value="" class="price_op" placeholder="0"></div>
							</td>
						</tr>
					</table>	
					<input type="reset" value="	초기화" />
					<input type="button" value="적용">
				</div>
			</div>
		</nav>
		<section id="wrap">
			<div id="filter">
				<h3></h3>
				<a href="item_countOrder.shop?category=<%= category%>" class="filter_sort">조회수순&nbsp|</a>
				<a href="item_highPrice.shop?category=<%= category%>"  class="filter_sort">높은가격순&nbsp|</a>
				<a href="item_lowPrice.shop?category=<%= category%>"  class="filter_sort">낮은가격순</a>
				<!-- <input type="submit" value="조회수순	|" onclick="javascript: form.action='item_countOrder.shop?category=category';">
				<input type="submit" value="높은가격순	|" onclick="javascript: form.action='item_highPrice.shop';">
				<input type="submit" value="낮은가격순" onclick="javascript: form.action='item_lowPrice.shop';"/> -->
			</div>
			<table id="itemIndex" align="center" cellpadding="10">
				<tr>
					<%
						if(articleList != null && listCount > 0){
							for(int i=0; i<articleList.size(); i++) { 
								 double discount = (double)articleList.get(i).getDiscount()/(double)100; 
								 double discountDollar = articleList.get(i).getItemDollar()*(1-discount);
							
					%>	
					<td>
						<div id="item_wr">
						<a href="itemDetail.shop?itemCode=<%= articleList.get(i).getItemCode()%>" class="itemDetail">
							<div class="img"><img src = "<%= articleList.get(i).getItemImg()%>" width="200px" height="200px"></div>
							<% if((i+1)%4 == 0) { %>
								<p><%= articleList.get(i).getBrandName() %></p>
								<p><%= articleList.get(i).getItemName() %></p>
								<p>
									<span style="color: #8C8C8C; text-decoration: line-through;">$<%= articleList.get(i).getItemDollar() %></span>
									<span style="font-weight: bold;"><%= articleList.get(i).getDiscount()+"%" %></span>
								</p>
								<p>
									<b>$<fmt:formatNumber value="<%= discountDollar %>" pattern='0.0' /></b>
									<b>(<fmt:formatNumber value="<%= articleList.get(i).getDiscountWon() %>"  groupingUsed="true"/>원)</b>
								</p>
								<!-- <div class="like"><img src="../img/dutyfree/heart.png" height="30px" width="30px"></div> -->
							</td>
							</tr>
							<% } else { %>
								<p><%= articleList.get(i).getBrandName()%></p>
								<p><%= articleList.get(i).getItemName() %></p>
								<p>
									<span style="color: #8C8C8C; text-decoration: line-through;">$<%= articleList.get(i).getItemDollar() %></span>
									<span style="font-weight: bold;"><%= articleList.get(i).getDiscount()+"%" %></span>
								</p>
								<p>
									<b>$<fmt:formatNumber value="<%= discountDollar %>" pattern='0.0' /></b>
									<b>(<fmt:formatNumber value="<%= articleList.get(i).getDiscountWon() %>" groupingUsed="true"/>원)</b>
								</p>
								<!-- <div class="like"><img src="../img/dutyfree/heart.png" height="30px" width="30px" class="heart"></div> -->
							<% } %>
						</a>
						</div>
					</td>	
						<% } %>	
				</tr>
			</table>
			<section id="pageList">
				<% if(nowPage<=1){ %>
					[이전]&nbsp;
				<% } else { %>
					<a href="itemList.shop?page=<%=nowPage-1 %>&category=<%= category%>">[이전]</a>&nbsp;
				<% } %>
				<%for(int a=startPage;a<=endPage;a++){
					if(a==nowPage){%>
						[<%=a %>]
				<%	} else { %>
						<a href="itemList.shop?page=<%=a %>&category=<%= category%>">[<%=a %>]</a>&nbsp;
				<%	} %>
				<%} %>
		
				<%if (nowPage>=maxPage) { %>
					[다음]
				<% } else { %>
					<a href="itemList.shop?page=<%=nowPage+1 %>">[다음]</a>
				<% } %>
			</section>
				<% } else { %>
					<section id="emptyArea">등록된 글이 없습니다.</section>
				<% } %>
	</form>
	<jsp:include page="../overlap/footer.jsp"/>
</body>
</html>