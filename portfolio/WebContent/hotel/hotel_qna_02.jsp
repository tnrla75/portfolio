<%@page import="dao.Hotel_DAO"%>
<%@page import="vo.Hotel_review_DTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*"%>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>호텔 리뷰</title>
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
	height:1200px;
	border-style: solid;
	margin: 0 auto;
	text-align: center;
}
.main_headbox{
	width:1000px;
	height:80px;
	
}
.main_medlebox{
	width:1000px;
	height:410px;
	border-style: solid;
	margin: 30px auto;
	float: left;
	
	
}
.main_poto_box{
	width:300px;
	height:400px;
	border-style: solid;
	float: left;
}
.main_medle_rigth{
	width:700px;
	height:300px;
	border-style: solid;
	margin: 0 auto;
	float: left;
}
.main_medle_center{
	width:380px;
	height:360px;
	border-style: solid;
	margin: 0 auto;
	text-align: left;
	padding:20px;
	float: left;
}


.reviwbox{
	clear:left;
	width:1000px;
	height:310px;
	border-style: solid;
	margin: 30px auto;
	border-radius: 15px;
}
.reviwbox_left{
	width:200px;
	height:310px;
	border-style: solid;
	float:left;
}
.reviwbox_left_poto{
	width:198px;
	height:120px;
	border-style: solid;
	margin: 0 auto;
}
.poto{
	width:198px;
	height:120px;
	margin: 0 auto;
	border-radius: 15px;
								
}
.reviwbox_left_down{
	width:200px;
	height:190px;
	border-style: solid;
	margin: 0 auto;
	float:left;
}

.reviwbox_left_down_left{
	

	width:60px;
	height:30px;
	border-style: solid;
	padding:5px;
	margin: 0 auto;
	float:left;
}
.reviwbox_left_down_left:focus{
		outline:none;
}
	
.reviwbox_left_down_left_sub{
	clear:left;
	width:60px;
	height:30px;
	padding:5px;
	border-style: solid;
	margin: 0 auto;
	float:left;
}
.reviwbox_left_down_rigth{	
	width:108px;
	height:30px;
	padding:5px;
	border-style: solid;
	margin: 0 auto;
	float:left;
}
.reviwbox_center{
	width:992px;
	height:310px;
	border-style: solid;
	
}
.reviwbox_center_up{
	width:946px;
	height:30px;
	padding:20px;
	font-size:22px;
	border-style: solid;
	
}
.reviwbox_center_down{
	width:992px;
	height:230px;
	border-style: solid;
	text-algin:left;
}

.button{
	width:100px;
	height:70px;
	background-Color:skyblue;
	border-radius:7px
}

.down_box{
	width:1000px;
	height:80px;
	border-style: solid;
	float:left;
}
</style>
<body>


<jsp:useBean id="members" class="dao.Hotel_DAO"/>
<%
	request.setCharacterEncoding("UTF-8");
	
	String mb_id = (String)session.getAttribute("mb_id");
	
	String hot_re_num=request.getParameter("hot_re_num");
	String hot_main_num=request.getParameter("hot_main_num");
	String hot_country=request.getParameter("hot_country");
	String hot_re_title=request.getParameter("hot_re_title");	
	String hot_re_content=request.getParameter("hot_re_content");   // insert_02에서 가져옴.
	String hot_re_comments=request.getParameter("hot_re_comments");
	String hot_re_date=request.getParameter("hot_re_date");	

	
	// out.println(id2+"님이 로그인 중...!!");
	
	/* for(int i=0;i<arr.size();i++){
		out.println("<tr>");
	out.println("<td class='number_box' name='hotel_reviw_num'>"+arr.get(i).getHotel_review_num()+"</td>");				
	out.println("<td class='addbox' name='hotel_add'>"+ arr.get(i).getHotel_add()+"</td>");
	out.println("<td class='smallbox' name='hotel_name'>"+ arr.get(i).getHotel_name()+"</td>");
	out.println("<td class='centerbox' name='hotel_rv_title'><a href='Review_02.jsp?getHotel_rv_title="+ arr.get(i).getHotel_rv_title()+"'>"+ arr.get(i).getHotel_rv_title()+"</a></td>");
	out.println("<td class='smallbox' name='id'>"+ arr.get(i).getId()+"</td>");
		out.print("</tr>");
	} */
	
	
	ArrayList<Hotel_review_DTO> arr=members.select_02(Integer.parseInt(hot_re_num));
