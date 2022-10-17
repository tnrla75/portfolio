<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.Item" %>
<%@ page import="vo.PageInfo" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	ArrayList<Item> articleList = (ArrayList<Item>)request.getAttribute("articleList");
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");	
	String keyword = (String)request.getAttribute("keyword");
	
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
<title>상품 검색</title>
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
		margin-left: 10px;
	}
	.sort1:first-of-type {
		position: relative;
		bottom: 10px;
	}
	.sort1:first-of-type img {
		position: relative;
		top: 5px;
	}
	nav div:last-of-type {
		width: 1200px;
		font-size: 25pt;
		font-weight: bold;
		margin: 0 auto;
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
<body>
	<form>
		<%
			String mb_id = (String)session.getAttribute("mb_id");
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
				<p class="sort1"><a href="itemMain.jsp"><img src="../img/dutyfree/home.png" width="20px" height="20px">	<</a></p>
				<p class="sort1">통합검색
			</div>
			<div><%= keyword %> 검색결과</div>
		</nav>
		<section id="wrap">
			<table id="itemIndex" align="center" cellpadding="10" >
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
								<div class="like"><img src="../img/dutyfree/heart.png" height="30px" width="30px"></div>
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
								<div class="like"><img src="../img/dutyfree/heart.png" height="30px" width="30px" class="heart"></div>
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
			<jsp:include page="../overlap/footer.jsp"/>	
	</form>
</body>
</html>