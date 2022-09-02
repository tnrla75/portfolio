<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Item.DBconnect" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Item.Review" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
	function winClose() {
		opener.parent.location="Item.jsp";
		myWindow.close();
	}
	var myWindow = window.open("about:blank","_self");
	self.setTimeout("winClose()",0);
	
</script>
<body>
	<jsp:useBean id="dbconnect" class="Item.DBconnect"></jsp:useBean>
	<% 
		String reviewNo = (String)session.getAttribute("reviewNo");
		int i = Integer.parseInt(reviewNo);
		
		ArrayList<Review> arr = dbconnect.db();
		
		String a = arr.get(i).getReviewNo();
		
	
		DBconnect db = new DBconnect();
		db.delete(a);
	
	%>
</body>
</html>