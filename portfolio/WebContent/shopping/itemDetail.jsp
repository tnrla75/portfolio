<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Item.Review" %>
<%@page import="vo.ItemReview"%>
<%@page import="vo.ItemImg"%>
<%@ page import="vo.Item" %>
<%@ page import="vo.ItemOption"%>
<%@ page import="vo.PageInfo"%>
<%@ page import="vo.ItemQna"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	Item article = (Item)request.getAttribute("article");
	session.setAttribute("article", article);
	ItemOption opArticle = (ItemOption)request.getAttribute("opArticle");
	ItemImg imgArticle = (ItemImg)request.getAttribute("imgArticle");
	ArrayList<ItemReview> reArticleList =(ArrayList<ItemReview>)request.getAttribute("reArticleList");
	ArrayList<ItemReview> totalReArticleList = (ArrayList<ItemReview>)request.getAttribute("totalReArticleList");
	ArrayList<ItemQna> qnaArticleList = (ArrayList<ItemQna>)request.getAttribute("qnaArticleList");
	ArrayList<ItemQna> totalQnaArticleList = (ArrayList<ItemQna>)request.getAttribute("totalQnaArticleList");

	Item wishArticle = (Item)request.getAttribute("wishArticle");
	
	String itemCode = article.getItemCode();
	session.setAttribute("itemCode", itemCode);
	
	//상품문의 페이징
	PageInfo qna_pageInfo = (PageInfo)request.getAttribute("qna_pageInfo");
	int listCount=qna_pageInfo.getListCount();
	int nowPage=qna_pageInfo.getPage();
	int maxPage=qna_pageInfo.getMaxPage();
	int startPage=qna_pageInfo.getStartPage();
	int endPage=qna_pageInfo.getEndPage();
	
	//리뷰 페이징
	PageInfo re_pageInfo = (PageInfo)request.getAttribute("re_pageInfo");
	int re_listCount = re_pageInfo.getListCount();
	int re_nowPage = re_pageInfo.getPage();
	int re_maxPage = re_pageInfo.getMaxPage();
	int re_startPage = re_pageInfo.getStartPage();
	int re_endPage = re_pageInfo.getEndPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Cairo&family=Indie+Flower&family=Koulen&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../css/header_footer.css">
