<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Item.DBconnect" %>
<!DOCTYPE html>


<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
	function winClose() {
		/* opener.parent.location.href="itemDetail.jsp?itemCode="+itemCode; */
		opener.parent.location.reload();
		myWindow.close();
	}
	var myWindow = window.open("about:blank","_self");
	self.setTimeout("winClose()",0); //1000이 1
</script>
<body>
	<%
	 	request.setCharacterEncoding("utf-8");
		String reviewNo = request.getParameter("reviewNo");
		String rate = request.getParameter("reRate");
		String reText = request.getParameter("reText");
		String rePhoto1 = request.getParameter("rePhoto1");
		String rePhoto2 = request.getParameter("rePhoto2");
		String rePhoto3 = request.getParameter("rePhoto3");
		
		String mb_id = (String) session.getAttribute("mb_id");
		String itemCode = (String)session.getAttribute("itemCode");
		System.out.println("==zzz");
		int reRate = Integer.parseInt(rate);

		DBconnect db = new DBconnect();
		db.insert(mb_id, itemCode, reRate, reText, rePhoto1, rePhoto2, rePhoto3);
	%>
</body>
</html>