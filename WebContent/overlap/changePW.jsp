<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="../css/header_footer.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<title>비밀번호 변경</title>
</head>
<style>
	*{
		box-sizing: border-box;
	}
	section{
		width: 600px;
		height: 730px;
		margin: 0 auto;
	}
	article{
		width:600px;
		height: 150px;
		margin: 20px auto;
		text-align: center;
		font-size: 20pt;
		line-height: 130px;
		border-bottom: 3px #030066 solid;
	}	
	
	.signuplabel{
		width: 120px;
		height: 55px;
		float: left;
		line-height: 50px;
		margin: 5px;
		padding-left: 10px;
		font-size: 10pt;
	}
	.signupinputdiv{
		width: 300px;
		height: 50px;
		float: left;
		margin: 10px;
	}
	.signupinputdiv{	
		height: 50px;
		float: left;
		margin: 10px;
	}	
	.signupinput{
		width: 300px;
		height: 40px;
		font-size: 14px;
		padding-left: 7px;
		border: #D5D5D5 1px solid;
		border-radius: 5px;
	}
	#signupid{
		width: 500px;
		height: 80px;
		margin: 0 auto;
	}
	.buttonbox{
		width: 300px;
		height: 45px;
		margin:0 auto;
	}
	.buttonbox input{
		width: 300px;
		height: 45px;
		background: #030066;
		color: white;
		font-weight: bold;
		border-radius: 5px;
		cursor: pointer;
	}
</style>
<body>
	<form action="../overlap/PWchange.mypage?command=PWchange" method="post">
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
			<article>
				비밀번호 변경
			</article>
			<div id="signupid">
			<div class="signuplabel">
				비밀번호
			</div>
			<div class="signupinputdiv">
				<input type="text" placeholder="비밀번호를 입력해주세요." class="signupinput" id="pw" name="pw" >
			</div>
		</div>
		<div id="signupid">
			<div class="signuplabel">
				비밀번호 확인
			</div>
			<div class="signupinputdiv">
				<input type="text" placeholder="비밀번호를 한번 더 입력해주세요." class="signupinput" name="pw" >
			</div>
		</div>
		<div style="width:600px; height:200px;padding-top:50px;">
			<div class="buttonbox"><input type="submit" value="비밀번호 변경하기" ></div>
		</div>
		</section>
		<jsp:include page="../overlap/footer.jsp"/>
	</form>
</body>
</html>