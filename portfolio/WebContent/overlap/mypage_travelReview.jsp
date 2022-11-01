
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.Member_info"%>
<%@page import="vo.Mypage_travelreview"%>
<%@page import="vo.PageInfo"%>
<%
	ArrayList<Mypage_travelreview> list = (ArrayList<Mypage_travelreview>)request.getAttribute("travelreview");
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int listCount=pageInfo.getListCount();	
	int nowPage=pageInfo.getPage();
	int maxPage=pageInfo.getMaxPage();
	int startPage=pageInfo.getStartPage();
	int endPage=pageInfo.getEndPage();
	System.out.println(maxPage+"=최대페이지");
	System.out.println(nowPage+"=현재페이지");
	System.out.println(listCount+"=listcount");
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Cairo&family=Indie+Flower&family=Koulen&display=swap" rel="stylesheet">
<link rel="stylesheet" href="../css/style.css" />
<link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../css/header_footer.css">
<script src="http://use.fontawesome.com/releases/v6.1.2/js/all.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
		height: 1000px;
		margin: 10px auto;
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
	.itemName {
		margin-top: 12px;
        display: block;
        color: #949494;
        width: 170px;
        font-size: 12px;
        font-weight: bolder !important;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }
    .item span:last-of-type {
		font-size: 10pt;
		color: #949494;
		position: relative;
		bottom: 13px;
	}
	.review_wr span:first-of-type {
		position: relative;
		bottom: 15px;
	}
	.review_wr span:nth-of-type(2) {
		float: right;
		font-size: 10pt;
		color: #8C8C8C;
		font-weight: bold;
		position: relative;
		bottom: 15px;
	}

	.reivew_wr span:last-of-type {
		font-size: 10pt;
	}	
	.star {
		filter: invert(84%) sepia(0%) saturate(1407%) hue-rotate(147deg) brightness(97%) contrast(76%);
		Loss: 0.7. This is a perfect result.
	}
	#pageList{
		width: 400px;
		height: 30px;
	}
</style>
</head>
<body>
	<form action="mypage_qna.mypage?command=item_qna" method="post" onsubmit="return signupchk()">
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
		<header id="info">
			<h3>MY PAGE</h3>
		</header>
		<section>
				
				<jsp:include page="../overlap/myPageMenu.jsp"/>
				
			<div id="infoBox">
				<div id="info_title">
					<h2>내가 작성한 리뷰</h2>
				</div>
				<div id="wrap">
				 	<table id="reTable" cellpadding="10px">
						<tr>
							<td width="320px">관광지</td>
							<td>리뷰 내용</td>
						</tr>
						<% for(int i=0; i<list.size(); i++) {
							String star1 = "<img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'>";
							String star2 = "<img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'>";
							String star3 = "<img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'>";
							String star4 = "<img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'>";
							String star5 = "<img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'>";
							
							String star;
							if(list.get(i).getAtt_reRate() == 1){
								star = star1;
							} else if(list.get(i).getAtt_reRate() == 2){
								star = star2;
							} else if(list.get(i).getAtt_reRate() == 3){
								star = star3;
							} else if(list.get(i).getAtt_reRate() == 4){
								star = star4;
							}  else if(list.get(i).getAtt_reRate() == 5){
								star = star5;
							} else {
								star = "";
							}
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
						 			<span><%= star %></span>
							 		<span><%= list.get(i).getAtt_reDate() %></span></br>	
							 		<span><%= list.get(i).getAtt_reContent() %></span>		
						 		</td>
						 	</tr>
						
						<% } %>
						</table>
				</div>			
				<div style="width:300px; height: 30px;margin: 0 auto;">
				<%if(maxPage > 1){ %>
				<div style="width:300px; height: 30px;clear:both;margin:0 auto;text-align: center;margin-top:50px;">
				<section id="pageList">
					<%if(nowPage<=1){ %>
					[이전]&nbsp;
					<%}else{ %>
					<a href="mypage_AttractionReview.mypage?command=travel_Review&page=<%=nowPage-1%>&mb_id=<%= mb_id %>">[이전]</a>&nbsp;
					<%} %>
			
					<%for(int a=startPage;a<=maxPage;a++){
							if(a==nowPage){%>
					[<%=a %>]
					<%}else{ %>
					<a href="mypage_AttractionReview.mypage?command=travel_Review&page=<%=a%>&mb_id=<%= mb_id %>">[<%=a %>]
					</a>&nbsp;
					<%} %>
					<%} %>
			
					<%if(nowPage>=maxPage){ %>
					[다음]	
					<%}else{ %>
					<a href="mypage_AttractionReview.mypage?command=travel_Review&page=<%=nowPage+1%>&mb_id=<%= mb_id %>">[다음]</a>
					<%} %>
				</section>
			</div>
			<%}%>	
		</div>	
			</div>
		</section>
		<jsp:include page="../overlap/footer.jsp"/>
	</form>
</body>
</html>