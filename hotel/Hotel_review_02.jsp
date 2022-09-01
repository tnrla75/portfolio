<%@page import="portfolio_02.Hotel_review_DB"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*"%>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>호텔 리뷰</title>
	<meta charset="utf-8">
	<link href="https://fonts.googleapis.com/css2?family=Cairo&family=Indie+Flower&family=Koulen&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="../css/style.css" />
	<link rel="stylesheet" type="text/css" href="../css/header_footer.css">
	
    <script src="http://use.fontawesome.com/releases/v6.1.2/js/all.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<% String mb_id=(String)session.getAttribute("mb_id"); // 로그인할때 저장된 값 %>
<script>
	$(document).ready(function() {
		$('#main > li > ul').hide();
		$('.insert').hide();
		
		$('.commonnav1').mouseenter(function(){
 			$('.commonnav1 > ul').slideDown(200);
 			$('.commonnav1 > p').css("border-bottom","solid 5px #CC3D3D");
 			$('.commonnav1 > ul').show();
 		});
 		$('.commonnav1').mouseleave(function(){
 			$('.commonnav1 > ul').slideUp(200);
 			$('.commonnav1 > p').css("border-bottom","solid 5px white");
 		});
 		$('.commonnav2').mouseenter(function(){
 			$('.commonnav2 > ul').slideDown(200);
 			$('.commonnav2 > p').css("border-bottom","solid 5px #CC3D3D");
 			$('.commonnav2 > ul').show();
 		});
 		$('.commonnav2').mouseleave(function(){
 			$('.commonnav2 > ul').slideUp(200);
 			$('.commonnav2 > p').css("border-bottom","solid 5px white");
 		});
 		$('.commonnav3').mouseenter(function(){
 			$('.commonnav3 > ul').slideDown(200);
 			$('.commonnav3 > p').css("border-bottom","solid 5px #CC3D3D");
 			$('.commonnav3 > ul').show();
 		});
 		$('.commonnav3').mouseleave(function(){
 			$('.commonnav3 > ul').slideUp(200);
 			$('.commonnav3 > p').css("border-bottom","solid 5px white");
 		});
 		$('.commonnav4').mouseenter(function(){
 			$('.commonnav4 > ul').slideDown(200);
 			$('.commonnav4 > p').css("border-bottom","solid 5px #CC3D3D");
 			$('.commonnav4 > ul').show();
 		});
 		$('.commonnav4').mouseleave(function(){
 			$('.commonnav4 > ul').slideUp(200);
 			$('.commonnav4 > p').css("border-bottom","solid 5px white");
 		});
 		
	});
 	</script>
<style>
.main_bigbox{
	width:1000px;
	height:1200px;
	border-style: solid;
	margin: 0 auto;
	text-align: center;
}
.main_headbox{
	width:1000px;
	height:80px;
	
}
.main_medlebox{
	width:1000px;
	height:410px;
	border-style: solid;
	margin: 30px auto;
	float: left;
	
	
}
.main_poto_box{
	width:300px;
	height:400px;
	border-style: solid;
	float: left;
}
.main_medle_rigth{
	width:700px;
	height:300px;
	border-style: solid;
	margin: 0 auto;
	float: left;
}
.main_medle_center{
	width:380px;
	height:360px;
	border-style: solid;
	margin: 0 auto;
	text-align: left;
	padding:20px;
	float: left;
}


.reviwbox{
	clear:left;
	width:1000px;
	height:310px;
	border-style: solid;
	margin: 30px auto;
	border-radius: 15px;
}
.reviwbox_left{
	width:200px;
	height:310px;
	border-style: solid;
	float:left;
}
.reviwbox_left_poto{
	width:198px;
	height:120px;
	border-style: solid;
	margin: 0 auto;
}
.poto{
	width:198px;
	height:120px;
	margin: 0 auto;
	border-radius: 15px;
								
}
.reviwbox_left_down{
	width:200px;
	height:190px;
	border-style: solid;
	margin: 0 auto;
	float:left;
}

.reviwbox_left_down_left{
	

	width:60px;
	height:30px;
	border-style: solid;
	padding:5px;
	margin: 0 auto;
	float:left;
}
.reviwbox_left_down_left:focus{
		outline:none;
}
	
.reviwbox_left_down_left_sub{
	clear:left;
	width:60px;
	height:30px;
	padding:5px;
	border-style: solid;
	margin: 0 auto;
	float:left;
}
.reviwbox_left_down_rigth{	
	width:108px;
	height:30px;
	padding:5px;
	border-style: solid;
	margin: 0 auto;
	float:left;
}
.reviwbox_center{
	width:992px;
	height:310px;
	border-style: solid;
	
}
.reviwbox_center_up{
	width:946px;
	height:30px;
	padding:20px;
	font-size:22px;
	border-style: solid;
	
}
.reviwbox_center_down{
	width:992px;
	height:230px;
	border-style: solid;
	text-algin:left;
}

