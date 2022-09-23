<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.Item" %>
<%
	String itemCode = request.getParameter("itemCode");
	session.setAttribute("itemCode", itemCode);
%>
<link rel="stylesheet" type="text/css" href="../css/header_footer.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성</title>
<style type="text/css">
	header img {
		position: relative;
		top: 40px;
		left: 170px;
	}
	#review {
		width: 500px;
		margin: 0 auto;
	}
	#top {
		height: 100px;
		margin-top: 40px;
		margin-bottom: 20px;
		border-style: solid;
		border-width: 0 0 1px 0;
	}
	h3 {
		text-align: center;
		position: relative;
		margin-bottom: 40px;
		right: 60px;
	}
	#text {
		width: 500px;
		height: 210px;
		margin-top: 0px;
	}
	#photoSel {
		margin-top: 10px;
	}
	#photo {
		width: 500px;
		height: 50px;
		border-style: dashed;
		border-color: #D5D5D5; 
		background-color: white;
		background: url(../img/dutyfree/camera.png);
		background-size: 25px;
		background-repeat: no-repeat;
		background-position: 450px;
	}
	#photoSel img {
	
	}
	.btn:first-of-type {
		width: 240px;
		height: 45px;
		background-color: white;
		border-color: #D5D5D5; 
	}
	.btn:last-of-type {
		float: right;
		width: 240px;
		height: 45px;
		color: white;
		background-color: #003399;
		border-style: solid;
		border-color: #003399;
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
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>
	function num_ck(){
		var reRate = document.getElementById("reRate");
		var regExp = /^[1-5]*$/;
		if (!regExp.test(reRate.value)){
			alert('1~5까지의 숫자만 입력해 주세요.');
			reRate.value="";
		}
	}
</script>
<script>
	$("#file").on('change',function(){
		var fileName = $("#file").innerText();
		alert(fileName);
		$(".upload-name").val(fileName);
	});
	
	$(document).ready(function() {
	  	$('#star1').click(function() {
	  		$('input[name=reRate]').attr('value',"1");
	 	});
	  	
	  	$('#star2').click(function() {
	  		$('input[name=reRate]').attr('value',"2");
	 	});
	  	
	  	$('#star3').click(function() {
	  		$('input[name=reRate]').attr('value',"3");
	 	});
	  	
	  	$('#star4').click(function() {
	  		$('input[name=reRate]').attr('value',"4");
	 	});
	  	
	  	$('#star5').click(function() {
	  		$('input[name=reRate]').attr('value',"5");
	 	});
	  	
	});
</script>
<body>
	<form action="update02.jsp" method="post">
		<div style="width:100%; height: 120px; box-shadow: 0px 5px 1px 1px #020066; ">
			<div style="width: 1200px; height: 150px; margin: 0 auto; ">
				<header>
					<div id="header">
						<div id="title">
							<a href="indexpage.jsp">
								<img src="../img/logo/logo1.png">
							</a>
						</div>
					</div>
				</header>
			</div>
		</div>
		<div id="review"> 
			<div id="top">
				<h3>
					<%
						String mb_id = (String)session.getAttribute("mb_id");
						out.println(mb_id+" 님");
					%>
					수정할 내용을 입력해주세요.
				</h3>
				<div class="rate">
				    <input type="radio" id="star5" name="rate" value="5" />
				    <label for="star5" title="text">5 stars</label>
				    <input type="radio" id="star4" name="rate" value="4" />
				    <label for="star4" title="text">4 stars</label>
				    <input type="radio" id="star3" name="rate" value="3" />
				    <label for="star3" title="text">3 stars</label>
				    <input type="radio" id="star2" name="rate" value="2" />
				    <label for="star2" title="text">2 stars</label>
				    <input type="radio" id="star1" name="rate" value="1" />
				    <label for="star1" title="text">1 star</label>
				</div>
				<input type="hidden" name="reRate" value="" id="reRate" name="reRate" onblur="num_ck()">
			</div>
			<div>
				<input type="hidden" name="itemCode" value="<%= itemCode%>"><br>
			</div>
			<div>
				<textarea name="reText" placeholder="최소 10자 이상 입력해주세요." id="text"></textarea>
			</div>
			<div id="photoSel">
				<input type="button" name="photo" value="사진 첨부하기" id="photo">
			</div>
			<div class="filebox">
			    <input class="upload-name" value="" placeholder="첨부파일">
			    <label for="file">파일찾기</label> 
			    <input type="file" id="file" name="file1"><br>
			</div>
			<div class="filebox">
			    <input class="upload-name" value="" placeholder="첨부파일">
			    <label for="file">파일찾기</label> 
			    <input type="file" id="file" name="file2"><br>
			</div>
			<div class="filebox">
			    <input class="upload-name" value="" placeholder="첨부파일">
			    <label for="file">파일찾기</label> 
			    <input type="file" id="file" name="file3"><br>
			</div>
			<div id="btn">
				<input type="button" value="취소" class="btn" onclick="window.close()">
				<input type="submit" value="등록" class="btn"​>
			</div>
		</div>
	</form>
	
</body>
</html>