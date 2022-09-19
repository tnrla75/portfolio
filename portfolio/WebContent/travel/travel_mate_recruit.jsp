<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<meta charset="utf-8">
	<link href="https://fonts.googleapis.com/css2?family=Cairo&family=Indie+Flower&family=Koulen&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="../css/style.css" />
	<link rel="stylesheet" type="text/css" href="../css/header_footer.css">
	<link type="text/css" rel="stylesheet" href="../css/responsive-tabs.css" />
    <link type="text/css" rel="stylesheet" href="../css/style.css" />
    <link type="text/css" rel="stylesheet" href="../css/travel_mate_recruit.css" />
    
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<body>
	<form action="travel_mate_recruit2.jsp">	
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
	<div class="h2"><h2>모집 글 작성</h2></div>
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
			<div class="date">예상출발날짜: <input id="startdate" type="date" name="startdate" onchange="datechange()"></div>
			<div class="date">예상도착날짜: <input id="arrivedate" type="date" name="arrivedate"></div>
		</div>
	</div>
<script>
	window.onload=function(){
		document.getElementById('startdate').value = new Date().toISOString().substring(0, 10);
		document.getElementById('arrivedate').value = new Date().toISOString().substring(0, 10);
		var today = new Date().toISOString().substring(0, 10);
		document.getElementById("startdate").setAttribute("min", today);
	}
	
	function datechange(){
		alert("a");
		
	}
</script>
	<div class="middle">
		<textarea class="maincontents" name="travelmateContent"></textarea>
	</div>
	<div class="writebutton">
		<a href="travel_mate.jsp"><input type="button" value="취소" class="backbutton"></a>
		<input type="submit" value="글 작성" class="button">
	</div>
	<input type="hidden"id="writedate" name="writedate">
</section>
<script>
	date =  new Date().toISOString().substring(0, 10);
	$("#writedate").val(date);
</script>
	<jsp:include page="../overlap/footer.jsp"/>
	</form>
</body>
</html>