<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@page import="vo.Travellocal"%> 
<%@page import="vo.Travelatt"%> 
<%@page import="vo.Travelimg"%>  
<%@page import="vo.Travelattandimg"%>
<% 
	Travellocal travellocal=(Travellocal)request.getAttribute("travelocal");
	ArrayList<Travelattandimg> travelatt=(ArrayList<Travelattandimg>)request.getAttribute("travelimg");
%> 
<!DOCTYPE html>
<html>
<head>
<title>local</title>
	<meta charset="utf-8">
	<link href="https://fonts.googleapis.com/css2?family=Cairo&family=Indie+Flower&family=Koulen&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="../css/header_footer.css">
	<link type="text/css" rel="stylesheet" href="../css/responsive-tabs.css" />
    <link type="text/css" rel="stylesheet" href="../css/style.css" />
    <link type="text/css" rel="stylesheet" href="../css/travel_local.css" />
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<style>
		section{
			width:1200px;
			border: 3px #030066 solid;
			border-radius: 5px;
			margin: 20px auto 50px auto;
		}
		.travel:last-of-type {
			position: relative;
			top: 50px;
		}
		.contents1 {
			width: 1060px;
			height: 500px;
			margin:10px auto;
		}
		.contents2 {
			width: 1060px;
			height: 350px;
			margin:0 auto;
			position: relative;
			top: 10px;
		}
		.travellist2 {
			float: left;
			border-style: solid;
			height: 250px;
			box-shadow: 7px 7px 7px #BDBDBD;
			border-width: 2px;
			border-color: #BDBDBD;
			margin-left: 10px;
			position: relative;
			overflow: hidden;
		}
	.travellist2 p {
			padding-top: 15px;
			font-size: 15pt;
			font-weight: bold;
			margin-left: 10px;
			line-height: 5pt;
		}
		.travellist2>img{
			transition: all 0.2s linear;
			width: 250px; 
			height: 250px;
		}
		.travellist2>img:hover{
			transform: scale(1.04);
			overflow: hidden;
		}
		.detail {
			position: relative;
			height: 50px;
			bottom: 74px;
			border-style: 100px;
			background-color:rgba(0,0,0,.6);
			color: white;
		}
		.localmap{
			margin-top: -70px;
			margin-right: 15px;
			width:400px;
			height: 400px;
			float: right;
		}
		.localmap img{
		border: 3px solid #030066;
		width:400px;
		height:400px;
		}
		.localcontent{
			width: 600px;
			height: 330px;
			margin:-15px 0 0 10px;
			padding: 10px;
			font-size: 13pt;
			background-color: rgba(234, 234, 234, 0.4);
			border-radius: 5px;
		}
		.contents1 p{
			font-size: 30pt;
			width: 600px;
			height: 50px;
			margin-left: 15px;
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
		<section>
			<article>
				<div class="contents1">
					<p><%=travellocal.getLocal_name() %></p>
					<div class="localmap"><img src="../img/travel<%=travellocal.getLocal_img()%>"></div>
					<div class="localcontent"><%=travellocal.getLocal_content() %></div>
				</div>
			</article>
			<div class="contents2">
			<h4>주변 관광명소</h4>
					<a href="../travel/Attraction.travel?att=<%=travelatt.get(0).getAtt_name() %>">
						<div class="travellist2">
							<img src="../img/travel<%=travelatt.get(0).getTravel_img1() %>">
							<div class="detail">
								<p><%=travelatt.get(0).getAtt_name() %></p>
								
							</div>
						</div>
					</a>
					<a href="../travel/Attraction.travel?att=<%=travelatt.get(1).getAtt_name() %>">
						<div class="travellist2">
							<img src="../img/travel<%=travelatt.get(1).getTravel_img1()%>">
							<div class="detail">
								<p><%=travelatt.get(1).getAtt_name() %></p>
								
							</div>
						</div>
					</a>
					<a href="../travel/Attraction.travel?att=<%=travelatt.get(2).getAtt_name() %>">
						<div class="travellist2">
							<img src="../img/travel<%=travelatt.get(2).getTravel_img1()%>">
							<div class="detail">
								<p><%=travelatt.get(2).getAtt_name() %></p>
							</div>
						</div>
					</a>
					<a href="../travel/Attraction.travel?att=<%=travelatt.get(3).getAtt_name() %>">
						<div class="travellist2">
							<img src="../img/travel<%=travelatt.get(3).getTravel_img1()%>">
							<div class="detail">
								<p><%=travelatt.get(3).getAtt_name() %></p>
							</div>
						</div>
					</a>
				</div>
				<div class="contents2">
				<h4> 주변 호텔</h4>
					<a href="">
						<div class="travellist2">
							<img src="../img/travel/phuket.jpg">
							<div class="detail">
								<p>푸켓</p>
								
							</div>
						</div>
					</a>
					<a href="">
						<div class="travellist2">
							<img src="../img/travel/guam.jpg">
							<div class="detail">
								<p>괌</p>
								
							</div>
						</div>
					</a>
					<a href="">
						<div class="travellist2">
							<img src="../img/travel/berlin.jpg">
							<div class="detail">
								<p>베를린</p>
							</div>
						</div>
					</a>
					<a href="">
						<div class="travellist2">
							<img src="../img/travel/cebu.jpg">
							<div class="detail">
								<p>세부</p>
							</div>
						</div>
					</a>
				</div>
				<div class="contents2">
				<h4> 주변 음식점</h4>
					<a href="">
						<div class="travellist2">
							<img src="../img/travel/phuket.jpg">
							<div class="detail">
								<p>푸켓</p>
								
							</div>
						</div>
					</a>
					<a href="">
						<div class="travellist2">
							<img src="../img/travel/guam.jpg">
							<div class="detail">
								<p>괌</p>
								
							</div>
						</div>
					</a>
					<a href="">
						<div class="travellist2">
							<img src="../img/travel/berlin.jpg">
							<div class="detail">
								<p>베를린</p>
							</div>
						</div>
					</a>
					<a href="">
						<div class="travellist2">
							<img src="../img/travel/cebu.jpg">
							<div class="detail">
								<p>세부</p>
							</div>
						</div>
					</a>
				</div>
				
		</section>
		<jsp:include page="../overlap/footer.jsp"/>
	</form>
</body>
</html>