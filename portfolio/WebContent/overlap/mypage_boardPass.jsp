<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="vo.Member_info"%>

<%
	Member_info member = (Member_info)request.getAttribute("member");
	String mb_id = (String)session.getAttribute("mb_id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Cairo&family=Indie+Flower&family=Koulen&display=swap" rel="stylesheet">
<link rel="stylesheet" href="../css/style.css" />
<link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../css/header_footer.css">
<link type="text/css" rel="stylesheet" href="../css/responsive-tabs.css" />
<link type="text/css" rel="stylesheet" href="../css/style2.css" />
<script src="http://use.fontawesome.com/releases/v6.1.2/js/all.js"></script>
<link rel="stylesheet" href="bang.css">
<style type="text/css"></style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="bang.js"></script>
<script type="text/javascript"></script>
<title>마이 페이지</title>
<style type="text/css">
	#info {
		margin-top: 120px;
		text-align: center;
		font-size: 30pt;
		font-family: 'Poppins', sans-serif;
		letter-spacing: 5px;
	}
	section {
		width: 1200px;
		height: 610px;
		margin: 20px auto;
	}
	#infoBox {
		float: left;
		width: 800px;
		height: fit-content;
	}	
	#infoBox table {
		margin-top: 50px;
		margin-bottom: 30px;
	}
	input:hover {
		background-color: white;
		border-color: #A3AFC9;
	}
	input:focus {
		outline: none;
		background-color: white;
		border-width: 2px;
		border-color: #A3AFC9;
	}
	select {
		border: #D5D5D5 1px solid; 
		height: 45px; 
		border-radius: 5px; 
		width: 125px; 
	}
	select:hover {
		border-color: #A3AFC9;
	}
	select:active {
		border-color: #A3AFC9;
	}
	#signupdiv2 {
		width: 750px;
		height: fit-content;
		margin: 0 auto;
		border-bottom: solid;
	}
	/* 약관동의 문제 생길때 height 바꾸면 됩니다 */
	#signupdiv2 >div{
		margin-left: 70px;
	}
	.signuplabel{
		width: 130px;
		height: 55px;
		float: left;
		line-height: 50px;
		margin: 5px;
		font-size: 10pt;
	}
	

	.signupinputbirth{
		margin: 11px 5px 10px 5px;
		border: none;
		float: left;
	}
	#signupdiv3{
		width: 600px;
		height: 200px;
		margin: 0 auto;
	}
	.signupbotdiv{
		width: 450px;
		height: 50px;
		line-height: 60px;
		float: left;
	}
	.signupradio{
		margin: 15px;
	}
	.signindiv{
		width: 600px;
		height: 100px;
		margin: 0 auto;
	}
	.signinbtn{
		float: left;
		width: 250px;
		height: 50px;
		margin-left: 180px;
		line-height: 50px;
		border-radius: 5px;
		cursor: pointer;
		background-color: white;
		font-size: 14pt;
	}
	#header{
		box-shadow: 0px 1px grey;
	}
	.errortextdiv{
		width: 320px;
		height: 0px;
		margin: 0 auto;
		text-align: left;
		font-size: 8pt;
		float: left;
	}
	.infomessage{
		border-style: none;
		position: relative;
		bottom: 13px;
		font-size: 6pt;
		width: 320px;
		left: 160px;
	}
	#email3{
		width: 100px; float: right;
	}



	.order_info {
		width: 700px;
		border-collapse: collapse;
		margin-top: 50px;
		font-size: 10pt;
		
	}
	.order_info .tableLine {
		border-style: solid;
		border-width: 1px 0 1px 0;
		border-color: #D5D5D5;
		padding: 10px;
		height: 60px;
	}
	.order_info .td1 {
		font-weight: bold;
		width: 90px;
		color: #002266;
		background-color: rgba(237,239,243, 0.7);
	}
	.order_info .td2 {
		width: 200px;
	}
	.eng-name {
		height: 35px;
		width: 200px;
	}
	
	.passnum {
		height: 35px;
		width: 200px;
	}
	.passDate {
		width: 200px;
		height: 35px;
	}
	#order_info:last-of-type {
		margin-bottom: 80px;
	}
</style>
</head>
<script>
	var hiddenidchk = document.getElementById("hiddenidchk");
	$(document).ready(function() {
		
		$(".all").click(function() {
				if($(".all").is(":checked")) $("input[name=check]").prop("checked", true);
				else $("input[name=check]").prop("checked", false);
			});
			$("input[name=check]").click(function() {
				var total = $("input[name=check]").length;
				var checked = $("input[name=check]:checked").length;
				if(total != checked) $(".all").prop("checked", false);
				else $(".all").prop("checked", true); 
			});

	});
	
	function selectEmail(ele){
	    var $ele = $(ele);
	    var $email2 = $('input[name=mb_email2]');

	    // '1'인 경우 직접입력
	    if($ele.val() == "1"){
	        $email2.attr('readonly', false);
	        $email2.val('');
	    } else {
	        $email2.attr('readonly', true);
	        $email2.val($ele.val());
	    }
	}
