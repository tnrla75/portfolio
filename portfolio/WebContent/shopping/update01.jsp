<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.Item" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성</title>
<style type="text/css">
	#review {
		width: 500px;
		margin: 0 auto;
	}
	#review div {
		width: 500px;
		margin: 10px;
	}
	#review div:first-of-type {
		height: 130px;
		border-style: solid;
		border-width: 0 0 1px 0;
	}
	 #review div:nth-of-type(2) {
		height: 20px;
	}
	#review div:nth-of-type(3) {
		height: 210px;
	}
	#text {
		width: 500px;
		height: 210px;
	}
	#photo {
		width: 500px;
		height: 50px;
		border-style: dashed;
		border-color: #D5D5D5; 
		background-color: white;
	}
	img {
		position: relative;
		top: 40px;
		left: 170px;
	}
	.btn:first-of-type {
		width: 240px;
		height: 45px;
		background-color: white;
		border-style: solid;
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
	.starColor1 {
		filter: invert(71%) sepia(95%) saturate(468%) hue-rotate(360deg) brightness(108%) contrast(104%);
		Loss: 0.0. This is a perfect result.
	}
	.starColor2 {
		filter: invert(84%) sepia(0%) saturate(1407%) hue-rotate(147deg) brightness(97%) contrast(76%);
		Loss: 0.7. This is a perfect result.
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
</style>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>
	$("#file").on('change',function(){
		var fileName = $("#file").val();
		$(".upload-name").val(fileName);
	});
	
	$(document).ready(function() {
	  	$('#star1').click(function() {
	  		$(this).addClass('starColor1');
	  		$('#star2').addClass('starColor2');
	  		$('#star3').addClass('starColor2');
	  		$('#star4').addClass('starColor2');
	  		$('#star5').addClass('starColor2');
	 	});
	  	
	  	$('#star2').click(function() {
	  		$(this).addClass('starColor1');
	  		$('#star1').addClass('starColor1');
	  		$('#star3').addClass('starColor2');
	  		$('#star4').addClass('starColor2');
	  		$('#star5').addClass('starColor2');
	 	});
	  	
	  	$('#star3').click(function() {
	  		$(this).addClass('starColor1');
	  		$('#star1').addClass('starColor1');
	  		$('#star2').addClass('starColor1');
	  		$('#star4').addClass('starColor2');
	  		$('#star5').addClass('starColor2');
	 	});
	  	
	  	$('#star4').click(function() {
	  		$(this).addClass('starColor1');
	  		$('#star1').addClass('starColor1');
	  		$('#star2').addClass('starColor1');
	  		$('#star3').addClass('starColor1');
	  		$('#star5').addClass('starColor2');
	 	});
	  	
	  	$('#star5').click(function() {
	  		$(this).addClass('starColor1');
	  		$('#star1').addClass('starColor1');
	  		$('#star2').addClass('starColor1');
	  		$('#star3').addClass('starColor1');
	  		$('#star5').addClass('starColor1');
	 	});
	});
</script>
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
<body>
	<%
		String reviewNo = request.getParameter("reviewNo");
		String itemCode = request.getParameter("itemCode");
		session.setAttribute("itemCode", itemCode);
		session.setAttribute("reviewNo", reviewNo);
	%>
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
			<div>
				<h3>
					<%
						String mb_id = (String)session.getAttribute("mb_id");
						out.println(mb_id+" 님");
					%>
					수정할 내용을 입력해주세요.
				</h3>
				<img src="../img/dutyfree/star3.png" width="20px" height="20px" id="star1" class="starColor1">
					<img src="../img/dutyfree/star3.png" width="20px" height="20px" id="star2" class="starColor1">
					<img src="../img/dutyfree/star3.png" width="20px" height="20px" id="star3" class="starColor1">
					<img src="../img/dutyfree/star3.png" width="20px" height="20px" id="star4" class="starColor1">
					<img src="../img/dutyfree/star3.png" width="20px" height="20px" id="star5" class="starColor1">
				<input type="text" name="reRate" placeholder="평점" id="reRate"onblur="num_ck()">
			</div>
			<div>
				<input type="hidden" name="itemCode" value="<%= itemCode%>"><br>
			</div>
			<div>
				<textarea name="reText" placeholder="최소 10자 이상 입력해주세요." id="text"></textarea>
			</div>
			<div>
				<img src='../img/dutyfree/camera.png' width='20px' height='20px'><input type="button" name="photo" value="사진 첨부하기" id="photo">
			</div>
			<div class="filebox">
			    <input class="upload-name" value="첨부파일" placeholder="첨부파일">
			    <label for="file">파일찾기</label> 
			    <input type="file" id="file" name="file1"><br>
			</div>
			<div class="filebox">
			    <input class="upload-name" value="첨부파일" placeholder="첨부파일">
			    <label for="file">파일찾기</label> 
			    <input type="file" id="file" name="file2"><br>
			</div>
			<div class="filebox">
			    <input class="upload-name" value="첨부파일" placeholder="첨부파일">
			    <label for="file">파일찾기</label> 
			    <input type="file" id="file" name="file3"><br>
			</div>
			<div>
				<input type="button" value="취소" class="btn" onclick="window.close()">
				<input type="submit" value="등록" class="btn">
			</div>
		</div>
	</form>
	
</body>
</html>