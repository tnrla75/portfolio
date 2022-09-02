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
		opener.parent.location="Item.jsp";
		myWindow.close();
	}
	var myWindow = window.open("about:blank","_self");
	self.setTimeout("winClose()",0);
</script>
<body>
	<%

	 	request.setCharacterEncoding("utf-8");
		String reviewNo = request.getParameter("reviewNo");
		String itemCode = request.getParameter("itemCode");
		String rate = request.getParameter("reRate");
		String reText = request.getParameter("reText");
		String rePhoto1 = request.getParameter("rePhoto1");
		String rePhoto2 = request.getParameter("rePhoto2");
		String rePhoto3 = request.getParameter("rePhoto3");
		
		String mb_id = (String) session.getAttribute("mb_id");
		session.setAttribute("itemCode", itemCode);
		session.setAttribute("reRate", rate);
		session.setAttribute("reText", reText);
		session.setAttribute("rePhoto1", rePhoto1);
		session.setAttribute("rePhoto2", rePhoto2);
		session.setAttribute("rePhoto3", rePhoto3);
		

		
		int reRate = Integer.parseInt(rate);

		
		DBconnect db = new DBconnect();
		db.insert(mb_id, itemCode, reRate, reText, rePhoto1, rePhoto2, rePhoto3);
	%>
</body>
</html>