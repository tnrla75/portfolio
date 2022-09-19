<%@page import="vo.ItemImg"%>
<%@page import="vo.ItemReview"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Item.Review" %>
<%@ page import="vo.Item" %>
<%@ page import="vo.PageInfo" %>

<%
	ArrayList<Item> articleList = (ArrayList<Item>)request.getAttribute("articleList");
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");	

	String category = request.getParameter("category");
	
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
	a {
		text-decoration: none;
		text-decoration-line: none;
		color: black;
	}
	a:hover {
		color: black;
	}
	a:active {
		color: black;
	}
	a:visited {
		color: black;
	}
	#search {
		width: 1200px;
		height: 20px;
		text-align: center;
		margin: 20px auto;
	}
	#search input[type=text] {
		float: left;
		width: 800px;
		height: 50px;
		margin-left: 200px;
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
	    position: relative;
	    right: 40px;
	    top: 10px;
	}
	#index {
		clear: left;
		width: 1200px;
		height: 20px;
		margin: 0 auto;
		padding-bottom: 10px;
	}
	#category {
		margin-top: 0;
		text-align: center;
		padding-left: 10px;
		font-family: 굵은안상수체;
		font-size: 17pt;
	}
	#category li {
		display: inline-block;
		list-style: none;
	}
	#sort {
		width: 1200px;
		height: 80px;
		font-size: 7pt;
		margin: 0 auto;
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
		height: 200px;
		margin: 20px auto;;
	}
	#sortBox table {
		width: 1200px;
	}
	#sortBox table  td{
		width: 300px;
	}
	
	#filter {
		width: 1200px;
		height: 20px;
		border-style: solid;
		border-width: 0 0 2px 0;
		margin: 0 auto;
		position: relative;
		bottom: 10px;
	}
	#filter a{
		border-style: none;
		background-color: white;
		position: relative;
		left: 850px;
		bottom: 20px;
	}
	#filter img {
		position: relative;
		left: 855px;
		bottom: 10px;
	}
	#itemIndex td {
		width: 270px;
		height: 380px;
		margin-left: 10px;
	}
	/* #itemIndex td:hover{
		border-style: solid;
		border-width: 1px;
	} */
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
	.itemDetail a:hover {
		border-style: solid;
	}

	.itemDetail p {
		margin-left: 10px;
	}
	.itemDetail p:first-of-type {
		font-weight: bold;
		font-size: 12pt;
	}
	.itemDetail p:nth-of-type(2) {
		font-weight: bold;
		font-size: 10pt;
		color: #8C8C8C;
	}
	.itemDetail b:first-of-type {
		font-weight: bold;
		font-size: 17pt;
	}
	.itemDetail b:last-of-type {
		font-weight: normal;
		font-size: 12pt;
		margin-left: 10px; 
		color: #8C8C8C;
	}
	.itemDetail:hover {
		border-style: solid;
	}
	#pageList {
		margin: auto;
		width: 500px;
		text-align: center;
	}
</style>
</head>
<% 
	String mb_id = (String)session.getAttribute("mb_id");
	String reviewNo=request.getParameter("reviewNo");
%>
<script>
	$(document).ready(function() {
 		$('.insert1').hide();
        $('#travel1').mouseover(function(){
            $('.insert1').show();
        });
        $('#travel1').mouseout(function(){
            $('.insert1').hide();
        });
        $('.insert2').hide();
        $('#travel2').mouseover(function(){
            $('.insert2').show();
        });
        $('#travel2').mouseout(function(){
            $('.insert2').hide();
        });
        $('.insert3').hide();
        $('#travel3').mouseover(function(){
            $('.insert3').show();
        });
        $('#travel3').mouseout(function(){
            $('.insert3').hide();
        });
        $('.insert4').hide();
        $('#travel4').mouseover(function(){
            $('.insert4').show();
        });
        $('#travel4').mouseout(function(){
            $('.insert4').hide();
        }); 
        
      	/* $('#filter img:first-of-type').hide();
      	$('#filter input[type=submit]:first-of-type').on('click', function() {
      		 $('#filter img:first-of-type').show();
        });  */ 
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
			<div id="index">
				<nav>
					<ul id="category">
						<li>카테고리</li>
						<li>BEST 샵</li>
						<li>세일</li>
						<li>명품관</li>
					</ul>
				</nav>
			</div>
			<div id="sort">
				<p class="sort1"><a href="itemMain.jsp"><img src="../img/dutyfree/home.png" width="20px" height="20px">	<</a></p>
				<p class="sort1"><%= category %> <</p>
				<p class="sort1">중분류 <</p>
				<p class="sort1">소분류</p>
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
								<td><a href="itemList.shop?category=미스트">미스트</a></td>
							</tr>
						</table>
					<%}%>		
				</div>
			</div>
		</nav>
		<section>
			<div id="filter">
				<div></div>
				<h3></h3>
				<img src="../img/dutyfree/check.png" width="25px" height="25px">
				<a href="item_countOrder.shop?category=<%= category%>">조회수순&nbsp|</a>
				<a href="item_highPrice.shop?category=<%= category%>">높은가격순&nbsp|</a>
				<a href="item_lowPrice.shop?category=<%= category%>">낮은가격순</a>
				<!-- <input type="submit" value="조회수순	|" onclick="javascript: form.action='item_countOrder.shop?category=category';">
				<input type="submit" value="높은가격순	|" onclick="javascript: form.action='item_highPrice.shop';">
				<input type="submit" value="낮은가격순" onclick="javascript: form.action='item_lowPrice.shop';"/> -->
			</div>
			<table id="itemIndex" align="center" cellpadding="10" >
				<tr>
					<%
					
					if(articleList != null && listCount > 0){
					
						for(int i=0; i<articleList.size(); i++) { 
					%>	
					<td>
						<a href="itemDetail.shop?itemCode=<%= articleList.get(i).getItemCode()%>" class="itemDetail">
							<div class="img"><img src = "<%= articleList.get(i).getItemImg()%>" width="200px" height="200px"></div>
							<% 
								if((i+1)%4 == 0) {
									out.println("<p>"+articleList.get(i).getBrandName()+"</p><p>"+articleList.get(i).getItemName()+"</p><p><b>$"+articleList.get(i).getDiscountDollar()+"</b><b>("+articleList.get(i).getDiscountWon()+"원)</b></p></td></tr>");
								} else {
									out.println("<p>"+articleList.get(i).getBrandName()+"</p><p>"+articleList.get(i).getItemName()+"</p><p><b>$"+articleList.get(i).getDiscountDollar()+"</b><b>("+articleList.get(i).getDiscountWon()+"원)</b></p>"); 
								}
							%>
						</a>
					</td>
						<% } %>	
				</tr>
			</table>
			<section id="pageList">
				<% if(nowPage<=1){ %>
					[이전]&nbsp;
				<% } else { %>
					<a href="itemList.shop?page=<%=nowPage-1 %>">[이전]</a>&nbsp;
				<% } %>
				<%for(int a=startPage;a<=endPage;a++){
					if(a==nowPage){%>
						[<%=a %>]
				<%	} else { %>
						<a href="itemList.shop?page=<%=a %>">[<%=a %>]</a>&nbsp;
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