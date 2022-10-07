<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="vo.Member_info"%>
<%	Member_info list = (Member_info)request.getAttribute("list");	%> 
<%System.out.println(list); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="../css/header_footer.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<title>Insert title here</title>

</head>
<style>
*{box-sizing: border-box;}
	section{
		width: 600px;
		height: 730px;
		margin: 0 auto;
	}
	article{
		width:600px;
		height: 150px;
		margin: 20px auto;
		text-align: center;
		font-size: 20pt;
		line-height: 130px;
		border-bottom: 3px #030066 solid;
	}	
	.signuplabel{
		width: 90px;
		height: 55px;
		float: left;
		line-height: 50px;
		margin: 5px;
		padding-left: 10px;
		font-size: 10pt;
	}
	.signupinputdiv{
		width: 300px;
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
		width: 300px;
		height: 40px;
		font-size: 14px;
		padding-left: 7px;
		border: #D5D5D5 1px solid;
		border-radius: 5px;
	}
	#signupid{
		width: 500px;
		height: 80px;
		margin: 0 auto;
	}
	select {
		border: #D5D5D5 1px solid; 
		height: 41px; 
		border-radius: 5px; 
		width: 100px; 
	}
	select:hover {
		border-color: #A3AFC9;
	}
	select:active {
		border-color: #A3AFC9;
	}
	.buttonbox{
		width: 300px;
		height: 45px;
		margin:0 auto;
	}
	.buttonbox input{
		width: 300px;
		height: 45px;
		background: #030066;
		color: white;
		font-weight: bold;
		border-radius: 5px;
		cursor: pointer;
	}
	 #modal1 > *{
	      padding: 0px;
	      margin: 0px;
    }
    #modal1{
		  background-color: rgba(0, 0, 0, 0.4);   	
	      display : none;
	      z-index : 999;
	      position:absolute;
	      left:0;
	      width:100%;
	      height:101%;
    }
    #modal1>#content1{
      width:500px;
      height:fit-content;
      margin:100px auto;
      padding:40px;
      top: 250px;
      position: relative;
      border-radius: 2px;
      background-color:#fff;
      box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
    }
    .modalheader{
    	width: 212px;
    	height: 60px;
    	margin: 0 auto;
    	font-size: 15pt;
    	
    }
    .close{
    	width: 300px;
    	height: 35px;
    	margin: 0 auto;
    }
    .close input{
    	width: 300px;
    	height: 35px;
    	border-style: none;
    	color: white;
    	background-color: #030066;
    	
    }
</style>
<body>
<form>
	<div id='modal1'>
	  <div id='content1'>
	   	<div class="modalheader">일치하는값이 없습니다.</div>
	   	<div class="close"><input type="button" value="닫기" onclick="back()"></div>
	   </div>
	 </div>
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
		<article>
			비밀번호 찾기
		</article>
		<div id="signupid">
			<div class="signuplabel">
				아이디
			</div>
			<div class="signupinputdiv">
				<input type="text" placeholder="아이디를 입력해 주세요." class="signupinput" id="id" name="mb_name" >
			</div>
		</div>
		<div id="signupid">
			<div class="signuplabel">
				이름
			</div>
			<div class="signupinputdiv">
				<input type="text" placeholder="이름을 입력해 주세요." class="signupinput" id="name" name="mb_name" >
			</div>
		</div>
		<div id="signupid">
			<div class="signuplabel">
				이메일
			</div>
			<div class="signupinputdiv" style="width:300px;">
				<input type="text" class="signupinput"  style="width: 80px;" id="email1" name="mb_email1">
				
				<span>&nbsp@</span>
				<input type="text" class="signupinput"  style="width: 80px;" name="mb_emaxil2" id="email2">
				<select id="email3" name="mb_email3" onChange="selectEmail(this)">
					<option value="1">직접 입력</option>
					<option value="naver.com">naver.com</option>
					<option value="daum.net">daum.net</option>
					<option value="gmail.com">gmail.com</option>
				</select>
			</div>
		</div>
		<div style="width:600px; height:200px;padding-top:50px;">
			<div class="buttonbox"><input type="button" value="비밀번호 변경하기" onclick="findPW()"></div>
		</div>
	</section>
	<jsp:include page="../overlap/footer.jsp"/>
	</form>
</body>
<script>
	var modal1 = document.getElementById('modal1');
	function findPW(){
		 const name = document.querySelector('#name').value;
		const id = document.querySelector('#id').value;
		const email1 = document.querySelector('#email1').value;
		const email2 = document.querySelector('#email2').value;
		  $.ajax({
		      url : "../overlap/findPW.mypage?command=PWresult&name="+name+"&email1="+email1+"&email2="+email2+"&id="+id ,
		      success:function(data){
		        if(data == 1){
		        	location.href="../overlap/changePW.jsp?";
		        }else{
		        	 modal1.style.display = 'block';
		        }
		      }, 
		      error : function(){
		          alert("fail");
		      }
		  }); 
	}
	function back(){
		modal1.style.display = 'none';
	}

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
</html>