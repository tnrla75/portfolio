<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			String id = (String)session.getAttribute("id"); 
			if(id == null){
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
	<div class="h2"><h2>글 수정</h2></div>
	<div class="top">
		<div class="title">
			<input type="text" placeholder="제목을 입력하세요." class="writetitle" name="travelmateTitle">
			<div class="place"><input type="text" placeholder="여행장소"name="destination"></div>
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
			<div class="date">예상출발날짜: <input id="startdate" type="date" name="startdate"></div>
			<div class="date">예상도착날짜: <input id="arrivedate" type="date" name="arrivedate"></div>
		</div>
	</div>
<script>
	document.getElementById('startdate').value = new Date().toISOString().substring(0, 10);
	document.getElementById('arrivedate').value = new Date().toISOString().substring(0, 10);
</script>
	<div class="middle">
		<textarea class="maincontents" name="travelmateContent"></textarea>
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