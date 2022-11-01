<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="vo.Member_info"%>

<%
	Member_info member = (Member_info)request.getAttribute("member");
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
		height: 1000px;
		margin: 10px auto;
	}
	#infoBox {
		float: left;
		width: 800px;
		height: fit-content;
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
	.signupinputdiv{
		width: 320px;
		height: 50px;
		float: left;
		margin: 10px;
	}
	.signupinput{
		width: 340px;
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
		margin: 5px 30px;
		cursor: pointer;
	}
	#addressbtn{
		width: 100px;
		height: 45px;
		background: #030066;
		color: white;
		font-weight: bold;
		border-radius: 5px;
		margin: 5px 30px;
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
	
	/*Check Box*/
	.checks:first-of-type {
		position: relative;
		margin-top: 10px;
	}
	#check {
		width: 500px;
		margin-left: 140px;
	}
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
		display: inline;
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

</style>
</head>
<script>
	$(docunment).ready(function() {
	
	});
</script>
<script>
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
<script>
	$(document).ready(function() {
		slide();
	  
	 	$('#nav-icon1,#nav-icon2,#nav-icon3,#nav-icon4').click(function(){
			$(this).toggleClass('open');
		});
	});
</script>
<body>
	<form name="info" action="info_update.mypage?command=update" method="post" onsubmit="return signupchk()">
		<%
			String mb_id = (String)session.getAttribute("mb_id");
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
					<h2>회원정보수정</h2>
					<div id="signupid">
						<div class="signuplabel">
							아이디
						</div>
						<div class="signupinputdiv">
							<input type="text" class="signupinput" value="<%= member.getMb_id()%>" id="id" name="mb_id" readonly style="background-color: rgba(217, 229, 255, 0.3);">
						</div>
					</div>
					<div id="signupid">
						<div class="signuplabel">
							현재 비밀번호
						</div>
						<div class="signupinputdiv">
							<input type="password" placeholder="현재 비밀번호를 입력하세요." class="signupinput" id="or_pw" name="or_pw" maxlength="12" oninput="this.value = this.value.replace(/[^a-zA-Z0-9.]/g, '').replace(/(\..*)\./g, '$1');"> 
						</div>
						<div class="signupsidebtn">
						</div>
						<div class="errortextdiv" >
							<span id="or_pwd" class="infomessage"></span>
						</div>
					</div>
					<div id="signupid">
						<div class="signuplabel">
							새 비밀번호
						</div>
						<div class="signupinputdiv">
							<input type="password" placeholder="새 비밀번호를 입력하세요." class="signupinput" id="pwd1" name="mb_pw" maxlength="12" oninput="this.value = this.value.replace(/[^a-zA-Z0-9.]/g, '').replace(/(\..*)\./g, '$1');"> 
						</div>
						<div class="signupsidebtn">		
						</div>
						<div class="errortextdiv" >
							<span id="pwd1m" class="infomessage"></span>
						</div>
					</div>
					<div id="signupid">
						<div class="signuplabel">
							새 비밀번호 확인
						</div>
						<div class="signupinputdiv">
							<input type="password" placeholder="새 비밀번호를 한번 더 입력하세요." class="signupinput" id="pwd2" maxlength="12" oninput="this.value = this.value.replace(/[^a-zA-Z0-9.]/g, '').replace(/(\..*)\./g, '$1');">
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
							<input type="text" value="<%= member.getMb_name()%>" class="signupinput" id="name" name="mb_name" readonly style="background-color: rgba(217, 229, 255, 0.3);">
						</div>
						<div class="signupsidebtn">
							
						</div>
					</div>
					<div class="errortextdiv" >
						<span id="namem" class="infomessage"></span>
					</div>
					
					<div id="signupid">
						<div class="signuplabel">
							이메일
						</div>
						<div class="signupinputdiv" style="width:330px;">
							<input type="text" class="signupinput" value="<%= member.getMb_email() %>" id="email1" name="mb_email1" readonly style="background-color: rgba(217, 229, 255, 0.3);">
							<%-- <% if (member.getMb_email() == null)  {%>
								<input type="text" class="signupinput" style="width: 80px;" id="email1" name="mb_email1">
								<span>&nbsp@</span>
								<input type="text" class="signupinput"  style="width: 80px;" name="mb_email2">
								<select id="email3" name="mb_email3" onChange="selectEmail(this)">
									<option value="1">직접 입력</option>
									<option value="naver.com">naver.com</option>
									<option value="daum.net">daum.net</option>
									<option value="gmail.com">gmail.com</option>
								</select>
								<div class="signupsidebtn" style="right: 10px; position: relative;">
									<input type="button" value="중복확인" id="emailchkbtn">
								</div>
							<% } else {%>
								<input type="text" class="signupinput" value="<%= member.getMb_email() %>" id="email1" name="mb_email1" readonly style="background-color: rgba(217, 229, 255, 0.3);">
							<% } %> --%>
						</div>
					</div>
					<div class="errortextdiv" >
						<span id="emailm" class="infomessage"></span>
					</div>
					<div id="signupid">
						<div class="signuplabel">
							주소
						</div>
						<% if (member.getMb_address() == null)  {%>
						<div class="signupinputdiv">
							<input type="text" placeholder="주소 검색" class="signupinput" id="sample6_address" name="mb_address" readonly> 
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
						<% } else { %>
						<div class="signupinputdiv">
							<input type="text" class="signupinput" value="<%= member.getMb_address() %>" id="sample6_address" name="mb_address" readonly> 
						</div>
						<div class="signupsidebtn">
							<input type="button" onclick="sample6_execDaumPostcode()" value="주소 변경" id="addressbtn" ><br>
						</div>
					</div>
					<div id="signupid">
						<div class="signuplabel">
							상세주소
						</div>
						<div class="signupinputdiv">
							<input type="text" value="<%= member.getMb_detailaddress() %>" class="signupinput" id="sample6_detailAddress" name="mb_detailaddress">
						</div>
						<div class="signupsidebtn">
						</div>
					</div>
					<% } %>
					<div id="signupid">
						<div class="signuplabel">
							전화번호
						</div>
						<% if (member.getMb_phonenum() == null) { %>
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
						<% } else { %>
						<div class="signupinputdiv">
							<input type="text" value="<%= member.getMb_phonenum() %>" class="signupinput" id="phone" name="mb_phonenum2" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
						</div>
						<% } %>
					</div>
					<div id="signupid">
						<div class="signuplabel">
							성별
						</div>
						<div class="signupinputdiv">
							<% if (member.getMb_gender() != null) { %>
							<div class="container">
								<ul>
									<li>
										<% if (member.getMb_gender() == "남") { %>
										<input type="radio" id="f-option" name="mb_gender" value="남" checked="checked">
										<label for="f-option">남</label>
										<div class="check"></div>
									</li>
									<li>
										<input type="radio" id="s-option" name="mb_gender" value="여">
										<label for="s-option">여</label>
										<div class="check"><div class="inside"></div></div>
									</li>	
										<% } else {%>
										<input type="radio" id="f-option" name="mb_gender" value="남">
										<label for="f-option">남</label>
										<div class="check"></div>
									</li>
									<li>
										<input type="radio" id="s-option" name="mb_gender" value="여" checked="checked">
										<label for="s-option">여</label>
										<div class="check"><div class="inside"></div></div>
									<% } %>
									</li>	
								</ul>
							</div>
							<% } else { %>
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
							<% } %>
						</div>
						<div class="signupsidebtn">		
						</div>
					</div>
					<div id="signupid">
						<div class="signuplabel">
							생년월일
						</div>
						<% if (member.getMb_birth() == null) { %>
						<div class="signupinputdiv" style="width: 320px;height: 40px;padding-left: 10px;border: #D5D5D5 1px solid;border-radius: 5px;">
							<input type="text" placeholder="YYYY" class="signupinputbirth" style="width: 100px;" id="byear" name="mb_birth1" maxlength="4" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
							<input type="text" placeholder="MM" class="signupinputbirth" style="width: 60px;" id="bmonth" name="mb_birth2" maxlength="2" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
							<input type="text" placeholder="DD" class="signupinputbirth" style="width: 60px;" id="bday" name="mb_birth3" maxlength="2" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">			
						</div>
						<% } else { %>
						<div class="signupinputdiv">
							<input type="text" value="<%=member.getMb_birth()%>" class="signupinput" id="sample6_detailAddress" name="mb_detailaddress" name="mb_birth1" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
						</div>
						<% } %>
					</div>
					<!-- <div id="signupid">
						<div class="signuplabel">
							약관동의
						</div>
						<div class="signupinputdiv">
							<div class="checks etrans">
								<span>
									<input type="checkbox" id="ex_chk" name="all" class="all"> 
							  		<label for="ex_chk">정보수신 동의(선택)</label>
								</span>
							</div><br/>
						</div>
						<div class="signupinputdiv">
							<div class="checks etrans" id="check">
								<input type="checkbox" id="ex_chk4" name="check" name="mb_agree1">
								<label for="ex_chk4">SNS 수신 동의</label>
								<input type="checkbox" id="ex_chk5" name="check" name="mb_agree2">  
								<label for="ex_chk5">이메일 수신 동의</label>
							</div>
						</div>
					</div> -->
				</div>
				<!-- <div class="terms">
					<h3>약관동의</h3>
					<div class="checks etrans">
						<span>
							<input type="checkbox" id="ex_chk" name="all" class="all"> 
					  		<label for="ex_chk">정보수신 동의(선택)</label>
						</span>
					</div><br/>
					<div class="checks etrans">
						<input type="checkbox" id="ex_chk4" name="check" name="mb_agree1">
						<label for="ex_chk4">[선택]SNS 수신 동의</label>
						<span><input type="checkbox" id="ex_chk5" name="check" name="mb_agree2">  
						<label for="ex_chk5">[선택]이메일 수신 동의</label></span>
					</div>
				</div> -->
				<div class="signindiv">
					<input type="button" class="signinbtn" style="border: 2px solid grey;" id="signupbtn1" value="탈퇴하기">
					<input type="submit" class="signinbtn" style="background-color: #030066;color: white;" id="signupbtn2" value="수정하기">
				</div>
			</div>
		</section>
		<jsp:include page="../overlap/footer.jsp"/>
	</form>
<script>

	var hiddenidchk = document.getElementById("hiddenidchk");
	var login_pw = <%= member.getMb_pw()%>
	var or_pw = document.getElementById("or_pw");
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
	
	
	or_pw.onblur = function() {
		if (login_pw != or_pw.value) {
			or_pwd.innerText="현재 비밀번호와 일치하지 않습니다.";
		} else {
			or_pwd.innerText="";
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
		if(pwd1.value != pwd2.value){
			alert("비밀번호와 비밀번호확인을 일치해주세요.");
			return false;
		}  
		if(email1.value.length <= 2){
			alert("이메일을 입력하세요.");
			return false
		}
		if(email3.value.length <= 2){
			alert("이메일을 다시 확인해주세요.");
			return false
		} 
		alert("회원가입 성공")
		return true;
	}
</script>
</body>
</html>