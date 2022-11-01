<%@page import="vo.Hotel_yoyaku_DTO"%>
<%@page import="vo.Member_info"%>
<%@page import="vo.Hotel_main_DTO"%>
<%@page import="vo.Hotel_room_DTO"%>
<%@page import="java.util.TreeMap"%>
<%@page import="action.Hotel_RoomAction"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
				<!-- 가격 컴마 링크 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      
	
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/style.css" />
	<link type="text/css" rel="stylesheet" href="../css/style2.css" />
	<link rel="stylesheet" type="text/css" href="../css/header_footer.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>    
							<!-- 메뉴 그림 -->
	<script src="http://use.fontawesome.com/releases/v6.1.2/js/all.js"></script>
<title>Insert title here</title>

<style type="text/css">

	#roomInfobox{		
		width:1200px;
		height: 950px;
		margin: 50px auto;
		text-align: center;
				
	}
	#leftBigbox{
		width:830px;
		height:900px;
		
		border-radius: 8;
		float: left;
	}
	#rightBigbox{
		width:300px;
		height:850px;
		margin: 30px auto;
		
		float: right;
	}
	#room_box{
		width:830px;
		height:330px;		
		margin: 0 auto;
		border-bottom: solid 1px rgba(0,0,0,0.4);
		float: left;
	}
	
	.room_box_sub{
		width:95px;
		height:270px;		
		margin: 0 auto;
		border-style: solid;
		border-radius: 8;
		float: left;
	}
	#room_img{
		width:360px;
		height:300px;
		border-radius: 8px;				
		margin-left:15px;
		margin-top:15px;
		box-shadow: 7px 7px 7px #BDBDBD;
		float: left;
	}
	
	#room_inpo{
		width:390px;
		height:300px;		
		margin: 15px auto;
		border-left: solid 1px rgba(0,0,0,0.4);
		margin-left:25px;
		padding-left:20px;
		border-radius: 8;
		float: left;
	}
	.hotel_name{
		clear:left;
		width:370px;
		height:50px;
		font-weight:bold;
		font-size:15px;
		border-radius: 8;
		margin-top:10px;
		margin-bottom:10px;
		text-align: left;
		/* box-shadow: 7px 7px 7px #BDBDBD; */
		float: left;
	}
	.hotel_star{
		clear:left;
		width:370px;
		height:20px;
		font-size:15px;
		font-weight:bold;
		text-align: left;
		float: left;
	}
	#name_people{
		width:370px;
		height:60px;
		font-weight:bold;
		font-size:16px;
		border-radius: 8;
		margin-top:10px;
		margin-bottom:10px;
		text-align: left;
		text-decoration:underline;
		float: left;
	}
	
	
	.room_name{					
		width:200px;
		height:60px;
		font-weight:bold;
		font-size:16px;
			
		text-align: left;
		text-decoration:underline;
		float: left;
	}
	.hotel_people{
		width:160px;
		height:60px;
		font-weight:bold;
		font-size:15px;
			
		text-align: left;
		float: left;
	}
	
	#infobox{
		clear:left;
		width:370px;
		height:40px;
		font-weight:bold;
		font-size:16px;
		border-radius: 8;
		margin-top:10px;
		
		margin-bottom:10px;
		text-align: left;
		text-decoration:underline;
		float: left;
	}
	
	.room_inpo{
		clear:left;
		width:420px;	
		height:40px;		
		font-size:15px;		
		text-align: left;
		float: left;
	}
	.room_inpo_img{
		width:112px;	
		height:40px;
		font-size:12px;
		
		text-align: left;
		float: left;
	}
	.room_inpo_sub{
		clear:left;
		width:150px;	
		height:40px;
		margin-top:20px;
		color:red;
		font-weight:bold;
		font-size:15px;
		border-radius: 8;
		text-align: left;
		/* box-shadow: 7px 7px 7px #BDBDBD; */
		float: left;
	}
	.room_inposub{
		
		width:80px;
		height:230px;
		border-radius: 8;
		
		/* box-shadow: 7px 7px 7px #BDBDBD; */
		float: left;
	}
	#nedanbox{
		width:300px;
		height:345px;
		margin: 80px auto;
		box-shadow: 7px 7px 7px #BDBDBD;
		background-color: rgba(231,231,231,0.7);
		border: solid 3px rgba(0,0,0,0.4);
		/* border-left: solid 1px rgba(0,0,0,0.4);
		border-top: solid 1px rgba(0,0,0,0.4); */
		border-radius: 8px;
		padding-left:15px;
		float: right;
	}
	#nedan{
		width:300px;
		height:40px;		
		margin: 20px auto 0 auto;
		border-bottom: solid 1px rgba(0,0,0,0.4);
		float: left;
	}
	.nedan_up01{
		width:80px;
		height:35px;
		text-align:left;
		padding-top:5px;
		float: left;
	}
	.nedan_up02{
		width:150px;
		height:40px;		
		font-weight: bold;
		font-size:20px;
		float: right;
	}
	#day{
		width:300px;
		height:40px;
		margin:20px auto;
		border-bottom: solid 1px rgba(0,0,0,0.4);
		float: left;
	}
	.room_day01{
		width:150px;
		height:35px;
		text-align:left;
		padding-top:5px;
		float: left;
	}
	.room_day02{
		width:150px;
		height:40px;
		font-weight: bold;
		font-size:20px;
		float: right;
	}
	.check{
		width:313px;
		height:40px;
		margin:0 auto;
			
		float: left;
	}
	.check01{
		width:150px;
		height:35px;
		text-align:left;
		padding-top:5px;
		float: left;
	}
	.check02{
		width:150px;
		height:40px;
		font-weight: bold;
		font-size:20px;
		float: right;
	}
	#yoyakubox{
		width:830px;
		height:600px;
		margin: 10px auto;		
		border-radius: 8px;		
		float: left;
	}
	#yoyakuhead{
		width:770px;
		height:40px;
		margin-top: 20px;
		margin-left:30px;		
		font-weight:bold;
		border-bottom: solid 1px rgba(0,0,0,0.4);
		text-decoration:underline;		
			
	}
	.yoyakuhead{
		width:100px;
		height:40px;
		font-size:15pt;
		text-decoration:underline;			
		text-align: right;
		float: left;
	}
	.yoyakuhead_sub{
		width:150px;
		height:35px;
		padding-top:5px;
		font-size:12pt;
		text-align: left;		
		float: left;
	}
	#yonaiyo{
		width:810px;
		height:480px;
		margin: 10px auto;
		box-shadow: 7px 7px 7px #BDBDBD;
		background-color: rgba(231,231,231,0.7);
		border-radius:8px;
		text-align: left;
		border: solid 3px rgba(0,0,0,0.4);
	}
	#yonaiyo_up{
		width:810px;
		height:80px;
		
	}
	#yonaiyo_down{
		width:810px;
		height:390px;
		
	}
	
	.yonaiyo{
		width:770px;
		height:30px;
		margin: 10px auto;
		font-size:20px;
		font-weight:bold;
		
		
		border-radius:8px;
		text-align: left;		
	}
	.yonaiyo_sub{
		width:770px;
		height:20px;
		margin: 0 auto;
		
		
		border-radius:8px;
		text-align: left;
		
	}
	.plussBtn{
		width:770px;
		height:20px;
		margin: 10px auto;
		
		
		border-radius:8px;
		text-align: right;
		
	}
	#yonaiyo_middle_01{
		width:810px;
		height:50px;
		
	}
	.namebox1{
		width:100px;
		height:40px;
		margin-left: 18px;
		
		font-size:20px;
		
		font-weight:bold;
		
		border-radius:8px;
		text-align: right;
		float: left;		
	}
	.namebox2{
		width:200px;
		height:40px;
		margin-left: 18px;
		
		font-size:20px;
		
		font-weight:bold;
		
		border-radius:8px;
		text-align: left;
		float: left;		
	}
	#email_phone{
		width:810px;
		height:50px;
	
	}
	
	.emailbox{
		clear:left;
		width:351px;
		height:40px;
		margin-left: 18px;
		
		font-size:20px;
		
		font-weight:bold;		
		
		border-radius:8px;
		text-align: center;
		float: left;		
	}
	.emailbox_sub{
		width:351px;
		height:40px;
		margin-left: 18px;
		
		font-size:20px;
		
		font-weight:bold;		
		
		border-radius:8px;
		text-align: center;
		float: left;	
	}
	#yoyakuBtnbox{
		clear:left;
		width:810px;
		height:100px;		
		text-align: center;
		margin:30px auto;
	}
	.yoyakuBtn{		
		width:200px;
		height:50px;
		font-size:15px;
		margin:30px auto;
		background-color:#000054;
		color:white;
		border-radius: 4px;
	}
