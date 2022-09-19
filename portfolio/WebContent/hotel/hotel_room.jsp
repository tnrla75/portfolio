<%@page import="javafx.scene.control.Alert"%>
<%@page import="vo.PageInfo"%>
<%@page import="vo.Hotel_room_DB"%>
<%@page import="vo.Hotel_main_DB"%>
<%@page import="vo.Hotel_review_DB"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*"%>
    
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>호텔 메인</title>
	<meta charset="utf-8">
	<link href="https://fonts.googleapis.com/css2?family=Cairo&family=Indie+Flower&family=Koulen&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="../css/style.css" />
	<link rel="stylesheet" type="text/css" href="../css/header_footer.css">
	
    <script src="http://use.fontawesome.com/releases/v6.1.2/js/all.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
   
    
</head>
<style>
	.up_bigbox{
		width: 1200px;
		height: 3320px;
		margin: 30px auto;
		background-color: skyblue;
		border-style: solid;
		border-radius: 8px;
	}
	#up_leftbox{
		width: 500px;
		height: 330px;
		
		float: left;
	}
	#imgbox01{
		width: 250px;
		height: 330px;
		
		margin-left:15px;
		float: left;
	}
	#imgbox02{
		clear:left;
		width: 770px;
		height: 150px;
		margin: 15px auto;
		
		float: left;
	}
	.up_leftbox{
		border-radius: 8px;
		width: 450px;
		height: 300px;
		border-style: solid;
		float: left;
	}
	#img01{
		
		width: 230px;
		height: 150px;
		border-radius: 8px;
		float: left;
	}
	#img02{
		
		width: 230px;
		height: 150px;
		border-radius: 8px;
		margin: 20px auto;
		float: left;
	}
	#img03{
		
		width: 230px;
		height: 150px;
		border-radius: 8px;
		
		float: left;
	}
	.img04{
		width: 230px;
		height: 150px;
		border-radius: 8px;
		margin-left:30px;
		
		float: left;
	}
	
	
	.up_medlebox{
		width: 380px;
		height: 330px;
		border-style: solid;
		margin-left:18px;
		border-radius: 8px;
		float: left;
	}
	.up_medlebox2{
		width: 380px;
		height: 150px;
		margin: 15px auto;
		border-style: solid;
		margin-left:18px;
		border-radius: 8px;
		float: left;
	}
	#down_bigbox{
		clear:left;
		width: 1200px;
		height: 400px;
		margin: 15px auto;
		border-style: solid;
		border-radius: 8px;
		background-color: pink;
	}
	.multiple-items{
		width: 230px;
		height: 150px;
		border-radius: 8px;
		margin: 20px auto;
		border-style: solid;
		float: left;
	}
	
	.re_headbox{
		width:1200px;
		height:50px;
		border-style: solid;
		
		text-align: center;
	}
	
	.reviwbox{
		clear:left;
		width:1050px;
		height:310px;
		border-style: solid;
		margin: 20px auto;
		background-color: #FAF4C0;
		border-radius: 15px;
	}
	.reviwbox_left{
		width:230px;
		height:310px;
		border-style: solid;
		margin: 0 auto;
		text-align: center;
		float:left;
	}
	.reviwbox_left_poto{
		width:228px;
		height:120px;
		border-style: solid;
		margin: 0 auto;
	}
	.poto{
		width:228px;
		height:120px;
		margin: 0 auto;
		border-radius: 15px;
									
	}
	.reviwbox_left_down{
		width:228px;
		height:190px;
		border-style: solid;
		margin: 0 auto;
		float:left;
	}
	
	.reviwbox_left_down_left{
		width:80px;
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
		width:80px;
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
		text-align: center;
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
		
	
</style>

<%
	
	request.setCharacterEncoding("UTF-8");

	String mb_id = (String)session.getAttribute("mb_id"); 

	ArrayList<Hotel_room_DB> roomList = (ArrayList<Hotel_room_DB>)request.getAttribute("roomList");
	ArrayList<Hotel_review_DB> reviewList = (ArrayList<Hotel_review_DB>)request.getAttribute("reviewList");
	

	ArrayList<Hotel_main_DB> mainList = (ArrayList<Hotel_main_DB>)request.getAttribute("mainList");
	
	String hot_main_num= (String)request.getParameter("hot_main_num");
	
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	
	int listCount=pageInfo.getListCount();
	int nowPage=pageInfo.getPage();
	int maxPage=pageInfo.getMaxPage();
	int startPage=pageInfo.getStartPage();
	int endPage=pageInfo.getEndPage();
	
	System.out.println(roomList+" : roomList roomjsp");
	System.out.println(reviewList+" : reviewList roomjsp");
	System.out.println(mainList+" : mainList roomjsp");
//	System.out.println(jjinList+" : jjinList roomjsp");
	System.out.println(pageInfo+" : PageInfo roomjsp");
	
	System.out.println(listCount+" : listCount roomjsp");
	System.out.println(nowPage+" : nowPage roomjsp");
	System.out.println(maxPage+" : maxPage roomjsp");
	System.out.println(startPage+" : startPage roomjsp");
	System.out.println(endPage+" : endPage roomjsp");
	
	
%>

<body>

	<%
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
		<div class="up_bigbox">		
			<div id="up_leftbox">					
					<img alt="사진 다시 넣어라잉~" src="../img/hotel_main/<%=mainList.get(0).getHot_main_img()%>" style="width: 500px;	height: 330px;border-radius: 8px;">			
			</div>
			<div id="imgbox01">
				<div id="img01">
					<img alt="사진 다시 넣어라잉~" src="../img/hotel_room/<%=roomList.get(1).getHot_room_img()%>" style="width: 230px;	height: 150px;border-radius: 8px;">
				</div>
				<div id="img02">
					<img alt="사진 다시 넣어라잉~" src="../img/hotel_room/<%=roomList.get(2).getHot_room_img()%>" style="width: 230px;	height: 150px;border-radius: 8px;">
				</div>
			</div>
			
			<div class="up_medlebox">
				호텔 이름 : <%=mainList.get(0).getHot_name()%><br>
				호텔 객실 이름 : <%=roomList.get(0).getHot_room_name()%><br>
				호텔 객실 이름 : <%=roomList.get(1).getHot_room_name()%><br>
				호텔 객실 이름 : <%=roomList.get(2).getHot_room_name()%>
			</div>
			
			<div id="imgbox02">				
				<div id="img03">
					<img alt="사진 다시 넣어라잉~" src="../img/hotel_room/<%=roomList.get(3).getHot_room_img()%>" style="width: 230px;	height: 150px;border-radius: 8px;">
				</div>
				<div class="img04">
					<img alt="사진 다시 넣어라잉~" src="../img/hotel_room/<%=roomList.get(4).getHot_room_img()%>" style="width: 230px;	height: 150px;border-radius: 8px;">
				</div>
				<div class="img04">
					<img alt="사진 다시 넣어라잉~" src="../img/hotel_room/<%=roomList.get(5).getHot_room_img()%>" style="width: 230px;	height: 150px;border-radius: 8px;">
				</div>
				
			</div>
			<div class="up_medlebox2">
				호텔 소개 서브
			</div>
			<div id="down_bigbox">			
				<div class="multiple-items">
					a a
				</div>
				<div class="multiple-items">
					s s
				</div>
				<div class="multiple-items">
					d d
				</div>
				<div class="multiple-items">
					f f
				</div>
				<div class="multiple-items">
					g g
				</div>
			</div>
			
			
			<header class="re_headbox">
				<h2>리뷰 상세정보</h2>				
			</header>	
					
					
				<% System.out.println(reviewList+"==22");  %>
				<%if(reviewList != null && listCount > 0){	%>
				<%for(int i=0;i<reviewList.size();i++){ %>
				<%= i %>
			<div class="reviwbox">
					<div class="reviwbox_left">	
						<div class="reviwbox_left_poto">
							<img src="../img/hotel_room/<%=roomList.get(0).getHot_room_img()%>"  class="poto">
						</div>
						
						<div class="reviwbox_left_down_left"   style="focus:'none';">
						평점 : 
						</div>
						<div class="reviwbox_left_down_rigth" readonly >
								<%=reviewList.get(i).getHot_re_grade()%>
						</div>
						<div class="reviwbox_left_down_left_sub" readonly style="focus:'none';">
						아이디 : 
						</div>
						<div class="reviwbox_left_down_rigth" style="cursor:'none';">
								<%=reviewList.get(i).getHot_re_id()%>
						</div>
						<div class="reviwbox_left_down_left_sub">
						투숙일 : 
						</div>
						<div class="reviwbox_left_down_rigth">
								<%=mainList.get(0).getHot_checkin_date()%>
						</div>
						<div class="reviwbox_left_down_left_sub">
						오늘날짜 : 
						</div>
						<div class="reviwbox_left_down_rigth">
								<%=reviewList.get(i).getHot_re_date()%>
						</div>
						
					</div>
					<div class="reviwbox_center">
						<div class="reviwbox_center_up">					
							타이틀 : <%=reviewList.get(i).getHot_re_title()%>				
						</div>
						<div clss="reviwbox_center_down">		
						<!-- <textarea rows="15" cols="120" > </textarea> insert할때 사용할 코드 -->
							상세내용 : <%=reviewList.get(i).getHot_re_content()%>
						</div>
						
					</div>
				</div>				
					<%} %>
				<section class="re_headbox">
					<%if(nowPage<=1){ %>
					[이전]&nbsp;
					<%}else{ %>
					<a href="../hotel/hotelRoomForm.ho?page=<%=nowPage-1 %>">[이전]</a>&nbsp;
					<%} %>
			
					<%for(int a=startPage;a<=endPage;a++){
							if(a==nowPage){%>
					[<%=a %>]
					<%}else{ %>
					<a href="../hotel/hotelRoomForm.ho?page=<%=a %>">[<%=a %>]
					</a>&nbsp;
					<%} %>
					<%} %>
			
					<%if(nowPage>=maxPage){ %>
					[다음]
					<%}else{ %>
					<a href="../hotel/hotelRoomForm.ho?page=<%=nowPage+1 %>">[다음]</a>
					<%} %>
				</section>
			<%
			}else{
			%>
			<section id="emptyArea">등록된 글이 없습니다.</section>
			<%}%>     
		
			<div class=main_reviwbox>
				aaaaa
			</div>
			<div class=main_reviwbox>
				aaaaa
			</div>
				
		</div>
			
		
			
	</section>
	
	<jsp:include page="../overlap/footer.jsp"/>
	
</body>
</html>