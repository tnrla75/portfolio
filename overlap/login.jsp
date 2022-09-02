<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title></title>
	<meta charset="utf-8">
	<link href="https://fonts.googleapis.com/css2?family=Cairo&family=Indie+Flower&family=Koulen&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="../css/header_footer.css">
	<link rel="stylesheet" type="text/css" href="../css/login.css">
	<link type="text/css" rel="stylesheet" href="../css/responsive-tabs.css" />
    <link type="text/css" rel="stylesheet" href="../css/style.css" />
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<body>
	<form action="login_answer.jsp" onsubmit="">	
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
<div class="mainlogin">
	<section>
		<div class="login">로그인</div>
		<div class="login_text">
			<input type="text" name="login_id" class="login_id"  placeholder="아이디를 입력해주세요.">
		</div>
		<div class="login_text">
			<input type="password" name="login_pw" class="login_pw" placeholder="비밀번호를 입력해주세요.">
		</div>
		<div class="login_find">
			<a href="">아이디찾기</a>
			<a href="">비밀번호찾기</a>
		</div>
		<div class="btn1">
			<input type="submit" name="loginbtn" class="login_btn" value="로그인">
		</div>
		<div class="btn2">
			<input type="button" name="signupbtn" class="signup_btn" value="회원가입" onClick="location.href='signuppage.jsp'">
		</div>
	</section>
</div>

	<jsp:include page="../overlap/footer.jsp"/>
	</form>
</body>
</html>