</style>
<%
		request.setCharacterEncoding("UTF-8");		
		String mb_id = (String)session.getAttribute("mb_id"); 		
		
		ArrayList<Hotel_main_DTO> yoyakuMain=(ArrayList<Hotel_main_DTO>)request.getAttribute("yoyakuMain");
		ArrayList<Member_info> yoyakuList=(ArrayList<Member_info>)request.getAttribute("yoyakuList");	
		TreeMap<Integer, Hotel_room_DTO> yoyakuRoom=(TreeMap<Integer, Hotel_room_DTO>)request.getAttribute("yoyakuRoom");	
		
		int kanryoList = (int)request.getAttribute("kanryo_rommcount");
		
//		int hot_room_num = (int)request.getAttribute("hot_room_num");
//		int hot_main_num = (int)request.getAttribute("hot_main_num");
		
		String hot_main_num=request.getParameter("hot_main_num");
		String hot_room_num=request.getParameter("hot_room_num");
		String hot_checkin_date=(String)request.getParameter("hot_checkin_date");
		String hot_checkout_date=request.getParameter("hot_checkout_date");
		
		
		System.out.println(yoyakuMain+" : 예약 JSP yoyakumain");
		System.out.println(yoyakuRoom+" 예약 JSP yoyakuRoom");
		System.out.println(kanryoList+" 예약 JSP kanryoList");
		
		System.out.println(hot_main_num+" : 예약 JSP main_num");
		System.out.println(hot_room_num+" : 예약 JSP room_num");
		System.out.println(hot_checkin_date+" : 예약 JSP hot_checkin_date");
		System.out.println(hot_checkout_date+" : 예약 JSP hot_checkout_date");
		
		
		
		/* System.out.println(yoyakuRoom.get(0).getHot_room_name()+" : rrrrrrrrrrrrrr");
		System.out.println(yoyakuLsit.get(0).getMb_firstname()+" JSP 예약List"); */
		int hot_room_price=yoyakuRoom.get(0).getHot_room_price();
