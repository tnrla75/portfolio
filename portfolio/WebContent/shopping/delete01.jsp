<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제 알림창</title>
<style type="text/css">
	div {
		width: 200px;
		height: 200px;
		margin: 0  auto;
	}
	.btn:first-of-type {
		width: 95px;
		height: 45px;
		background-color: white;
		border-style: solid;
		border-color: #D5D5D5; 
		font-weight: bold;
	}
	.btn:last-of-type {
		float: right;
		width: 95px;
		height: 45px;
		color: white;
		background-color: #003399;
		border-style: solid;
		border-color: #003399;
		font-weight: bold;
	}
</style>
</head>
<body>
	<form action="delete02.jsp">
	<% 
		String reviewNo = request.getParameter("reviewNo");
		session.setAttribute("reviewNo", reviewNo);
	%>
	
		<div>
			<h4>리뷰를 삭제하시겠습니까?</h4>
			<input type="button" value="아니오" class="btn" onclick="window.close()">
			<input type="submit" value="삭제" class="btn" >
		</div>
		
	</form>
	
</body>
</html>