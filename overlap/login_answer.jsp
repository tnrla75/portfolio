
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@ page import="mate_package.MateConnect" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%	
		String login_id = request.getParameter("login_id");
		String login_pw = request.getParameter("login_pw");
		MateConnect mc = new MateConnect();
		String data = mc.login(login_id,login_pw);
		if(!(data ==null)){
			session.setAttribute("id", login_id);
			response.sendRedirect("indexpage.jsp");
		}else{
			%>
			<script>
			alert("로그인실패!");
			location.href("login.jsp");
			</script>
			<%
			 
		}
	%>

</body>
</html>