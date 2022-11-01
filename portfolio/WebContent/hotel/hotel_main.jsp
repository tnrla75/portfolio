<%@page import="com.mysql.jdbc.jdbc2.optional.SuspendableXAConnection"%>
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
						<!-- 모달 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>				
						<!-- 구글맵 -->
	 <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB41DRUbKWJHPxaFjMAwdrzWzbVKartNGg&callback=initMap&v=weekly"defer></script>
						<!-- 메뉴 그림 -->
    <script src="http://use.fontawesome.com/releases/v6.1.2/js/all.js"></script>
   
    
</head>
<style>
	body{
		
	}
	#up_rightbox input:first-of-type {	
		width: 250px;
		height: 30px;
		font-size: 10pt;
		text-align:center; 
		border-style: solid;
		border-width: 1;	
		margin: 0 auto;
		border-radius:8px;	
		top:5px;
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
		margin: 0 auto;
		left: 40px;
		top: 18px;
	}
	#hot_room_maxpeople{
		width: 50px;
		height: 30px;
		margin: 0 auto;
		border-radius:8px;
		margin:auto 10px 10px 10px;
		border-style: solid;
	}
	.hotelIcon{
		margin: 0 auto;
		border-radius:8px;
		
	}
	.section{
		width: 1200px;
		height: 1400px;
		
		margin: 40px auto;
		
		border-right: solid 1px rgba(0,0,0,0.4);
		border-bottom: solid 1px rgba(0,0,0,0.4);
		
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
		height: 900px;
		margin: 0 auto;
		margin-right: 20px;
		text-align: center;
		border-left: solid 1px rgba(0,0,0,0.4);
		border-right: solid 1px rgba(0,0,0,0.4);
		border-bottom: solid 1px rgba(0,0,0,0.4);		
		float:left;
	}
	#map{
		width: 298px;
		height: 200px;
		border-radius:8px;
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
		height: 250px;
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
		height: 80px;
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
		font-size:17px;
	}
	#nation_name{
		width: 100px;
		height: 20px;
		margin-top:20px;
		font-weight: bold;
		
		
	}
	#room_name{
		width: 200px;
		height: 20px;
		margin:0 0 0 10px;
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
		height: 130px;
		margin: 10px auto;		
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
		
		float:right;
	}
	#star{
		text-align: center;
		font-weight: bold;
	}
	             
	              /* 현수 코드 */
	#modal1 > *{
		padding: 0px;
		margin: 0px;
	}
		
	#modal1{
		display : none;
		z-index : 999;
		position:absolute;
		right: 605px;
		top: 335px;
		width:70%;
		height:400px;
	}
	#modal1>#content1{
		width:500px;
		height:600px;
		margin:100px auto;
		padding:20px;
		position: relative;
		background-color:#fff;
		box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
	}
		
	#modal1 .close{
		position:absolute;
		top:4px;
		right:4px;	
		font-size:20px;
		border:0;
		background-color:#F0F0F0;
	}
		
	#modal1 .close:hover,
	#modal1 .close:focus {
	  color : #000;
	  text-decoration: none;
	  cursor :pointer;
	}
	.modalul {
		width:500px;
	}
	.modalul li{
		list-style: none;
		float: left;
		width: 105px;
		height: 50px;
		line-height: 50px;
		position: relative;
		left:-60px;
		top:-33px;
	}
	.modalul li:nth-child(1){
		width: 500px;
		height: 40px;
		background-color: #F0F0F0;
		font-weight: bold;
		font-size:12pt;
		line-height: 40px;
	}
	.modalul li:nth-child(n+2){
		font-size:10pt;
		padding: 0 10px;
		margin: 2px 5px;
	}
	.modalul li:nth-child(n+2):hover{
		background-color: #5AA0FF ;
		color:white;
	}
	#btnOpen1:focus{
		outline: none;
		text-align:left;
		border-bottom: solid rgba(211, 10, 20, 0.9) 2px;
	} 
	#btnOpen1{		
		text-align:left;
	} 
	              
	
	
</style>
<%
	request.setCharacterEncoding("UTF-8");

	String mb_id = (String)session.getAttribute("mb_id"); 
	
	ArrayList<Hotel_main_DTO> mainList=(ArrayList<Hotel_main_DTO>)request.getAttribute("mainList");	
	
	TreeMap<Integer, Hotel_room_DTO> main_roomList=(TreeMap<Integer, Hotel_room_DTO>)request.getAttribute("main_roomList");	
	
	System.out.println(mainList.size()+" : mainJsp mainList");
	System.out.println(main_roomList.size()+" : mainJsp main_roomList");
	
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	
	int listCount=pageInfo.getListCount();
	int nowPage=pageInfo.getPage();
	int maxPage=pageInfo.getMaxPage();
	int startPage=pageInfo.getStartPage();
	int endPage=pageInfo.getEndPage();
	
	System.out.println(main_roomList.get(1).getHot_main_num());
	
	
	/* System.out.println(main_roomList.get(mainList.get(1).getHot_main_num()).getHot_room_name()+" 11111111111111"); 
	System.out.println(main_roomList.get(mainList.get(1).getHot_main_num()).getHot_room_price()+" 2222222222222"); 
	 */
	
