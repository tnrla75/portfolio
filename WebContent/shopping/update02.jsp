<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Item.Review" %>
<%@ page import="Item.DBconnect" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
	function winClose() {
		opener.parent.location.reload();
		myWindow.close();
	}
	var myWindow = window.open("about:blank","_self");
	self.setTimeout("winClose()",0);

</script>
<body>
	<jsp:useBean id="dbconnect" class="Item.DBconnect"></jsp:useBean>
	<%
		request.setCharacterEncoding("utf-8");
		String mb_id = (String)session.getAttribute("mb_id"); 
		String reviewNo = (String)session.getAttribute("reviewNo");
		String itemCode = request.getParameter("itemCode");
		String rate = request.getParameter("reRate");
		String reText = request.getParameter("reText");
		String rePhoto1 = request.getParameter("rePhoto1");
		String rePhoto2 = request.getParameter("rePhoto2");
		String rePhoto3 = request.getParameter("rePhoto3");
			
		int reRate = Integer.parseInt(rate);
	
		ArrayList<Review> arr = dbconnect.db();

		out.println(reviewNo);
		DBconnect db = new DBconnect();
		db.update(reRate, reText, rePhoto1, rePhoto2, rePhoto3, reviewNo);
	%>

</body>
</html>