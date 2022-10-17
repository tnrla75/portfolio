<%@page import="javafx.scene.control.Alert"%>
<%@page import="vo.PageInfo"%>
<%@page import="vo.Hotel_room_DTO"%>
<%@page import="vo.Hotel_main_DTO"%>
<%@page import="vo.Hotel_review_DTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
			<!-- 가격 컴마 링크 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>호텔 메인</title>
	<link href="https://fonts.googleapis.com/css2?family=Cairo&family=Indie+Flower&family=Koulen&display=swap" rel="stylesheet">
	
	<link rel="stylesheet" type="text/css" href="../css/header_footer.css">	
    <script src="http://use.fontawesome.com/releases/v6.1.2/js/all.js"></script>    
    					
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
   
    
</head>
<style>
	.up_bigbox{
		width: 1200px;
		height: fit-content;
		margin: 30px auto;
		
		
		border-radius: 4px;
	}
	#up_leftbox{
		width: 500px;
		height: 500px;		
		float: left;
		box-shadow: 7px 7px 7px #BDBDBD;
	}
	
	#imgbox01{
		width: 241px;
		height: 500px;
		
		margin-left:20px;
		float: left;
	}
	
	.up_leftbox{
		border-radius: 4px;
		width: 450px;
		height: 300px;
		
		float: left;
	}
	#img01{		
		width: 241px;
		height: 150px;
		border-radius: 4px;
		box-shadow: 7px 7px 7px #BDBDBD;
		margin-bottom:10px;
		float: left;
	}
	.img02{
		
		width: 241px;
		height: 150px;
		border-radius: 4px;
		margin: 12px auto;
		box-shadow: 7px 7px 7px #BDBDBD;
		float: left;
	}
	
	
	
	#up_rightbox{
		width: 380px;
		height: 500px;
		border-bottom:solid 1px rgba(0,0,0,0.4);
		margin-left:20px;
		border-left:solid 0.1px rgba(0,0,0,0.1);
		border-top:solid 0.1px rgba(0,0,0,0.1);
		box-shadow: 7px 7px 7px #BDBDBD;
		float: left;
	}
	.up_right{
		width: 380px;
		height: 340px;
		
		
		border-radius: 4px;
		float: left;
	}
	.hot_name{
		width: 360px;
		height: 120px;
		font-size:25px;
		
		padding-left:10px;
		font-weight:bold;
	}
	.hot_address{
		width: 360px;
		height: 90px;
		
		font-size:18px;
		padding-left:10px;
	}
	
	
	.up_rightlebox2{
		width: 380px;
		height: 150px;
		margin: 0 auto;
		
		border-top:solid 1px rgba(0,0,0,0.4);
		
		float: left;
	}
	.up_rightlebox2 div:first-of-type{
		width: 360px;
		height: 30px;
		margin: 0 auto;
		padding:10px;
		padding-top:10px;
	}
	
	.up_up{
		
		
	}
	.up_down{
		width: 150px;
		height: 25px;
		margin-left: 20px;
		
		float: left;
	}
	.room_bigbox{
		clear:left;
		width: 1200px;
		height: fit-content;
		margin: 20px auto;
		padding-top:20px;
		border-radius: 4px;		
		
	}
	.medel_roombox{
		width: 1100px;
		height: 300px;
		margin: 20px auto;
		background-color: rgba(231,231,231,0.7);
		box-shadow: 7px 7px 7px #BDBDBD;
		border-radius: 4px;
		
	}
	.me_room_name{
		width: 980px;
		height: 40px;
		margin: 10px auto;
		line-height:40px;
		padding-top:20px;
		font-size:25px;
		font-weight:bold;
		
		
	
	}
	.me_box{
		width: 1000px;
		height: 200px;
		margin: 0 auto;
		
		border-radius: 4px;
	}
	.me_img{
		width: 200px;
		height: 200px;
		
		border-radius: 4px;
		margin-left:20px;
		box-shadow: 7px 7px 7px #BDBDBD;
		float:left;
	}
	.me_naiyou1{
		width: 240px;
		height: 180px;		
		border-right: solid 1px rgba(0,0,0,0.4);		
		padding-top:10px;
		padding-left:10px;		
		margin-left:10px;
		font-size:15px;
		font-width: bold;
		text-align: left;
		float:left;
	}
	.me_naiyou1 div:first-of-type{
		width: 110px;
		height: 25px;
		text-align: left;
		float:left;
		
		padding-top:5px;
	}
	.room_amount{
		width: 80px;
		height: 30px;
		color:red;
		line-height:20pt;
		font-weight: bold;
		font-size: 18px;
		
		text-align: left;
		margin-left:10px;
		
		float:left;
	}
	.me_yoyaku{
		width: 230px;
		height: 200px;		
		border-radius: 4px;		
		margin-right:10px;
		font-size:20px;	
		text-align: center;
		float:right;
	}
	.room_small{		
		margin-top:10px;
		margin-bottom: 10px;		
		width: 120px;
		height: 50px;
		float:right;
	}
	.room_small div:first-of-type{	
		text-align:center;
	}
	.room_small div:last-of-type{	
		text-align:center;
		
		margin-bottom:10px;
		width: 120px;
	}
	.price_small{
		clear:right;
		color: red;		
		font-weight: bold;
		margin-top:10px;
		margin-bottom: 10px;
		
		border-color:red;
		width: 120px;
		height: 30px;
		float:right;
		text-align: center;
	}
	.yoyaku_small{
		clear:right;
		width:140px;
		height:60px;
		
		float:right;
	}
	.yoyaku_btn{
		
		width:140px;
		height:50px;
		font-size:15px;
		background-color:#000054;
		color:white;
		border-radius: 4px;
		
		
	}
	
	.re_headbox{
		clear:left;
		width:1200px;
		height:80px;		
		margin: 40px auto;
		text-align: center;
		border-top: solid 1px rgba(0,0,0,0.4)
	}
	#emptyArea{
		
		width:1200px;
		height:80px;		
		margin: 40px auto;
		text-align: center;
		
	}
	.blank{
		width:360px;
		height:60px;
		text-align: center;
		float: left;
	}
	.re_insert{
		width:80px;
		height:50px;
		font-size:20px;
		background-color:#000054;
		color:white;
		border-radius: 4px;
		
	}
	.reviwbox{
		clear:left;
		width:1050px;
		height:260px;
		border-style: solid;
		margin: 20px auto;
		background-color: #FAF4C0;
		border-radius: 4px;
	}
	.reviwbox_left{
		width:230px;
		height:260px;
		
		margin: 0 auto;
		text-align: center;
		float:left;
	}
	
	.reviwbox_left_down{
		
		width:228px;
		height:190px;
		
		margin: 0 auto;
		float:left;
	}
	
	.reviwbox_left_down_left{
		clear:left;
		width:85px;
		height:47px;
		text-align: right;
		padding:5px;
		margin: 0 auto;
		float:left;
	}
	.reviwbox_left_down_left:focus{
			outline:none;
	}
		
	.reviwbox_left_down_left_sub{
		clear:left;
		width:85px;
		height:47px;
		padding:5px;
		text-align: right;
		margin: 0 auto;
		float:left;
	}
	.reviwbox_left_down_rigth{	
		width:110px;
		height:40px;
		padding:5px;
		text-align: left;
		margin: 0 auto;
		text-align: left;
		float:left;
	}
	.reviwbox_center{
		width:792px;
		height:260px;
		
		float:left;
	}
	.reviwbox_center_up{
		width:792px;
		height:58px;		
		font-size:22px;
		
		float:left;
	}
	.reviwbox_center_up_left{
		width:560px;
		height:50px;		
		font-size:22px;
		
		float:left;
	}
	.reviwbox_center_up_right{
		
		width:200px;
		height:50px;		
		font-size:22px;
		
		float:right;
	}
	.reviwbox_center_down{
		
		width:792px;
		height:190px;
		
		text-algin:left;
		margin: 0 auto;
		float:left;
	}
	
	.downbox{
		clear:left;
		width:1200px;
		height:80px;		
		margin: 30px auto;
		padding-top:15px;
		text-align: center;
		border-top: solid 1px rgba(0,0,0,0.4)
	}
	
