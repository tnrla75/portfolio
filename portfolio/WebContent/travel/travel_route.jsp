
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="travel_package.RouteDTO" %>
<html>
<head>
	<title></title>
	<meta charset="utf-8">
	<link href="https://fonts.googleapis.com/css2?family=Cairo&family=Indie+Flower&family=Koulen&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="../css/header_footer.css">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<style>
	.maindiv{
		border-radius: 10px;
		background-color: #e7e7e7;
		margin: 30px auto;
		width: 1200px;
		height: 1000px;
	}
	.routeinputdiv{
		margin: 35px;
		
		width: 1100px;
		height: 100px;
		
	}
	.routeinput{
		border-radius: 3px;
		height: 30px;
		
		border: solid 2px red;
		box-sizing: border-box;
	}
	.routeinputdiv input:first-of-type {
			width: 950px;
			height: 50px;
			border-radius: 5px;
			border-style: solid;
			border-color: #E7E7E7;
			position: relative;
			font-size: 10pt;
			top: 35px;
			left: 30px;
	}
	.routeinputdiv input:last-of-type {
		width:80px;
		height: 52px;
		border-style: solid;
		border-radius: 5px;
		font-weight: bold;
		background-color: #002266;
		color: white;
		position: relative;
		font-size: 13pt;
		top: 40px;
		left: 30px;
	}
	
	.routelistdiv{
		width: 1100px;
		height: 800px;
		border-radius: 15px;
		margin: 0 auto;
		background-color:white;
	}
	.routelistindiv{
		
		width: 1000px;
		height: 180px;
		margin: 20px 40px;
		padding-top: 20px;
		display: flex;
		border-bottom:solid 1px rgba(0,0,0, 0.3);
	}
	.routelistindiv .div1{
		border: solid 2px black;
		box-sizing: border-box;
		width: 200px;
		height: 150px;
		margin: 10px;
		float: left;
	}
	.routelistindiv .div2{
		width: 750px;
		height: 150px;
		margin: 10px;
	}
	.div3{
		width:750px;
		height: 30px;
	}
	.div3 > .span1{
		float: left;
	}
	.div3 > .span2{
		float: right;
	}
	.div4{
		width:750px;
		height: 100px;
	}
	.routelistdiv a:link{
		text-decoration: none;
	}
	.routemakebtn{
		text-align: center;
	}
	.routemakebtn > input{
		border-style: none;
		border-radius: 8px;
		width:100px;
		height: 50px;
		font-size: 14pt;
		color: white;
		background-color: #030066;
	}
</style>

<script>
	
	
	 function mypage_check(){ 
	    var mb_id = '<%=(String)session.getAttribute("mb_id")%>';
	    

	     if(mb_id=="null"){ 
	        alert("로그인을 해주세요");
	     }
	     else{ 
	        location.replace("travel_routemake.jsp");
	     }
	     
	}    
	 function logoutbtn() {
		
	}

</script>
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
<div class="maindiv">
	<div class="routeinputdiv">
		<input type="text" class="routeinput" placeholder="원하는 루트를 검색하세요.">
		<input type="button" value="검색">
	</div>
<jsp:useBean id="control" class="travel_package.RouteController">
</jsp:useBean>
	<div class="routelistdiv">
		<% 
			ArrayList<RouteDTO> arr = control.routeselect();
			for(int i=arr.size()-1; i>=0; i--){
				out.print("<a href=travel_routedetail.jsp?routeNum='"+arr.get(i).getRouteNum()+"'><div class='routelistindiv'><div class='div1'>이미지 파일</div><div class='div2'><div class='div3'><span class='span1'>"+arr.get(i).getRouteTitle()+"</span><span class='span2'>"+arr.get(i).getId()+"</span></div><div class='div4'><span>"+arr.get(i).getRouteContent()+"</span></div></div></div></a>");
			}; 
			
		%>
		
		<div class="routemakebtn">
			<input type="button" value="글쓰기" onclick="mypage_check()" >
		</div>
	</div>
</div>

<jsp:include page="../overlap/footer.jsp"/>
	</form>
</body>
</html>