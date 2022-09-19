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
<%@ page import="vo.Qna"%>


<%
	Item article = (Item)request.getAttribute("article");
	ItemOption opArticle = (ItemOption)request.getAttribute("opArticle");
	ItemImg imgArticle = (ItemImg)request.getAttribute("imgArticle");
	ArrayList<ItemReview> articleList=(ArrayList<ItemReview>)request.getAttribute("articleList");
	ArrayList<Qna> qnaArticleList = (ArrayList<Qna>)request.getAttribute("qnaArticleList");
	ArrayList<Qna> totalQnaArticleList = (ArrayList<Qna>)request.getAttribute("totalQnaArticleList");

	String itemCode = article.getItemCode();
	session.setAttribute("itemCode", itemCode);
	
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
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
<link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
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
		bottom: 70px;
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
		left: 50px;
		bottom: 40px;
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
		padding: 10px;
		height: 80px;
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
		border-style: none;
		background-color: #EAEAEA;
		margin: 0 auto;
		position: relative;
		right: 40px;
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
	#reviewTable .tableLine div:first-of-type {
		margin-top: 10px;
	}
	#empty {
		width: 1200px;
		height: 500px;
		border-style: solid;
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
		height: 90px;
		padding-left: 25px;
		padding-top: 30px;
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
		height: 75px;
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
	#text{
		width: 1000px;
		height: 200px;
	}
	#terms1 table font {
		font-size: 18pt;
		font-weight: bold;
	}
	.tableLine {
		border-bottom: 1px solid #D5D5D5;
		height: 70px;
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
			var popupY = Math.ceil(( window.screen.height - 750 )/2); 
			window.open("write.jsp?itemCode="+<%= itemCode %>,"popup",'width=600, height=750, left= '+popupX+', top= '+popupY+"'"); 
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
		var popupY = Math.ceil(( window.screen.height - 170 )/2); 
		window.open("delete01.jsp?reviewNo="+num,"popup",'width=300, height=170, left= '+popupX+', top= '+popupY+"'");
		
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
	
	
	function count(type)  {
		  // 결과를 표시할 element
		  const resultElement = document.getElementById('result');
		  
		  // 현재 화면에 표시된 값
		  let number = resultElement.innerText;
		  
		  // 더하기/빼기
		  if(type === 'plus') {
		    number = parseInt(number) + 1;
		  }else if(type === 'minus')  {
		    number = parseInt(number) - 1;
		  }
		  // 결과 출력
		  resultElement.innerText = number;
		}
	
</script>
<script>
	$(document).ready(function() {
		
		$('#terms1').hide();
		
		$('.qna_display1').hide();
		$('.qna_display2').hide();
		
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
        
        //옵션 선택
        $('.option_wr1').hide();
        $('.select').on('change',function() {
        	document.getElementById('option').innerText = this.value;
        	$('.option_wr1').show();
        });
        
      	//옵션 선택
        $('#optionSel input[type=button]').on('click',function() {
        	var result = document.getElementById('result');
        	var price = <%= article.getDiscountWon() %>;
        	/* result *= result.innerText; */
        	/* var total = result.innerHTML*price; */
        	document.getElementById('total1').innerText = "("+result.innerHTML*<%= article.getDiscountWon() %>+"원)";
        	document.getElementById('total2').innerText = "$"+result.innerHTML*<%= article.getDiscountDollar() %>;
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
				<p class="sort1"><a href="itemList.shop?category=<%=article.getBigCategory()%>"><%=article.getBigCategory() %> <</a></p>
				<p class="sort1"><a href="itemList.shop?category=<%=article.getMidCategory()%>"><%=article.getMidCategory() %> <</a></p>
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
					    <% } else if (imgArticle.getItemImg4() == null) { %>
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
				<div id="select">
					<p class="brand"><%=article.getBrandName() %></p>
					<p class="brand"><%=article.getItemName() %></p>
					<table cellpadding="15" align="center">
						<tr>
							<td>정상가</td>
							<td style="color: #8C8C8C; text-decoration: line-through;">$<%=article.getItemDollar() %>&nbsp(<%=article.getItemWon() %>원)</td>
						</tr>
						<tr class="tableLine">
							<td>회원가</td>
							<td><font>$<%=article.getDiscountDollar() %></font>&nbsp(<%=article.getDiscountWon() %>원)10%off</td>
						</tr>
						<tr class="tableLine">
							<td>상품코드</td>
							<td><%=article.getItemCode() %></td>
						</tr>
						<tr class="tableLine">
							<td><%=opArticle.getOptionName() %></td>
							<td><select class="select">
									<option>선택해 주세요.</option>
									<% if(opArticle.getOption2() == null) { %>
										<option><%=opArticle.getOption1() %></option>
									<% } 
									else if (opArticle.getOption3() == null) {%>
										<option><%=opArticle.getOption1() %></option>
							    		<option><%=opArticle.getOption2() %></option>
							    	<% }
									else if (opArticle.getOption4() == null) {%>
										<option><%=opArticle.getOption1() %></option>
								    	<option><%=opArticle.getOption2() %></option>
								    	<option><%=opArticle.getOption3() %></option>
								    <% } 
									else if (opArticle.getOption5() == null) {%>
										<option><%=opArticle.getOption1() %></option>
								    	<option><%=opArticle.getOption2() %></option>
								    	<option><%=opArticle.getOption3() %></option>
								    	<option><%=opArticle.getOption4() %></option>
							   		<% }
									else if (opArticle.getOption5() != null) {%>
										<option><%=opArticle.getOption1() %></option>
								    	<option><%=opArticle.getOption2() %></option>
								    	<option><%=opArticle.getOption3() %></option>
								    	<option><%=opArticle.getOption4() %></option>
								    	<option><%=opArticle.getOption5() %></option>
							   		<% }%>
							    </select>
							</td>
						</tr>
					</table>
					<div class="option_wr1">
						<div><%=article.getItemName() %></div>
						<div id="option"></div>
						<div id="optionSel">
							<input type='button' onclick='count("minus")' value='-'/>
							<input type='button' onclick='count("plus")' value='+'/>
							<div id='result'>0</div>
						</div>
					</div>
					<div class="option_wr2">
						<div><b>상품금액합계</b><b id="total1">(0 원)</b><b id="total2">$0</b></div>
					</div>
					<input type="button" value="BUY NOW" class="buy">
					<input type="button" value="SHOPPING BAG" class="cart">
					<button id="present"><img src="../img/dutyfree/present.png" width="35px" height="35px"></button>
					<div class="like">
						♡
						<!-- <p>like</p> -->
					</div> 
				</div>
			</div>
			<div id="tab_wr">
				<div class="tabs">
				    <input id="all" type="radio" name="tab_item" checked>
				    <label class="tab_item" for="all">상품설명</label>
				    <input id="programming" type="radio" name="tab_item">
				    <label class="tab_item" for="programming">상품평 <%= "("+articleList.size()+")" %></label>
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
									
									String star1 = "<img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'>";
									String star2 = "<img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'>";
									String star3 = "<img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'>";
									String star4 = "<img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'>";
									String star5 = "<img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'>";
									
									for(int i = 0; i<articleList.size(); i++) {
										sum += articleList.get(i).getReRate();
										avg = sum/articleList.size();
									}
								%>
								<p><%= avg%>/5.0</p>
								<p>
									<%
										if (avg == 5.0) {
											out.println(star5);	
										} else if (avg == 4.0) {
											out.println(star4);	
										} else if (avg == 3.0) {
											out.println(star3);
										} else if (avg == 2.0) {
											out.println(star2);
										} else {
											out.println(star1);
										}
									%>
								</p>
								<input type="button" class="reviewBtn1" value="상품 리뷰 작성하기" onclick="review()">				
							</div>
							<div id="rate2">
								<p>평점</p>
								<ul>
									<li>아주 좋아요</li>
									<li>맘에 들어요</li>
									<li>보통이에요</li>
									<li>그냥 그래요</li>
									<li>별로에요</li>		
								</ul>
							</div>
						</div>
						<div id="detailReview1">	
							<table id="reviewTable">
								<%
									String a;
									String star;
									for(int i = 0; i<articleList.size(); i++) {
										if (articleList.size() == 0) {
											out.println("<div id='empty'><p>리뷰가 없습니다.</p><p>리뷰를 작성해보세요</p><input type='button' class='reviewBtn2' value='상품 리뷰 작성하기' onclick='review()'></div>");
										}	
										 if(articleList.get(i).getReRate() == 1){
											star = star1;
										} else if(articleList.get(i).getReRate() == 2){
											star = star2;
										} else if(articleList.get(i).getReRate() == 3){
											star = star3;
										} else if(articleList.get(i).getReRate() == 4){
											star = star4;
										}  else if(articleList.get(i).getReRate() == 5){
											star = star5;
										} else {
											star = "";
										}	
										out.println("<tr class='tableLine'><td><div><b>"+articleList.get(i).getMb_id()+"</b>");	
												
										if (mb_id.equals(articleList.get(i).getMb_id())) {
											a = "<input type='button' value='삭제' class='update' onclick='del("+articleList.get(i).getReviewNo()+")'><input type='button' value='수정' class='update' onclick='update("+articleList.get(i).getReviewNo()+")'></div><div id='reviewRate'>";
											out.println(a);
										}
									out.println("<p>"+star+"<b class='reDate'>"+articleList.get(i).getReDate()+"</b></p></div><div id='text'>"+articleList.get(i).getReText()+"</div>");
										if (articleList.get(i).getRePhoto1()==null || articleList.get(i).getRePhoto2()==null || articleList.get(i).getRePhoto3()==null) {
											out.println("<div class='recom'><b>이 리뷰가 도움이 돼요!</b><b><img src='../img/dutyfree/finger1.png' width='15px' height='15px'></b></div></td></tr>");	
										} else {
											out.println("<div id='photo'>"+articleList.get(i).getRePhoto1()+articleList.get(i).getRePhoto2()+articleList.get(i).getRePhoto3()+
												"</div><div class='recom'><b>이 리뷰가 도움이 돼요!</b><b><img src='../img/dutyfree/finger1.png' width='15px' height='15px'></b></div></td></tr>");
										}
									} 
								%>
							</table>
						</div> 
						<div id="list">
							<ul>
								<li><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">5</a></li>
								<li><a href="#">></a></li>
							</ul>
						</div>
					</div>
					
					<!-- tab3 내용 -->
					<div class="tab_content" id="design_content">
						<div class='qnaWriteBtn'><a href="javascript:doDisplay1();" >상품문의</a></div>
					    <div id="terms1">
				    		<table celpadding="10px">
				    			<tr>
				    				<td width="200px" align="center">제목</td>
				    				<td><input type="text" name="qsubject"></td>
				    			</tr>
				    			<tr>
				    				<td width="200px" align="center">내용</td>
				    				<td><textarea name="question" placeholder="최소 10자 이상 입력해주세요." id="text"></textarea></td>
				    			</tr>
				    		</table>
				    		<div>
								<input type="button" value="취소" class="btn" onclick="close()">
								<input type="submit" value="등록" class="btn" onclick="javascript: form.action='qnaInsert.jsp';"​>
							</div>
				    	</div>
				        <table id="qnaTable" cellpadding="10px">
							<%
							if(qnaArticleList != null && listCount > 0) {
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
									<%-- <td width="400"><div onclick="qna()"><%= qnaArticleList.get(i).getQsubject() %></div></td> --%>
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
								<%if(nowPage<=1){ %>
								<&nbsp;
								<%}else{ %>
								<a href="itemDetail.shop?page=<%=nowPage-1 %>&itemCode=<%=article.getItemCode()%>"> < </a>&nbsp;
								<%} %>
								<%for(int b = startPage; b<=endPage; b++){
									if(b==nowPage){%>
									<%=b %>
									<%}else{ %>
									<a href="itemDetail.shop?page=<%=b %>&itemCode=<%=article.getItemCode()%>"><%=b %>
									</a>&nbsp;
									<%} %>
								<%} %>
								<%if(nowPage>=maxPage){ %>
								>
								<%}else{ %>
								<a href="itemDetail.shop?page=<%=nowPage+1%>&itemCode=<%=article.getItemCode()%>"> > </a>
								<%} %>
						</section>
						<%
					    } else {
						%> <section id="emptyArea">등록된 글이 없습니다.</section>
						<% } %>
						</div>
					</div>
				</div>
			</section>
			<jsp:include page="../overlap/footer.jsp"/>
	</form>

</body>
</html>