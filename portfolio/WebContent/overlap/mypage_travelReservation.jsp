<%@page import="vo.Mypage_qna"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.Member_info"%>
<%@page import="vo.Mypage_travelattraction_reserve"%>

<%
	ArrayList<Mypage_travelattraction_reserve> list = (ArrayList<Mypage_travelattraction_reserve>)request.getAttribute("item");
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>마이 페이지</title>
<style>
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
	#reTable {
		margin: 10px auto;
		width: 750px;
		border-collapse: collapse;
	}
	.reTableLine {
		border-bottom: 1px solid #D5D5D5;
		border-top: 1px solid #D5D5D5;
		height: 70px;
	}
	.item div{
		float: left;
	}
	.item div:last-of-type {
		margin-top: 15px;	
		margin-left: 10px;
	}
	.item span:first-of-type {
		margin-top: 10px;
		font-size: 10pt;
		font-weight: bold;
	}
    .item span:last-of-type {
		font-size: 14pt;
		color: #949494;
		position: relative;
		bottom: 13px;
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
	<form action="mypage_qna.mypage?command=item_qna" method="post" onsubmit="return routeinsert()">
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
					<h2>예약 내역</h2>
				</div>
				<div id="wrap">
					<table id="reTable" cellpadding="10px">
						<tr>
							<td width="320px">관광지</td>
							<td>예약인원</td>
							<td>예약날짜</td>
						</tr>
						<% for(int i=0; i<list.size(); i++) {
							
						%>
						 	<tr class="reTableLine">
						 		<td class="item">
						 			<a href="../travel/Attraction.travel?att=<%=list.get(i).getAtt_name()%>">
						 				<div><img src="../img/travel<%= list.get(i).getAtt_img()%>" width="100px" height="100px"></div>
							 			<div>
							 				<span><%= list.get(i).getAtt_name() %></span></br>
							 			</div>	
						 			</a>	
						 		</td>
						 		<td class="review_wr">
							 		<span> 성인: <%= list.get(i).getAtt_adult_num() %>명</span>	</br>
							 		<%if(!list.get(i).getAtt_student_num().equals("0")){ %>
							 			<span> 학생: <%= list.get(i).getAtt_student_num() %>명</span>			
						 			<%}else{ %>
						 			<%} %>
						 		</td>
						 		<td>
						 				<span><%= list.get(i).getAtt_reserve_date() %></span>
						 		</td>
						 	</tr>
						
						<% } %>
						</table>
			
				</div>
			</div>
		</section>
		<div style="width: 1200px; height: 100px; margin-top: 10px;"></div>
		
	</form>
	<jsp:include page="../overlap/footer.jsp"/>
</body>
</html>