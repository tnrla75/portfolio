<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<meta charset="utf-8">
	<link href="https://fonts.googleapis.com/css2?family=Cairo&family=Indie+Flower&family=Koulen&display=swap" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script src="https://kit.fontawesome.com/e008e677ae.js" crossorigin="anonymous"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<link rel="stylesheet" href="../assets/css/style.css" />
	<link rel="stylesheet" type="text/css" href="../css/header_footer.css">
	<link type="text/css" rel="stylesheet" href="../css/responsive-tabs.css" />
    <link type="text/css" rel="stylesheet" href="../css/style.css" />
	<style>
		header:not{
			margin: 0;
			padding: 0;
		}
		
		div{
			/*border: solid black 2px;
			box-sizing: border-box;*/
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
		#signupdiv1{
			margin: 0 auto;
			font-size: 20pt;
			width: 600px;
			height:	190px;
			border-bottom: solid;
		}
		#signupdiv1 section{
			text-align: center;
			line-height: 150px;
		}
		#signupdiv1 > div{
			width: 600px;
		}
		#signupdiv2 {
			width: 600px;
			height: 1000px;
			margin: 0 auto;
			border-bottom: solid;
		}
		/* 약관동의 문제 생길때 height 바꾸면 됩니다 */
		#signupdiv2 >div{
			
		}
		.signuplabel{
			width: 130px;
			height: 55px;
			float: left;
			line-height: 50px;
			margin: 5px;
			font-size: 10pt;
		}
		.signupinputdiv{
			width: 320px;
			height: 50px;
			float: left;
			margin: 10px;
		}
		.signupinputdiv{
			
			height: 50px;
			float: left;
			margin: 10px;
		}
		.signupinput{
			width: 320px;
			height: 40px;
			font-size: 14px;
			padding-left: 10px;
			border: #D5D5D5 1px solid;
			border-radius: 5px;
		}
		.signupsidebtn{
			width: 100px;
			height: 50px;
			float: left;
			margin: 5px;
		}
		.signupsidebtn > button , #idchkbtn, #emailchkbtn{
			width: 100px;
			height: 45px;
			background: #030066;
			color: white;
			font-weight: bold;
			border-radius: 5px;
			margin: 5px 10px;
			cursor: pointer;
		}
		#addressbtn{
			width: 100px;
			height: 45px;
			background: #030066;
			color: white;
			font-weight: bold;
			border-radius: 5px;
			margin: 5px 10px;
			cursor: pointer;
		}
		#signupid{
			float: left;
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
			margin: 10px 20px;
			text-align: center;
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
		/*Radio*/
		.container {
			height: 20px;
			position: relative;
			bottom: 30px;
		}
		.container ul{
			list-style: none;
			padding-left: 0px;
			position: relative;
			font-size: 10pt;
			right: 10px;
		}
		.container li {
			display: inline-block;
			color: #AAAAAA;
			position: relative;
		}
		ul li input[type=radio]{
		  position: absolute;
		  visibility: hidden;
		}
		ul li label{
		display: block;
		position: relative;
		font-size: 12pt;
		padding: 20px 0px 5px 40px;
		margin: 10px auto;
		z-index: 9;
		cursor: pointer;
		-webkit-transition: all 0.25s linear;
		}
		ul li:hover label{
			color: #FFFFFF;
		}
		ul li .check{
			position: absolute;
			border: 5px solid #AAAAAA;
			border-radius: 100%;
			height: 10px;
			width: 10px;
			top: 30px;
			left: 20px;
			z-index: 5;
			transition: border .25s linear;
			-webkit-transition: border .25s linear;
		}
		ul li .check::before {
			position: absolute;
			content: '';
			border-radius: 100%;
			height: 8px;
			width: 8px;
			top: 1.1px;
			left: 1.1px;
		}
		input[type=radio]:checked ~ .check {
		  border: 5px solid #002266;
		}
		input[type=radio]:checked ~ .check::before{
		  background: #002266;
		}
		input[type=radio]:checked ~ label{
		  color: black;
		}
		.terms {
			width: 600px;
			height: fit-contents;
			margin: 0 auto;
			padding-top: 20px;
			overflow: auto;
		}
		#terms1 {
			padding-top: 20px;
			width: 598px;
			height: 100px;
			margin: 0 auto;
			border-style: solid;
			border-color: #D5D5D5;
			border-width: 1px;
			overflow: auto;
			font-size: 10pt;
		}
		.terms_wr {
			padding-top: 20px;
		}
		#terms2 {
			padding-top: 20px;
			width: 598px;
			height: 100px;
			margin: 0 auto;
			border-style: solid;
			border-color: #D5D5D5;
			border-width: 1px;
			overflow: auto;
			font-size: 10pt;
		}
		#terms3 {
			padding-top: 20px;
			width: 598px;
			height: 100px;
			margin: 0 auto;
			border-style: solid;
			border-color: #D5D5D5;
			border-width: 1px;
			overflow: auto;
			font-size: 10pt;
		}
		.terms h3{
			width: 600px;
			border-style: solid;
			border-width: 0 0 2px 0;
			border-color: #747474;
		}
		.terms label {
			font-size: 10pt;
		}
		.terms p:first-of-type {
			width: 655px;
			margin-bottom: 20px;
			height: fit-contents;
			border-style: solid;
			border-color: #D5D5D5;
			border-width: 0 0 1px 0;
		}
		.terms a {
			float: right;
			font-size: 10pt;
			border-style: solid;
			background-color: white;
			border-radius: 2px;
			padding: 3px;
			border-width: 1px;
			color: #003399;
			border-color: #003399;
		}
		.terms .checks:last-of-type{
			border-style: solid;
			border-width: 0 0 1px 0;
			padding-bottom: 15px;
			border-color: #BDBDBD;
		}
		/*Check Box*/
		.checks {position: relative;}
		.terms div:first-of-type {
			margin-top: 0px;
			border-style: solid;
			border-width: 0 0 1px 0;
			border-color: ;
		}
		.terms div:first-of-type span {
			position: relative;
			bottom: 10px;
		}
		.terms div:first-of-type span {
			position: relative;
			bottom: 10px;
		}
		.terms div:last-of-type span {
			position: relative;
			left: 50px;
		}
		.checks input[type="checkbox"] {  /* 실제 체크박스는 화면에서 숨김 */
			position: absolute;
			width: 1px;
			height: 1px;
			padding: 0;
			margin: -1px;
			overflow: hidden;
			clip:rect(0,0,0,0);
			border: 0
		}
		.checks input[type="checkbox"] + label {
			display: inline-block;
			position: relative;
			cursor: pointer;
			-webkit-user-select: none;
			-moz-user-select: none;
			-ms-user-select: none;
		}
		.checks input[type="checkbox"] + label:before {  /* 가짜 체크박스 */
			content: ' ';
			display: inline-block;
			width: 15px;  /* 체크박스의 너비를 지정 */
			height: 15px;  /* 체크박스의 높이를 지정 */
			/*line-height: 30px;  세로정렬을 위해 높이값과 일치 */
			margin: -2px 8px 0 0;
			text-align: center; 
			vertical-align: middle;
			background: #fafafa;
			border: 1px solid #d3d3d3;
			/*border-radius : 3px;*/
			/*box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05);*/
		}
		.checks input[type="checkbox"] + label:active:before,
		.checks input[type="checkbox"]:checked + label:active:before {
			box-shadow: 0 1px 2px rgba(0,0,0,0.05), inset 0px 1px 3px rgba(0,0,0,0.1);
		}

		.checks input[type="checkbox"]:checked + label:before {  /* 체크박스를 체크했을때 */ 
			content: '\2714';  /* 체크표시 유니코드 사용 */
			color: #221DB5;  
			background: #ffffff;
			border-color: #b3b3b3;  
			/*box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05), inset 15px 10px -12px rgba(255,255,255,0.1);*/
		}
		.checks.etrans input[type="checkbox"] + label {
			padding-left: 30px;
		}
		.checks.etrans input[type="checkbox"] + label:before {
			position: absolute;
			left: 0;
			top: 0;
			margin-top: 0;
			opacity: .6;
			box-shadow: none;
			border-color: #d3d3d3;  
			-webkit-transition: all .12s, border-color .08s;
			transition: all .12s, border-color .08s;
		}
		.checks.etrans input[type="checkbox"]:checked + label:before {
			position: absolute;
			content: "";
			width: 10px;
			top: -5px;
			left: 5px;
			border-radius: 0;
			opacity:1; 
			background: transparent;
			border-color:transparent #221DB5 #221DB5 transparent;  
			border-top-color:transparent;
			border-left-color:transparent;
			-ms-transform:rotate(45deg);
			-webkit-transform:rotate(45deg);
			transform:rotate(45deg);
		}
		.no-csstransforms .checks.etrans input[type="checkbox"]:checked + label:before {
			/*content:"\2713";*/
			content: "\2714";
			top: 0;
			left: 0;
			width: 21px;
			line-height: 21px;
			color: #6cc0e5;
			text-align: center;
			border: 1px solid #6cc0e5;
		}
		a {
			text-decoration-line: none;
			color: black;
		}
		a:hover {
			color: black;
		}
		a:active {
			color: black;
		}
		a:visited {
			color: black;
		}
		
	</style>
