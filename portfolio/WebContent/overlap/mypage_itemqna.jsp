<%@page import="vo.Mypage_qna"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.Member_info"%>
<%@page import="vo.Mypage_qna"%>

<%
	ArrayList<Mypage_qna> list = (ArrayList<Mypage_qna>)request.getAttribute("itemqna");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Cairo&family=Indie+Flower&family=Koulen&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../css/header_footer.css">
<link type="text/css" rel="stylesheet" href="../css/responsive-tabs.css" />
<link type="text/css" rel="stylesheet" href="../css/style2.css" />
<script src="http://use.fontawesome.com/releases/v6.1.2/js/all.js"></script>
<link rel="stylesheet" href="bang.css">
<style type="text/css"></style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
		width: 1300px;
		min-height: 900px;
		height: fit-content;
		margin: 10px auto;
	}
	#infoBox {
		float: left;
		width: 800px;
		height: fit-content;
	}	
	
	#info_title {
		width: 750px;
		height: fit-content;
		margin: 0 auto;
		border-bottom: solid;
	}
	#wrap {
		width: 750px;
		height: fit-content;
		margin: 0 auto;
	}
	#qnaTable {
		margin: 10px auto;
		width: 750px;
		border-collapse: collapse;
	}
	.qnaTableLine {
		border-bottom: 1px solid #D5D5D5;
		border-top: 1px solid #D5D5D5;
		height: 70px;
	}
	#no_qna {
		text-align: center;
		padding: 80px;
		border-style: solid;
		border-width: 1px 0 1px 0;
	}
	#no_qna img {
		margin-bottom: 20px;
	}
	.item div{
		float: left;
	}
	.item div:last-of-type {
		margin-top: 15px;
		margin-left: 20px;
	}
	.item span:first-of-type {
		margin-top: 10px;
		font-size: 10pt;
		font-weight: bold;
	}
	.itemName {
		margin-top: 12px;
        display: block;
        color: #949494;
        width: 170px;
        font-size: 12px;
        font-weight: bolder !important;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }
    .item span:last-of-type {
		font-size: 10pt;
		color: #949494;
		position: relative;
		bottom: 13px;
	}
	#answer1 {
		float: right;
		width: 70px;
		height: 20px;
		color: #949494;
		margin-top: 10px;
		border-style: solid;
		border-width: 1px;
		border-color: #949494;
		font-weight: bold;
		text-align: center;
		font-size: 8pt;
		padding-top: 5px;
		
	}
	#answer2 {
		float: right;
		width: 70px;
		height: 20px;
		color: #4374D9;
		margin-top: 10px;
		border-style: solid;
		border-width: 1px;
		border-color: #4374D9;
		font-weight: bold;
		text-align: center;
		font-size: 8pt;
		padding-top: 5px;
	}
	.qna_text {
		margin-top: 7px;
	}
	.qna_text span:first-of-type {
		font-size: 10pt;
		color: #747474;
	}
	.qna_wr span:last-of-type {
		font-size: 10pt;
	}
	.question_line1 {
		background-color: #F6F6F6;
	}
	.question_line2 {
		background-color: #F6F6F6;
	}
	.question_line1 #question1 {
		width: 600px;
		height: fit-content;
		margin: 20px auto;
		padding-bottom: 30px;
		border-style: solid;
		border-width: 0 0 1px 0;
		border-color: #A6A6A6;
	}
	.question_line1 #question1 b:first-of-type{
		font-size: 40px;
		font-family: 'Montserrat', sans-serif;
		color: #747474;
	}
	.question_line1 #question1 b:last-of-type {
		font-size: 15px;
		font-weight: normal;
		margin-left: 50px;
		position: relative;
		bottom: 5px;
	}
	.question_line1 #question2 {
		width: 600px;
		heightL fit-content;
		margin: 20px auto;
		border-color: #A6A6A6;
	}
	.question_line1 #question2 b:first-of-type {
		font-size: 40px;
		font-family: 'Montserrat', sans-serif;
		color: #4641D9;
	}
	.question_line1 #question2 b:last-of-type {
		font-size: 15px;
		font-weight: normal;
		margin-left: 50px;
		position: relative;
		bottom: 5px;
	}
	
	.question_line2 b:first-of-type {
		font-size: 40px;
		font-family: 'Montserrat', sans-serif;
		color: #747474;
	}
	.question_line2 b:last-of-type {
		font-size: 15px;
		font-weight: normal;
		margin-left: 50px;
		position: relative;
		bottom: 5px;
	}
	.question_line2 div {
		width: 600px;
		heightL fit-content;
		margin: 20px auto;
		border-color: #A6A6A6;
	}	

