<%@page import="hotel_package.Hotel_review_DB"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*"%>
    
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>리뷰 타이틀 목록</title>
	<meta charset="utf-8">
	<link href="https://fonts.googleapis.com/css2?family=Cairo&family=Indie+Flower&family=Koulen&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="../css/style.css" />
	<link rel="stylesheet" type="text/css" href="../css/header_footer.css">
	
    <script src="http://use.fontawesome.com/releases/v6.1.2/js/all.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    
</head>

<style>
.main_bigbox{
	width:1000px;
	height:800px;
	border-style: solid;
	margin: 30px auto;
	text-align: center;
}
#main_headbox{
	width:1000px;
	height:60px;
	border-style: solid;
}

.number_box{
	width:50px;
	height:35px;
	margin: 0 auto;
	text-align: center;
	font-size:20px;
	float:left;
	
}
.addbox{
	width:100px;
	height:35px;
	margin: 0 auto;
	text-align: center;
	font-size:25px;
	float:left;

}
.smallbox{
	width:125px;
	height:35px;	
	margin: 0 auto;
	text-align: center;
	font-size:25px;
	float:left;
}
.centerbox{
	width:447px;
	height:35px;
	margin: 0 auto;
	text-align: center;
	font-size:25px;
	float:left;
}
.datebox{
	width:125px;
	height:35px;	
	margin: 0 auto;
	
	text-align: center;
	font-size:22px;
	float:left;
}
.insert_go{
	width:100px;
	height:70px;
	background-Color:skyblue;
	font-size:25px;
	border-radius:7px ;
	
}

.down_box{
	width:1000px;
	height:80px;
	border-style: solid;
}
.p_box{
	width:1000px;
	height:100px;
	margin:50px auto;
	border-style: solid;
	margin-bottom: 0;
	
}
.p{
	width:580px;
	height:100px;
	margin:0 auto;
	border-style: solid;
	margin-bottom: 0;
	text-align: center;
	float:left;
	font-size:40px;
	margin:0 auto;
}

.p_sub{
	width:200px;
	height:100px;
	margin:0 auto;
	border-style: solid;
	margin-bottom: 0;
	text-align: rigth;
	float:left;
}
</style>


<jsp:useBean id="members" class="hotel_package.Java_main"/>

<%
	
	request.setCharacterEncoding("UTF-8");
	
	String hotel_add=request.getParameter("hotel_add");
	String hotel_name=request.getParameter("hotel_name");
	String hotel_rv_title=request.getParameter("hotel_rv_title");	
	String hotel_rv_content=request.getParameter("hotel_rv_content");   // insert_01에서 가져옴.
	String hotel_rv_id=request.getParameter("hotel_rv_id");
	
	
%>
<body>
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
	<input type="hidden" name="hotel_rv_content" value="<%= hotel_rv_content %>"/>
		<script>
		
	<%-- 	function write() {
			alert("a");
			  if((<%= mb_id %>!="null")){
				alert("aa");
			}else {
				alert("bb");
			}   
			
		} --%>
		
		function logincheck(){
			var mb_id = '<%=(String)session.getAttribute("mb_id")%>';
			if(mb_id == "null"){
				alert("로그인 해주세요.");
				location.replace("../overlap/login.jsp");
			}else{
				location.replace("Hotel_rv_insert_01.jsp");
			}
		}
	
 	</script>					
	<div class="p_box">
		<div class="p_sub">
			&nbsp;
		</div>
		<div class="p">
			<p>
				호텔 리뷰 게시판
			</p>			
		</div>
		<div class="p_sub">
			<select name='country_name'>
				<option value='한국'>한국</option>
				<option value='일본'>일본</option>
				<option value='중국'>중국</option>
				<option value='미국'>미국</option>
				<option value='러시아'>러시아</option>
				<option value='베트남'>베트남</option>
				<option value='태국'>태국</option>
				<option value='필리핀'>필리핀</option>
			</select>
		</div>
	</div>
	
	<form>
		<section class='main_bigbox'>
		
		
		<table  border='1'  cellspacing='0'>
		<tr>
		
			<td class='number_box' name='hotel_reviw_num'>번호</td>	
			
			<td class='addbox'>국가</td>
			<td class='smallbox' name='hotel_name'>호텔이름</td>							
			<td class='centerbox' name='hotel_rv_title'>타이틀</td>
			<td class='smallbox' name='id'>아이디</td>
			<td class='smallbox' name='date'>작성일</td>					
			
		</tr>
				
		<%
		
		ArrayList<Hotel_review_DB> arr=members.select_01();
	
		for(int i=0;i<arr.size();i++){
			out.println("<tr>");
				out.println("<td class='number_box' name='hotel_reviw_num'>"+(i+1)+"</td>");				
				out.println("<td class='addbox' name='hotel_add' >"+ arr.get(i).getHotel_add()+"</td>");
				out.println("<td class='smallbox' name='hotel_name'>"+ arr.get(i).getHotel_name()+"</td>");
				out.println("<td class='centerbox' name='hotel_rv_title'><a href='Hotel_review_02.jsp?hotel_review_num="+ arr.get(i).getHotel_review_num()+"'>"+ arr.get(i).getHotel_rv_title()+"</a></td>");
				out.println("<td class='smallbox' name='getHotel_rv_id'>"+arr.get(i).getHotel_rv_id()+"</td>");
				out.println("<td class='datebox' style='overflow: hidden;' name='getHotel_rv_date' id='hotel_rv_date' maxlength='10'>"+arr.get(i).getHotel_rv_date()+"</td>");
			out.print("</tr>");
			
		}
		
		%>
		</table>
		
		<div class='down_box'>
		<input type='button' value='글쓰기' class='insert_go' onclick="logincheck()">
		</div>
		</section>
		</form>
		
	<jsp:include page="../overlap/footer.jsp"/>

</body>
</html>
