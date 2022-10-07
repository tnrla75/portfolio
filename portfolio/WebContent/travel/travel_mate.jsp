<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.util.ArrayList"%>    
<%@ page import="travel_package.MateController" %>
<%@ page import="travel_package.MateDTO" %>
<%@page import="vo.PageInfo"%>
<%
	ArrayList<MateDTO> customer=(ArrayList<MateDTO>)request.getAttribute("customer");
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
	<title></title>
	<meta charset="utf-8">
	<link href="https://fonts.googleapis.com/css2?family=Cairo&family=Indie+Flower&family=Koulen&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="../css/style.css" />
	<link rel="stylesheet" type="text/css" href="../css/header_footer.css">
	<link type="text/css" rel="stylesheet" href="../css/responsive-tabs.css" />
    <link type="text/css" rel="stylesheet" href="../css/style.css" />
    <link type="text/css" rel="stylesheet" href="../css/travel_mate.css" />
    
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<style>
	#pageList{
		width:300px; 
		height: 30px;
		clear:both;
		margin:0 auto;
		text-align: center;
		margin-top:50px;
	}
	.buttonbox{
		margin-bottom: 10px;
	}
</style>
<script>
	function logincheck(){
		var mb_id = '<%=(String)session.getAttribute("mb_id")%>';
		if(mb_id == "null"){
			alert("로그인 해주세요.");
			location.replace("../overlap/login.jsp");
		}else{
			location.replace("travel_mate_recruit.jsp");
		}
	}
</script>
<body>
	<form action="travel_mate_search.travel">	
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
	<div class="bigtitle"><h2>여행 메이트 모집</h2></div>
	<div class="search">
		<input type="submit" class="searchbutton" value="검색">
		<input type="text" class="searchtext" placeholder="지역을검색하세요." name="search">
	</div>
	<article style="height:500px;">
	<div class="samearticle" style="background-color:#E7E7E7;">
		<div class="matenum">NO</div>
		<div class="matetitle">제목</div>
		<div class="mateid">작성자</div>
		<div class="matedate">날짜</div>
	</div>
		<%
			for(int i=0; i<customer.size(); i++){
				int a= i+(nowPage-1)*10+1;
				out.println("<div class='samearticle'><div class='matenum'>"+a+"</div><div class='matetitle'><a href='travel_mate_recruit_detail.jsp?num="+customer.get(i).getTravelmateNum()+"'>"+customer.get(i).getTravelmateTitle()+"</a></div><div class='mateid'>"+customer.get(i).getId()+"</div><div class='matedate'>"+customer.get(i).getTravelmateDate()+"</div></div>");
			}
		%>	
	</article>
	<div style="width:300px; height: 30px;margin: 0 auto;">
		<%if(maxPage > 1){ %>
			<div style="width:300px; height: 30px;clear:both;margin:0 auto;text-align: center;margin-top:50px;">
				<section id="pageList">
					<%if(nowPage<=1){ %>
					[이전]&nbsp;
					<%}else{ %>
					<a href="travel_mate.travel?page=<%=nowPage-1 %>">[이전]</a>&nbsp;
					<%} %>
			
					<%for(int a=startPage;a<=maxPage;a++){
							if(a==nowPage){%>
					[<%=a %>]
					<%}else{ %>
					<a href="travel_mate.travel?page=<%=a %>">[<%=a %>]
					</a>&nbsp;
					<%} %>
					<%} %>
			
					<%if(nowPage>=maxPage){ %>
					[다음]	
					<%}else{ %>
					<a href="travel_mate.travel?page=<%=nowPage+1 %>">[다음]</a>
					<%} %>
				</section>
			</div>
			<%}%>	
		</div>	
</section>
<div class="buttonbox">
		<input type="button" class="writebutton" value="글쓰기" onclick="logincheck()">
	</div>
	<jsp:include page="../overlap/footer.jsp"/>
	</form>
</body>
</html>