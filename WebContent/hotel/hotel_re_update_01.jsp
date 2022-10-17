<%@page import="vo.Hotel_review_DTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>리뷰 수정</title>
	<meta charset="utf-8">
	<link href="https://fonts.googleapis.com/css2?family=Cairo&family=Indie+Flower&family=Koulen&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="../css/style.css" />
	<link rel="stylesheet" type="text/css" href="../css/header_footer.css">
	
    <script src="http://use.fontawesome.com/releases/v6.1.2/js/all.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<style>
	body{
 		margin:0;
 		padding:0;
 	}
		.table{
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
		
		/* 평점 */
	.rate {
	    float: left;
	    position: relative;
		left: 40px;
	    bottom: 20px;
	}
	.rate:not(:checked) > input {
	    position:absolute;
	    top:-9999px;
	}
	.rate:not(:checked) > label {
	    float:right;
	    width:1em;
	    overflow:hidden;
	    white-space:nowrap;
	    cursor:pointer;
	    font-size:30px;
	    color:#ccc;
	}
	.rate:not(:checked) > label:before {
	    content: '★ ';
	}
	.rate > input:checked ~ label {
	    color: #FFE400;    
	}
	.rate:not(:checked) > label:hover,
	.rate:not(:checked) > label:hover ~ label {
	    color: #FFE400;  
	}
	.rate > input:checked + label:hover,
	.rate > input:checked + label:hover ~ label,
	.rate > input:checked ~ label:hover,
	.rate > input:checked ~ label:hover ~ label,
	.rate > label:hover ~ input:checked ~ label {
	    color: #FFE400;
	}
		
</style>
<body>
	
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
<jsp:useBean id="members" class="dao.Hotel_DAO"/>

<%
	request.setCharacterEncoding("UTF-8");

	String hot_content=request.getParameter("hot_content");
	String hot_re_num=request.getParameter("hot_re_num");
	String hot_main_num=request.getParameter("hot_main_num");
	
	request.setAttribute("hot_re_num", hot_re_num);
	System.out.println(hot_main_num+" update 01");
	
%>
	
	<form action="hotel_re_update_02.jsp">
	<table align="center" cellpadding="10px" border="1" class="table">
	
		
		<input type="hidden" name="mb_id" value=<%=mb_id %>>
		<input type="hidden" name="hot_main_num" value=<%=hot_main_num %>>
		<input type="hidden" name="hot_re_num" value=<%=hot_re_num %>>
	
		
		
		<h2 >리뷰 작성</h2><hr><br>
		
		
			<tr id="reate">
				<td size="15">&nbsp;</td>
				<td>평점
					<input type="radio" name="hot_re_rate" value="1">1
					<input type="radio" name="hot_re_rate" value="2">2
					<input type="radio" name="hot_re_rate" value="3">3
					<input type="radio" name="hot_re_rate" value="4">4
					<input type="radio" name="hot_re_rate" value="5">5
					<hr>
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;&nbsp;&nbsp;<textarea class="textarea" name="hot_re_content" placeholder="리뷰 내용을 입력하세요." style="resize:none"></textarea></td>
			</tr>
			
		</table>
		<div id="btn">
			<input class="text" type="button" value="취소">
			<input class="text" type="submit"  value="등록">
		</div>

		<jsp:include page="../overlap/footer.jsp"/>
	</form>
</body>
<script>
	date =  new Date().toISOString().substring(0,10);
	$("#hot_re_date").val(date);
	alert(hotel_re_date);
</script>
</html>