%>
	<form action="hotel_qna_01.jsp">
		<%if(mb_id == null){%>			
			<jsp:include page="../overlap/header_login.jsp"/>			
		<%}else{%>		
			<jsp:include page="../overlap/header_logout.jsp"/>			
		<%}%>
		<section class="main_bigbox">
		
		<input type="hidden" name="hot_re_date" value="<%= hot_re_date %>"/>
		
		<div>
			<head class="main_headbox">
				<h2>문의 상세정보</h2>
			</head>			
	
			<div class="reviwbox">
					<div class="reviwbox_left">	
						<div class="reviwbox_left_poto">
							<img src="../img/hotel/hotel01.jpg"  class="poto">
						</div>
						
						<div class="reviwbox_left_down_left"   style="focus:'none';">
						평점 :
						</div>
						<div class="reviwbox_left_down_rigth" readonly >
								<%
									
									
									out.println("<td class='reviwbox_left_down'>"+arr.get(0).getHot_re_num()+"<br><br></td>");
									
								%>
						</div>
						<div class="reviwbox_left_down_left_sub" readonly style="focus:'none';">
						아이디 :
						</div>
						<div class="reviwbox_left_down_rigth" style="cursor:'none';">
								<%
								
									out.println("<td class='reviwbox_left_down'>"+arr.get(0).getHot_main_num()+"<br><br></td>");
							
								%>
						</div>
						<div class="reviwbox_left_down_left_sub">
						날짜 :
						</div>
						<div class="reviwbox_left_down_rigth">
								<%								
//									out.println("<td class='reviwbox_left_down'>"+arr.get(0).getHot_re_title()+"<br><br></td>");
								
								%>
						</div>
						<div class="reviwbox_left_down_left_sub">
						날짜 :
						</div>
						<div class="reviwbox_left_down_rigth">
								<%
								
									out.println("<td class='reviwbox_left_down'>"+arr.get(0).getHot_re_date()+"<br><br></td>");
									
								
								%>
						</div>
						
						
					</div>
					<div class="reviwbox_center">
						<div class="reviwbox_center_up">					
								<%
//								out.println(arr.get(0).getHot_re_title());
								
								%>								
						</div>
						<div clss="reviwbox_center_down">		
						<!-- <textarea rows="15" cols="120" > </textarea> insert할때 사용할 코드 -->
							<%								
								out.println(arr.get(0).getHot_re_content());
							%>
						</div>
						
					</div>
			</div>
			<div class=main_reviwbox>
				여여여여기...!! : <%=hot_main_num%>
			</div>
			<div class=main_reviwbox>
				aaaaa
			</div>
				
		</div>
		<%session.getAttribute("md_id"); %>
		<div class="down_box">
			<%			
			
			 if(arr.get(0).getHot_re_id().equals(mb_id)){
				out.println("<a href=hotel_rv_update_01.jsp?hotel_review_num="+ hot_re_num +" name='수정' class='button'>수정</a>");
				
			}else{
				
			} 			
			%>
			
			<%--  <a href=Update_01.jsp?hotel_review_num= <%=hotel_review_num%>  name='수정' class="button">수정</a>			
			<a href=Delete.jsp?hotel_review_num=<%=hotel_review_num%>  name='삭제' class="button">삭제</a>  --%>
			
			<input type="submit" value="돌아가기" class="button">
			<%
			 if(arr.get(0).getHot_re_id().equals(mb_id)){					
					out.println("<a href=hotel_rv_delete.jsp?hot_re_num="+ hot_re_num +" name='삭제' class='button'>삭제</a>");
				}
			%>
		</div>
		</section>
	</form>
		
</body>
</html>