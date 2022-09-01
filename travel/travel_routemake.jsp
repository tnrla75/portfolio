<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="route_package.RouteDTO" %>
<html>
<head>
<title></title>
<meta charset="utf-8">
<link
	href="https://fonts.googleapis.com/css2?family=Cairo&family=Indie+Flower&family=Koulen&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../css/header_footer.css">
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<style>
.maindiv {
	margin: 50px auto 0 auto;
	width: 1200px;
	height: 800px;
	border-radius: 10px;
	border: 2px black solid;
	box-sizing: border-box;
}

.writediv {
	width: 1200px;
	height: 70px;
	line-height: 70px; border-radius : 10px;
	font-size: 24pt;
	font-weight: bold;
	text-align: center;
	margin: 30px auto 30px auto;
	border-radius: 10px;
}

.contentdiv {
	width: 1200px;
	height: 50px;
	margin: 10px;
}

.contentdiv>div>input {
	height: 50px;
}

.textdiv {
	float: left;
}

.inputdiv>input {
	width: 600px;
	border-style: solid;
	border-color: #E7E7E7;
}

.routeContent {
	width: 600px;
	height: 430px;
	margin: 5px;
}

.leftdiv {
	width: 650px;
	height: auto;
	float: left;
}

.rightdiv {
	width: 500px;
	height: 500px;
	float: right;
	margin: 5px;
	border: 2px rgba(0, 0, 0, 0.3) solid;
	border-radius: 5px;
}

.btndiv {
	width: 1200px;
	margin: 0 auto;
	float: left;
	text-align: center;
}

.btndiv>input {
	width: 100px;
	height: 35px;
	border-radius: 5px;
	border-style: none;
	font-size: 12pt;
	font-weight: bold;
	margin: 5px;
	display: inline-block;
}

input::-ms-clear, input::-ms-reveal {
	display: none;
	width: 0;
	height: 0;
}

input::-webkit-search-decoration, input::-webkit-search-cancel-button,
	input::-webkit-search-results-button, input::-webkit-search-results-decoration
	{
	
}
</style>

<script>
	
</script>
<jsp:useBean id="control" class="route_package.RouteController">
</jsp:useBean>
<body>
	<form action='travel_routemake_call.jsp'>
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
			<div class="maindiv">
				<div class="writediv">
					<span>글쓰기</span>
				</div>
				<div class="leftdiv">
					<div class="contentdiv">

						<div class="inputdiv">
							<input type="text" name="title" id="board_title"
								placeholder="제목을 입력하세요.">
						</div>
					</div>

					<div class="routeContent">
						<div class="inputdiv">
							<input type="text" class="routeContent" name="content"
								id="board_content" placeholder="내용을 입력하세요.">
						</div>
					</div>
				</div>
				<div class="rightdiv">루트넣을예정</div>
				<div class="btndiv">
					<input type="button" value="취소"
						onclick="location.href='travel_route.jsp'"> <input
						type="submit" value="등록"
						style="background-color: #030066; color: white;">
				</div>
			</div>


			<jsp:include page="../overlap/footer.jsp"/>
	</form>
</body>
</html>