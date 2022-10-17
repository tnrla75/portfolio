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
<title>상품문의</title>
<style type="text/css">
	#qna {
		width: 500px;
		margin: 0 auto;
	}
	#qna div {
		width: 500px;	
	}
	#qna div:first-of-type {
		height: 130px;
		margin-bottom: 20px;
		border-style: solid;
		border-width: 0 0 1px 0;
	}
	#qna div:first-of-type h3 {
		text-align: center;
	}

	 #qna div:nth-of-type(2) {
		height: 20px;
	}
	#qna div:nth-of-type(3) {
		height: 210px;
	}
	#text {
		width: 300px;
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
	
	
</script>
<body>
	<form action="qnaInsert.jsp" method="post">
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
		<div id="qna"> 
			<div>
				<h3>
					<%
						String mb_id = (String)session.getAttribute("mb_id");
						out.println(mb_id+" 님");
					%>
					상품 Q&A
				</h3>
			</div>
			<div>	
				<b>제목</b>
				<input type="text" name="qSubject"><br>
			</div>
			<div>
				<b>내용</b>
				<textarea name="question" placeholder="최소 10자 이상 입력해주세요." id="text"></textarea>
			</div>
			
			<div>
				<input type="button" value="취소" class="btn" onclick="window.close()">
				<input type="submit" value="등록" class="btn"​>
			</div>
		</div>
	</form>
	
</body>
</html>