.button{
	width:100px;
	height:70px;
	background-Color:skyblue;
	border-radius:7px
}

.down_box{
	width:1000px;
	height:80px;
	border-style: solid;
	float:left;
}
</style>
<body>
<body>
	<div style="width:100%; height: 150px; box-shadow: 0px 5px 1px 1px #030066; ">
		<div style="width: 1200px; height: 150px; margin: 0 auto; ">
		<header>
			<div id="header">
			<div id="title">
				<a href="indexpage.jsp">
					<header style="width: 250px;height: 250px; z-index: -2;position: relative;">
						<img src="../img/logo/logo1.png">
					</header>
				</a>
			</div>
			<div id="nav">
				<nav>
					<ul id="top">
						
						<li class="commonnav"><a href="../overlap/login.jsp">로그인</a></li>
						
						<li class="commonnav"><a href="signuppage.jsp">회원가입</a></li>
						<li class="commonnav"><a href="#">마이페이지</a></li>
						<li class="commonnav"><a href="#">즐겨찾기</a></li>
						<li class="commonnav"><a href="#">고객센터</a></li>
					</ul>
					<ul id="main">
						
						<li class="commonnav2">
							<p><a class="commonlink" href="flight_main.html">항공</a></p>
							<ul class="list">
								<li><a href="#">최저가 항공권</a></li>
								<li><a href="#">부가 서비스 안내</a></li>
								<li><a href="#">좌석 안내</a></li>
							</ul>
						</li>
						<li class="commonnav3">
							<p><a class="commonlink" href="hotel_main.html">호텔</a></p>
							<ul class="list">
								<li><a href="#">추천 호텔</a></li>
								<li><a href="../hotel/Review_01.jsp">호텔 검색</a></li>
								<li><a href="#">호텔 게시판</a></li>
								<li><a href="#">계절별 할인</a></li>
							</ul>
						</li>
						<li class="commonnav4">
							<p><a class="commonlink" href="dutyfree_main.html">면세점</a></p>
							<ul class="list">
								<li><a href="#">카테고리</a></li>
								<li><a href="#">Best샵</a></li>
								<li><a href="#">세일</a></li>
								<li><a href="#">명품관</a></li>
							</ul>
						</li>
						<li class="commonnav1">
							<p><a class="commonlink" href="../travel/travel_2.html" id="main1">여행</a></p>
							<ul class="list">
								<li><a href="#">지역</a></li>
								<li><a href="#">관광명소</a></li>
								<li><a href="#">맛집</a></li>
								<li><a href="travel_route.jsp">여행루트</a></li>
								<li><a href="#">여행메이트</a></li>
							</ul>
						</li>
					</ul>
				</nav>
			</div>
		</div>
		</header>
	</div>
