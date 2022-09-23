
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@ page import="Connect.Connect" %>    
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
		Connect mc = new Connect();
		String data = mc.login(login_id,login_pw);
		if(!(data ==null)){
			session.setAttribute("mb_id", login_id);
			response.sendRedirect("indexpage.jsp");
		}else{
			out.println("<script>");
			out.println("alert('fail');");
			out.println("history.back();");
			out.println("</script>");
			}
			%>
		
	

</body>
</html>