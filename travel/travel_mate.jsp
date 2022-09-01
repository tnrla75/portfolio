<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.util.ArrayList"%>    
<%@ page import="mate_package.MateConnect" %>
<%@ page import="mate_package.MateDTO" %>
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
<script>
	function logincheck(){
		var id = '<%=(String)session.getAttribute("id")%>';
		if(id == "null"){
			alert("로그인 해주세요.");
			location.replace("../overlap/login.jsp");
		}else{
			location.replace("travel_mate_recruit.jsp");
		}
	}
</script>
<body>
	<form>	
	<%
		String id = (String)session.getAttribute("id"); 
		if(id == null){
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
		<input type="button" class="searchbutton" value="검색">
		<input type="text" class="searchtext" placeholder="지역을검색하세요.">
	</div>
	<article>
	<div class="samearticle" style="background-color:#E7E7E7;">
		<div class="matenum">NO</div>
		<div class="matetitle">제목</div>
		<div class="mateid">작성자</div>
		<div class="matedate">날짜</div>
	</div>
		<% 
			MateConnect mc = new MateConnect();
			ArrayList<MateDTO> customer = mc.select();
			for(int i=0; i<customer.size(); i++){
				int a= i+1;
				out.println("<div class='samearticle'><div class='matenum'>"+a+"</div><div class='matetitle'><a href='travel_mate_recruit_detail.jsp?num="+customer.get(i).getTravelmateNum()+"'>"+customer.get(i).getTravelmateTitle()+"</a></div><div class='mateid'>"+customer.get(i).getId()+"</div><div class='matedate'>"+customer.get(i).getTravelmateDate()+"</div></div>");
			}
		%>
	</article>
	<div class="buttonbox">
		<input type="button" class="writebutton" value="글쓰기" onclick="logincheck()">
	</div>
</section>
	<jsp:include page="../overlap/footer.jsp"/>
	</form>
</body>
</html>