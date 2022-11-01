<%@page import="vo.Hotel_yoyaku_DTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%-- <%@taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>

<%@page import="java.util.ArrayList"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<body>
<form action="hotel_batis_insert_01.jsp">
<table border="1">
	<tr><td>사번</td><td>이름</td><td>직급</td><td>전화</td></tr>
<%
	ArrayList<Hotel_yoyaku_DTO> list = (ArrayList<Hotel_yoyaku_DTO>)request.getAttribute("data");
	for(Hotel_yoyaku_DTO dto : list){
%>
	<tr>
		<td><%=dto.getHot_main_num()%></td>
		<td><%=dto.getHot_main_num()%></td>
		<td><%=dto.getHot_main_num()%></td>
		<td><%=dto.getHot_main_num()%></td>
	</tr>

<%		
	}
%>
	
</table>
<input type="submit" value="값 넣기">
</form>
</body>
</html>