%>
</head>
<script>
	
 	 function yoyakuBtn(checkin_date,checkout_date){			
			alert("예약하러 가자잉~");
			var hot_checkin_date=checkin_date;
			var hot_checkout_date=checkout_date;
			alert(" 체크 인 : "+hot_checkin_date);	
			alert(" 체크 아웃 : "+hot_checkout_date);
			
			
				location.replace("yoyakuInsert.hot?command=yoyakuInsert&hot_room_num=<%=hot_room_num%>&hot_main_num=<%=hot_main_num%>&hot_checkin_date=<%=yoyakuRoom.get(0).getHot_checkin_date()%>&hot_checkout_date=<%=yoyakuRoom.get(0).getHot_checkout_date()%>&hot_name=<%=yoyakuMain.get(0).getHot_name()%>&hot_address=<%=yoyakuMain.get(0).getHot_address()%>&hot_room_name=<%=yoyakuRoom.get(0).getHot_room_name()%>&hot_room_price=<%=hot_room_price%>&mb_firstname=<%=yoyakuList.get(0).getMb_firstname()%>&mb_lastname=<%=yoyakuList.get(0).getMb_lastname() %>&mb_phonenum=<%=yoyakuList.get(0).getMb_phonenum()%>&mb_email=<%=yoyakuList.get(0).getMb_email()%>&mb_birth=<%=yoyakuList.get(0).getMb_birth()%>&mb_gender=<%=yoyakuList.get(0).getMb_gender()%>&hot_checkin_time=<%=yoyakuMain.get(0).getHot_checkin_time()%>&hot_checkout_time=<%=yoyakuMain.get(0).getHot_checkout_time()%>");
 				
 				<%-- var route = "'yoyakuInsert.hot?command=yoyakuInsert&hot_room_num=<%=hot_room_num%>&hot_main_num=<%=hot_main_num%>&hot_name=<%=yoyakuMain.get(0).getHot_name()%>&hot_address=<%=yoyakuMain.get(0).getHot_address()%>&hot_room_name=<%=yoyakuRoom.get(0).getHot_room_name()%>&hot_room_price=<%=hot_room_price%>";
 				route += "&mb_firstname=<%=yoyakuList.get(0).getMb_firstname()%>&mb_lastname=<%=yoyakuList.get(0).getMb_lastname() %>";
 				route += "&mb_phonenum=<%=yoyakuList.get(0).getMb_phonenum()%>&mb_email=<%=yoyakuList.get(0).getMb_email()%>";
 				route += "&mb_birth=<%=yoyakuList.get(0).getMb_birth()%>&mb_gender=<%=yoyakuList.get(0).getMb_gender()%>";
 				location.replace(route); --%>
				
 			
	}
 	 function room_go(){
 		 alert("객실 화면으로 이동~");
 	 	location.replace("../hotel/hotelRoomForm.ho?hot_main_num=<%=hot_main_num%>");
 	 }
		