%>
<script type="text/javascript">

		/* 지도 */
 	function initMap() {
		  const map = new google.maps.Map(document.getElementById("map"), {
		    zoom: 12,
		    center: { lat: <%=mainList.get(0).getHot_latitude()%>, lng: <%=mainList.get(0).getHot_longitude()%> },
		  });
		  const tourStops = [
			  <% for(int i=0; i<mainList.size(); i++){%>
		    [{ lat: <%=mainList.get(i).getHot_latitude()%>, lng: <%=mainList.get(i).getHot_longitude()%> },'<%=mainList.get(i).getHot_name()%>','<%=mainList.get(i).getHot_main_img()%>'],
		    <%}%>
		    /* [{ lat: 37.5797, lng: 126.977 }, "경복궁","서울 종로구 사직로 161 경복궁"],
		    [{ lat: 37.5815, lng: 126.9849 }, "북촌한옥마을","서울 종로구 계동길 37"],
		    [{ lat: 37.5691, lng: 126.9786 }, "청계천","서울 종로구 창신동"],
		    [{ lat: 37.5769, lng: 126.9768 }, "광화문","서울 종로구 효자로 12 국립고궁박물관"],
		    [{ lat: 37.5632, lng: 126.9874 }, "명동성당","서울 중구 명동길 74"],
		    [{ lat: 37.5722, lng: 126.9867 }, "인사동","서울특별시 종로구 인사동"], */
		  ];
		  const infoWindow = new google.maps.InfoWindow();
			// 마커 찍는곳
		  tourStops.forEach(([position, title, img], i) => {
		    const marker = new google.maps.Marker({
		      position,
		      map,
		      title: `<div><span class="span1">장소명:`+ title+ `</span><br><img src="../img/hotel/hot_main/`+ img+ `" class="chooseimg"><input type="button" value="추가하기" class="plusbtn" onclick=plusatt(this)><input type="hidden" value=`+title+` class="aabb"><input type="hidden" value=`+img+` class="img"></div>`,
		            optimized: false,
		    });
	
		    marker.addListener("click", () => {
		      infoWindow.setContent(marker.getTitle());
		      infoWindow.open(marker.getMap(), marker);
		    });
		    marker.addListener("mouseover", () =>{
		      infoWindow.setContent(marker.getTitle());
		      infoWindow.open(marker.getMap(), marker);
		    });
		  });
		} 
	
		/* 모달 ( 검색 창 ) */
		
		// modal 창 1번 
	var btnOpen1  = document.getElementById('btnOpen1');
	var btnClose1 = document.getElementById('btnClose1');
	
	// modal 창을 감춤
	var closeRtn = function(){
		var modal1 = document.getElementById('modal1');
		modal1.style.display = 'none';
	}

	// modal 창을 보여줌
	btnOpen1.onclick = function(){
		var modal1 = document.getElementById('modal1');
		modal1.style.display = 'block';
	}
	window.onclick = function(e) {
		if(e.target == modal1){
			modal1.style.display = 'none';
		}
	}
	btnClose1.onclick = closeRtn;
	
	$(document).ready(function() {
		$(".modalul li:nth-child(n+2)").on('click', function(e) {
			$('#btnOpen1').val($(this).text());
			modal1.style.display = 'none';
		}); 
	});
		
		/* 검색 */
	function getPost(mode){
		 var myform=document.myform;
		if(mode=='01'){
			myform.action="/hotelMainForm.ho";
		}else if(mode == '02'){
			var myform=document.myform;		
			if(myform.hot_room_maxpeople.value!='인원수' && myform.hot_nation.value!='전체' /* && myform.hot_checkin_date<hot_checkout_date */){		
				alert("aa");
				
				myform.action = "../hotel/kensakuList.hot?command=kensakuList";
			}else{
				alert("전체는 없다잉~");
				alert("인원수를 선택하시오~~");
				alert("숙박 날짜를 다시 확인하시오~");
			}
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
					alert("1성급 호텔은 없어요잉...ㅠㅠ");
				}
			});				
	}
	
	// 호텔 지역 ajax
	function nations(hot_nation){
		var hot_nation=hot_nation.value;
			
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
					alert("해당 지역에 호텔이 없습니다..ㅠㅠ");
				}
			});	
			
	}
	