</script>
<script>
	$(docunment).ready(function() {
	
	});
</script>
<script>

</script>
<script>
	$(document).ready(function() {
		slide();
	  
	 	$('#nav-icon1,#nav-icon2,#nav-icon3,#nav-icon4').click(function(){
			$(this).toggleClass('open');
		});
	});
</script>
<body>
	<form name="info" action="board_update.mypage?command=board_update&mb_id=<%= mb_id %>" method="post" onsubmit="return signupchk()">
		<%
			
			if(mb_id == null){
				%>
				<jsp:include page="../overlap/header_login.jsp"/>
				<script>
					location.href="../index.jsp";
				</script>
				<%
			}else{
				%>
				<jsp:include page="../overlap/header_logout.jsp"/>
				<%
			}
		%>
		
		<header id="info">
			<h3>MY PAGE</h3>
		</header>
		<section>
			<jsp:include page="myPageMenu.jsp" />
			<div id="infoBox">
				<div id="signupdiv2">
					<h2>여권정보</h2>
				</div>
				<table align="center" cellpadding="10px" class="order_info">
					<tr class="tableLine">
						<td class="td1">Last Name<span style="color: red;">*</span></td>
						<% if (member.getMb_lastname() == null) { %>
							<td class="td2"><input type="text" name="mb_lastname" placeholder="Last name(성)" class="eng-name" id="elastname"></td>
						<% } else {%>
						<td class="td2"><input type="text" name="mb_lastname" placeholder="Last name(성)" class="eng-name" value="<%= member.getMb_lastname()%>" readonly style="background-color: rgba(213, 213, 213, 0.3);"></td>
						<% } %>
						<td class="td1">First Name<span style="color: red;">*</span></td>
						<% if (member.getMb_firstname() == null) { %>
							<td class="td2"><input type="text" name="mb_firstname" placeholder="First name(이름)" class="eng-name" id="efirstname"></td>
						<% } else {%>
							<td class="td2"><input type="text" name="mb_firstname" placeholder="First name(이름)" class="eng-name" value="<%= member.getMb_firstname()%>" readonly style="background-color: rgba(213, 213, 213, 0.3);"></td>
						<% } %>
					</tr>
					<tr class="tableLine">
						<td class="td1">여권번호<span style="color: red;">*</span></td>
						<% if (member.getMb_passnum() == null) { %>
							<td class="td2"><input type="text" name="mb_passnum" class="passnum"></td>
						<% } else {%>
							<td class="td2"><input type="text" name="mb_passnum" class="passnum" value="<%= member.getMb_passnum()%>"></td>
						<% } %>
						<td class="td1">여권만료일<span style="color: red;">*</span></td>
						<% if (member.getMb_exdate() == null) { %>
							<td class="td2"><input type="text" name="mb_exdate" class="passnum"></td>
						<% } else {%>
							<td class="td2"><input type="text" name="mb_exdate" class="passnum" value="<%= member.getMb_exdate()%>"></td>
						<% } %>					
					</tr>
				</table>
				<div class="signindiv">
					<input type="submit" class="signinbtn" style="background-color: #030066;color: white;" id="signupbtn2" value="수정하기">
				</div>
			</div>
			
		</section>
		<jsp:include page="../overlap/footer.jsp"/>
	</form>
<script>

	var elastname = document.getElementById("elastname");
	var efirstname = document.getElementById("efirstname");



	// 유효성 검사
	// 1 id, pwd / 소문자 대문자 4 ~ 12자리까지
	// 2 이름(영문) / 영어로만
	var reg1 = /^[a-zA-Z0-9]{4,12}$/
	var reg2 = /[a-zA-Z]/;

	elastname.onblur = function (){
		if(!reg2.test(elastname.value)){
			enamem.innerText="영어를 입력하세요.";
		}
		else if(reg2.test(elastname.value) && reg2.test(efirstname.value)){
			enamem.innerText="";
		}
	}
	efirstname.onblur = function (){
		if(!reg2.test(efirstname.value)){
			enamem.innerText="영어를 입력하세요.";
		}
		else if(reg2.test(elastname.value) && reg2.test(efirstname.value)){
			enamem.innerText="";
		}
	}
	

</script>
</body>
</html>