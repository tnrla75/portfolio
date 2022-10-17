<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		body{
			
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

	header {
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
	/* 평점 */
	.rate {
	    float: center;
		
		left: 40px;
	    
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
</head>
<%
	String hot_main_num=request.getParameter("hot_main_num");
	String mb_id=(String)session.getAttribute("mb_id");
%>
<body>
	<form action="hotel_re_insert_02.jsp">
		<h2 >리뷰 작성</h2><hr><br>
		<input type="hidden" name="hot_main_num" value=<%=hot_main_num%> >
		<input type="hidden" name="mb_id" value=<%=mb_id%> >
		<table align="center" cellpadding="10px">
			<tr id="reate">
				<td size="15">&nbsp;</td>
				<td>
					<div class="rate">
						평점 :
					    <input type="radio" id="star5" name="hot_re_rate" value="5" />		    
					    <label for="star5" title="text">5 stars</label>
					   
					   
					    <input type="radio" id="star4" name="hot_re_rate" value="4" />
					    <label for="star4" title="text">4 stars</label>
					  
					   
					    <input type="radio" id="star3" name="hot_re_rate" value="3" />
					    <label for="star3" title="text">3 stars</label>
					    
					    
					    <input type="radio" id="star2" name="hot_re_rate" value="2" />
					    <label for="star2" title="text">2 stars</label>
					   
					  
					    <input type="radio" id="star1" name="hot_re_rate" value="1" />
					    <label for="star1" title="text">1 star</label>
						
					</div>
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
	</form>
</body>
</html>