</script>
<body>
	<form name="myform"  method="post">
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
	<div id="head" style="font-size: 20pt;">검색 결과 : <%=mainList.size()%> 건</div>		
		<div id="up_leftbox">
				<div id="map">지도 공간</div>
				  
				<div class="starbox">
						<div id="starHead">성급 star</div>
					<div class="star">						
						<input class="starbutton" type="button" name="hot_star" value="1" onclick="stars(this)" id=star>
						<i class="fa-solid fa-star"></i>
					</div>
					<div class="star">						
						<input class="starbutton" type="button" name="hot_star" value="2" onclick="stars(this)" id=star>
						<i class="fa-solid fa-star"></i>
					</div>
					<div class="star">						
						<input class="starbutton" type="button" name="hot_star" value="3" onclick="stars(this)" id=star>
						<i class="fa-solid fa-star"></i>
					</div>
					<div class="star">						
						<input class="starbutton" type="button" name="hot_star" value="4" onclick="stars(this)" id=star>
						<i class="fa-solid fa-star"></i>
					</div>
					<div class="star">						
						<input class="starbutton" type="button" name="hot_star" value="5" onclick="stars(this)" id=star>
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
						<input class="nationButton" type="button" name="nation" value="제주도" onclick="nations(this)">
					</div>
				</div>	
				<div class="countrybox">
					<div class="country">중국</div>
					<div class="nation">
						<input class="nationButton" type="button" name="nation" value="베이징" onclick="nations(this)">
					</div>
					<div class="nation">
						<input class="nationButton" type="button" name="nation" value="칭따오" onclick="nations(this)">
					</div>
					<div class="nation">
						<input class="nationButton" type="button" name="nation" value="하얼빈" onclick="nations(this)">
					</div>
					<div class="nation">
						<input class="nationButton" type="button" name="nation" value="우한" onclick="nations(this)">
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
							<input type="text" placeholder="여행지 또는 숙소 이름으로 검색" id="btnOpen1" name="hot_nation" size="40" readonly> 
						
							<select id="hot_room_maxpeople" name="hot_room_maxpeople" height="30">
								<option value="인원수">인원수</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								
							</select> 
							<input type="date"  name="hot_checkin_date" id="datechoice3"> 
							<input type="date" name="hot_checkout_date" id="datechoice4"> 
							<input type="button" name="kensakuBtn" class="kensakuBtn" onClick="getPost('02')">
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
<div id='modal1'>
	<div id='content1'>
		
		<div>
			<div class="modaltitle">
				<ul class="modalul">
					<li>&nbsp;&nbsp;인기지역 <input type='button' value='X' class="close" id='btnClose1'/></li>
					<li>aaa</li>
					<li>bbb</li>
					<li>서울</li>
					<li>제주도</li>
				</ul>
			</div>
			<div class="modaltitle">
				<ul class="modalul">
					<li>&nbsp;&nbsp;대한민국</li>
					<li>서울</li>
					<li>부산</li>
					<li>제주</li>
					<li>강릉</li>
					<li>경주</li>
					<li>전주</li>
					<li>여수</li>
					<li>인천</li>
				</ul>
			</div>
			<div class="modaltitle">
				<ul class="modalul">
					<li>&nbsp;&nbsp;일본</li>
					<li>도쿄</li>
					<li>오사카</li>
					<li>교토</li>
					<li>삿포로</li>
					<li>나고야</li>
					<li>오키나와</li>
				</ul>
			</div>
			<div class="modaltitle">
				<ul class="modalul">
					<li>&nbsp;&nbsp;베트남</li>
					<li>호치민</li>
					<li>호이안</li>
					<li>다낭</li>
					<li>하노이</li>
				</ul>
			</div>
			<div class="modaltitle">
				<ul class="modalul">
					<li>&nbsp;&nbsp;기타국가</li>
					<li>태국</li>
					<li>싱가포르</li>
					<li>홍콩</li>
				</ul>
			</div>
		</div>
	</div>
</div>
		      </div> 
		       	
		     		<%	
		     		
		     		if(mainList != null ){	%>
					<% for(int i=0;i<mainList.size();i++){ %> 
					
					
				<div class="up_rightbox">
					<a href="../hotel/hotelRoomForm.ho?hot_main_num=<%=mainList.get(i).getHot_main_num()%>">
					<div class="hot_centerimg">
						<img alt="이미지 경로 잘못입력됨." src="../img/hotel/hotel_main/<%=mainList.get(i).getHot_main_img()%>" style="width: 180px; height: 220px; border-radius: 8px">						
					</div>					
					 </a>	
					<div class="hot_centerbox">
						
						<div class="hot_centerbox_up">
							<div class="hot_centerbox_up_left"> 
																
									<div id="hotel_name"><a href="../hotel/hotelRoomForm.ho?hot_main_num=<%=mainList.get(i).getHot_main_num()%>"><%=mainList.get(i).getHot_name()%> </a><br></div>
									
									<div id="nation_name"><%=mainList.get(i).getHot_nation()%>
									</div>
									
							</div>
							<div class="hot_centerbox_up_right">
									<br>
									<div id="star"><%=mainList.get(i).getHot_star()%>성급<br></div>
							</div>
						</div>
						<div class="hot_centerbox_down">
							<div class="hot_centerbox_down_left">
									
									<div class="room_bold">
									
										
										<%if(main_roomList.get(mainList.get(i).getHot_main_num()).getHot_room_name()!=null){%>	
											<a href="../hotel/hotelRoomForm.ho?hot_main_num=<%=mainList.get(i).getHot_main_num()%>">				
												<div id="room_name"> <%=main_roomList.get(mainList.get(i).getHot_main_num()).getHot_room_name()%></div>
											</a>
										<%}%><br> 
									</div>
									
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
									<div class="line"> <fmt:formatNumber value="<%=main_roomList.get(mainList.get(i).getHot_main_num()).getHot_room_price() %>" /> 원</div>
									
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