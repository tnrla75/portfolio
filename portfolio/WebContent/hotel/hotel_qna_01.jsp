<%@page import="vo.Hotel_qna_DTO"%>

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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
    
</head>

<style>
.main_bigbox{
	width:1000px;
	height:inherit;
	
	margin: 30px auto;
	text-align: center;
}
#main_headbox{
	width:1000px;
	height:60px;
	background-color: rgba(231,231,231,0.7);
	border: solid 3px rgba(0,0,0,0.4);
	
}
#up{
	background-color: rgba(231,231,231,0.7);
	border-radius: 8px;
}


.number_main{
	width:50px;
	height:67px;
	margin: 0 auto;
	padding-top:23px;
	text-align: center;
	font-size:18px;
	float:left;
	
}
.number_box{
	width:50px;
	height:35px;
	margin: 0 auto;
	text-align: center;
	font-size:20px;
	float:left;
	
}
 .nationmain{
	width:100px;
	height:70px;
	margin: 0 auto;
	padding-top:20px;
	text-align: center;
	font-size:25px;
	float:left;

}
.nationbox{
	width:100px;
	height:35px;
	margin: 0 auto;
	text-align: center;
	font-size:20px;
	float:left;

}
.datemain{
	width:185px;
	height:70px;
	
	padding-top:20px;
	text-align: center;
	font-size:25px;
	margin-left:30px;
	float:right;
}
.date{
	width:185px;
	height:35px;	
	text-align: center;
	font-size:20px;
	float:right;
}
.centerbox{
	width:626px;
	height:70px;
	margin: 0 auto;
	padding-top:20px;
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
	width:60px;
	height:80px;
	margin:0 auto;
	
	padding-top:40px;
	float:right;
	/* width:100px;
	height:70px;
	background-Color:skyblue;
	font-size:25px;
	border-radius:7px ; */
	
}

.down_box{
	width:1000px;
	height:80px;
	margin: 40px auto;
}
.p_box{
	
	width:1000px;
	height:80px;
	margin:100px auto 0 auto;
	
	
	
}
#p{
	width:340px;
	height:70px;
	margin:0 0 0 163px;	
	text-align: center;
	float:left;
	font-size:40px;
	border-bottom: solid 1px rgba(0,0,0,0.4);
	
}

.p_left{
	width:150px;
	height:80px;
	margin:0 auto;	
	margin-bottom: 0;
	text-align: right;
	float:left;
	
}
.p_right{
	width:200px;
	height:80px;
	margin:0 auto;		
	margin-bottom: 0;
	text-align: right;
	float:right;
	
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
.sub_nebubox3{
	
}


		/* 아코디언 style */
		
*{
  box-sizing: border-box; 
}
  
.que:first-child{
    border-top: 1px solid black;
  }
  
.que{
  position: relative;
  padding: 17px 0;
  height:100px;
  cursor: pointer;
  font-size: 20px;
  border-bottom: 1px solid #dddddd;
  
}
  
.que::before{
  display: inline-block;
  content: 'Q';
  font-size: 20px;
  color: #006633;
  margin: 0 5px;
}

.que.on>span{
  font-weight: bold;
  color: #006633; 
}
  
.anw {
  display: none;
  overflow: hidden;
  font-size: 14px;
  background-color: #f4f4f2;
  padding: 27px 0;
}
  
.anw::before {
  display: inline-block;
  content: 'A';
  font-size: 14px;
  font-weight: bold;
  color: #666;
  margin: 0 5px;
}

.arrow-wrap {
  position: absolute;
  top:50%; right: 10px;
  transform: translate(0, -50%);
}

.que .arrow-top {
  display: none;
}
.que .arrow-bottom {
  display: block;
}
.que.on .arrow-bottom {
  display: none;
}
.que.on .arrow-top {
  display: block; 
}
</style>

<%
	request.setCharacterEncoding("UTF-8");
	
	String mb_id = (String)session.getAttribute("mb_id"); 
	
	ArrayList<Hotel_qna_DTO> qnaList=(ArrayList<Hotel_qna_DTO>)request.getAttribute("qnaList");

	System.out.println(qnaList+" : 문의 JSP qnaList");
%>
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
				location.replace("../hotel/hotel_qna_insert_01.jsp");
			}
		} 
		 
		// 아코디언
		$(document).ready(function(){
		$(".que").click(function() {
			   $(this).next(".anw").stop().slideToggle(300);
			  $(this).toggleClass('on').siblings().removeClass('on');
			  $(this).next(".anw").siblings(".anw").slideUp(300); // 1개씩 펼치기
			  
			});	
		});
		
</script>
<body>
	
		<%if(mb_id == null){%>			
			<jsp:include page="../overlap/header_login.jsp"/>			
		<%}else{%>		
			<jsp:include page="../overlap/header_logout.jsp"/>			
		<%}%>
	
	
	<form >			
	<div class="p_box">
		<div class="p_left">
			&nbsp;
		</div>
		<div id="p">호텔 문의 게시판</div>
		<div class="p_right">		
			<div class='insert_go'>
				<input type='button' value='글쓰기' style="border-radius: 7px;background-color:#030066;height:30px;color:white;" onclick="logincheck()">
			</div>
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
	
	
		<section class='main_bigbox'>
		<table  id="up" cellspacing='0' >
			<tr >
				<td class='number_main' name='hot_re_num'>번호</td>			
				<td class='nationmain'>국가</td>									
				<td class='centerbox' name='hot_re_title'>타이틀</td>			
				<td class='datemain' name='hot_re_date'>작성일</td>								
			</tr>
				
		<%-- <%for(int i=0;i<qnaList.size();i++){%>
					<tr>
						<td class='number_box' name='hot_re_num'><%=qnaList.get(i).getHot_qna_num()%></td>									
						<td class='addbox' name='hot_main_num'><%=qnaList.get(i).getHot_qna_nation()%></td>
								<!-- <td class='centerbox' name='hot_re_num'><a href='hotel_review_02.jsp?+="+arr.get(i).getHot_re_num()+"'>"+ arr.get(i).getHot_re_title()+"</a></td> -->
						<td class='centerbox' name='hot_qna_title'><%=qnaList.get(i).getHot_qna_title()%></td>
						<td class='datemain' style='overflow: hidden;' name='hot_re_date' id='hot_re_date' maxlength='10'><%=qnaList.get(i).getHot_qna_date()%></td>
					</tr>							
		<%}%> --%>
		</table>
		
				<!-- 아코디언 -->
		<%for(int i=0;i<qnaList.size();i++){%>
		<div id="Accordion_wrap">
		
		     <div class="que">		 
		     	<div class='number_box'><%=qnaList.get(i).getHot_qna_num()%></div>    	
		     	<div class='nationbox'><%=qnaList.get(i).getHot_qna_nation()%></div>
			      <span><%=qnaList.get(i).getHot_qna_title()%></span>
			       <div class="arrow-wrap">
				         <span class="arrow-top">↑</span>
				        <span class="arrow-bottom">↓</span>
			       </div>	
			      <div class='date'><%=qnaList.get(i).getHot_qna_date()%></div>  		      
			</div>
			
			<div class="anw">
			    	  <span><%=qnaList.get(i).getHot_qna_answer()%></span>
			</div>
		
		
		</div>
		<%}%>
		
		</section>
		</form>
		
	<jsp:include page="../overlap/footer.jsp"/>

</body>
</html>