<script src="http://use.fontawesome.com/releases/v6.1.2/js/all.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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
	#search input[type=text] {
		float: left;
		width: 800px;
		height: 50px;
		margin-left: 200px;
		margin-top: 30px;
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
		margin: 50px auto;
		position: relative;
		top: 45px;
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
	#select_wr {
		float: right;
		width: 590px;
		height: 500px;
		position: relative;
		bottom: 120px;
		/* border-style: solid;
		border-color: #EAEAEA; */
	}
	#select_wr table {
		width: 590px;
		border-collapse: collapse;
	}
	#select_wr table font {
		font-size: 25pt;
		font-weight: bold;
	}
	#select_wr table span {
		font-weight: bold;
	}
	#total2 {
		font-size: 25pt;
		position: relative;
		bottom: 12px;
	}
	#optionSel {
		float: right;
		width: 150px;
		height: 40px;
		margin-right: 20px;
		position: relative;
		bottom: 10px;
	}
	#optionSel input[type=button]:first-of-type {
		width: 30px;
		height: 30px;
		background-color: white;
		border-style: none;
	}
	#optionSel input[type=button]:last-of-type {
		width: 30px;
		height: 30px;
		background-color: white;	
		margin-left: 40px;
		border-style: none;
	}
	#optionSel #result {
		width: 30px;
		height: 30px;
		position: relative;
		left: 80px;
		bottom: 7px;
	}
	.option_wr1 {
		border-style: solid;
		border-color: #EAEAEA;
		border-width: 1px;
		height: 110px;
		margin-top: 10px;
		padding-left: 25px;
		font-size: 14pt;
	}
	.option_wr1 div:first-of-type {
		float: left;
		margin-top: 10px;
		width: 470px;
		height: 40px;
	}
	.option_wr1 div:nth-of-type(2) {
		float: right;
		position: relative;
		top: 15px;
		right: 20px;
	}
	.option_wr1 div:nth-of-type(3) {
		clear: left;
		position: relative;
		top: 20px;
	}
	.option_wr2 {
		height: 65px;
		margin-top: 30px;
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
	#select {
		width: 150px;
		height: 50px;
		font-size: 14px;
	}
	.counter {
	  width: 45px;  
	  border-radius: 0px !important;
	  text-align: center;
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
	#select_wr .buy {
		float: left;
		width: 212px;
		height: 65px;
		background-color: black;
		margin-top: 15px;
		color: white;
	}
	#select_wr .cart {
		float: left;
		width: 212px;
		height: 65px;
		border-style: none;
		background-color: #A6A6A6;
		margin-top: 15px;
		margin-left: 12px;
		color: white;
	}
	#select_wr #present {
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
		overflow: hidden;
	}
	#like_off {
		width: 65px;
		height: 65px;
		position: relative;
		top: 5px;
	}
	#like_on {
		width: 65px;
		height: 65px;
		position: relative;
		bottom: 58px;
	}

	.tableLine {
		border-bottom: 1px solid #D5D5D5;
		padding: 10px;
		height: 80px;
	}
	.brand {
		display: block;
		line-height: 15pt;
	}
	.brand:nth-of-type(2) {
		font-size: 18pt;
		font-weight: bold;
		line-height: 25pt;
	}
	#detail2 {
		width: 1200px;
		height: fit-content;
		margin: 0 auto;
	}
	#detail2 img {
		margin-top: 50px;
		width: 900px;
		padding-left: 110px;
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
		border-top: 1px solid black;
		/* background-color: #EAEAEA; */
		margin: 0 auto;
		position: relative;
		right: 40px;
	}
	#rate1 {
		float: left;
		margin-top: 15px;
		padding-top: 10px;
		border-right: 1px solid black;
		width: 480px;
		height: 200px;
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
		margin-left: 160px;
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
		margin-top: 20px;
		width: 670px;
		height: 200px;
	}
	#rate2 div {
		float: left;
	}
	#rate2 div:first-of-type {
		width: 200px;
	}
	#rate2 div:last-of-type {
		width: 370px;
	}
	#rate2 li {
		list-style: none;
		font-weight: bold;
		font-size: 12pt;
		line-height: 20pt;
		padding-top: 5px;
	}
	#detailReview1 {
		width: 1200px;
		height: fit-content;
		margin: 20px auto;
		position: relative;
		right: 40px;
		border-style: solid;
		border-left: 0;
		border-right: 0;
		border-color: #A6A6A6;
	}
	#reviewTable {
		width: 1200px;
		border-collapse: collapse;
	}

	#reviewTable .text {
		border-style: 50px;
		height: fit-content;
	}
	#reviewTable .tableLine div:first-of-type {
		margin-top: 10px;
	}
	#empty1 {
		width: 1200px;
		height: 280px;
		text-align: center;
	}
	#empty1 p:first-of-type {
		padding-top: 70px;
		color: #8C8C8C;
	}
	#empty1 p:last-of-type {
		font-weight: bold;
		color: #8C8C8C;
	}
	#empty2 {
		width: 1200px;
		height: 100px;
		margin-top: 20px;
		border-style: solid;
		border-width: 1px 0 1px 0;
		padding-top: 30px;
		text-align: center;
		position: relative;
		right: 40px;
	}
	#empty1 p {
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
		min-height: 100px;
		height: fit-content;
		margin-top: 10px;
		resize: none;
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
	
	
	/* tab */
	#tab_wr {
		width: 1200px;
		height: fit-content;
		margin: 50px auto;
	}
	.tabs {
		margin-top: 50px;
		padding-bottom: 40px;
		border-style: none;

		margin: 0 auto;
	}

	/* 탭 스타일 */
	.tab_item {
		width: calc(100%/3);
		height: 50px;
		border-bottom: 3px solid #333333;
		background-color: #f8f8f8;
		line-height: 50px;
		font-size: 16px;
		text-align: center;
		color: #333333;
		display: block;
		float: left;
		text-align: center;
		font-weight: bold;
		transition: all 0.2s ease;
	}
	.tab_item:hover {
		opacity: 0.75;
	}

	/* 라디오 버튼 UI삭제*/
	input[name="tab_item"] {
		display: none;
	}

	/* 탭 컨텐츠 스타일 */
	.tab_content {
		display: none;
		padding: 40px 40px 0;
		clear: both;
		width: 1200px;
		overflow: hidden;
	}
	
	
	/* 선택 된 탭 콘텐츠를 표시 */
	#all:checked ~ #all_content,
	#programming:checked ~ #programming_content,
	#design:checked ~ #design_content {
		display: block;
	}
	
	/* 선택된 탭 스타일 */
	.tabs input:checked + .tab_item {
		background-color: #333333;
		color: #fff;
	}
	
	.qnaWriteBtn {
		width: 170px;
		height: 50px;
		background-color: black;
		color: white;
		text-align: center;
		font-size: 13pt;
		font-weight: bold;
		border-style: solid;
		margin-left: 950px;
	}
	.qnaWriteBtn a{
		color: white;
		font-size: 15pt;
		font-weight: bold;
		position: relative;
		top: 10px;
	}
	#terms1 {
		width: 1200px;
		margin: 10px auto;
		height: fit-content;
	}
	#terms1 table {
		width: 1150px;
		margin-top: 20px;
		margin-bottom: 20px;
		position:relative;
		right: 20px;
		border-collapse: collapse;
	}
	#terms1 table input{
		width: 1000px;
		height: 40px;
		margin-bottom: 10px;
	}
	#qText {
		width: 1000px;
		height: 200px;
		resize: none;
	}
	#terms1 table font {
		font-size: 18pt;
		font-weight: bold;
	}
	.tableLine {
		border-bottom: 1px solid #D5D5D5;
		height: 50px;
	}
	#qnaTable {
		margin-top: 50px;
		width: 1200px;
		border-collapse: collapse;
		position: relative;
		right: 50px;
	}
	.qnaTableLine {
		border-bottom: 1px solid #D5D5D5;
		border-top: 1px solid #D5D5D5;
		height: 70px;
	}
	.question_line1 {
		background-color: #F6F6F6;
	}
	.question_line1 #question1 {
		width: 900px;
		heightL fit-content;
		margin: 20px auto;
		padding-bottom: 30px;
		border-style: solid;
		border-width: 0 0 1px 0;
		border-color: #A6A6A6;
	}
	.question_line1 #question1 b:first-of-type{
		font-size: 40px;
		font-family: 'Montserrat', sans-serif;
		color: #747474;
	}
	.question_line1 #question1 b:last-of-type {
		font-size: 15px;
		font-weight: normal;
		margin-left: 50px;
		position: relative;
		bottom: 5px;
	}
	.question_line1 #question2 {
		width: 900px;
		heightL fit-content;
		margin: 20px auto;
		border-color: #A6A6A6;
	}
	.question_line1 #question2 b:first-of-type {
		font-size: 40px;
		font-family: 'Montserrat', sans-serif;
		color: #4641D9;
	}
	.question_line1 #question2 b:last-of-type {
		font-size: 15px;
		font-weight: normal;
		margin-left: 50px;
		position: relative;
		bottom: 5px;
	}
	.question_line2 {
		background-color: #F6F6F6;
	}
	.question_line2 b:first-of-type {
		font-size: 40px;
		font-family: 'Montserrat', sans-serif;
		color: #747474;
	}
	.question_line2 b:last-of-type {
		font-size: 15px;
		font-weight: normal;
		margin-left: 50px;
		position: relative;
		bottom: 5px;
	}
	.question_line2 div {
		width: 900px;
		heightL fit-content;
		margin: 20px auto;
		border-color: #A6A6A6;
	}
	#answer1 {
		width: 100px;
		height: 30px;
		background-color: #A6A6A6;
		color: white;
		font-weight: bold;
		border-radius: 15px;
		padding-top: 5px;
	}
	#answer2 {
		width: 100px;
		height: 30px;
		background-color: #123478;
		color: white;
		font-weight: bold;
		border-radius: 15px;
		padding-top: 5px;
	}
	
	.btn:first-of-type {
		float: left;
		width: 150px;
		height: 45px;
		margin-left: 20px;
		background-color: white;
		border-color: #D5D5D5; 
	}
	.btn:last-of-type {
		width: 150px;
		height: 45px;
		margin-left: 20px;
		color: white;
		background-color: #003399;
		border-style: solid;
		border-color: #003399;
	}
	#pageList {
		margin: 20px auto;
		width: 500px;
		text-align: center;
	}
	#shopping_cart {
		position: absolute;
		top: 30px;
		right: 350px;
	} 
	#dialog-message {
		text-align: center;
		font-size: 16pt;
		font-weight: bold;
		line-height: 40pt;
		margin-top: 30px;
	}
	#dialog-message img {
		float: right;
	}
	#dialog-message input {
		width: 210px;
		height: 60px;
		margin-top: 40px;
		border-style: none;
		color: white;
		font-weight: bold;
		font-size: 13pt;
	}
	#dialog-message input:first-of-type {
		background-color: #747474;
	}
	#dialog-message input:last-of-type {
		background-color: black;
		margin-left: 20px;
	}
	
	/* 평점 */
	.container {
		width: 400px;
		padding: 20px;
		/* overflow: hidden; */
		float: left;
	}
	.horizontal {
		position: relative;
		right: 20px;
	}
	.horizontal .progress-bar {
		float: left;
		height: 5px;
		width: 100%;
		padding: 13px 0;
	}
	
	.horizontal .progress-track {
		position: relative;
		width: 100%;
		height: 10px;
	}
	
	.horizontal .progress-fill {
		position: relative;
		background-color: black;
		font-weight: bold;
		color: #747474;
		height: 10px;
		width: 50%;
		font-family: "Lato","Verdana",sans-serif;
		font-size: 12px;
	}
	.horizontal .progress-fill span {
		position: relative;
		left: 400px;
	}
	
	.rounded .progress-track,
	.rounded .progress-fill {
		border-radius: 3px;
		box-shadow: inset 0 0 35px rgba(0,0,0,0.2);
	}
