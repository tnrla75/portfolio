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
<style>
	#modal1 > *{
		padding: 0px;
		margin: 0px;
	}
		
	#modal1{
		display : none;
		z-index : 999;
		position:absolute;
		right: 565px;
		top: 257px;
		width:70%;
		height:400px;
	}
	#modal1>#content1{
		width:500px;
		height:600px;
		margin:100px auto;
		padding:20px;
		position: relative;
		background-color:#fff;
		box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
	}
		
	#modal1 .close{
		position:absolute;
		top:4px;
		right:4px;	
		font-size:20px;
		border:0;
		background-color:#F0F0F0;
	}
		
	#modal1 .close:hover,
	#modal1 .close:focus {
	  color : #000;
	  text-decoration: none;
	  cursor :pointer;
	}
	.modalul {
		width:500px;
	}
	.modalul li{
		list-style: none;
		float: left;
		width: 95px;
		height: 50px;
		line-height: 50px;
		position: relative;
		left:-60px;
		top:-36px;
	}
	.modalul li:nth-child(1){
		width: 540px;
		height: 40px;
		background-color: #F0F0F0;
		font-weight: bold;
		font-size:12pt;
		line-height: 40px;
	}
	.modalul li:nth-child(n+2){
		font-size:10pt;
		padding: 0 10px;
		margin: 2px 5px;
	}
	.modalul li:nth-child(n+2):hover{
		background-color: #5AA0FF ;
		color:white;
	}
	#btnOpen1:focus{
		outline: none;
		border-bottom: solid rgba(211, 10, 20, 0.9) 2px;
	}
	
</style>
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
		<div id='modal1'>
	<div id='content1'>
		
		<div>
			<div class="modaltitle">
				<ul class="modalul">
					<li>&nbsp;&nbsp;인기지역 <input type='button' value='X' class="close" id='btnClose1'/></li>
					<li>aaa</li>
					<li>bbb</li>
					<li>서울</li>
					<li>제주도</li>
				</ul>
			</div>
			<div class="modaltitle">
				<ul class="modalul">
					<li>&nbsp;&nbsp;대한민국</li>
					<li>서울</li>
					<li>부산</li>
					<li>제주</li>
					<li>강릉</li>
					<li>경주</li>
					<li>전주</li>
					<li>여수</li>
					<li>인천</li>
				</ul>
			</div>
			<div class="modaltitle">
				<ul class="modalul">
					<li>&nbsp;&nbsp;일본</li>
					<li>도쿄</li>
					<li>오사카</li>
					<li>교토</li>
					<li>삿포로</li>
					<li>나고야</li>
					<li>오키나와</li>
				</ul>
			</div>
			<div class="modaltitle">
				<ul class="modalul">
					<li>&nbsp;&nbsp;베트남</li>
					<li>호치민</li>
					<li>호이안</li>
					<li>다낭</li>
					<li>하노이</li>
				</ul>
			</div>
			<div class="modaltitle">
				<ul class="modalul">
					<li>&nbsp;&nbsp;기타국가</li>
					<li>태국</li>
					<li>싱가포르</li>
					<li>홍콩</li>
				</ul>
			</div>
		</div>
	</div>
</div>
<section>
	<div class="h2"><h2>모집 글 작성</h2></div>
	<div class="top">
		<div class="title">
			<input type="text" placeholder="제목을 입력하세요." class="writetitle" name="travelmateTitle">
			<div class="place"><input type="text" placeholder="여행장소"name="destination" id="btnOpen1" readonly></div>
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
		<a href="travel_mate.travel"><input type="button" value="취소" class="backbutton"></a>
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
<script>
// modal 창 1번 
	var btnOpen1  = document.getElementById('btnOpen1');
	var btnClose1 = document.getElementById('btnClose1');
	
	// modal 창을 감춤
	var closeRtn = function(){
		var modal1 = document.getElementById('modal1');
		modal1.style.display = 'none';
	}

	// modal 창을 보여줌
	btnOpen1.onclick = function(){
		var modal1 = document.getElementById('modal1');
		modal1.style.display = 'block';
	}
	window.onclick = function(e) {
		if(e.target == modal1){
			modal1.style.display = 'none';
		}
	}
	btnClose1.onclick = closeRtn;
	
	$(document).ready(function() {
		$(".modalul li:nth-child(n+2)").on('click', function(e) {
			$('#btnOpen1').val($(this).text());
			modal1.style.display = 'none';
		}); 
	});
	
</script>
</html>