</head>
<script>
	var hiddenidchk = document.getElementById("hiddenidchk");
	$(document).ready(function() {
		$('#idchkbtn').click(function(){
			
			var mb_id =  $('#id').val();

			$.ajax({
				url: "idchkbtn.jsp?mb_id="+mb_id,
				dataType : "html",
				success:function(data){
				
					if(data== 0){
						$("#idm").html('중복된 아이디입니다.');
						$("#hiddenidchk").val('0');
					}
					else{
						$("#idm").html('사용가능한 아이디입니다.');
						$("#hiddenidchk").val('1');
					}
				},
				error : function(){
					alert("아이디 중복확인 오류입니다.");
				}
			});
		});
		
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
		$('.terms1').hide();
		$('.terms2').hide();
		$('.terms3').hide();

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
	
	// 이용약관
	var bDisplay1 = true; 
	function doDisplay1(){
        var con = document.getElementById("terms1"); 	
        if(con.style.display=='none'){ 	
            con.style.display = 'block'; 	
        }else{ 		
            con.style.display = 'none'; 	
        } 
    }
    var bDisplay2 = true; 
    function doDisplay2(){ 	
        var con = document.getElementById("terms2"); 	
        if(con.style.display=='none'){ 		
            con.style.display = 'block'; 	
        }else{ 		
            con.style.display = 'none'; 	
        } 
    }
    var bDisplay3 = true; 
    function doDisplay3(){ 	
        var con = document.getElementById("terms3"); 	
        if(con.style.display=='none'){ 		
            con.style.display = 'block'; 	
        }else{ 		
            con.style.display = 'none'; 	
        } 
    }
	
	</script>

<body>
<form name="myform" action="signuppage_result.jsp" onsubmit="return signupchk()">
<input type="hidden"  id="hiddenidchk" value="3">
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
	<div id="signupdiv1">
		<div>
			<section>
				회원가입
			</section>
		</div>
		<div style="float: right;">
			<p style="font-size: 9pt; float: right;"><span style="color: red;">*</span>필수 입력 사항</p>
		</div>
	</div>
	<div id="signupdiv2">
		<div id="signupid">
			<div class="signuplabel">
				아이디<span style="color: red;">*</span>
			</div>
			<div class="signupinputdiv">
				<input type="text" placeholder="아이디를 입력하세요." class="signupinput" id="id" name="mb_id" maxlength="12" oninput="this.value = this.value.replace(/[^a-zA-Z0-9.]/g, '').replace(/(\..*)\./g, '$1');">
			</div>
			<div class="signupsidebtn">
				
				<input type="button" value="중복 확인" id="idchkbtn">
			</div>
		</div>
		<div class="errortextdiv" >
			<span id="idm" class="infomessage"></span>
		</div>
		<div id="signupid">
			<div class="signuplabel">
				비밀번호<span style="color: red;">*</span>
			</div>
			<div class="signupinputdiv">
				<input type="password" placeholder="비밀번호를 입력하세요." class="signupinput" id="pwd1" name="mb_pw" maxlength="12" oninput="this.value = this.value.replace(/[^a-zA-Z0-9.]/g, '').replace(/(\..*)\./g, '$1');"> 
			</div>
			<div class="signupsidebtn">
				
			</div>
			<div class="errortextdiv" >
				<span id="pwd1m" class="infomessage"></span>
			</div>
		</div>
		<div id="signupid">
			<div class="signuplabel">
				비밀번호 확인<span style="color: red;">*</span>
			</div>
			<div class="signupinputdiv">
				<input type="password" placeholder="비밀번호를 한번 더 입력하세요." class="signupinput" id="pwd2" maxlength="12" oninput="this.value = this.value.replace(/[^a-zA-Z0-9.]/g, '').replace(/(\..*)\./g, '$1');">
			</div>
			<div class="signupsidebtn">
				
			</div>
		</div>
		<div class="errortextdiv" >
			<span id="pwd2m" class="infomessage"></span>
		</div>
		<div id="signupid">
			<div class="signuplabel">
				이름<span style="color: red;">*</span>
			</div>
			<div class="signupinputdiv">
				<input type="text" placeholder="이름을 입력해 주세요." class="signupinput" id="name" name="mb_name" >
			</div>
			<div class="signupsidebtn">
				
			</div>
		</div>
		<div class="errortextdiv" >
			<span id="namem" class="infomessage"></span>
		</div>
		<div id="signupid">
			<div class="signuplabel">
				이름(영문)
			</div>
			<div class="signupinputdiv" style="width:350px;">
				<input type="text" placeholder="HONG" style="width: 137px; float: left; margin-right: 30px;" class="signupinput" id="elastname" name="mb_firstname">
				<input type="text" placeholder="GILDONG" style="width: 137px;" class="signupinput" id="efirstname"  name="mb_lastname">
			</div>
			
		</div>
		<div class="errortextdiv" >
			<span id="enamem" class="infomessage"></span>
		</div>
		<div id="signupid">
			<div class="signuplabel">
				여권 번호
			</div>
			<div class="signupinputdiv">
				<input type="text" placeholder="여권 번호를 입력하세요." class="signupinput" id="phone" name="mb_passnum" maxlength="20" oninput="this.value = this.value.replace(/[^a-zA-Z0-9.]/g, '').replace(/(\..*)\./g, '$1');">
			</div>
			<div class="signupsidebtn">
				
			</div>
		</div>
		<div id="signupid">
			<div class="signuplabel">
				여권 유효기간
			</div>
			<div class="signupinputdiv" style="width: 320px;height: 40px;padding-left: 10px;border: #D5D5D5 1px solid;border-radius: 5px;">
				 
				<input type="text" placeholder="YYYY" class="signupinputbirth" style="width: 100px;" id="byear" name="mb_exdate1" maxlength="4" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
				<input type="text" placeholder="MM" class="signupinputbirth" style="width: 60px;" id="bmonth" name="mb_exdate2" maxlength="2" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
				
				
			</div>
			
		</div>
		<div id="signupid">
			<div class="signuplabel">
				이메일<span style="color: red;">*</span>
			</div>
			<div class="signupinputdiv" style="width:330px;">
				<input type="text" class="signupinput"  style="width: 80px;" id="email1" name="mb_email1">
				
				<span>&nbsp@</span>
				<input type="text" class="signupinput"  style="width: 80px;" name="mb_email2">
				<select id="email3" name="mb_email3" onChange="selectEmail(this)">
					<option value="1">직접 입력</option>
					<option value="naver.com">naver.com</option>
					<option value="daum.net">daum.net</option>
					<option value="gmail.com">gmail.com</option>
				</select>
			</div>
			<div class="signupsidebtn" style="right: 10px; position: relative;">
				<input type="button" value="중복확인" id="emailchkbtn">
			</div>
		</div>
		<div class="errortextdiv" >
			<span id="emailm" class="infomessage"></span>
		</div>
		<div id="signupid">
			<div class="signuplabel">
				주소
			</div>
			<div class="signupinputdiv">
				<input type="text" placeholder="주소 검색" class="signupinput" 
				id="sample6_address" name="mb_address" readonly> 
			</div>
			<div class="signupsidebtn">
				<input type="button" onclick="sample6_execDaumPostcode()" value="주소 찾기" id="addressbtn" ><br>
			</div>
		</div>

		
		<div id="signupid">
			<div class="signuplabel">
				상세주소
			</div>
			<div class="signupinputdiv">
				<input type="text" placeholder="주소를 자세히 입력하세요." class="signupinput" id="sample6_detailAddress" name="mb_detailaddress">
			</div>
			<div class="signupsidebtn">
			</div>
		</div>
		<div id="signupid">

			<div class="signuplabel">
				전화번호
			</div>
			<div class="signupinputdiv" style="width: 400px;">
			<select id="" name="mb_phonenum1" style="width:100px;">
				<option>선택</option>
				<option value="+1">+1(미국)</option>
				<option value="+81">+81(일본)</option>
				<option value="+82">+82(대한민국)</option>
				<option value="+84">+84(베트남)</option>
				<option value="+86">+86(중국)</option>
			</select>
				<input type="text" placeholder="숫자만 입력해주세요." class="signupinput" id="phone" name="mb_phonenum2" style="width: 215px;" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
			</div>
			
		</div>
		<div id="signupid">
			<div class="signuplabel">
				성별
			</div>
			<div class="signupinputdiv">
				<div class="container">
						<ul>
							<li>
								<input type="radio" id="f-option" name="mb_gender" value="남">
								<label for="f-option">남</label>
								<div class="check"></div>
							</li>
							<li>
								<input type="radio" id="s-option" name="mb_gender" value="여">
								<label for="s-option">여</label>
								<div class="check"><div class="inside"></div></div>
							</li>
							
						</ul>
				</div>
			</div>
			<div class="signupsidebtn">
				
			</div>
		</div>
		
		<div id="signupid">
			<div class="signuplabel">
				생년월일
			</div>
			<div class="signupinputdiv" style="width: 320px;height: 40px;padding-left: 10px;border: #D5D5D5 1px solid;border-radius: 5px;">
				 
				<input type="text" placeholder="YYYY" class="signupinputbirth" style="width: 100px;" id="byear" name="mb_birth1" maxlength="4" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
				<input type="text" placeholder="MM" class="signupinputbirth" style="width: 60px;" id="bmonth" name="mb_birth2" maxlength="2" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
				<input type="text" placeholder="DD" class="signupinputbirth" style="width: 60px;" id="bday" name="mb_birth3" maxlength="2" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
				
			</div>
		</div>
	</div>
	<div class="terms">
			<h3>약관동의</h3>
			<div class="checks etrans">
				<span>
					<input type="checkbox" id="ex_chk" name="all" class="all"> 
			  		<label for="ex_chk">이용약관 및 개인정보수집 및 이용, 정보수신(선택)에 동의합니다.</label>
				</span>
			</div><br />
			<div class="checks etrans">
			  <input type="checkbox" id="ex_chk2" name="check"> 
			  <label for="ex_chk2">[필수] 이용약관 동의</label> 
			   <a href="javascript:doDisplay1();"> 약관보기</a>
			  <div class="terms1"  id="terms1">
			  <b>제1조(목적)</b><br/>
				이 약관은 (주)세정서울지사(전자상거래 사업자)가 운영하는 디디에 두보 공식몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리.의무 및 책임사항을 규정함을 목적으로 합니다.<br/>
				※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」<br/>

			  <b>제2조(정의)</b><br/>
				① “몰”이란 (주)세정서울지사는 용역(이하 “재화 등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.<br/>
				② “이용자”란 “몰”에 접속하여 이 약관에 따라 “몰”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.<br/>
				③ ‘회원’이라 함은 “몰”에 회원등록을 한 자로서, 계속적으로 “몰”이 제공하는 서비스를 이용할 수 있는 자를 말합니다.<br/>
				④ ‘비회원’이라 함은 회원에 가입하지 않고 “몰”이 제공하는 서비스를 이용하는 자를 말합니다.<br/>

			<b>제3조 (약관 등의 명시와 설명 및 개정)</b><br/>
			① “몰”은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호.모사전송번호.전자우편주소, 사업자등록번호, 통신판매업 신고번호, 개인정보보호책임자등을 이용자가 쉽게 알 수 있도록 00 사이버몰의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.<br/>
			② “몰은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회.배송책임.환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.<br/>
			③ “몰”은 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.<br/>
			④ “몰”이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 “몰“은 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다.<br/>
			⑤ “몰”이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 “몰”에 송신하여 “몰”의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.<br/>
			⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자 보호지침 및 관계법령 또는 상관례에 따릅니다.<br/>

			<b>제4조(서비스의 제공 및 변경)</b><br/>
			① “몰”은 다음과 같은 업무를 수행합니다.<br/>
			  1. 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결<br/>
			  2. 구매계약이 체결된 재화 또는 용역의 배송<br/>
			  3. 기타 “몰”이 정하는 업무<br/>
			② “몰”은 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다.<br/>
			③ “몰”이 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다.<br/>
			④ 전항의 경우 “몰”은 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.<br/>


			</b>제5조(회원가입)</b><br/>
			① 이용자는 “몰”이 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.<br/>
			② “몰”은 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하지 않는 한 회원으로 등록합니다.<br/>
			  1. 가입신청자가 이 약관 제7조제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제7조제3항에 의한 회원자격 상실 후 3년이 경과한 자로서 “몰”의 회원재가입 승낙을 얻은 경우에는 예외로 한다.<br/>
			  2. 등록 내용에 허위, 기재누락, 오기가 있는 경우<br/>
			  3. 기타 회원으로 등록하는 것이 “몰”의 기술상 현저히 지장이 있다고 판단되는 경우<br/>
			③ 회원가입계약의 성립 시기는 “몰”의 승낙이 회원에게 도달한 시점으로 합니다.<br/>
			④ 회원은 회원가입 시 등록한 사항에 변경이 있는 경우, 상당한 기간 이내에 “몰”에 대하여 회원정보 수정 등의 방법으로 그 변경사항을 알려야 합니다.<br/>

			</b>제6조(회원 탈퇴 및 자격 상실 등)</b><br/>
			① 회원은 “몰”에 언제든지 탈퇴를 요청할 수 있으며 “몰”은 즉시 회원탈퇴를 처리합니다.<br/>
			② 회원이 다음 각 호의 사유에 해당하는 경우, “몰”은 회원자격을 제한 및 정지시킬 수 있습니다.<br/>
			  1. 가입 신청 시에 허위 내용을 등록한 경우<br/>
			  2. “몰”을 이용하여 구입한 재화 등의 대금, 기타 “몰”이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우<br/>
			  3. 다른 사람의 “몰” 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우<br/>
			  4. “몰”을 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우<br/>
			③ “몰”이 회원 자격을 제한.정지 시킨 후, 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 “몰”은 회원자격을 상실시킬 수 있습니다.<br/>
			④ “몰”이 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소 전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.<br/>

			</b>제7조(개인정보보호)</b><br/>
			① “몰”은 이용자의 개인정보 수집시 서비스제공을 위하여 필요한 범위에서 최소한의 개인정보를 수집합니다.<br/>
			② “몰”은 회원가입시 구매계약이행에 필요한 정보를 미리 수집하지 않습니다. 다만, 관련 법령상 의무이행을 위하여 구매계약 이전에 본인확인이 필요한 경우로서 최소한의 특정 개인정보를 수집하는 경우에는 그러하지 아니합니다.<br/>
			③ “몰”은 이용자의 개인정보를 수집·이용하는 때에는 당해 이용자에게 그 목적을 고지하고 동의를 받습니다.<br/>
			④ “몰”은 수집된 개인정보를 목적외의 용도로 이용할 수 없으며, 새로운 이용목적이 발생한 경우 또는 제3자에게 제공하는 경우에는 이용·제공단계에서 당해 이용자에게 그 목적을 고지하고 동의를 받습니다. 다만, 관련 법령에 달리 정함이 있는 경우에는 예외로 합니다.<br/>
			⑤ “몰”이 제2항과 제3항에 의해 이용자의 동의를 받아야 하는 경우에는 개인정보보호 책임자의 신원(소속, 성명 및 전화번호, 기타 연락처), 정보의 수집목적 및 이용목적, 제3자에 대한 정보제공 관련사항(제공받은자, 제공목적 및 제공할 정보의 내용) 등 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」 제22조제2항이 규정한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지 이 동의를 철회할 수 있습니다.<br/>
			⑥ 이용자는 언제든지 “몰”이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 “몰”은 이에 대해 지체 없이 필요한 조치를 취할 의무를 집니다. 이용자가 오류의 정정을 요구한 경우에는 “몰”은 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다.<br/>
			⑦ “몰”은 개인정보 보호를 위하여 이용자의 개인정보를 처리하는 자를 최소한으로 제한하여야 하며 신용카드, 은행계좌 등을 포함한 이용자의 개인정보의 분실, 도난, 유출, 동의 없는 제3자 제공, 변조 등으로 인한 이용자의 손해에 대하여 모든 책임을 집니다.<br/>
			⑧ “몰” 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체 없이 파기합니다.<br/>
			⑨ “몰”은 개인정보의 수집·이용·제공에 관한 동의란을 미리 선택한 것으로 설정해두지 않습니다. 또한 개인정보의 수집·이용·제공에 관한 이용자의 동의거절시 제한되는 서비스를 구체적으로 명시하고, 필수수집항목이 아닌 개인정보의 수집·이용·제공에 관한 이용자의 동의 거절을 이유로 회원가입 등 서비스 제공을 제한하거나 거절하지 않습니다.<br/>


			<b>제8조(이용자의 의무)</b><br/>
			이용자는 다음 행위를 하여서는 안 됩니다.<br/>
			1. 신청 또는 변경시 허위 내용의 등록<br/>
			2. 타인의 정보 도용<br/>
			3. “몰”에 게시된 정보의 변경<br/>
			4. “몰”이 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시<br/>
			5. “몰” 기타 제3자의 저작권 등 지적재산권에 대한 침해<br/>
			6. “몰” 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위<br/>
			7. 외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 몰에 공개 또는 게시하는 행위<br/>
			  </div>
			</div><br />
			<div class="checks etrans">
			  <input type="checkbox" id="ex_chk3" name="check"> 
			  <label for="ex_chk3">[필수] 개인정보 수집 이용 동의</label>
			  <a href="javascript:doDisplay2();"> 약관보기</a>
			   <div class="terms2"  id="terms2">
			   		1. 개인정보 수집목적 및 이용목적<br/>

					가. 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산<br/>

					콘텐츠 제공 , 구매 및 요금 결제 , 물품배송 또는 청구지 등 발송 , 금융거래 본인 인증 및 금융 서비스<br/>

					나. 회원 관리<br/>

					회원제 서비스 이용에 따른 본인확인 , 개인 식별 , 불량회원의 부정 이용 방지와 비인가 사용 방지 , 가입 의사 확인 , 연령확인 , 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인, 불만처리 등 민원처리 , 고지사항 전달<br/>

					2. 수집하는 개인정보 항목 : 이름 , 생년월일 , 성별 , 로그인ID , 비밀번호 , 자택 전화번호 , 휴대전화번호 , 이메일 , 14세미만 가입자의 경우 법정대리인의 정보<br/>

					3. 개인정보의 보유기간 및 이용기간<br/>

					원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.<br/>

					가. 회사 내부 방침에 의한 정보 보유 사유<br/>

					o 부정거래 방지 및 쇼핑몰 운영방침에 따른 보관 : OO년<br/>

					나. 관련 법령에 의한 정보보유 사유<br/>

					o 계약 또는 청약철회 등에 관한 기록<br/>

					-보존이유 : 전자상거래등에서의소비자보호에관한법률<br/>

					-보존기간 : 5년<br/>

					o 대금 결제 및 재화 등의 공급에 관한 기록<br/>

					-보존이유: 전자상거래등에서의소비자보호에관한법률<br/>

					-보존기간 : 5년<br/>

					o 소비자 불만 또는 분쟁처리에 관한 기록<br/>

					-보존이유 : 전자상거래등에서의소비자보호에관한법률<br/>

					-보존기간 : 3년 <br/>

					o 로그 기록 <br/>

					-보존이유: 통신비밀보호법<br/>

					-보존기간 : 3개월<br/>

					※ 동의를 거부할 수 있으나 거부시 회원 가입이 불가능합니다.<br/>
			   </div>
			</div><br />
			<div class="checks etrans">
			  <input type="checkbox" id="ex_chk4" name="check" name="mb_agree1">
			  <label for="ex_chk4">[선택]SNS 수신 동의</label>
			  <span><input type="checkbox" id="ex_chk5" name="check" name="mb_agree2">  
			  <label for="ex_chk5">[선택]이메일 수신 동의</label></span>
			   <a href="javascript:doDisplay3();"> 약관보기</a>
			  <div class="terms3"  id="terms3">
			  	할인쿠폰 및 혜택, 이벤트, 신상품 소식 등 쇼핑몰에서 제공하는 유익한 쇼핑정보를 이메일로 받아보실 수 있습니다.<br/>

				단, 주문/거래 정보 및 주요 정책과 관련된 내용은 수신동의 여부와 관계없이 발송됩니다.<br/>

				선택 약관에 동의하지 않으셔도 회원가입은 가능하며, 회원가입 후 회원정보수정 페이지에서 언제든지 수신여부를 변경하실 수 있습니다.<br/>
			  </div>
			</div>
		</div>

	<div class="signindiv">
		
		<input type="button" class="signinbtn" style="border: 2px solid grey;" id="signupbtn1" value="돌아가기" onClick="location.href='indexpage.jsp'">
		
		<input type="submit" class="signinbtn" style="background-color: #030066;color: white;" id="signupbtn2" value="가입하기">
	</div>

	<jsp:include page="../overlap/footer.jsp"/>
	
	</form>
		<script>
	
	var id = document.getElementById("id");
	var hiddenidchk = document.getElementById("hiddenidchk");
	var pwd1 = document.getElementById("pwd1");
	var pwd2 = document.getElementById("pwd2");
	var name = document.getElementById("name");
	var elastname = document.getElementById("elastname");
	var efirstname = document.getElementById("efirstname");
	var email1 = document.getElementById("email1");
	var email3 = document.getElementById("email3");
	var sample6_address = document.getElementById("sample6_address");
	var sample6_detailAddress = document.getElementById("sample6_detailAddress");
	var ex_chk2 = document.getElementById("ex_chk2");
	var ex_chk3 = document.getElementById("ex_chk3");


	var idm = document.getElementById("idm");
	var pwd1m = document.getElementById("pwd1m");
	var pwd2m = document.getElementById("pwd2m");
	var namem = document.getElementById("namem");
	var enamem = document.getElementById("enamem");
	var emailm = document.getElementById("emailm");
	// 유효성 검사
	// 1 id, pwd / 소문자 대문자 4 ~ 12자리까지
	// 2 이름(영문) / 영어로만
	var reg1 = /^[a-zA-Z0-9]{4,12}$/
	var reg2 = /[a-zA-Z]/;
	
	id.onblur = function (){
		if(!reg1.test(id.value)){
			idm.innerText="4자리 이상 12자리 이하로 작성해주세요.";
		}
		else{
			idm.innerText="";
		}
	} 
	pwd1.onblur = function (){
		if(!reg1.test(pwd1.value)){
			pwd1m.innerText="4자리 이상 12자리 이하로 작성해주세요.";
		}
		else{
			pwd1m.innerText="";
		}
	}
	pwd2.onblur = function (){
		if(pwd1.value != pwd2.value){
			pwd2m.innerText="위와 같은 비밀번호를 입력하세요.";
		}
		else{
			pwd2m.innerText="";
		}
	}
	name.onblur = function (){
		if(name.value.length <= 1){
			namem.innerText="이름을 입력하세요.";
		}
		else{
			namem.innerText="";	
		}
	}

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
	email1.onblur = function (){
		if(!(email1.value.length >= 2)){
			emailm.innerText="이메일을 입력하세요.";
		}
		else{
			emailm.innerText="";	
		}
	}
	
	function signupchk(){
		if(!reg1.test(id.value)){
			alert("아이디를 조건에 맞게 입력하세요.");
			return false;
		}
		if(!(hiddenidchk.value == 1)){
			alert("아이디 중복확인을 해주세요.");
			return false;
		} 
		if(!reg1.test(pwd1.value)){
			alert("비밀번호를 조건에 맞게 입력하세요.");
			return false;
		} 
		if(pwd1.value != pwd2.value){
			alert("비밀번호와 비밀번호확인을 일치해주세요.");
			return false;
		}  
		if(name.value.length < 2){
			alert("이름을 입력하세요.");
			return false
		}
		if(email1.value.length <= 2){
			alert("이메일을 입력하세요.");
			return false
		}
		if(email3.value.length <= 2){
			alert("이메일을 다시 확인해주세요.");
			return false
		} 
		if(ex_chk2.checked == false){
			alert("이용약관 동의를 하세요.");
			return false			
		}
		if(ex_chk3.checked == false){
			alert("개인 정보 수집 동의를 하세요.");
			return false
		} 
		alert("회원가입 성공")
		return true;
	}

	function sample6_execDaumPostcode() {
		
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var addr = ''; // 주소 변수
	            var extraAddr = ''; // 참고항목 변수
	
	            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                addr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	            }
	
	            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	          
	
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById("sample6_address").value = addr;
	            // 커서를 상세주소 필드로 이동한다.
	            document.getElementById("sample6_detailAddress").focus();
	        }
	    }).open();
	}
		



</script>
	

</body>
</html>