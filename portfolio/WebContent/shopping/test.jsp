<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Item.Review" %>
<%@page import="vo.ItemReview"%>
<%@page import="vo.ItemImg"%>
<%@ page import="vo.Item" %>
<%@ page import="vo.ItemOption"%>
<%
	Item article = (Item)request.getAttribute("article");
	String itemCode = request.getParameter("itemCode");
	
	/* ItemOption opArticle = (ItemOption)request.getAttribute("opArticle");
	ItemImg imgArticle = (ItemImg)request.getAttribute("imgArticle");
	ArrayList<ItemReview> articleList=(ArrayList<ItemReview>)request.getAttribute("articleList"); */
	
	out.println(article);

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
<title>상품 상세 설명</title>
<style>
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
		margin: 50px auto;
	}
	#search input {
		width: 800px;
		height: 20px;
		margin-bottom: 0;
		border-radius: 10px 10px 10px 10px;
	}
	#index {
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
	#detail1 {
		width: 1200px;
		height: 700px;
		margin: 0 auto;
	}
	#thumbnail img{
		width: 590px;
		height: 500px;
		/* border-style: solid;
		border-color: #EAEAEA;  */
	}
	#img {
		margin-top: 20px;
		position: relative;
		top: 20px;
	}
	#select {
		float: right;
		width: 590px;
		height: 500px;
		position: relative;
		bottom: 100px;
		/* border-style: solid;
		border-color: #EAEAEA; */
	}
	#select table {
		width: 590px;
		border-collapse: collapse;
	}
	#select table font {
		font-size: 18pt;
		font-weight: bold;
	}
	#optionSel {
		float: right;
		width: 150px;
		height: 40px;
		position: relative;
		bottom: 55px;
	}
	#optionSel input[type=text] {
		height: 26px;
		border-style: solid;
		border-width: 1px;
		border-color: #D5D5D5;
	}
	
	.up_count {
		width: 30px;
		height: 30px;
		position: relative;
		right: 10px;
		border-style: solid;
		border-width: 1px;
		border-color: #D5D5D5;
		background-color: white;
	
	} 
	.down_count {
		width: 30px;
		height: 30px;
		position: relative;
		left: 10px;
		border-style: solid;
		border-width: 1px;
		border-color: #D5D5D5;
		background-color: white;
	}
	.btn {
		display: inline-block;
		padding: 4px 12px; 
		font-size: 14px; 
		line-height: 20px;
		color: #333; 
		text-align: center; 
		vertical-align: middle; 
		cursor: pointer;
		border-color: #D5D5D5;
	}
	
	#option {
		width: 200px;
		height: 40px;
	}
	#select .buy {
		float: left;
		width: 212px;
		height: 65px;
		background-color: black;
		margin-top: 15px;
		color: white;
	}
	#select .cart {
		float: left;
		width: 212px;
		height: 65px;
		border-style: none;
		background-color: #A6A6A6;
		margin-top: 15px;
		margin-left: 12px;
		color: white;
	}
	#select #present {
		float: left;
		width: 65px;
		height: 65px;
		margin-left: 12px;
		position: relative;
		top: 14px;
		background-color: #F15F5F;
		border-style: none;
		/*filter: invert(100%) sepia(0%) saturate(34%) hue-rotate(162deg) brightness(106%) contrast(110%);*/
	}
	.like {
		float: right;
		width: 65px;
		height: 56px;
		border-style: solid;
		border-width: 1px;
		text-align: center;
		padding-top: 7px;
		font-size: 25pt;
		position: relative;
		top: 14px;
	}
	.tableLine {
		border-bottom: 1px solid #D5D5D5;
		height: 70px;
	}
	.brand {
		display: block;
		line-height: 15pt;
	}
	.brand:nth-of-type(2n) {
		font-size: 18pt;
		font-weight: bold;
	}
	#detail2 {
		width: 1200px;
		height: fit-content;
		border-style: solid;
		border-left: 0;
		border-right: 0;
		margin: 0 auto;
	}
	#detail2 img {
		margin-top: 50px;
		padding-left: 100px;
	}
	#review {
		border-style: none;
		width: 1200px;
		height: 15px;
		margin: 10px auto;
	} 
	#review1 {
		width: 1200px;
		height: 220px;
		border-style: none;
		background-color: #EAEAEA;
		margin: 0 auto;
	}
	#rate1 {
		float: left;
		width: 590px;
		height: 220px;
	}
	#rate1 p:first-of-type {
		text-align: center;
		padding-top: 20px;
		font-size: 20px;
		font-weight: bold;
		line-height: 10px;
	}
	#rate1 p:last-of-type {
		text-align: center;
		font-size: 20px;
		font-weight: bold;
	}
	.reviewBtn1 {
		width: 170px;
		height: 50px;
		background-color: black;
		color: white;
		margin-left: 210px;
		font-size: bold;
	}
	.reviewBtn2 {
		width: 170px;
		height: 50px;
		background-color: black;
		color: white;
		font-size: bold;
	}
	#rate2 {
		float: right;
		width: 590px;
		height: 200px;
	}
	#rate2 li {
		list-style: none;
		padding-top: 5px;
	}
	#detailReview1 {
		width: 1200px;
		/* height: fit-content; */
		margin: 20px auto;
		border-style: solid;
		border-left: 0;
		border-right: 0;
		border-color: #A6A6A6;
	}
	#reviewTable {
		width: 1200px;
		border-collapse: collapse;
	}
	#reviewTable .tableLine div:first-of-type {
		margin-top: 10px;
	}
	#empty {
		width: 1200px;
		height: 300px;
		text-align: center;
	}
	#empty p:first-of-type {
		padding-top: 90px;
		color: #8C8C8C;
	}
	#empty p:last-of-type {
		font-weight: bold;
		color: #8C8C8C;
	}
	.update {
		float: right;
		background-color: white;
		border-style: none;
		border-width: 1px;
		color: #3F0099;
	}
	.recom b:first-of-type {
		float: left;
		margin-right: 20px;
		font-weight: bold;
	}
	.recom b:last-of-type {
		float: left;
		border-style: solid;
		border-width: 1px;
		border-radius: 12px;
		width: 50px;
		height: 20px;
		align-content: center;
		padding: 5px;
		position: relative;
		bottom: 5px;
	}
	#reviewTable a {
		float: right;
		margin-left: 20px;
	}
	#reviewRate {
		flot: left;
		height: 20px;
		margin-top: 5px;
	}
	#reviewRate b:last-of-type {
		float: right;
		color: #BDBDBD;
	}
	.reDate {
		float: right;
		color: #BDBDBD;
	}
	#text {
		width: 1200px;
		height: fit-content;
		margin-top: 10px;
	}
	#photo {
		margin-top: 20px;
		width: 1200px;
		height: 100px;
	}
	#list {
		width: 1200px;
		height: 20px;
		text-align: center;
		margin: 0 auto;
	}
	#list ul {
	
	}
	#list ul li {
		display: inline-block;
		list-style: none;
	}
	#list a {
		margin-left: 20px;
	}
	.star {
		filter: invert(84%) sepia(0%) saturate(1407%) hue-rotate(147deg) brightness(97%) contrast(76%);
		Loss: 0.7. This is a perfect result.
	}
	#option {
		font-size: 15px;
	}
	.option_wr1 {
		border-style: solid;
		border-color: #EAEAEA;
		border-width: 1px;
		height: 85px;
		padding-left: 25px;
		padding-top: 10px;
		font-size: 14pt;
	}
	.option_wr1 div:first-of-type {
		margin-top: 15px;
	}
	
	.option_wr1 div:nth-of-type(2) {
		position: relative;
		top: 10px;
	}
	
	.option_wr2 {
		border-style: solid;
		height: 60px;
	}
	.option_wr2 b:first-of-type {
		font-size: 14pt;
		padding-left: 10px;
		position: relative;
		top: 15px;
	}
	.option_wr2 b:nth-of-type(2) {
		font-size: 10pt;
		float:right;
		padding-top: 20px;
		padding-right: 20px;
		font-weight: normal;
		color: #8C8C8C;
	}
	.option_wr2 b:last-of-type {
		font-size: 14pt;
		float:right;
		padding-top: 15px;
		padding-right: 20px;
	}
	.select {
		width: 150px;
		height: 50px;
		font-size: 14px;
	}
	.counter {
	  width: 45px;  
	  border-radius: 0px !important;
	  text-align: center;
	}
</style>
</head>
<% 
	String mb_id = (String)session.getAttribute("mb_id");
	String reviewNo=request.getParameter("reviewNo");
%>
<body>
 	<form name="itemDetail">
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
				<input type="text" name="search">
			</div>
			<div id="index">
				<nav>
					<ul id="category">
						<li>카테고리1</li>
						<li>카테고리2</li>
						<li>카테고리3</li>
						<li>카테고리4</li>
					</ul>
				</nav>
			</div>
			<div id="sort">
	
			</div>
		</nav>
	</form>
</body>
</html>