</style>
</head>
<script>
	
	
</script>

</head>
<script>
	function doDisplay1(){
	    var con = document.getElementById("terms1"); 	
	    if(con.style.display=='none'){ 	
	        con.style.display = 'block'; 	
	    }else{ 		
	        con.style.display = 'none'; 	
	    } 
	} 
	
	function qnaDisplay(){
        var con = document.getElementsByName("qna_display"); 	
        if(con.style.display=='none'){ 	

            con.style.display = 'block'; 	
        }else{ 		
            con.style.display = 'none'; 	
        } 
    }
	
</script>
<script>
	$(document).ready(function() {
		$('.qna_display1').hide();
		$('.qna_display2').hide();
		
		slide();
	  
	 	$('#nav-icon1,#nav-icon2,#nav-icon3,#nav-icon4').click(function(){
			$(this).toggleClass('open');
		});
	 	
	 	
	});
</script>
<body>
	<form action="mypage_qna.mypage?command=item_qna" method="post" onsubmit="return signupchk()">
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
				<div id="info_title">
					<h2>상품 Q&A</h2>
				</div>
				<div id="wrap">
					<table id="qnaTable" cellpadding="10px">
						<tr>
							<td width="320px">상품 정보</td>
							<td>문의 내용</td>
						</tr>
						<% if(list.size() == 0) { %>
						<tr>
							<td colspan="2" id="no_qna">
								<img src="../img/icon/write.png" width="50px" height="50px"></br>
								<div>
									<span>상품 Q&A 내역이 없습니다.</span></br>
								</div>
							</td>
						</tr>
						<% } else {
							for(int i=0; i<list.size(); i++) { %>
						 	<tr class="qnaTableLine">
						 		<td class="item">
						 			<a href="../shopping/itemDetail.shop?itemCode=<%= list.get(i).getItemCode()%>">
							 			<div><img src="<%= list.get(i).getItemImg()%>" width="100px" height="100px"></div>
							 			<div>
							 				<span><%= list.get(i).getBrandName() %></span></br>
								 			<span class="itemName"><%= list.get(i).getItemName() %></span></br>
								 			<span>상품코드 : <%= list.get(i).getItemCode() %></span></br>
							 			</div>	
							 		</a>
						 		</td>
						 		<td class="qna_wr">
						 			<a href="javascript:qnaDisplay();">
							 			<% if (list.get(i).getQanswer() == null) { %>
							 				<div id="answer1">답변대기</div>
							 			<% } else { %>
							 				<div id="answer2">답변완료</div>
							 			<% } %>
							 			<div class="qna_text">
							 				<span><%= list.get(i).getQupdate() %>&nbsp|</span>
							 				<span><%= list.get(i).getQsubject() %></span>
							 			</div>
						 			</a>
						 		</td>
						 	</tr>
						 	<% if (list.get(i).getQanswer() != null) { %>
						 	<tr class="qna_display1" name="qna_display">
								<td colspan="2" class="question_line1">
									<div id="question1"><b>Q</b><b><%= list.get(i).getQuestion() %></b></div>
									<div id="question2"><b>A</b><b><%= list.get(i).getQanswer() %></b></div>
								</td>
							</tr>
							<% } else {%>
							<tr class="qna_display2" name="qna_display">
								<td colspan="2" class="question_line2">
									<div><b>Q</b><b><%= list.get(i).getQuestion() %></b></div>
								</td>
							</tr>
						 	<% } %>		
						<% } %>
						<% } %>
						</table>
				</div>		
			</div>
		</section>
		<jsp:include page="../overlap/footer.jsp"/>
	</form>
</body>
</html>