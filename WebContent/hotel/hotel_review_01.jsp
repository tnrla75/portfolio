<%@page import="vo.Hotel_review_DTO"%>

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
	height:80px;
	margin:50px auto;
	border-style: solid;
	
	
}
.p{
	width:580px;
	height:80px;
	margin:0 auto;
	border-style: solid;
	text-align: center;
	float:left;
	font-size:40px;
	margin:0 auto;
}

.p_sub{
	width:200px;
	height:80px;
	margin:0 auto;
	border-style: solid;
	margin-bottom: 0;
	text-align: right;
	float:left;
	
}

.sub_nebubox1{
	width:80px;
	height:80px;
	margin:0 auto;
	padding-top:40px;
	margin-right:10px;
	float:right;
}
.sub_nebubox2{
	width:40px;
	height:80px;
	margin:0 auto;
	
	padding-top:40px;
	float:right;
	
}

</style>


<jsp:useBean id="members" class="dao.Hotel_DAO"/>

<%
	request.setCharacterEncoding("UTF-8");
	
	String hot_re_num=request.getParameter("hot_re_num");
	String hot_main_num=request.getParameter("hot_main_num");
	String hot_country=request.getParameter("hot_country");
	String hot_re_title=request.getParameter("hot_re_title");	
	String hot_re_content=request.getParameter("hot_re_content");   // insert_01에서 가져옴.
	String hot_re_comments=request.getParameter("hot_re_comments");	
	String hot_re_date=request.getParameter("hot_re_date");
	System.out.println(hot_re_num+" : re_01");
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
	<input type="hidden" name="hot_re_content" value="<%=hot_re_content%>"/>
		<script>
		
	<%-- 	function write() {
			alert("a");
			  if((<%= mb_id %>!="null")){
				alert("aa");
			}else {
				alert("bb");
			}   
			
		} --%>
		function country_check(){
			if(hot_rate.equals("hot_rate")){
				
			}			
		}
		
		 function logincheck(){
			var mb_id = '<%=(String)session.getAttribute("mb_id")%>';
			if(mb_id == "null"){
				alert("로그인 해주세요.");
				location.replace("../overlap/login.jsp");
			}else{
				location.replace("../hotel/hotel_rv_insert_01.jsp");
			}
		} 
	
 	</script>					
	<div class="p_box">
		<div class="p_sub">
			&nbsp;
		</div>
		<div class="p">
			
				호텔 리뷰 게시판
						
		</div>
		<div class="p_sub">
		
			<div class="sub_nebubox2">
				<input onclick="country_check()" type="button" value="검색" style="border-radius: 7px;background-color:#030066;height:30px;color:white;">				
			</div>
		
			<div class="sub_nebubox1">
				<select name='hot_country' style="border-radius: 7px;height:30px;">
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
	</div>
	
	<form >
		<section class='main_bigbox'>
		<table  border='1'  cellspacing='0' cellpadding=''>
		<tr>
		
			<td class='number_box' name='hot_re_num'>번호</td>	
			
			<td class='addbox'>국가</td>
			<td class='smallbox' name='hot_name'>호텔이름</td>							
			<td class='centerbox' name='hot_re_title'>타이틀</td>
			<td class='smallbox' name='hot_re_id'>아이디</td>
			<td class='smallbox' name='hot_re_date'>작성일</td>	
							
		</tr>
				
		<%
							ArrayList<Hotel_review_DTO> arr=members.select_01();
							
								for(int i=0;i<arr.size();i++){
							out.println("<tr>");
								out.println("<td class='number_box' name='hot_re_num'>"+(i+1)+"</td>");				
						//				out.println("<td class='addbox' name='hot_country' >"+ arr.get(i).getHot_country()+"</td>");
								out.println("<td class='smallbox' name='hot_main_num'>"+ arr.get(i).getHot_main_num()+"</td>");
						//				out.println("<td class='centerbox' name='hot_re_num'><a href='hotel_review_02.jsp?+="+arr.get(i).getHot_re_num()+"'>"+ arr.get(i).getHot_re_title()+"</a></td>");
								out.println("<td class='smallbox' name='hot_re_id'> "+arr.get(i).getHot_re_id()+"</td>");
								out.println("<td class='datebox' style='overflow: hidden;' name='hot_re_date' id='hot_re_date' maxlength='10'> "+arr.get(i).getHot_re_date()+"</td>");
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
