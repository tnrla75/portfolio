<%@page import="vo.Mypage_qna"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.Travel_selectroute"%>

<%
	ArrayList<Travel_selectroute> list = (ArrayList<Travel_selectroute>)request.getAttribute("myroute");
	
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
<script src="http://use.fontawesome.com/releases/v6.1.2/js/all.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
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
		min-height: 850px;
		height: fit-content;
		margin: 10px auto;
		block-size: min-content;
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
	#no_order div {
		width: 400px;
		margin: 30px auto;
		padding: 70px;
		text-align: center;
	}
	#no_order span {
		margin-top: 70px;
	}
	#detail_box {
		margin-top: 50px;
		height: 200px;
		font-weight: bold;
		font-size: 10pt;
		border-radius: 2px;
		box-shadow: rgba(6, 24, 44, 0.15) 0px 0px 0px 2px, rgba(6, 24, 44, 0.20) 0px 4px 6px -1px, rgba(255, 255, 255, 0.08) 0px 1px 0px inset;
	}
	#num {
		margin-left: 190px;
		width: 520px;
		padding-top: 17px;
	}
	#num span:first-of-type {
		margin-left: 40px;
		font-size: 15pt;
		margin-left: 10px;
	}
	#num span:last-of-type {
		color: #8C8C8C;
		margin-left: 10px;
		float: right;
	}

	#detail_box #img {
		float: left;
		margin-top: 15px;
		margin-left: 10px;
		width: 745px;
		font-size: 15pt;
	}
	#detail_box #detail {
		float: left;
		margin-left: 50px;
		line-height: 16pt;
	}
	#detail span:nth-of-type(3) {
		color: #A6A6A6;
		font-size: 9pt;
	}
	#detail span:last-of-type {
		font-size: 11pt;
	}
	#detail_box #img {
		float: left;
		margin-top: 20px;
		margin-left: 30px;
		width: 125px;
	}
	.routedetail{
		width: 510px;
		height: 35px;
		overflow: hidden;
		white-space:nowrap;
		box-shadow: rgba(99,99,99,0.4) 0px 2px 8px 0px;
		border-radius:2px;
		text-overflow: ellipsis;
		font-size: 10pt;	
		line-height: 35px;
		padding: 5px;
	}
	
	.routedetail> div{
		float: left;
	}
	.localname{
		float: left;
		width: 250px;
		height: 40px;
		margin-top: 15px;
		margin-left: 50px;
		font-size: 13pt;
	}
	   .map {
	  height: 120px;
	  width: 120px;
	}
	.count{
		margin-top: 10px;
		width: 150px;
		height: 25px;
		color: #8C8C8C;
		font-size:10pt;
	}
	.date{
		width: 100px;
		height: 25px;
		float:right;
		margin-top:-25px;
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
					<h2>내가 쓴 여행루트</h2>
				</div>
				<div id="wrap">
					<% if(list.size() == 0) { %>
						<div id="no_order">
							<div>
								<span>작성하신 글이 없습니다.</span></br>
							</div>
						</div>
					<% } else { 
							for(int i=0; i<list.size(); i++) { 
								int count = 0;
								 %>
<script>
function initMap() {
	  const myLatLng = { lat: <%=list.get(i).getLocal_latitude()%>, lng: <%=list.get(i).getLocal_longitude()%> };
	  const map = new google.maps.Map(document.getElementsByClassName("map"), {
	    zoom: 4,
	    center: myLatLng,
	  });

	  new google.maps.Marker({
	    position: myLatLng,
	    map,
	    title: "Hello World!",
	  });
	}

	window.initMap = initMap;
</script>
								<div id="detail_box">
										<!-- <div id="img"><div class="map"></div></div>
  										<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCMF6muU7VHDkbFX-xuKoXma9JWt-mR0Bc&callback=initMap&v=weekly"defer></script>	 -->
  										<div id="img"><img src="../img/travel<%=list.get(i).getLocal_img()%>" width="160px" height="160px"></div>
  										<div id="num">
											<span><%= list.get(i).getRoutetitle() %></span>
											<span><%= list.get(i).getWritedate() %></span>
										</div>							
										<div class="localname"><i style="color:#cc3d3d" class="fa-solid fa-location-dot"></i>&nbsp;<%=list.get(i).getLocal() %></div>
										 
										<div id="detail">
											<div class="routedetail">
												<%if(list.get(i).getRoute1_1() != null){ count++;%><%=list.get(i).getRoute1_1()%>><%}%>
												<%if(list.get(i).getRoute1_2() != null){ count++;%><%=list.get(i).getRoute1_2()%>><%}%>
												<%if(list.get(i).getRoute1_3() != null){ count++;%><%=list.get(i).getRoute1_3()%>><%}%>
												<%if(list.get(i).getRoute1_4() != null){ count++;%><%=list.get(i).getRoute1_4()%>><%}%>
												<%if(list.get(i).getRoute1_5() != null){ count++;%><%=list.get(i).getRoute1_5()%>><%}%>
												<%if(list.get(i).getRoute2_1() != null){ count++;%><%=list.get(i).getRoute2_1()%>><%}%>
												<%if(list.get(i).getRoute2_2() != null){ count++;%><%=list.get(i).getRoute2_2()%>><%}%>
												<%if(list.get(i).getRoute2_3() != null){ count++;%><%=list.get(i).getRoute2_3()%>><%}%>
												<%if(list.get(i).getRoute2_4() != null){ count++;%><%=list.get(i).getRoute2_4()%>><%}%>
												<%if(list.get(i).getRoute2_5() != null){ count++;%><%=list.get(i).getRoute2_5()%>><%}%>
												<%if(list.get(i).getRoute3_1() != null){ count++;%><%=list.get(i).getRoute3_1()%>><%}%>
												<%if(list.get(i).getRoute3_2() != null){ count++;%><%=list.get(i).getRoute3_2()%>><%}%>
												<%if(list.get(i).getRoute3_3() != null){ count++;%><%=list.get(i).getRoute3_3()%>><%}%>
												<%if(list.get(i).getRoute3_4() != null){ count++;%><%=list.get(i).getRoute3_4()%>><%}%>
												<%if(list.get(i).getRoute3_5() != null){ count++;%><%=list.get(i).getRoute3_5()%>><%}%>
												<%if(list.get(i).getRoute4_1() != null){ count++;%><%=list.get(i).getRoute4_1()%>><%}%>
												<%if(list.get(i).getRoute4_2() != null){ count++;%><%=list.get(i).getRoute4_2()%>><%}%>
												<%if(list.get(i).getRoute4_3() != null){ count++;%><%=list.get(i).getRoute4_3()%>><%}%>
												<%if(list.get(i).getRoute4_4() != null){ count++;%><%=list.get(i).getRoute4_4()%>><%}%>
												<%if(list.get(i).getRoute4_5() != null){ count++;%><%=list.get(i).getRoute4_5()%>><%}%>
												<%if(list.get(i).getRoute5_1() != null){ count++;%><%=list.get(i).getRoute5_1()%>><%}%>
												<%if(list.get(i).getRoute5_2() != null){ count++;%><%=list.get(i).getRoute5_2()%>><%}%>
												<%if(list.get(i).getRoute5_3() != null){ count++;%><%=list.get(i).getRoute5_3()%>><%}%>
												<%if(list.get(i).getRoute5_4() != null){ count++;%><%=list.get(i).getRoute5_4()%>><%}%>
												<%if(list.get(i).getRoute5_5() != null){ count++;%><%=list.get(i).getRoute5_5()%><%}%>
											
											</div>
											<div class="count">전체&nbsp;<%=count %>&nbsp;개&nbsp;장소</div>
											<div class="date">
												<%if(list.get(i).getRoute2_1() == null){ %>
												PLAN&nbsp;·&nbsp;당일치기
												<%}else if(list.get(i).getRoute3_1() == null){ %>
												PLAN&nbsp;·&nbsp;1박2일
												<%}else if(list.get(i).getRoute4_1() == null){ %>
												PLAN&nbsp;·&nbsp;2박3일
												<%}else if(list.get(i).getRoute5_1() == null){ %>
												PLAN&nbsp;·&nbsp;3박4일
												<%}else{%>
												PLAN&nbsp;·&nbsp;4박5일
												<%} %>
											</div>
										</div>	
								</div>
						<% } %> 
					<% } %>
				
				</div>
			</div>
		</section>
		<div style="width: 1200px; height: 100px; margin-top: 10px;"></div>
		
	</form>
	<jsp:include page="../overlap/footer.jsp"/>
</body>
</html>