<jsp:useBean id="members" class="portfolio_02.Java_main"/>
<%
	request.setCharacterEncoding("UTF-8");

	String hotel_review_num=request.getParameter("hotel_review_num");
	
	String hotel_rv_id=request.getParameter("hotel_rv_id");	
	String hotel_rv_content=request.getParameter("hotel_rv_content");
	String hotel_rv_date=request.getParameter("hotel_rv_date");	
	
	String id2=(String)session.getAttribute("mb_id"); // 로그인할때 저장된 값
	
	// out.println(id2+"님이 로그인 중...!!");
	
	
	/* for(int i=0;i<arr.size();i++){
		out.println("<tr>");
			out.println("<td class='number_box' name='hotel_reviw_num'>"+arr.get(i).getHotel_review_num()+"</td>");				
			out.println("<td class='addbox' name='hotel_add'>"+ arr.get(i).getHotel_add()+"</td>");
			out.println("<td class='smallbox' name='hotel_name'>"+ arr.get(i).getHotel_name()+"</td>");
			out.println("<td class='centerbox' name='hotel_rv_title'><a href='Review_02.jsp?getHotel_rv_title="+ arr.get(i).getHotel_rv_title()+"'>"+ arr.get(i).getHotel_rv_title()+"</a></td>");
			out.println("<td class='smallbox' name='id'>"+ arr.get(i).getId()+"</td>");
		out.print("</tr>");
	} */
	
	

	
	%>
	<form action="Hotel_review_01.jsp">
		<section class="main_bigbox">
		
		<input type="hidden" name="hotel_rv_date" value="<%= hotel_rv_date %>"/>
		
		<div>
			<head class="main_headbox">
				<h2>리뷰 상세정보</h2>
			</head>			
			<div class="main_medlebox" >
				<div class="main_poto_box">
					<img src="../img/hotel/hotel01.jpg"   style="width:300px; height:400px;">
				</div>
				<div class="main_medle_center">
					<%
					
					ArrayList<Hotel_review_DB> arr=members.select_02(Integer.parseInt(hotel_review_num));
					
							out.println("<table>");
								out.println("<tr>");
									out.println("<td>호텔 이름 : "+arr.get(0).getHotel_name()+"<br></td>");
								out.println("</tr>");
								out.println("<tr>");
									out.println("<td>호텔 주소 : "+arr.get(0).getHotel_add()+"<br></td>");
								out.println("</tr>");
								out.println("<tr>");
									out.println("<td>호텔 편의시설 : "+arr.get(0).getHotel_add()+"<br></td>");
								out.println("</tr>");
								out.println("<tr>");
									out.println("<td>지도로 보기 버튼 "+arr.get(0).getHotel_add()+"<br></td>");
								out.println("</tr>");
								out.println("<tr>");
								out.println("<td>지도로 보기 버튼 "+arr.get(0).getHotel_rv_content()+"<br></td>");
							out.println("</tr>");
							out.println("</table>");
						
					%>
				</div>
				
			</div>
			
			<div class="reviwbox">
					<div class="reviwbox_left">	
						<div class="reviwbox_left_poto">
							<img src="../img/hotel/hotel01.jpg"  class="poto">
						</div>
						
						<div class="reviwbox_left_down_left"   style="focus:'none';">
						평점 :
						</div>
						<div class="reviwbox_left_down_rigth" readonly >
								<%
									
									
									out.println("<td class='reviwbox_left_down'>"+arr.get(0).getHotel_review_num()+"<br><br></td>");
									
								%>
						</div>
						<div class="reviwbox_left_down_left_sub" readonly style="focus:'none';">
						아이디 :
						</div>
						<div class="reviwbox_left_down_rigth" style="cursor:'none';">
								<%
								
									out.println("<td class='reviwbox_left_down'>"+arr.get(0).getHotel_rv_id()+"<br><br></td>");
							
								%>
						</div>
						<div class="reviwbox_left_down_left_sub">
						날짜 :
						</div>
						<div class="reviwbox_left_down_rigth">
								<%
								
									out.println("<td class='reviwbox_left_down'>"+arr.get(0).getHotel_rv_date()+"<br><br></td>");
								
								%>
						</div>
						<div class="reviwbox_left_down_left_sub">
						날짜 :
						</div>
						<div class="reviwbox_left_down_rigth">
								<%
								
									out.println("<td class='reviwbox_left_down'>"+arr.get(0).getHotel_rv_date()+"<br><br></td>");
									
								
								%>
						</div>
						
						
					</div>
					<div class="reviwbox_center">
						<div class="reviwbox_center_up">					
								<%
								out.println(arr.get(0).getHotel_rv_title());
								
								%>								
						</div>
						<div clss="reviwbox_center_down">		
						<!-- <textarea rows="15" cols="120" > </textarea> insert할때 사용할 코드 -->
							<%								
								out.println(arr.get(0).getHotel_rv_content());
							%>
						</div>
						
					</div>
			</div>
			<div class=main_reviwbox>
				aaaaa
			</div>
			<div class=main_reviwbox>
				aaaaa
			</div>
				
		</div>
		<%session.getAttribute("md_id"); %>
		<div class="down_box">
			<%			
			
				
			 if(arr.get(0).getHotel_rv_id().equals(id2)){
				out.println("<a href=Hotel_rv_update_01.jsp?hotel_review_num="+ hotel_review_num +" name='수정' class='button'>수정</a>");
				
			}else{
				
			} 			
			%>
			
			<%--  <a href=Update_01.jsp?hotel_review_num= <%=hotel_review_num%>  name='수정' class="button">수정</a>			
			<a href=Delete.jsp?hotel_review_num=<%=hotel_review_num%>  name='삭제' class="button">삭제</a>  --%>
			
			<input type="submit" value="돌아가기" class="button">
			<%
			 if(arr.get(0).getHotel_rv_id().equals(id2)){					
					out.println("<a href=Hotel_rv_delete.jsp?hotel_review_num="+ hotel_review_num +" name='삭제' class='button'>삭제</a>");
				}
			%>
		</div>
		</section>
	</form>
	<footer style="top: 350px;">
		<div id="footer" >
			<div class="footerIn">
				<ul>
					<li>회사소개</li>
					<li>회사에 대하여</li>
					<li>기업지배구조</li>
					<li>채용정보</li>
					<li>홍보채널</li>
				</ul>
				<ul>
					<li>고객지원</li>
					<li>공지사항</li>
					<li>자주 묻는 질문</li>
					<li>고객의 말씀</li>
					<li>서비스 센터</li>
				</ul>
				<ul>
					<li>약관 및 규정</li>
					<li>개인정보 처리방침</li>
					<li>이용약관</li>
					<li>고객의 말씀</li>
				</ul>
				<ul>
					<li>기타 서비스</li>
					<li>IR</li>
					<li>파트너제휴 플랫폼</li>
					<li>호텔 등록</li>
					<li>모든호텔</li>
				</ul>

			</div>
		</div>
	</footer>
</body>
</html>