<%@page import="Item.Review"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Item.Review" %>
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
		height: 500px;
		margin: 0 auto;
	}
	#photo img{
		float: left;
		width: 590px;
		height: 500px;
		/*border-style: solid;
		border-color: #EAEAEA;*/
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
	#select input[type=button]:first-of-type {
		float: left;
		width: 212px;
		height: 65px;
		background-color: black;
		margin-top: 15px;
		color: white;
	}
	#select input[type=button]:last-of-type {
		float: left;
		width: 212px;
		height: 65px;
		border-style: none;
		background-color: #A6A6A6;
		margin-top: 15px;
		margin-left: 12px;
		color: white;
	}
	#select button {
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
	}
	.brand {
		display: block;
		line-height: 10pt;
	}
	.brand:nth-of-type(2n) {
		font-size: 18pt;
		font-weight: bold;
	}
	#detail2 {
		width: 1200px;
		height: 800px;
		border-style: solid;
		border-left: 0;
		border-right: 0;
		margin: 20px auto;
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
	#datailReview1 {
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

</style>
</head>
<jsp:useBean id="dbconnect" class="Item.DBconnect"></jsp:useBean>
<% 
	String mb_id = (String)session.getAttribute("mb_id");
	String reviewNo=request.getParameter("reviewNo");
	ArrayList<Review> arr = dbconnect.db();
%>
<script>
	function review() {
		var mb_id = '<%= (String)session.getAttribute("mb_id") %>';
		
		if (mb_id == "null") {
			alert("로그인이 필요합니다.");
			location.href="../overlap/login.jsp";
		} else {
			window.open("write.jsp","popup","width=600, height=750"); 
		}
	}
	
	function del(num) {
		window.open("delete01.jsp?reviewNo="+num,"popup","width=300, height=200");
		
	}
	
	function update(num) {
		
		window.open("update01.jsp?reviewNo="+num,"popup","width=600, height=750");
	}
</script>
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
		
        
	});
</script>
<body>
	<form name="item">
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
				<p class="sort1">대분류 <</p>
				<p class="sort1">중분류 <</p>
				<p class="sort1">소분류</p>
			</div>
		</nav>
		<section>
			<div id="detail1">
				<div id="photo">
					<p><img src="../img/dutyfree/neck.png" width="200px" height="200px"></p>
				</div>
				<div id="select">
					<p class="brand">DIDIER DUBOT</p>
					<p class="brand">디디에두보 미스두 목걸이</p>
					<table cellpadding="15" align="center">
						<tr>
							<td>정상가</td>
							<td style="color: #BDBDBD; text-decoration: line-through;">$319(426,471원)</td>
						</tr>
						<tr class="tableLine">
							<td>회원가</td>
							<td><font>$287.1</font>(383,823원) 10%off</td>
						</tr>
						<tr>
							<td>구매혜택</td>
							<td>결제혜택</td>
						</tr>
						<tr class="tableLine">
							<td>상품코드</td>
							<td>레퍼런스 코드:AR1909 / 상품코드:2067234671</td>
						</tr>
						<tr class="tableLine">
							<td>수량</td>
							<td>1개</td>
						</tr>
						<tr class="tableLine">
							<td>총 상품금액(수량)</td>
							<td>0 (0개)</td>
						</tr>
					</table>
					<input type="button" value="BUY NOW">
					<input type="button" value="SHOPPING BAG">
					<button><img src="../img/dutyfree/present.png" width="35px" height="35px"></button>
					<div class="like">
						♡
						<!-- <p>like</p> -->
					</div>
				</div>
			</div>
			<div id="detail2">
				<p>상세설명</p>
			</div>
			<div id="review">
				<h3>REVIEW <%= "("+arr.size()+")" %></h3>
			</div>
			
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
						
						for(int i = 0; i<arr.size(); i++) {
							sum += arr.get(i).getReRate();
							avg = sum/arr.size();
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
					<input type="submit" class="reviewBtn1" value="상품 리뷰 작성하기" onclick="review()">
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
			<div id="datailReview1">
				
				<table id="reviewTable">
					<%
						String a;
						String star;
						if (arr.size() == 0) {
							out.println("<div id='empty'><p>리뷰가 없습니다.</p><p>리뷰를 작성해보세요</p><input type='submit' class='reviewBtn2' value='상품 리뷰 작성하기' onclick='review()'></div>");

						}
						
						for(int i = 0; i<arr.size(); i++) {
							
							if(arr.get(i).getReRate() == 1){
								star = star1;
							} else if(arr.get(i).getReRate() == 2){
								star = star2;
							} else if(arr.get(i).getReRate() == 3){
								star = star3;
							} else if(arr.get(i).getReRate() == 4){
								star = star4;
							}  else if(arr.get(i).getReRate() == 5){
								star = star5;
							} else {
								star = "";
							}	
							out.println("<tr class='tableLine'><td><div><b>"+arr.get(i).getMb_id()+"</b>");
							
							
							if (mb_id.equals(arr.get(i).getMb_id())) {
								a = "<input type='button' value='삭제' class='update' onclick='del("+i+")'><input type='button' value='수정' class='update' onclick='update("+i+")'></div><div id='reviewRate'>";
								out.println(a);
							}
							out.println("<p>"+star+"<b class='reDate'>"+arr.get(i).getReDate()+"</b></p></div><div id='text'>"+arr.get(i).getReText()+"</div><div id='photo'>"+arr.get(i).getRePhoto1()+arr.get(i).getRePhoto2()+arr.get(i).getRePhoto3()+
							"</div><div class='recom'><b>이 리뷰가 도움이 돼요!</b><b><img src='../img/dutyfree/finger1.png' width='15px' height='15px'></b></div></td></tr>");
							String b = arr.get(i).getReviewNo();
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
		</section>
		<jsp:include page="../overlap/footer.jsp"/>
	</form>

</body>
</html>