</script>

<body>
	<form name="myform" <%-- action="yoyakuInsert.hot?command=yoyakuInsert&hot_room_num=<%=hot_room_num%>&hot_main_num=<%=hot_main_num%>
				&hot_name=<%=yoyakuMain.get(0).getHot_name()%>&hot_address=<%=yoyakuMain.get(0).getHot_address()%>
				&hot_room_name=<%=yoyakuRoom.get(0).getHot_room_name()%>&hot_room_price=<%=hot_room_price%>
				&mb_firstname=<%=yoyakuList.get(0).getMb_firstname()%>&mb_lastname=<%=yoyakuList.get(0).getMb_lastname() %>
				&mb_phonenum=<%=yoyakuList.get(0).getMb_phonenum()%>&mb_email=<%=yoyakuList.get(0).getMb_email()%>
				&mb_birth=<%=yoyakuList.get(0).getMb_birth()%>&mb_gender=<%=yoyakuList.get(0).getMb_gender()%>"  --%>method="post" >
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
		
		
		<div id="roomInfobox" >
			<div id="leftBigbox">
				<div id="room_box">					
					<div id="room_img">
						<img alt="다시 입력하라우 ㅡㅡ;" src='../img/hotel/hotel_room/<%=yoyakuRoom.get(0).getHot_room_img()%>' style="width: 360px;	height: 300px;border-radius: 8px;"> 
					</div>
					
						<div id="room_inpo">
							
								<div class="hotel_name"> <%=yoyakuMain.get(0).getHot_name()%></div>
								<div class="hotel_star"> <%=yoyakuMain.get(0).getHot_star()%>성급</div>
								<div id="name_people">
									<div class="room_name">
										<%=yoyakuRoom.get(0).getHot_room_name()%> &nbsp;	
									</div>										
									<div class="hotel_people"> 													
											<i class="fa-solid fa-user"></i>성인  <%=yoyakuRoom.get(0).getHot_room_maxpeople()%>명 이용가능												
									</div>
										 									
								</div>
								<div id="infobox">
									<div class="room_inpo">
										
										<%if(yoyakuRoom.get(0).getHot_room_wifi()!=null){%>						
											<div class="room_inpo_img"><i class='fa-solid fa-wifi'></i> <%=yoyakuRoom.get(0).getHot_room_wifi()%></div>
										<%} %>
										
										<%if(yoyakuRoom.get(0).getHot_room_bedsort()!=null){%>
											<div class="room_inpo_img"><i class="fa-solid fa-tv"></i> <%=yoyakuRoom.get(0).getHot_room_bedsort()%></div>
										<%} %>									
													
										<%if(yoyakuRoom.get(0).getHot_room_TV()!=null){%>
											<div class="room_inpo_img"><i class="fa-solid fa-tv"></i> <%=yoyakuRoom.get(0).getHot_room_TV()%></div>
										<%} %>	
										
										<%if(yoyakuRoom.get(0).getHot_room_parking()!=null){%>
											<div class="room_inpo_img"><i class="fa-solid fa-ban-smoking"> </i> <%=yoyakuRoom.get(0).getHot_room_parking()%></div>
										<%} %> 
										
										<%if(yoyakuRoom.get(0).getHot_room_Noparking()!=null){%>
											<div class="room_inpo_img"><i class="fa-solid fa-ban-smoking"> </i> <%=yoyakuRoom.get(0).getHot_room_Noparking()%></div>
										<%} %> 
										
										<%if(yoyakuRoom.get(0).getHot_room_airCon()!=null){%>
											<div class="room_inpo_img"><i class="fa-solid fa-ban-smoking"> </i> <%=yoyakuRoom.get(0).getHot_room_airCon()%></div>
										<%} %> 
										
										<%if(yoyakuRoom.get(0).getHot_room_shower()!=null){%>
											<div class="room_inpo_img"><i class="fa-solid fa-ban-smoking"> </i> <%=yoyakuRoom.get(0).getHot_room_shower()%></div>
										<%} %>								 
									</div>
								</div>						
								<div class="room_inpo_sub">환불 불가</div>
						</div>	
					</div>
					
					<div id="yoyakubox">	
						<div id="yoyakuhead">
							<div class="yoyakuhead">
								<%=mb_id%>
							</div>
							<div class="yoyakuhead_sub">
								&nbsp;님의 정보...
							</div>
						</div>
						<div id="yonaiyo">
						<div id="yonaiyo_up">
							<div class="yonaiyo">투숙객 정보</div>
							<div class="yonaiyo_sub">투숙객 이름은 체크인 시 제시할 유효한 신분증 이름과 정확히 일치해야 합니다.</div>
						</div>
						<div id="yonaiyo_down">	
							<div id="yonaiyo_middle_01">
								<div class="namebox1" id="mb_firstname" >&nbsp; <%=yoyakuList.get(0).getMb_firstname() %> </div>
								<div class="namebox2" id="mb_lastname">&nbsp; <%=yoyakuList.get(0).getMb_lastname() %> 님의 정보...</div><br><br>		
							</div>
							<div id="email_phone">					
								<div class="emailbox" >&nbsp; 휴대폰 번호 :  </div>							
								<div class="emailbox_sub" id="mb_phonenum">&nbsp; <%=yoyakuList.get(0).getMb_phonenum() %> </div>
							</div>
							<div id="email_phone">					
								<div class="emailbox" >&nbsp; 이메일 :  </div>							
								<div class="emailbox_sub" id="mb_email">&nbsp; <%=yoyakuList.get(0).getMb_email() %> </div>
							</div>
							<div id="email_phone">					
								<div class="emailbox" >&nbsp; 생년월일 :  </div>							
								<div class="emailbox_sub" id="mb_birth">&nbsp; <%=yoyakuList.get(0).getMb_birth() %> </div>
							</div>
							<div id="email_phone">					
								<div class="emailbox" >&nbsp; 성별 :  </div>							
								<div class="emailbox_sub" id="mb_gender">&nbsp; <%=yoyakuList.get(0).getMb_gender() %> </div>
							</div>
							<div id="yoyakuBtnbox">
								<input class="yoyakuBtn" type="button" name="yoyaku" value="뒤로가기" onclick="room_go()">
								<input class="yoyakuBtn" type="button" name="yoyaku" value="예약하기" onclick="yoyakuBtn(<%=hot_checkin_date%>,<%=hot_checkout_date%>)">								
							</div>
						</div>	
							
						 </div>
					</div>
				</div>	
			
			<div id="rightBigbox">
				<div id="nedanbox">
					<div id="nedan">
						<div class="nedan_up01">객실 가격</div>
						<div class="nedan_up02"><fmt:formatNumber value="<%=hot_room_price%>" groupingUsed="true" /> 원</div>						
					</div>
					<div id="day">
						<div class="room_day01">객실 1개 X 1박</div>
						<div class="room_day02"><fmt:formatNumber value="<%=hot_room_price%>" groupingUsed="true" /> 원</div>						
					</div>
					<div class="check">
						<div class="check01">체크인 날짜</div>
						<div class="check02"><%=yoyakuRoom.get(0).getHot_checkin_date()%></div>						
					</div>
					<div class="check">
						<div class="check01">체크아웃 날짜</div>
						<div class="check02"><%=yoyakuRoom.get(0).getHot_checkout_date()%></div>						
					</div>
					<div class="check">
						<div class="check01">체크인 시간</div>
						<div class="check02"><%=yoyakuMain.get(0).getHot_checkin_time() %></div>						
					</div>
					<div class="check">
						<div class="check01">체크아웃 시간</div>
						<div class="check02"><%=yoyakuMain.get(0).getHot_checkout_time() %></div>						
					</div>
					<div class="check">
						<div class="check01">남은 객실</div>
						<div class="check02">
							<%if((yoyakuRoom.get(0).getHot_room_amount()-kanryoList)>=1){ %>
									<%=(yoyakuRoom.get(0).getHot_room_amount()-kanryoList) %> 개
							<%} %>
						</div>						
					</div>
					
					
				</div>
				<div >		
					<div></div>	
					<div> </div>						
				</div>
			</div>
		</div>
			<jsp:include page="../overlap/footer.jsp"/>
	</form>
		
</body>
</html>