</style>
</head>

<% 
	String mb_id = (String)session.getAttribute("mb_id");
	String reviewNo=request.getParameter("reviewNo");
%>
<script>
	function review() {
		var mb_id = '<%= (String)session.getAttribute("mb_id") %>';
		if (mb_id == "null") {
			alert("로그인이 필요합니다.");
			location.href="../overlap/login.jsp";
		} else {
			var popupX = Math.ceil(( window.screen.width - 600 )/2);
			var popupY = Math.ceil(( window.screen.height - 700 )/2); 
			window.open("write.jsp?itemCode="+<%= itemCode %>,"popup",'width=600, height=700, left= '+popupX+', top= '+popupY+"'"); 
		}
	}
	
	function buy() {
		var mb_id = '<%= (String)session.getAttribute("mb_id") %>';
		var select =  document.getElementById('option').html;
		
		var count =  document.getElementById('result').innerHTML;
		var option = document.getElementById('option').innerHTML;
		
		var select = document.getElementById('option').innerText;
		
		if (mb_id == "null") {
			alert("로그인이 필요합니다.");
			location.href="../overlap/login.jsp";
		} else if (select == "선택해 주세요.") {
			alert("옵션을 선택해 주세요.");
		} else {
			location.href="itemOrder.dutyfree?command=buy&itemCode=<%= article.getItemCode()%>&mb_id=<%= mb_id%>&count="+count+"&option="+option;
		}	
	}
	
	//쇼핑백
	function cart() {
		var mb_id = '<%= (String)session.getAttribute("mb_id") %>';
		var select =  document.getElementById('option').html;
		
		var count =  document.getElementById('result').innerHTML;
		var option = document.getElementById('option').innerHTML;
		
		var select = document.getElementById('option').innerText;
		if (mb_id == "null") {
			alert("로그인이 필요합니다.");
			location.href="../overlap/login.jsp";
		} else if (select == "선택해 주세요." || select == "") {
			alert("옵션을 선택해 주세요.");
		} else {
			/* $("#dialog-message").dialog().parents(".ui-dialog").find(".ui-dialog-titlebar").remove();
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
			alert("선택하신 상품이 쇼핑백에 담겼습니다.");
			location.href = "itemCart.dutyfree?command=cart&itemCode=<%= article.getItemCode()%>&mb_id=<%= mb_id%>&count="+count+"&option="+option;
			
		}
	}
	
	function cart_go() {
		var mb_id = '<%= (String)session.getAttribute("mb_id") %>';
		var select =  document.getElementById('option').html;
		var count =  document.getElementById('result').innerHTML;
		var option = document.getElementById('option').innerHTML;

		location.href = "itemCart.dutyfree?command=cart&itemCode=<%= article.getItemCode()%>&mb_id=<%= mb_id%>&count="+count+"&option="+option;	
	}
	
	function qna() {
		var mb_id = '<%= (String)session.getAttribute("mb_id") %>';
		if (mb_id == "null") {
			alert("로그인이 필요합니다.");
			location.href="../overlap/login.jsp";
		}
	}
	
	function qnaWrite() {
		var mb_id = '<%= (String)session.getAttribute("mb_id") %>';
		if (mb_id == "null") {
			alert("로그인이 필요합니다.");
			location.href="../overlap/login.jsp";
		}
	}

	function del(num) {
		var popupX = Math.ceil(( window.screen.width - 300 )/2);
		var popupY = Math.ceil(( window.screen.height - 120 )/2); 
		window.open("delete01.jsp?reviewNo="+num,"popup",'width=300, height=120, left= '+popupX+', top= '+popupY+"'");
		
	}
	
	function update(num) {

		var popupX = Math.ceil(( window.screen.width - 600 )/2);
		var popupY = Math.ceil(( window.screen.height - 750 )/2); 
		window.open("update01.jsp?reviewNo="+num,"popup",'width=600, height=750, left= '+popupX+', top= '+popupY+"'"); 
	}
	
	 
	function doDisplay1(){
        var con = document.getElementById("terms1"); 	
        if(con.style.display=='none'){ 	
            con.style.display = 'block'; 	
        }else{ 		
            con.style.display = 'none'; 	
        } 
    } 

	function qnaDisplay(){
        var con = document.getElementsByName("qna_display1");
        con.style.display = 'block';
      /*  if(con.style.display=='none'){ 	
            con.style.display = 'block'; 	
        }else{ 		
            con.style.display = 'none'; 	
        } */
    } 
	
	//옵션 수량
	function count(type)  {
		//결과를 표시할 element
		const resultElement = document.getElementById('result');
		  
		var number = resultElement.innerText;
		  
		// 더하기/빼기
		if(type === 'plus') {
			number = parseInt(number) + 1;
		} else if(type === 'minus' && number>0)  { 
			number = parseInt(number) - 1;
		}
		resultElement.innerText = number;
	}
 	
	

	
</script>
<script>
	$(document).ready(function() {
		
		$('#terms1').hide();
		
		$('.qna_display1').hide();
		$('.qna_display2').hide();
		
		
		$(".dialog_close").click(function(){
			$('#dialog-message').dialog('close');
		
		});
		
		
		$('.horizontal .progress-fill span').each(function(){
			var percent = $(this).html();
			$(this).parent().css('width', percent);
		});


		$('.vertical .progress-fill span').each(function(){
			var percent = $(this).html();
			var pTop = 100 - ( percent.slice(0, percent.length - 1) ) + "%";
			$(this).parent().css({
				'height' : percent,
				'top' : pTop
			});
		});
		
		
		$('#qText').on('keyup', function() {
			 $('.textLength').html($(this).val().length+" / 250자");
			 if ($(this).val().length > 250) {
				 alert("글자 수가 초과되었습니다.");
				 $(this).val($(this).val().substring(0, 250));
				 $('.textLength').html($(this).val().length+" / 250자");
			 }	
		});
		
        //옵션 선택
        $('.option_wr1').hide();
        <% double discount = (double)article.getDiscount()/(double)100; %>
        $('#select').on('change',function() {
	        document.getElementById('option').innerText = this.value;  
	        var total1 = <%= article.getDiscountWon() %>;
	        var total2 = <%= article.getItemDollar()*(1-discount) %>;
	        
	        if (this.value == "선택해 주세요.") {
	        	 $('.option_wr1').hide();
	        } else {
	        	 $('.option_wr1').show();
	        	 document.getElementById('total1').innerText = "("+total1.toLocaleString()+"원)";
	         	 document.getElementById('total2').innerText = "$"+total2.toFixed(1);
	        }	
        });

      	//옵션 선택
        $('#optionSel input[type=button]').on('click',function() {
        	var result = document.getElementById('result');
    		var dollar = <%= article.getItemDollar()*(1-discount) %>;
			
        	var total1 = result.innerHTML*<%= article.getDiscountWon() %>;
        	var total2 = result.innerHTML*dollar;
        	document.getElementById('total1').innerText = "("+total1.toLocaleString()+"원)";
        	document.getElementById('total2').innerText = "$"+total2.toFixed(1);
        });
       	
      	//옵션 딛기
        $('#option_close').on('click',function() {
        	document.getElementById('option').innerText = this.value;
        	document.getElementById('total1').innerText = "(0원)";
        	document.getElementById('total2').innerText = "$ 0";
        
        	$('.option_wr1').hide();
        });
        
        //이미지 클릭
        $('#img > img').on('click',function() {
        	var is = $(this).attr('src');
        	var imgSrc = "<img src='"+is+"'>";
			$('#thumbnail').html(imgSrc);
			$('#thumbnail').show();
        }); 
        
        var mb_id;
        var id;
        $('#qnaTable').on('click', 'tr', function() {
        	mb_id = '<%= (String)session.getAttribute("mb_id") %>';
        	id = $(this).find("td:eq(2)").text();
        });

        $('#qnaTable a').on('click', function() {
        	var currentRow = $(this).closest('tr');
        	var detail = currentRow.next('tr');
  	
        	if (mb_id == id) {
        		if(detail.is(":visible")) {
            		detail.hide();
            	} else {
            		detail.show();
            	}
        	} else {
        		detail.hide();
        		alert("비밀글 입니다.");
        	}
        });
        
        //찜하기
		<% if (wishArticle == null) { %>
			$('#like_on').hide();
		<% } else { %>
			$('#like_on').show();
		<% } %>
  	 	
        var mb_id = '<%= (String)session.getAttribute("mb_id") %>';
    	var like_off = document.getElementById('like_off');
    	var like_on = document.getElementById('like_on');
        $('#like_off').on('click', function() {
        	if (mb_id == "null") {
    			alert("로그인이 필요합니다.");
    			location.href="../overlap/login.jsp";
    		} else {
    			$.ajax({
           	    	url : "itemWish.dutyfree?command=itemWish&itemCode=<%= article.getItemCode()%>" ,
           	   		dataType : "html" ,
           	    	success:function(){
           	    		like_on.style.display = 'block';
           	    		alert("찜 등록")
           	      	}, 
    	       	    error : function(){
    	       	        alert("fail");
    	       	    }
           	  	});
    		}
        });
        $('#like_on').on('click', function() {
        	$.ajax({
       	    	url : "itemWish_del.dutyfree?command=itemWish_del&itemCode=<%= article.getItemCode()%>" ,
       	   		dataType : "html" ,
       	    	success:function(){
       	    		like_off.style.display = 'block';
       	    		alert("찜 삭제")
       	      	}, 
	       	    error : function(){
	       	        alert("fail");
	       	    }
       	  	});
        	$('#like_on').hide();
        });
	});
</script>
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
				<input type="text" name="keyword">
				<input type="submit" value="" onclick="javascript: form.action='search.shop';" class="searchIcon">
			</div>
			
			<div id="sort">
				<p class="sort1"><a href="itemMain.jsp"><img src="../img/dutyfree/home.png" width="20px" height="20px">	<</a></p>
				<p class="sort1"><a href="itemList.shop?category=<%=article.getBigCategory()%>"><%=article.getBigCategory() %> <</a></p>
				<p class="sort1"><a href="itemList.shop?category=<%=article.getSmCategory()%>"><%=article.getSmCategory() %> </a></p>
			</div>
		</nav>
		<section>
			<div id="detail1">
				<div id="photo">
					<p id="thumbnail"><img src="<%=imgArticle.getItemImg1() %>" width="200px" height="200px"></p>
					<p id="img">
						<% if (imgArticle.getItemImg2() == null) { %>
							<img src="<%=imgArticle.getItemImg1() %>" width="146px" height="150px">
						<% } else if (imgArticle.getItemImg3() == null) { %>
							<img src="<%=imgArticle.getItemImg1() %>" width="146px" height="150px">
					    	<img src="<%=imgArticle.getItemImg2() %>" width="146px" height="150px">
					    <% } else if (imgArticle.getItemImg4() == null){ %>
					    	<img src="<%=imgArticle.getItemImg1() %>" width="146px" height="150px">
					    	<img src="<%=imgArticle.getItemImg2() %>" width="146px" height="150px">
					    	<img src="<%=imgArticle.getItemImg3() %>" width="146px" height="150px">
					    <% } else { %>
					    	<img src="<%=imgArticle.getItemImg1() %>" width="146px" height="150px">
					    	<img src="<%=imgArticle.getItemImg2() %>" width="146px" height="150px">
					    	<img src="<%=imgArticle.getItemImg3() %>" width="146px" height="150px">
					    	<img src="<%=imgArticle.getItemImg4() %>" width="146px" height="150px">
					    <% } %>
					</p>
				</div>
				<div id="select_wr">
					<p class="brand"><%=article.getBrandName() %></p>
					<p class="brand"><%=article.getItemName() %></p>
					<table cellpadding="15" align="center">
						<tr>
							<td>정상가</td>
							<td style="color: #8C8C8C; text-decoration: line-through;">$<%= article.getItemDollar() %>&nbsp(<fmt:formatNumber value="<%= article.getItemWon() %>" groupingUsed="true" />원)</td>
						</tr>
						<tr class="tableLine">
							<td>회원가</td>
							<td>
								<font>$<fmt:formatNumber value='<%=article.getItemDollar()*(1-discount) %>' pattern='.0' /></font>
								&nbsp(<fmt:formatNumber value='<%=article.getDiscountWon() %>' groupingUsed="true" />원)
								<span><%= article.getDiscount() %>% off</span>
							</td>
						</tr>
						<tr class="tableLine">
							<td>상품코드</td>
							<td><%=article.getItemCode() %></td>
						</tr>
						<tr class="tableLine">
							<td><%=opArticle.getOptionName() %></td>
							<td><select id="select" name="suntack" onchange="select(itemDetail.suntack)">
									<option value="선택해 주세요." selected>선택해 주세요.</option>
									<% if(opArticle.getOption2() == null) { %>
										<option value="<%=opArticle.getOption1() %>"><%=opArticle.getOption1() %></option>
									<% } 
									else if (opArticle.getOption3() == null) {%>
										<option value="<%=opArticle.getOption1() %>"><%=opArticle.getOption1() %></option>
							    		<option value="<%=opArticle.getOption2() %>"><%=opArticle.getOption2() %></option>
							    	<% }
									else if (opArticle.getOption4() == null) {%>
										<option value="<%=opArticle.getOption1() %>"><%=opArticle.getOption1() %></option>
								    	<option value="<%=opArticle.getOption2() %>"><%=opArticle.getOption2() %></option>
								    	<option value="<%=opArticle.getOption3() %>"><%=opArticle.getOption3() %></option>
								    <% } 
									else if (opArticle.getOption5() == null) {%>
										<option value="<%=opArticle.getOption1() %>"><%=opArticle.getOption1() %></option>
								    	<option value="<%=opArticle.getOption2() %>"><%=opArticle.getOption2() %></option>
								    	<option value="<%=opArticle.getOption3() %>"><%=opArticle.getOption3() %></option>
								    	<option value="<%=opArticle.getOption4() %>"><%=opArticle.getOption4() %></option>
							   		<% }
									else if (opArticle.getOption5() != null) {%>
										<option value="<%=opArticle.getOption1() %>"><%=opArticle.getOption1() %></option>
								    	<option value="<%=opArticle.getOption2() %>"><%=opArticle.getOption2() %></option>
								    	<option value="<%=opArticle.getOption3() %>"><%=opArticle.getOption3() %></option>
								    	<option value="<%=opArticle.getOption4() %>"><%=opArticle.getOption4() %></option>
								    	<option value="<%=opArticle.getOption5() %>"><%=opArticle.getOption5() %></option>
							   		<% }%>
							    </select>
							</td>
						</tr>
					</table>
					<div class="option_wr1">
						<div><%=article.getItemName() %></div>
						<div><img src="../img/dutyfree/x_icon.png" width="20px" height="20px" id="option_close"></div>
						<div id="option"></div>
						<div id="optionSel">
							<input type='button' onclick='count("minus")' value='-'/>
							<input type='button' onclick='count("plus")' value='+'/>
							<div id='result'>1</div>
						</div>
					</div>
					<div class="option_wr2">
						<div><b>상품금액합계</b><b id="total1">(0원)</b><b id="total2">$0</b></div>
					</div>
					<input type="button" value="BUY NOW" class="buy" onclick="buy()">
					<input type="button" value="SHOPPING BAG" class="cart" onclick="cart()">
					<button id="present"><img src="../img/dutyfree/present.png" width="35px" height="35px"></button>
					<div class="like">
		
						<div id="like_off" onclick="like_off()" ><img src="../img/dutyfree/heart.png" width="30px" height="30px"></div>
						<div id="like_on" onclick="like_on()"><img src="../img/dutyfree/heart3.png" width="35px" height="35px"></div>
					
					</div> 
				</div>
			</div>
			<div id="dialog-message" style='display:none'>
			  	<img src="../img/dutyfree/x_icon.png" width="30px" height="30px" class="dialog_close"></br>
				<span>선택하신 상품이</span></br>
				<span>SHOPPING BAG에 추가 되었습니다.</span></br>
				<input type="button" value="쇼핑 계속하기" class="dialog_close">
				<input type="button" value="쇼핑백 확인하기" onclick="cart_go()">
			</div>
			</section>
			<div id="tab_wr">
				<div class="tabs">
				    <input id="all" type="radio" name="tab_item" checked>
				    <label class="tab_item" for="all">상품설명</label>
				    <input id="programming" type="radio" name="tab_item">
				    <label class="tab_item" for="programming">상품평 <%= "("+totalReArticleList.size()+")" %></label>
				    <input id="design" type="radio" name="tab_item">
				    <label class="tab_item" for="design">Q&A <%= "("+totalQnaArticleList.size()+")" %></label>
				    
				    <!-- tab1 내용 -->
				    <div class="tab_content" id="all_content">
				        <div id="detail2">
							<img src="<%=article.getItemDetail() %>" >
						</div>
					</div>
					
				    <!-- tab2 내용 -->
				    <div class="tab_content" id="programming_content">
						<div id="review1">	
							<div id="rate1">
								<%	
									int sum = 0;
									double avg = 0;
									double count1 = 0;
									double count2 = 0;
									double count3 = 0;
									double count4 = 0;
									double count5 = 0;
				    				String star0 = "<img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'>";
									String star1 = "<img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'>";
									String star2 = "<img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'>";
									String star3 = "<img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'>";
									String star4 = "<img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'>";
									String star5 = "<img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'>";
									
									for(int i = 0; i<reArticleList.size(); i++) {
										sum += reArticleList.get(i).getReRate();
										avg = (double)sum/(double)reArticleList.size(); 
										
										if (reArticleList.get(i).getReRate() == 1) {
											count1 ++;
										}
										if (reArticleList.get(i).getReRate() == 2) {
											count2 ++;
										}
										if (reArticleList.get(i).getReRate() == 3) {
											count3 ++;
										}
										if (reArticleList.get(i).getReRate() == 4) {
											count4 ++;
										}
										if (reArticleList.get(i).getReRate() == 5) {
											count5 ++;
										}
										
									}
								%>
								
								<p>
									<% if (avg == 0) { %>
										0/5.0
									<% } else { %>
										<fmt:formatNumber value='<%= avg %>' pattern=".0" />/5.0
									<% } %>
								</p>
								<p>
									<%
										if (avg == 5.0) {
											out.println(star5);	
										} else if (avg < 5 && avg >= 4) {
											out.println(star4);	
										} else if (avg < 4 && avg >= 3) {
											out.println(star3);
										} else if (avg < 3 && avg >= 2) {
											out.println(star2);
										} else if (avg < 2 && avg >= 1) {
											out.println(star1);
										} else {
											out.println(star0);
										}
									%>
								</p>
								<input type="button" class="reviewBtn1" value="상품 리뷰 작성하기" onclick="review()">		
								
							</div>
							<div id="rate2">
								<div>
									<ul>
										<li>아주 좋아요</li>
										<li>맘에 들어요</li>
										<li>보통이에요</li>
										<li>그냥 그래요</li>
										<li>별로에요</li>		
									</ul>
								</div>
								<div class="container horizontal rounded">
									<div class="progress-bar horizontal">
									    <div class="progress-track">
									      <div class="progress-fill">
									        <span><fmt:formatNumber value='<%= count5/totalReArticleList.size()*100 %>' pattern='0' />%</span>
									      </div>
									    </div>
								  	</div>
								    <div class="progress-bar horizontal">
									    <div class="progress-track">
									      <div class="progress-fill">
									        <span><fmt:formatNumber value='<%= count4/totalReArticleList.size()*100 %>' pattern='0' />%</span>
									      </div>
									    </div>
									</div>							
								    <div class="progress-bar horizontal">
									    <div class="progress-track">
									    	<div class="progress-fill">
										        <span><fmt:formatNumber value='<%= count3/totalReArticleList.size()*100 %>' pattern='0' />%</span>
										    </div>
									    </div>
									</div>		
								  	<div class="progress-bar horizontal">
								    	<div class="progress-track">
								      		<div class="progress-fill">
								       			<span><fmt:formatNumber value='<%= count2/totalReArticleList.size()*100 %>' pattern='0' />%</span>
								     		</div>
								   		</div>
								  	</div>	
								  	<div class="progress-bar horizontal">
								    	<div class="progress-track">
								      		<div class="progress-fill">
								        		<span><fmt:formatNumber value='<%= count1/totalReArticleList.size()*100 %>' pattern='0' />%</span>
										    </div>
										</div>
								    </div>
								</div>
							</div>
						</div>
						<div id="detailReview1">	
							<table id="reviewTable">
				        	<% if (reArticleList.size() == 0) { %>
				        		<div id='empty1'><p>리뷰가 없습니다.</p><p>리뷰를 작성해보세요</p><input type='button' class='reviewBtn2' value='상품 리뷰 작성하기' onclick='review()'></div>
				        	<% } %>
				        	<% if  (reArticleList == null && listCount == 0) {%>
				        	<% } else {
								for(int i=0; i<reArticleList.size(); i++){	
									String a;
									String star;

									if(reArticleList.get(i).getReRate() == 1){
										star = star1;
									} else if(reArticleList.get(i).getReRate() == 2){
										star = star2;
									} else if(reArticleList.get(i).getReRate() == 3){
										star = star3;
									} else if(reArticleList.get(i).getReRate() == 4){
										star = star4;
									}  else if(reArticleList.get(i).getReRate() == 5){
										star = star5;
									} else {
										star = "";
									}	
									out.println("<tr class='tableLine' height='30'><td><div><b>"+reArticleList.get(i).getMb_id()+"</b>");	
												
									if (mb_id == null || !mb_id.equals(reArticleList.get(i).getMb_id())) {
										
									} else {
										a = "<input type='button' value='삭제' class='update' onclick='del("+reArticleList.get(i).getReviewNo()+")'><input type='button' value='수정' class='update' onclick='update("+reArticleList.get(i).getReviewNo()+")'></div><div id='reviewRate'>";
										out.println(a);
									}
									out.println("<p>"+star+"<b class='reDate'>"+reArticleList.get(i).getReDate()+"</b></p></div><div id='text'>"+reArticleList.get(i).getReText()+"</div>");
									if (reArticleList.get(i).getRePhoto1()==null || reArticleList.get(i).getRePhoto2()==null || reArticleList.get(i).getRePhoto3()==null) {
										out.println("<div class='recom'><b>이 리뷰가 도움이 돼요!</b><b><img src='../img/dutyfree/finger1.png' width='15px' height='15px'></b></div></td></tr>");	
									} else {
										out.println("<div id='photo'>"+reArticleList.get(i).getRePhoto1()+reArticleList.get(i).getRePhoto2()+reArticleList.get(i).getRePhoto3()+
											"</div><div class='recom'><b>이 리뷰가 도움이 돼요!</b><b><img src='../img/dutyfree/finger1.png' width='15px' height='15px'></b></div></td></tr>");
									}
								} 
								%> 
							</table>
							<section id="pageList">
									<%if (re_nowPage<=1) { %>
										<&nbsp;
									<%}else{ %>
									<a href="itemDetail.shop?page=<%=re_nowPage-1 %>&itemCode=<%=article.getItemCode()%>"> < </a>&nbsp;
									<%} %>
									
									<%for (int b = re_startPage; b<=re_endPage; b++){
										if (b==re_nowPage) {%>
										<%=b %>
										<%} else { %>
										<a href="itemDetail.shop?page=<%=b %>&itemCode=<%=article.getItemCode()%>"><%=b %>
										</a>&nbsp;
										<% } %>
									<%} %>
									<%if (re_nowPage>=re_maxPage) { %>
										>
									<%} %>
							</section>
							<% } %>
						</div> 
						<div id="list">
							
						</div>
					</div>
					
					<!-- tab3 내용 -->
					<div class="tab_content" id="design_content">
						<div class='qnaWriteBtn' onclick="qna()"><a href="javascript:doDisplay1();" >상품문의</a></div>
					    <div id="terms1">
				    		<table celpadding="10px">
				    			<tr>
				    				<td width="200px" align="center">제목</td>
				    				<td><input type="text" name="qsubject"></td>
				    			</tr>
				    			<tr>
				    				<td width="200px" align="center">내용</td>
				    				<td>
				    					<textarea name="question" placeholder="최소 10자 이상 입력해주세요." id="qText"></textarea>
				    					<div class="textLength">0 / 250</div>
				    				</td>
				    			</tr>
				    		</table>
				    		<div>
								<input type="button" value="취소" class="btn" onclick="close()">
								<input type="submit" value="등록" class="btn" onclick="javascript: form.action='qnaInsert.jsp';"​>
							</div>
				    	</div>
				        <table id="qnaTable" cellpadding="10px">
				        	<% if (qnaArticleList.size() == 0) { %>
				        		<section><div id='empty2'><p>아직 등록된 Q&A가 없습니다.</p></div></section>
				        	<% } %>
				        	<% if  (qnaArticleList == null && listCount == 0) {%>
				        		<section><div id='empty2'><p>아직 등록된 Q&A가 없습니다.</p></div></section>
				        	<% } else {
								/* if(qnaArticleList != null && listCount > 0) { */
								for(int i=0; i<qnaArticleList.size(); i++){	
							%>
								<tr class="qnaTableLine">
									<td width="100" align="center">
										<% if (qnaArticleList.get(i).getQanswer() == null) { %>
										<div id="answer1">답변대기</div>
										<% } else { %>
										<div id="answer2">답변완료</div>
										<% } %>
									</td>
									<td width="400"><a href="javascript:qnaDisplay();" ><%= qnaArticleList.get(i).getQsubject() %></a></td>
									<td width="80" align="center" id="qna_id"><%= qnaArticleList.get(i).getMb_id() %></td>
									<td width="80" align="center"><%= qnaArticleList.get(i).getQupdate() %></td>
								</tr>
									<% if (qnaArticleList.get(i).getQanswer() != null) { %>
									<tr class="qna_display1">
										<td colspan="4" class="question_line1">
											<div id="question1"><b>Q</b><b><%= qnaArticleList.get(i).getQuestion() %></b></div>
											<div id="question2"><b>A</b><b><%= qnaArticleList.get(i).getQanswer() %></b></div>
										</td>
									</tr>
									<% } else {%>
									<tr class="qna_display2">
										<td colspan="4" class="question_line2">
											<div><b>Q</b><b><%= qnaArticleList.get(i).getQuestion() %></b></div>
										</td>
									</tr>
									<% } %>	
								<% } %>
						</table>
						<section id="pageList">
								<%if (nowPage<=1) { %>
									<&nbsp;
								<%}else{ %>
								<a href="itemDetail.shop?page=<%=nowPage-1 %>&itemCode=<%=article.getItemCode()%>"> < </a>&nbsp;
								<%} %>
								
								<%for (int b = startPage; b<=endPage; b++){
									if (b==nowPage) {%>
									<%=b %>
									<%} else { %>
									<a href="itemDetail.shop?page=<%=b %>&itemCode=<%=article.getItemCode()%>"><%=b %>
									</a>&nbsp;
									<% } %>
								<%} %>
								<%if (nowPage>=maxPage) { %>
									>
								<%} %>
						</section>
						<%
					    } %>
						</div>
					</div>
				</div>
		<jsp:include page="../overlap/footer.jsp"/>
	</form>
	
</body>
</html>