<%@page import="java.util.TreeMap"%>
<%@page import="vo.Hotel_room_DTO"%>
<%@page import="action.Hotel_MainAction"%>
<%@page import="vo.Hotel_main_DTO"%>
<%@page import="vo.Hotel_review_DTO"%>
<%@page import="vo.PageInfo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*"%>
   <!--  fmt사용 lib 선언  -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>호텔 메인</title>
	<meta charset="utf-8">
	<link href="https://fonts.googleapis.com/css2?family=Cairo&family=Indie+Flower&family=Koulen&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="../css/style.css" />
	<link type="text/css" rel="stylesheet" href="../css/style2.css" />
	<link rel="stylesheet" type="text/css" href="../css/header_footer.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	
	<link type="text/css" rel="stylesheet" href="../css/responsive-tabs.css" />
	
						<!-- 메뉴 그림 -->
    <script src="http://use.fontawesome.com/releases/v6.1.2/js/all.js"></script>
   
    
</head>
<style>
	body{
		
	}
	#up_rightbox input:first-of-type {
		height: 40px;
		width: 200px;
		font-size: 10pt;
		padding-left: 30px;
		padding-right: 30px; 
		border-style: solid;
		border-width: 0;
		background-color: gray;
		position: relative;
		bottom: 5px;
	}
	
	#up_rightbox input:last-of-type {
		border-style: none;
		background: url(../img/icon/loupe.png);
		width: 35px;
		height: 35px;
		background-size: 20px;
		background-repeat: no-repeat;
		position: relative;
		left: 40px;
		top: 20px;
	}
	.section{
		width: 1200px;
		height: 1400px;
		
		margin: 40px auto;
		border-style: solid;
		background-color: white;		
	}
	#head{	
	width: 1200px;
	height: 50px;
	margin: 0 auto;
	font-weight:bold;
	text-align: center;
	
	}
	#up_rightbox{
		width: 850px;
		height: 170px;
		margin: 0 auto;
		border-radius: 7px;
		border-style: solid;
		float:left;
	}
	#up_leftbox{
		width: 300px;
		height: 1300px;
		margin: 0 auto;
		margin-right: 20px;
		text-align: center;
		border-style: solid;
		border-radius: 7px;
		float:left;
	}
	#map{
		width: 298px;
		height: 200px;
		border-style: solid;
		float: left;
	}
	
	.starbox{
		clear:left;
		width: 298px;
		height: 70px;
		margin: 20px auto;
		text-align: center;
		
		float: left;
	}
	.star{
		
		width: 48px;
		height: 25px;
		margin: 10px 0 0 10px;
		text-align: center;	
		border-bottom: solid 1px rgba(0,0,0,0.4);	
		float: left;
	}
	.starbutton{
		border-color:white;
		background-color: white;
		
	}
    #starHead{
    	width: 296px;
		height: 30px;
		margin: 0 auto;
		text-align: center;
		
		background-color:DADADA;
		float: left;
    }
	.countrybox{
		clear:left;
		width: 298px;
		height: 70px;
		margin: 20px auto;
		text-align: center;
		
		
	}

	.country{		
		width: 296px;
		height: 30px;
		margin: 10px auto;
		text-align: center;		
		background-color:DADADA;
		float: left;
	}
	.nation{			
		width: 60px;
		height: 35px;
		margin: 10px 0 0 12px;
		text-align: center;		
		float: left;
	}
	.nationButton{
		border-color:white;
		background-color: white;
	}
	
	
	#centerbox{
		width: 800px;	
		height: fit-content;
		margin: 0 auto;
		padding-bottom: 30px;		
		text-align: center;
		border-radius: 7px;
		
		float:left;
		
	}
	
	.up_rightbox{
		width: 850px;
		height: 220px;
		margin: 10px auto;
		text-align: center;
		
		border-bottom: solid 1px rgba(0,0,0,0.4);
		float:left;
	}
	.hot_centerimg{
		width: 180px;
		height: 200px;
		margin: 0 auto;
		border-radius: 7px;
		text-align: center;
		box-shadow: 7px 7px 7px #BDBDBD;
		float:left;
	}
	
	.hot_centerbox{
		width: 590px;
		height: 200px;
		margin: 0 auto;		
		text-align: left;
		margin-left:20px;
		border-left: solid 1px rgba(0,0,0,0.4);
		float:left;
	}
	.hot_centerbox_up{
		width: 580px;
		height: 50px;
		margin: 0 auto;		
		text-align: left;
		
		padding-left:10px;
		float:left;
	}
	
	
	.hot_centerbox_up_left{
		width: 460px;
		height: 80px;
		margin: 0 auto;		
		text-align: left;
		font-size:15px;		
		float:left;
	}
	#hotel_name{
		width: 460px;
		height: 50px;
		
		font-weight: bold;
		font-size:20px;
	}
	#room_name{
		width: 460px;
		height: 20px;
		margin-top:10px;
		font-weight: bold;
		text-decoration: underline;
	}
	.hot_centerbox_up_right{
		width: 100px;
		height: 50px;
		margin: 0 auto;		
		text-align: right;
				
		float:left;
	}
	.hot_centerbox_down{
		width: 580px;
		height: 110px;
		margin: 45px auto;		
		text-align: left;
		background: linear-gradient(-90deg, #fff 0%, #fff 25%, #f5f7fa 100%);
		
		margin-left:10px;
		float:left;
	}
	.hot_centerbox_down_left{
		clear:left;
		width: 380px;
		height: 100px;
		margin: 0 auto;		
		text-align: left;
		line-height:20pt;
		padding-left:10px;
		float:left;
	}
	.room_bold{
		font-weight: bold;
	}
	.hot_centerbox_down_left_sub{
		width: 120px;
		height: 20px;
		font-size:15px;
		float:left;
	}
	
	.hot_centerbox_down_rigth{
		float: right;
		width: 165px;
		height: 70px;
		margin: 0 auto;	
		font-size:22px;	
		text-align: right;
		
		float:left;
	}
	.hot_centerbox_down_rigth div:first-of-type{
		color: red;
		font-weight: bold;
	}
	
	.line{
		width: 150px;
		height: 40px;
		text-align:center;
		border-color:red;
		border-bottom: solid 1px rgba(0,0,0,0.4);
		float:right;
	}
	
</style>
<%
	request.setCharacterEncoding("UTF-8");

	String mb_id = (String)session.getAttribute("mb_id"); 
	
	ArrayList<Hotel_main_DTO> mainList=(ArrayList<Hotel_main_DTO>)request.getAttribute("mainList");	
	
	TreeMap<Integer, Hotel_room_DTO> main_roomList=(TreeMap<Integer, Hotel_room_DTO>)request.getAttribute("main_roomList");	
	
	System.out.println(main_roomList+" : mainJsp main_roomList");
	
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	
	int listCount=pageInfo.getListCount();
	int nowPage=pageInfo.getPage();
	int maxPage=pageInfo.getMaxPage();
	int startPage=pageInfo.getStartPage();
	int endPage=pageInfo.getEndPage();
	
	String hot_nation=(String)request.getParameter("hot_nation");
	String people_num=(String)request.getParameter("people_num");
	String start_date=(String)request.getParameter("start_date");
	String finish_date=(String)request.getParameter("finish_date");
%>
<script type="text/javascript">
	function getPost(mode){
		 var myform=document.myform;
		if(mode=='04'){
			myform.action="/hotelMainForm.ho";
		}else if(mode == '05'){
			myform.action = "../hotel/hotelMainForm.ho";
		}
		myform.submit();
	}
	
	// 호텔 성급 ajax
	function stars(hot_star){
		var hot_star=hot_star.value;		
						<%-- location.replace("../hotel/hotelMainForm.ho?hot_star=1&hot_nation="+<%=starList.get(0).getHot_nation()%>); --%>						
			$.ajax({
				url : '../hotel/hotelMainStarForm.ho?hot_star='+hot_star,
				dataType : 'html',
	//			traditional: true, 배열 보낼때 사용
				success : function(data) {
					
					$("#centerbox").html(data);
				},
				error : function() {
					alert("ajax 실패");
				}
			});	
			
	}
	
	// 호텔 지역 ajax
	function nations(hot_nation){
		var hot_nation=hot_nation.value;
			alert(hot_nation+": 1");
						<%-- location.replace("../hotel/hotelMainForm.ho?hot_star=1&hot_nation="+<%=starList.get(0).getHot_nation()%>); --%>						
			$.ajax({
				url : '../hotel/hotelMainNationForm.ho?hot_nation='+hot_nation,
				dataType : 'html', // text로 쓰고 아래 data에 내용 그래도 써서 값 넘기는 것도 가능.
	//			data : 'hot_nation='+hot_nation,  
	//			traditional: true, 배열 보낼때 사용
				success : function(data) {
					
					$("#centerbox").html(data);
				},
				error : function() {
					alert("ajax 정보 없음");
				}
			});	
			
	}
	

	
</script>
<body>
	<form action="/hotelMainForm.ho" name="myform">
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
	
	<section class="section">
	<div id="head" style="font-size: 20pt;">검색 결과(지금은 로그인 아이디) : <%= mb_id %> </div>		
		<div id="up_leftbox">
				<div id="map">지도 공간</div>
				
				<div class="starbox">
						<div id="starHead">성급 star</div>
					<div class="star">						
						<input class="starbutton" type="button" name="star" value="1" onclick="stars(this)" id=star>
						<i class="fa-solid fa-star"></i>
					</div>
					<div class="star">						
						<input class="starbutton" type="button" name="star" value="2" onclick="stars(this)" id=star>
						<i class="fa-solid fa-star"></i>
					</div>
					<div class="star">						
						<input class="starbutton" type="button" name="star" value="3" onclick="stars(this)" id=star>
						<i class="fa-solid fa-star"></i>
					</div>
					<div class="star">						
						<input class="starbutton" type="button" name="star" value="4" onclick="stars(this)" id=star>
						<i class="fa-solid fa-star"></i>
					</div>
					<div class="star">						
						<input class="starbutton" type="button" name="star" value="5" onclick="stars(this)" id=star>
						<i class="fa-solid fa-star"></i>
					</div>
				</div>
				
				<div class="countrybox">
					<div class="country">한국</div>
					<div class="nation">
						<input class="nationButton" type="button" name="nation" value="서울" onclick="nations(this)">
					</div>
					<div class="nation">
						<input class="nationButton" type="button" name="nation" value="인천" onclick="nations(this)">
					</div>
					<div class="nation">
						<input class="nationButton" type="button" name="nation" value="부산" onclick="nations(this)">
					</div>
					<div class="nation">
						<input class="nationButton" type="button" name="nation" value="대구" onclick="nations(this)">
					</div>
				</div>	
				<div class="countrybox">
					<div class="country">중국</div>
					<div class="nation">
						<input class="nationButton" type="button" name="nation" value="서울" onclick="nations(this)">
					</div>
					<div class="nation">
						<input class="nationButton" type="button" name="nation" value="인천" onclick="nations(this)">
					</div>
					<div class="nation">
						<input class="nationButton" type="button" name="nation" value="부산" onclick="nations(this)">
					</div>
					<div class="nation">
						<input class="nationButton" type="button" name="nation" value="대구" onclick="nations(this)">
					</div>
				</div>	
				<div class="countrybox">	
					<div class="country">일본</div>
					<div class="nation">
						<input class="nationButton" type="button" name="nation" value="도쿄" onclick="nations(this)">
					</div>
					<div class="nation">
						<input class="nationButton" type="button" name="nation" value="오사카" onclick="nations(this)">
					</div>
					<div class="nation">
						<input class="nationButton" type="button" name="nation" value="후쿠오카" onclick="nations(this)">
					</div>
					<div class="nation">
						<input class="nationButton" type="button" name="nation" value="나고야" onclick="nations(this)">
					</div>
				</div>	
				<div class="countrybox">	
					<div class="country">태국</div>
					<div class="nation">
						<input class="nationButton" type="button" name="nation" value="암낫짜른" onclick="nations(this)">
					</div>
					<div class="nation">
						<input class="nationButton" type="button" name="nation" value="앙통" onclick="nations(this)">
					</div>
					<div class="nation">
						<input class="nationButton" type="button" name="nation" value="야소톤" onclick="nations(this)">
					</div>
					<div class="nation">
						<input class="nationButton" type="button" name="nation" value="얄라" onclick="nations(this)">
					</div>
				</div>	
				<div class="countrybox">	
					<div class="country">싱가포르</div>
					<div class="nation">
						<input class="nationButton" type="button" name="nation" value="중앙지구" onclick="nations(this)">
					</div>
					<div class="nation">
						<input class="nationButton" type="button" name="nation" value="북동지구" onclick="nations(this)">
					</div>
					<div class="nation">
						<input class="nationButton" type="button" name="nation" value="북서지구" onclick="nations(this)">
					</div>
					<div class="nation">
						<input class="nationButton" type="button" name="nation" value="남동지구" onclick="nations(this)">
					</div>
				</div>	
				<div class="countrybox">	
					<div class="country">홍콩</div>
					<div class="nation">
						<input class="nationButton" type="button" name="nation" value="홍콩섬" onclick="nations(this)">
					</div>
					<div class="nation">
						<input class="nationButton" type="button" name="nation" value="중서구" onclick="nations(this)">
					</div>
					<div class="nation">
						<input class="nationButton" type="button" name="nation" value="만자구" onclick="nations(this)">
					</div>
					<div class="nation">
						<input class="nationButton" type="button" name="nation" value="동구" onclick="nations(this)">
					</div>
				</div>	
				
				
		</div>
		<div id="centerbox">
		 <div id="up_rightbox">
		 		
					<h3 style="font-size: 20pt;">머무르고 싶은 지역을 입력하세요.</h3>
		        		<div>
							<img src="../img/icon/hotel.png" width="20" height="20"	class="hotelIcon"> 
							<input type="text" placeholder="여행지 또는 숙소 이름으로 검색" size="40"> 
							<select height="30">
								<option value="인원수">인원수</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
							</select> 
							<input type="date" name="checkin" id="datechoice3"> 
							<input type="date" name="checkout" id="datechoice4"> 
							<input type="button" name="hotelBtn" class="hotelBtn" onClick="getPost('05')">
						</div><hr>
						<script>
							document.getElementById('datechoice1').valueAsDate=new Date();
							document.getElementById('datechoice2').valueAsDate=new Date();
							document.getElementById('datechoice3').valueAsDate=new Date();
							document.getElementById('datechoice4').valueAsDate=new Date();
							document.getElementById('datechoice5').valueAsDate=new Date();
							$("#datechoice1").datepicker();
							$("#datechoice2").datepicker();
							$("#datechoice3").datepicker();
							$("#datechoice4").datepicker();
							$("#datechoice5").datepicker();
						</script>
		       
		      </div> 
		       	
		    
		     		<%	
		     		
		     		if(mainList != null ){	%>
					<% for(int i=0;i<mainList.size();i++){ %> 
					
					
				<div class="up_rightbox">
					<a href="../hotel/hotelRoomForm.ho?hot_main_num=<%=mainList.get(i).getHot_main_num()%>">
					<div class="hot_centerimg">
						<img alt="경로 잘못입력됨." src="../img/hotel/hotel_main/<%=mainList.get(i).getHot_main_img()%>" style="width: 180px; height: 200px; border-radius: 8px">						
					</div>					
					 </a>	
					<div class="hot_centerbox">
						
						<div class="hot_centerbox_up">
							<div class="hot_centerbox_up_left"> 
																
									<div id="hotel_name"><a href="../hotel/hotelRoomForm.ho?hot_main_num=<%=mainList.get(i).getHot_main_num()%>"><%=mainList.get(i).getHot_name()%> </a><br></div>
								
									<div id="room_name"><%=mainList.get(i).getHot_nation()%> <br></div>
								
							</div>
							<div class="hot_centerbox_up_right">
									<div>리뷰좋다<br></div>
									<div>리뷰좋다<br></div>
							</div>
						</div>
						<div class="hot_centerbox_down">
							<div class="hot_centerbox_down_left">
									
									<div class="room_bold">  <%=main_roomList.get(mainList.get(i).getHot_main_num()).getHot_room_name() %><br></div>
									
									<div> 
										<%if(mainList.get(0).getHot_wifi()!=null){%>						
											<div class="hot_centerbox_down_left_sub"><i class='fa-solid fa-wifi'></i> <%=mainList.get(0).getHot_wifi()%></div>
										<%} %> 
										<%if(mainList.get(0).getHot_meetRoom()!=null){%>						
											<div class="hot_centerbox_down_left_sub"><i class="fa-regular fa-handshake"></i> <%=mainList.get(0).getHot_meetRoom()%></div>
										<%} %>
										
										<%if(mainList.get(0).getHot_smoking()!=null){%>						
											<div class="hot_centerbox_down_left_sub"><i class="fa-solid fa-smoking"></i> <%=mainList.get(0).getHot_smoking()%></div><br>
										<%} %>	
														
										<%if(mainList.get(0).getHot_restaurant()!=null){%>
											<div class="hot_centerbox_down_left_sub"><i class="fa-solid fa-utensils"></i> <%=mainList.get(0).getHot_restaurant()%></div>
										<%} %> 
										
										<%if(mainList.get(0).getHot_bar()!=null){%>						
											<div class="hot_centerbox_down_left_sub"><i class="fa-solid fa-martini-glass"></i> <%=mainList.get(0).getHot_bar()%></div><br>
										<%} %>						
										<%if(mainList.get(0).getHot_cafe()!=null){%>						
											<div class="hot_centerbox_down_left_sub"><i class="fa-solid fa-mug-saucer"></i> <%=mainList.get(0).getHot_cafe()%></div>
										<%} %>
										<br>
									</div>
									
							</div>	
							<div class="hot_centerbox_down_rigth">
									<br>
									<div class="line"> <fmt:formatNumber value="<%=main_roomList.get(mainList.get(i).getHot_main_num()).getHot_room_price()%>" groupingUsed="true" /> 원</div>
									
							</div>
		       			</div>
		        	</div>		       
		     </div>	 
		     
		      
		      <%} %>  
		      
		      <section id="pageList">
			<%if(nowPage<=1){ %>
			[이전]&nbsp;
			<%}else{ %>
			<a href="../hotel/hotelMainForm.ho?page=<%=nowPage-1 %>">[이전]</a>&nbsp;
			<%} %>
			
			<%for(int a=startPage;a<=endPage;a++){
					if(a==nowPage){%>
			[<%=a %>]
			<%}else{ %>
			<a href="../hotel/hotelMainForm.ho?page=<%=a %>">[<%=a %>]
			</a>&nbsp;
			<%} %>
			<%} %>
	
			<%if(nowPage>=maxPage){ %>
			[다음]
			<%}else{ %>
			<a href="../hotel/hotelMainForm.ho?page=<%=nowPage+1 %>">[다음]</a>
			<%} %>
		</section>
	<%
	}else{
	%>
	<section id="emptyArea">등록된 호텔이 없습니다.</section>
	<%}%>   
		   	
		 
		 </div>
	</section>
				</form>		
		
	<jsp:include page="../overlap/footer.jsp"/>
	
</body>
</html>