</style>

<%
	request.setCharacterEncoding("UTF-8");

	String mb_id = (String)session.getAttribute("mb_id"); 

	ArrayList<Hotel_room_DTO> roomList = (ArrayList<Hotel_room_DTO>)request.getAttribute("roomList");
	ArrayList<Hotel_review_DTO> reviewList = (ArrayList<Hotel_review_DTO>)request.getAttribute("reviewList");
	
	ArrayList<Hotel_main_DTO> mainList = (ArrayList<Hotel_main_DTO>)request.getAttribute("mainList");
	
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
	
//	var qwwe = $('input[name=value]').val(); JSP(히든을)를 JS에  호출하는 방법
	<%-- <input type="hidden" name=value value="<%=mb_id%>"> --%>
	var mb_id = '<%=mb_id%>';
	function logincheck(){
		
		if(mb_id == "null"){
			alert("로그인 해주세요.");
			location.replace("../overlap/login.jsp");
		}else{
			location.replace("../hotel/hotel_re_insert_01.jsp?hot_main_num=<%=hot_main_num %>");
		}
	} 
	function yoyakuBt(hot_room_num,hot_main_num,mb_id){
		
		if(mb_id == "null"){
			alert("로그인 해주세요.");
//			location.replace("../overlap/login.jsp");
			location.replace("../hotel/hotelYoyakuForm.ho?hot_room_num="+hot_room_num+"&hot_main_num="+hot_main_num+"&mb_id="+mb_id);
		}else{
			location.replace("../hotel/hotelYoyakuForm.ho?hot_room_num="+hot_room_num+"&hot_main_num="+hot_main_num+"&mb_id="+mb_id);
		}
	}
	function getPost(mode)
	{
		var myform = document.myform;
		if(mode == '05'){
			myform.action = "../hotel/hotelMainForm.ho";
		}
		
		myform.submit();
	};
	
	
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
	<form >
	<section>		
		<div class="up_bigbox">		
			<div id="up_leftbox">
								
					<img alt="사진 다시 넣어라잉~" src="../img/hotel/hotel_room/<%=roomList.get(0).getHot_room_img()%>" style="width: 500px;	height: 500px;border-radius: 4px;">			
				
				
			</div>
			<div id="imgbox01">
				<div id="img01">
					<img alt="사진 다시 넣어라잉~" src="../img/hotel/hotel_room/<%=roomList.get(1).getHot_room_img()%>" style="width: 241px;	height: 150px;border-radius: 4px;">
				</div>
				<div class="img02">
					<img alt="사진 다시 넣어라잉~" src="../img/hotel/hotel_room/<%=roomList.get(2).getHot_room_img()%>" style="width: 241px;	height: 150px;border-radius: 4px;">
				</div>
				<div class="img02">
					<img alt="사진 다시 넣어라잉~" src="../img/hotel/hotel_room/<%=roomList.get(3).getHot_room_img()%>" style="width: 241px;	height: 150px;border-radius: 4px;">
				</div>
			</div>
			
			<div id="up_rightbox">
				<div class="up_right">
					<div class="hot_name"><%=mainList.get(0).getHot_name()%><br><br><br></div>
					<div class="hot_address"><%=mainList.get(0).getHot_address()%><br><br></div>
					<div class="hot_address">
						체크인 시간 : <%=mainList.get(0).getHot_checkin_time()%><br><br>
						체크아웃 시간: <%=mainList.get(0).getHot_checkout_time()%><br><br>
					</div>
					
					
					 
				</div>
				<div class="up_rightlebox2">
					<div class="up_up">호텔 소개 서브<br></div>
					
					<%if(mainList.get(0).getHot_wifi()!=null){%>						
						<div class="up_down"><i class='fa-solid fa-wifi'></i> <%=mainList.get(0).getHot_wifi()%></div>
					<%} %>
					
					
					<%if(mainList.get(0).getHot_meetRoom()!=null){%>						
						<div class="up_down"><i class="fa-regular fa-handshake"></i> <%=mainList.get(0).getHot_meetRoom()%><br></div>
					<%} %>
					
					
					<%if(mainList.get(0).getHot_smoking()!=null){%>						
						<div class="up_down"><i class="fa-solid fa-smoking"></i> <%=mainList.get(0).getHot_smoking()%></div>
					<%} %>	
					
									
					<%if(mainList.get(0).getHot_restaurant()!=null){%>
						<div class="up_down"><i class="fa-solid fa-utensils"></i> <%=mainList.get(0).getHot_restaurant()%><br></div>
					<%} %> 					
					
								
					<%if(mainList.get(0).getHot_cafe()!=null){%>						
						<div class="up_down"><i class="fa-solid fa-mug-saucer"></i> <%=mainList.get(0).getHot_cafe()%><br></div>
					<%} %>
					
					
					<%if(mainList.get(0).getHot_bar()!=null){%>						
						<div class="up_down"><i class="fa-solid fa-martini-glass"></i> <%=mainList.get(0).getHot_bar()%></div>
					<%} %>			
					
				</div>
			</div>
			 
			<div class="room_bigbox">	
				<header class="re_headbox">
					<h2>방 상세정보</h2>				
				</header>		
				<%for(int i=0;i<roomList.size();i++){ %>
				<div class="medel_roombox">
					<div class="me_room_name">
						&clubs; <%=roomList.get(i).getHot_room_name()%><br>
					</div>
					<div class="me_box">
						<div class="me_img">
							<img alt="사진 다시 넣어라잉~" src="../img/hotel/hotel_room/<%=roomList.get(i).getHot_room_img()%>" style="width: 200px;	height: 200px;border-radius: 4px;">
						</div>
						
						<div class="me_naiyou1">
							
							
							<%if(roomList.get(i).getHot_room_wifi() !=null){%>						
								<i class='fa-solid fa-wifi'> </i> <%=roomList.get(i).getHot_room_wifi()%><br>
							<%} %> 
							<%if(roomList.get(i).getHot_room_TV() !=null){%>
								<i class="fa-solid fa-tv"> </i> <%=roomList.get(i).getHot_room_TV()%><br>
							<%} %> 
							
							<%if(roomList.get(i).getHot_room_breakfast() !=null){%>
								<i class="fa-solid fa-bowl-rice"></i> <%=roomList.get(i).getHot_room_breakfast()%><br>
							<%}else{ %> 
							<%} %>
							<%if(roomList.get(i).getHot_room_Nobreakfast() !=null){%>
								<i class="fa-solid fa-ban-smoking"> </i> <%=roomList.get(i).getHot_room_Nobreakfast()%><br>
							<%} %> 
							
							<%if(roomList.get(i).getHot_room_airCon() !=null){%>
								<i class="fa-solid fa-snowflake"></i> <%=roomList.get(i).getHot_room_airCon()%><br>
							<%} %> 
							
							<%if(roomList.get(i).getHot_room_shower() !=null){%>
								<i class="fa-solid fa-shower"> </i> <%=roomList.get(i).getHot_room_shower()%><br>
							<%} %> 				
											
							
							
						</div>
						<div class="me_naiyou1">
								<br>
								<%if(roomList.get(i).getHot_room_bedsort() !=null){%>
									<i class="fa-solid fa-bed"> </i> <%=roomList.get(i).getHot_room_bedsort()%><br><br>
								<%} %> 
								
								<%if(roomList.get(i).getHot_room_maxpeople() !=null){ %>
									<div>사용가능 인원 : </div> <div class="room_amount">  <%=roomList.get(i).getHot_room_maxpeople()%> 명</div>
								<%} %>
								
								<%if(roomList.get(i).getHot_room_parking() !=null){ %>									
									<div><%=roomList.get(i).getHot_room_parking()%></div>									
								<%} %>
								
								<%if(roomList.get(i).getHot_room_Noparking() !=null){ %>									
									<div><%=roomList.get(i).getHot_room_Noparking()%></div>									
								<%} %>
								
							
						</div>
						<div class="me_yoyaku">
								<div>
										&nbsp;
										</div>
									<div class="room_small">
										<div>남은 객실</div>
										<div><%=roomList.get(i).getHot_room_amount()+"개" %></div> 
									</div>
									<div class="price_small">
										<fmt:formatNumber value="<%=roomList.get(i).getHot_room_price()%>" groupingUsed="true" />원
									</div>
									<div class="yoyaku_small">
									
										<input type="button"  name="yoyakuBtn" class="yoyaku_btn" value="예약하기" onclick="yoyakuBt(<%=roomList.get(i).getHot_room_num()%>,<%=roomList.get(i).getHot_main_num()%>,<%=mb_id%>)">
									</div>
							
						</div>
					</div>
					
				</div>
				
				<%} %>
										
				</div>				
					
			
			
			<header class="re_headbox">
				<h2>리뷰 상세정보</h2>				
			</header>	
					
				<% System.out.println(reviewList+"==22");  %>
				<%if(reviewList != null && listCount > 0){	%>
				<%for(int i=0;i<reviewList.size();i++){ %>
			
			<div class="reviwbox">
					<div class="reviwbox_left">	
						<div class="reviwbox_left_down_left"   style="focus:'none';">
							&nbsp;
						</div>
						<div class="reviwbox_left_down_rigth" readonly >
								&nbsp;
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
							<div class="reviwbox_center_up_left">				
							리뷰번호 : 	 <%=reviewList.get(i).getHot_re_num()%>
							호텔번호 : 	 <%=reviewList.get(i).getHot_main_num()%>
							</div>	
							<div class="reviwbox_center_up_right">
								<%if(reviewList.get(i).getHot_re_id().equals(mb_id)){%>
									<a href="hotel_re_update_01.jsp?hot_re_num=<%=reviewList.get(i).getHot_re_num()%>&hot_main_num=<%=reviewList.get(0).getHot_main_num()%> value='수정' class='button' ">수정</a>
								<%}else{%>								
									
								<%}%>	
								<%if(reviewList.get(i).getHot_re_id().equals(mb_id)){%>				
									<a  href="hotel_re_delete.jsp?hot_re_num=<%=reviewList.get(i).getHot_re_num()%>&hot_main_num=<%=reviewList.get(0).getHot_main_num()%>" 
									value='삭제' class='button'">삭제</a>
								<%}%>
							</div>
						</div>
						<div class="reviwbox_center_down">		
						<!-- <textarea rows="15" cols="120" > </textarea> insert할때 사용할 코드 -->
							상세내용 : <%=reviewList.get(i).getHot_re_content()%>						
						</div>
						
					</div>
					
					
				</div>				
					<%} %>
				<section class="downbox">
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
						<input class="re_insert" style="float: right;" type="button" value="글쓰기" onclick="logincheck()" >
					</div>
				</section>
			<%
			}else{
			%>
			<section id="emptyArea" >등록된 글이 없습니다.</section>
			<section class="downbox">
				
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
						<input class="re_insert" style="float: right;" type="button" value="글쓰기" onclick="logincheck()" >
					</div>
			
			</section>
			<%}%>     
		
			
				
		</div>
				
	</section>
	</form>
	<jsp:include page="../overlap/footer.jsp"/>
	
</body>
</html>