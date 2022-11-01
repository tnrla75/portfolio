<%@page import="vo.Hotel_review_DTO"%>
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
<style>
		body{
			
		}
		#bigbox{
			width: 900px;
			height: 750px;
			margin:0 auto;
			
		}
		table{
			width: 900px;
			background-color: #FAECC5;
		}
		#reate{
			text-align:center; 
			font-size:20px;
		}
		.textarea{
			width: 800px;
			height: 250px;
			
			font-size:20px;
		}
		h2{
			text-align:center; 
			font-size:45px;
			margin:50px auto;
		}
		#btn{
			width: 900px;
			height: 50px;
			margin:30px auto;
		}
		#btn input:first-of-type{
			margin-left:350px;
			width: 120px;
			height: 50px;
			font-size:15px;
			border-style:hidden;
			border-radius: 7px;
			background-color: #D5D5D5;
		}
		#btn input:last-of-type{
			width: 120px;
			height: 50px;
			font-size:15px;
			border-style:none;
			border-radius: 7px;
			background-color: #050099;
			color:white;
			
		}
		
		
	/* 파일첨부 */
	.filebox .upload-name {
	    display: inline-block;
	    width: 350px;
	    height: 30px;
	    padding: 0 10px;
	    vertical-align: middle;
	    border: 1px solid #dddddd;
	    color: #999999;
	}
	.filebox label {
	    display: inline-block;
	    float: right;
	    color: #fff;
	    vertical-align: middle;
	    background-color: #999999;
	    cursor: pointer;
	    width: 120px;
	    height: 30px;
		text-align: center;
		font-weight: bold;
		vertical-align: middle;
	}
	.filebox input[type="file"] {
	    position: absolute;
	    width: 0;
	    height: 0;
	    padding: 0;
	    overflow: hidden;
	    border: 0;
	}

	.header {
		float: left;
		width: 250px; 
		height: 250px; 
		z-index: -2;
		position: relative;
		bottom: 60px;
		right: 70px;
	}
	.fileBox {
		margin-top: 10px;
	}
	#btn {
		margin-top: 20px;
	}
	.p_right{
	width:200px;
	height:80px;
	margin:0 auto;		
	margin-bottom: 0;
	text-align: right;
	float:right;
	
}

.sub_nebubox1{
	width:80px;
	height:80px;
	margin:0 auto;
	padding-top:40px;
	margin-right:10px;
	float:right;
}

	</style>
</head>
<%
	String hot_main_num=request.getParameter("hot_main_num");
	String mb_id=(String)session.getAttribute("mb_id");
%>
<body>
	<form action="hotel_qna_insert_02.jsp">
		<%if(mb_id == null){%>
		<jsp:include page="../overlap/header_login.jsp"/>
		<%}else{%>
		<jsp:include page="../overlap/header_logout.jsp"/>
		<%}%>
	
	<div id="bigbox">
		<h2>문의 작성</h2><hr><br>
		<div class="p_right">		
			
		
			<div class="sub_nebubox1">
				<select name='hot_qna_nation' style="border-radius: 7px;height:30px;">
					<option value='한국'>한국</option>
					<option value='일본'>일본</option>
					<option value='중국'>중국</option>
					<option value='미국'>미국</option>
					<option value='러시아'>러시아</option>
					<option value='베트남'>베트남</option>
					<option value='태국'>태국</option>
					<option value='필리핀'>필리핀</option>
				</select>
			</div>			
		</div>
		<input type="hidden" name="hot_main_num" value=<%=hot_main_num%> >
		<input type="hidden" name="mb_id" value=<%=mb_id%> >
		<table align="center" cellpadding="10px">
			
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;&nbsp;&nbsp;<textarea class="textarea" name="hot_qna_content" placeholder="문의 내용을 입력하세요." style="resize:none"></textarea></td>
			</tr>
			
		</table>
		<div id="btn">
			<input class="text" type="button" value="취소">
			<input class="text" type="submit"  value="등록">
		</div>
	</div>	
	</form>
	<jsp:include page="../overlap/footer.jsp"/>
	<script>
	date =  new Date().toISOString().substring(0,10);
	$("#hot_qna_date").val(date);
		
</script>
</body>
</html>