<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	String mb_id = (String)session.getAttribute("mb_id");
	session.removeAttribute("mb_id");
	%>
	<script>
	location.href= document.referrer;
	</script>
</body>
</html>