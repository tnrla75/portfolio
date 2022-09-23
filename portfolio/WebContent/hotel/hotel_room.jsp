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
		height: fit-content;
		margin: 30px auto;
		
		border-style: solid;
		border-radius: 8px;
	}
	#up_leftbox{
		width: 500px;
		height: 500px;		
		float: left;
		border-style: solid;
	}
	#img_main01{
		width: 500px;
		height: 330px;		
		float: left;
	}
	#imgbox01{
		width: 241px;
		height: 500px;
		border-style: solid;
		margin-left:20px;
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
		width: 241px;
		height: 150px;
		border-radius: 8px;
		float: left;
	}
	#img02{
		
		width: 241px;
		height: 150px;
		border-radius: 8px;
		margin: 25px auto;
		float: left;
	}
	#img03{		
		width: 241px;
		height: 150px;
		border-radius: 8px;
		margin: 20px auto;
		float: left;
	}
	.img04{
		width: 241px;
		height: 150px;
		border-radius: 8px;
		margin: 20px auto;
		margin-left:18px;	
		float: left;
	}
	
	
	#up_rightbox{
		width: 380px;
		height: 500px;
		border-style: solid;
		margin-left:20px;
		border-radius: 8px;
		float: left;
	}
	.up_right{
		width: 380px;
		height: 340px;
		border-style: solid;
		
		border-radius: 8px;
		float: left;
	}
	.hot_name{
		width: 360px;
		height: 80px;
		font-size:25px;
		border-style: solid;
		padding-left:10px;
		font-weight:bold;
	}
	.hot_address{
		width: 360px;
		height: 60px;
		border-style: solid;
		font-size:18px;
		padding-left:10px;
	}
	
	
	.up_rightlebox2{
		width: 380px;
		height: 150px;
		margin: 0 auto;
		border-style: solid;
		
		border-radius: 8px;
		float: left;
	}
	.room_bigbox{
		clear:left;
		width: 1200px;
		height: fit-content;

		margin: 15px auto;
		border-style: solid;
		border-radius: 8px;		
		
	}
	.medle_roombox{
		width: 1000px;
		height: 300px;
		margin: 15px auto;
		border-style: solid;
		border-radius: 8px;
		
	}
	.me_room_name{
		width: 1000px;
		height: 40px;
		margin: 15px auto;
		font-size:25px;
		font-weight:bold;
		border-style: solid;
		border-radius: 8px;
		
	}
	.me_box{
		width: 1000px;
		height: 220px;
		margin: 0 auto;
		border-style: solid;
		border-radius: 8px;
	}
	.me_img{
		width: 200px;
		height: 200px;
		border-style: solid;
		border-radius: 8px;
		float:left;
	}
	.me_naiyou1{
		width: 350px;
		height: 200px;
		border-style: solid;
		border-radius: 8px;
		margin-left:26px;
		
		
		float:left;
	}
	
	
	
	.re_headbox{
		clear:left;
		width:1200px;
		height:80px;
		border-style: solid;
		margin: 0 auto;
		text-align: center;
	}
	.blank{
		width:394px;
		height:60px;
	
		border-style: solid;
		float: left;
	}
	.re_insert{
		width:80px;
		height:50px;
		font-size:20px;
		
		color:white;
		
	}
	.reviwbox{
		clear:left;
		width:1050px;
		height:310px;
		border-style: solid;
		margin: 20px auto;
		
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
	.yoyaku{
		width:992px;
		height:80px;
		font-weight:bold;
		border-style: solid;
		text-algin:left;
		
		margin: 15px auto;
		border-radius: 8px;
	}
	
	
</style>

<%
	
	request.setCharacterEncoding("UTF-8");

	String mb_id = (String)session.getAttribute("mb_id"); 

	ArrayList<Hotel_room_DB> roomList = (ArrayList<Hotel_room_DB>)request.getAttribute("roomList");
	ArrayList<Hotel_review_DB> reviewList = (ArrayList<Hotel_review_DB>)request.getAttribute("reviewList");
	
	ArrayList<Hotel_main_DB> mainList = (ArrayList<Hotel_main_DB>)request.getAttribute("mainList");
	
	String hot_main_num=request.getParameter("hot_main_num");
	
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
<script>
	<%-- function writea(){
		alert("aa");
		location.href="../hotel/hotel_re_insert_01.jsp?hot_main_num=<%=hot_main_num %>";
	} --%>
	function logincheck(){
		var mb_id = '<%=(String)session.getAttribute("mb_id")%>';
		if(mb_id == "null"){
			alert("로그인 해주세요.");
			location.replace("../overlap/login.jsp");
		}else{
			location.replace("../hotel/hotel_re_insert_01.jsp?hot_main_num=<%=hot_main_num %>");
		}
	} 
	
	
	</script>
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
				<div id="img_main01">					
					<img alt="사진 다시 넣어라잉~" src="../img/hotel_room/<%=roomList.get(0).getHot_room_img()%>" style="width: 500px;	height: 330px;border-radius: 8px;">			
				</div>
				<div id="img03">				
					<img alt="사진 다시 넣어라잉~" src="../img/hotel_room/<%=roomList.get(1).getHot_room_img()%>" style="width: 241px;	height: 150px;border-radius: 8px;">
				</div>
				<div class="img04">
					<img alt="사진 다시 넣어라잉~" src="../img/hotel_room/<%=roomList.get(2).getHot_room_img()%>" style="width: 241px;	height: 150px;border-radius: 8px;">
				</div>
				
			</div>
			<div id="imgbox01">
				<div id="img01">
					<img alt="사진 다시 넣어라잉~" src="../img/hotel_room/<%=roomList.get(3).getHot_room_img()%>" style="width: 241px;	height: 150px;border-radius: 8px;">
				</div>
				<div id="img02">
					<img alt="사진 다시 넣어라잉~" src="../img/hotel_room/<%=roomList.get(4).getHot_room_img()%>" style="width: 241px;	height: 150px;border-radius: 8px;">
				</div>
				<div class="img02">
					<img alt="사진 다시 넣어라잉~" src="../img/hotel_room/<%=roomList.get(5).getHot_room_img()%>" style="width: 241px;	height: 150px;border-radius: 8px;">
				</div>
			</div>
			
			<div id="up_rightbox">
				<div class="up_right">
					<div class="hot_name"><%=mainList.get(0).getHot_name()%><hr></div>
					<div class="hot_address"><%=mainList.get(0).getHot_address()%><br></div>
					<div class="hot_address">
						체크인 시간 : <%=mainList.get(0).getHot_checkin_time()%><br>
						체크아웃 시간: <%=mainList.get(0).getHot_checkout_time()%><br>
					</div>
					<div class="hot_address">aa<br></div>
					
					 
				</div>
				<div class="up_rightlebox2">
					호텔 소개 서브<br>
					<%if(mainList.get(0).getHot_wifi()!=null){%>						
						<i class='fa-solid fa-wifi'></i> <%=mainList.get(0).getHot_wifi()%>
					<%} %>
					<%if(mainList.get(0).getHot_meetRoom()!=null){%>
						
						<i class='fa-regular fa-suitcase'> 회의실</i><%=mainList.get(0).getHot_meetRoom()%>
					<%} %>
					<%if(mainList.get(0).getHot_smoking()!=null){ %>
						<i class="fa-solid fa-joint"></i> 흡연가능<%=mainList.get(0).getHot_smoking()%>
					<%} %> 
					<%if(mainList.get(0).getHot_Nosmoking()!=null){%>
						<i class="fa-solid fa-ban-smoking"> 흡연불가능</i><%=mainList.get(0).getHot_Nosmoking()%>
					<%} %> 
					<%if(mainList.get(0).getHot_TV()!=null){%>
						<i class="fa-solid fa-tv"></i> 티비<%=mainList.get(0).getHot_TV()%>
					<%} %>
					<%if(mainList.get(0).getHot_restaurant()!=null){%>
						<i class="fa-duotone fa-utensils"></i> 레스토랑<%=mainList.get(0).getHot_restaurant()%>
					<%} %> 
					<%if(mainList.get(0).getHot_breakfast()!=null){%>
						<i class="fa-solid fa-bowl-food"></i> 조식<%=mainList.get(0).getHot_breakfast()%>
					<%} %> 
				</div>
			</div>
			
			
			
				
			<div class="room_bigbox">	
				<header class="re_headbox">
					<h2>방 상세정보</h2>				
				</header>		
				<%for(int i=0;i<roomList.size();i++){ %>
				<div class="medle_roombox">
					<div class="me_room_name">
						&clubs; <%=roomList.get(i).getHot_room_name()%><br>
					</div>
					<div class="me_box">
						<div class="me_img">
							<img alt="사진 다시 넣어라잉~" src="../img/hotel_main/<%=mainList.get(0).getHot_main_img()%>" style="width: 200px;	height: 200px;border-radius: 8px;">
						</div>
						<div class="me_naiyou1">
						fas
						</div>
						<div class="me_naiyou1">
						fas	
						</div>
					</div>
					
				</div>
				<div class="yoyaku">
						예약 부분
					</div>
				<%} %>
										
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
								<%=reviewList.get(i).getHot_re_rate()%>
						</div>
						<div class="reviwbox_left_down_left_sub" readonly style="focus:'none';">
							아이디 : 
						</div>
						<div class="reviwbox_left_down_rigth" style="cursor:'none';">
								<%=reviewList.get(i).getHot_re_id()%>
						</div>
						
						<div class="reviwbox_left_down_left_sub">
							작성날짜 : 
						</div>
						<div class="reviwbox_left_down_rigth">
								<%=reviewList.get(i).getHot_re_date()%>
						</div>
						
					</div>
					
					<div class="reviwbox_center">
						<div class="reviwbox_center_up">					
							리뷰번호 : 	 <%=reviewList.get(i).getHot_re_num()%>
							호텔번호 : 	 <%=reviewList.get(i).getHot_main_num()%>
						</div>
						<div clss="reviwbox_center_down">		
						<!-- <textarea rows="15" cols="120" > </textarea> insert할때 사용할 코드 -->
							상세내용 : <%=reviewList.get(i).getHot_re_content()%>						
						</div>
						
					</div>
					<%if(reviewList.get(i).getHot_re_id().equals(mb_id)){%>
						<a href="hotel_re_update_01.jsp?hot_re_num=<%=reviewList.get(i).getHot_re_num()%>&hot_main_num=<%=reviewList.get(0).getHot_main_num()%> value='수정' class='button' ">수정</a>
					<%}%>
					<%
					 if(reviewList.get(i).getHot_re_id().equals(mb_id)){	%>				
					<a  href="hotel_re_delete.jsp?hot_re_num=<%=reviewList.get(i).getHot_re_num()%>&hot_main_num=<%=reviewList.get(0).getHot_main_num()%> value='삭제' class='button'">삭제</a>
							
					<%}%>
					
				</div>				
					<%} %>
				<section class="re_headbox">
					<div class="blank">
						&nbsp;
					</div>
					<div class="blank">
						<%if(nowPage<=1){ %>
						[이전]&nbsp;
						<%}else{ %>
						<a href="../hotel/hotelRoomForm.ho?page=<%=nowPage-1 %>&hot_main_num=<%=mainList.get(0).getHot_main_num()%>">[이전]</a>&nbsp;
						<%} %>
				
						<%for(int a=startPage;a<=endPage;a++){
								if(a==nowPage){%>
						[<%=a %>]
						<%}else{ %>
						<a href="../hotel/hotelRoomForm.ho?page=<%=a %>&hot_main_num=<%=mainList.get(0).getHot_main_num()%>">[<%=a %>]
						</a>&nbsp;
						<%} %>
						<%} %>
				
						<%if(nowPage>=maxPage){ %>
						[다음]
						<%}else{ %>
						<a href="../hotel/hotelRoomForm.ho?page=<%=nowPage+1 %>&hot_main_num=<%=mainList.get(0).getHot_main_num()%>">[다음]</a>
						<%} %>
					</div>
					<div class="blank">
						<input class="re_insert" type="button" value="글쓰기" onclick="logincheck()" >
					</div>
				</section>
			<%
			}else{
			%>
			<section id="emptyArea">등록된 글이 없습니다.</section>
			<%}%>     
		
			
				
		</div>
			
		
			
	</section>
	
	<jsp:include page="../overlap/footer.jsp"/>
	
</body>
</html>