<%@ page language="java" contentType="text/html;  charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link href="https://fonts.googleapis.com/css2?family=Cairo&family=Indie+Flower&family=Koulen&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="../css/header_footer.css">
	<link type="text/css" rel="stylesheet" href="../css/responsive-tabs.css" />
    <link type="text/css" rel="stylesheet" href="../css/style.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<title>댓글 작성</title>
</head>
<style>
	section{
		width: 1200px;
		height: 700px;
		margin: 30px auto;
		border-radius: 5px;
		border:2px #030066 solid;
	}
	.contentbox{
		box-sizing:border-box;
		width: 1100px;
		height:300px;
		margin: 20px auto;
		border-radius: 5px;
		background-color: #E7E7E7;
	}
	.att_content{
		box-sizing:border-box;
		width: 1050px;
		height: 250px;
		resize: none;
		margin: 20px 25px 0 25px;
		padding-top: 10px;
	}
	.topcomment{
		margin: 20px 0 0 50px;
		}
	.comment{
		margin: 50px 0 0 50px;

	}
	.buttonbox{
		box-sizing:border-box;
		width:220px;
		height: 35px;
		margin: 70px auto 0 auto;
	}
	.backbutton{
		box-sizing:border-box;
		width:100px;
		height:35px;
		float:left;
		margin-right: 10px;
		cursor: pointer;
		font-weight: bold;
		border-radius: 5px;
		background: #E7E7E7;
		border: none;
	}
	.writebutton{
		box-sizing:border-box;
		width:100px;
		height:35px;
		cursor: pointer;
		color: white;
		font-weight: bold;
		border-radius: 5px;
		background: #030066; 
		border: none;
	}
</style>
<script>
	function back(){
		
	}
</script>

<body>
<form action="Attraction_review_insert.travel">
	<%	String mb_id=(String)session.getAttribute("mb_id");
		String att=request.getParameter("att");
		String attnum=request.getParameter("attnum");
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
		<div class="topcomment">
		<h2><%=att%> 어떠셨나요?</h2>
		</div>
		<div class="comment">
			<h3>평점을 남겨주세요.</h3>
		</div>
		<div>
			<input type="text" placeholder="평점을 입력하세요." name="att_rate">
		</div>
		<div class="comment">
			<h3>여행은 어떠셨나요?</h3>
		</div>
		<div class="contentbox">
			<textarea placeholder="위치나 교통, 편의시설 등 다른 여행자에게 추천하는 나만의 여행 팁을 알려주세요!" name="att_content" class="att_content"></textarea>
		</div>
		<div>
			<input type="hidden" id="writedate" name="writedate">
			<input type="hidden" value="<%=attnum%>" name="att_num">
			<input type="hidden" value="<%=mb_id%>" name="att_reid">
			<input type="hidden" value="<%=att%>" name="att_name">
		</div>
		<div class="buttonbox">
			<input type="button" value="취소" id="backbutton" class="backbutton">
			<input type="submit" value="글 작성" id="writebutton" class="writebutton">
		</div>
	</section>
	<jsp:include page="../overlap/footer.jsp"/>
<script>
	date =  new Date().toISOString().substring(0, 10);
	$("#writedate").val(date);
</script>
</form>
</body>
</html>