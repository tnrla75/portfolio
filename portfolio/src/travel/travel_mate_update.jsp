<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.util.ArrayList"%>    
<%@ page import="travel_package.MateController" %>
<%@ page import="travel_package.MateDTO" %>
<!DOCTYPE html>
<html>
<head>
	<title>update</title>
	<meta charset="utf-8">
	<link href="https://fonts.googleapis.com/css2?family=Cairo&family=Indie+Flower&family=Koulen&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="../css/style.css" />
	<link rel="stylesheet" type="text/css" href="../css/header_footer.css">
	<link type="text/css" rel="stylesheet" href="../css/responsive-tabs.css" />
    <link type="text/css" rel="stylesheet" href="../css/style.css" />
    <link type="text/css" rel="stylesheet" href="../css/travel_mate_update.css" />
    
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<body>
	<form action="travel_mate_update2.jsp">	
	<%
			String mb_id = (String)session.getAttribute("mb_id"); 
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
<%
	MateController user = new MateController();
	String travelmateNum= request.getParameter("num");
	ArrayList<MateDTO> customer2= user.detail(travelmateNum);
	System.out.println(customer2);
%>
	<div class="h2"><h2>글 수정</h2></div>
	<div class="top">
		<div class="title">
			<input type="text" class="writetitle" name="travelmateTitle" value='<%=customer2.get(0).getTravelmateTitle()%>'>
			<div class="place"><input type="text" placeholder="여행장소"name="destination" value='<%=customer2.get(0).getDestination()%>'></div>
		</div>
		<div class="information">
			<div class="people">모집인원: 
				<select name="travelmateMember">
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
				</select>명
			</div>
			<div class="reservation">항공권예약유무:
				<input type="radio" name="reservation" value="o">o
				<input type="radio" name="reservation" value="x" checked>x
			</div>
			<div class="date">예상출발날짜: <input id="startdate" type="date" name="startdate" value='<%=customer2.get(0).getDepartureDate()%>'></div>
			<div class="date">예상도착날짜: <input id="arrivedate" type="date" name="arrivedate" value='<%=customer2.get(0).getArriveDate()%>'></div>
		</div>
	</div>
	<div class="middle">
		<textarea class="maincontents" name="travelmateContent" ><%=customer2.get(0).getTravelmateContent()%></textarea>
	</div>
	<div class="writebutton">
		<a href="travel_mate.jsp"><input type="button" value="취소" class="backbutton"></a>
		<input type="submit" value="글 수정" class="button">
	</div>
	<input type="hidden"id="writedate" name="writedate">
	<input type="hidden"id="num" name="travelmateNum">
</section>
<script>
	date =  new Date().toISOString().substring(0, 10);
	$("#writedate").val(date);
	
	var a =<%=request.getParameter("num")%>
	$("#num").val(a);
</script>
	<jsp:include page="../overlap/footer.jsp"/>
	</form>
</body>
</html>