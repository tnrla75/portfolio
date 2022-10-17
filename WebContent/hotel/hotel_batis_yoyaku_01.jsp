<%@page import="vo.Member_info"%>
<%@page import="vo.Hotel_yoyaku_DTO"%>
<%@page import="vo.Hotel_main_DTO"%>
<%@page import="vo.Hotel_room_DTO"%>
<%@page import="java.util.TreeMap"%>
<%@page import="action.Hotel_RoomAction"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
				<!-- 가격 컴마 링크 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      
	<link rel="stylesheet" href="../css/style.css" />
	<link type="text/css" rel="stylesheet" href="../css/style2.css" />
	<link rel="stylesheet" type="text/css" href="../css/header_footer.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>    
							<!-- 메뉴 그림 -->
	<script src="http://use.fontawesome.com/releases/v6.1.2/js/all.js"></script>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	#roomInfobox{		
		width:1200px;
		height: 100vh;
		margin: 50px auto;
		text-align: center;
		border-style: solid;		
	}
	#leftBigbox{
		width:830px;
		height:900px;
		border-style: solid;
		border-radius: 8;
		float: left;
	}
	#rightBigbox{
		width:330px;
		height:850px;
		margin: 0 auto;
		border-style: solid;
		
		float: right;
	}
	#room_box{
		width:830px;
		height:270px;		
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
		width:320px;
		height:230px;
		border-radius: 8px;				
		margin-left:15px;
		margin-top:15px;
		box-shadow: 7px 7px 7px #BDBDBD;
		float: left;
	}
	
	#room_inpo{
		width:430px;
		height:230px;		
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
		font-size:20px;
		border-radius: 8;
		margin-top:10px;
		margin-bottom:10px;
		text-align: left;
		/* box-shadow: 7px 7px 7px #BDBDBD; */
		float: left;
	}
	#name_people{
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
	
	
	.room_name{				
		width:100px;
		height:30px;
		font-weight:bold;
		font-size:16px;
		border-radius: 8;
		margin-top:10px;
		margin-bottom:10px;
		padding-top:10px;
		
		text-align: left;
		text-decoration:underline;
		float: left;
	}
	.hotel_people{
		width:220px;
		height:30px;
		font-weight:bold;
		font-size:15px;
		border-radius: 8;
		margin-top:10px;
		padding-top:10px;
		margin-bottom:10px;
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
		width:102px;	
		height:20px;
		font-size:15px;
		
		text-align: left;
		float: left;
	}
	.room_inpo_sub{
		clear:left;
		width:150px;	
		height:30px;
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
		width:328px;
		height:250px;
		margin: 0 auto;
		border-style: solid;
		border-radius: 8;
		float: right;
	}
	.nedanbox{
		font-weight: bold;
		font-size:20px;
	}
	#yoyakubox{
		width:830px;
		height:550px;
		margin: 50px auto;
		border-style: solid;
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
		height:400px;
		margin: 10px auto;
		border-style: solid;
		background-color: #BDBDBD;
		border-radius:8px;
		text-align: left;
			
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
	.namebox1{
		width:100px;
		height:40px;
		margin-left: 18px;
		margin-top: 10px;
		font-size:20px;
		padding-top:10px;
		font-weight:bold;
		
		border-radius:8px;
		text-align: right;
		float: left;		
	}
	.namebox2{
		width:200px;
		height:40px;
		margin-left: 18px;
		margin-top: 10px;
		font-size:20px;
		padding-top:10px;
		font-weight:bold;
		
		border-radius:8px;
		text-align: left;
		float: left;		
	}
	.emailbox{
		clear:left;
		width:351px;
		height:40px;
		margin-left: 18px;
		margin-top: 10px;
		font-size:20px;
		padding-top:10px;
		font-weight:bold;		
		
		border-radius:8px;
		text-align: center;
		float: left;		
	}
	.emailbox_sub{
		width:351px;
		height:40px;
		margin-left: 18px;
		margin-top: 10px;
		font-size:20px;
		padding-top:10px;
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
		
		
		
//		int hot_room_num = (int)request.getAttribute("hot_room_num");
//		int hot_main_num = (int)request.getAttribute("hot_main_num");
		
		String hot_main_num=request.getParameter("hot_main_num");
		String hot_room_num=request.getParameter("hot_room_num");
		
		
		out.println(yoyakuMain+" : 예약 JSP yoyakumain");
		out.println(yoyakuRoom+" 예약 JSP yoyakuRoom");
		
		System.out.println(hot_main_num+" : 예약 JSP main_num");
		System.out.println(hot_room_num+" : 예약 JSP room_num");
		
		/* System.out.println(yoyakuRoom.get(0).getHot_room_name()+" : rrrrrrrrrrrrrr");
		System.out.println(yoyakuLsit.get(0).getMb_firstname()+" JSP 예약List"); */
%>
<script>
	
 	 function yoyakuBtn(){			
			alert("예약하러 가자잉~");			
				 <%-- location.replace("../hotel/hotelYoyakuBatisForm.hot?hot_room_num="<%=hot_room_num%>);  --%>
	}	
		
</script>
</head>
<body>
	<form action="yoyaku.hot?command=yoyaku&hot_room_num=<%=hot_room_num%>&hot_main_num=<%=hot_main_num%>" method="post">
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
						<img alt="다시 입력하라우 ㅡㅡ;" src='../img/hotel/hotel_room/<%=yoyakuRoom.get(0).getHot_room_img()%>' style="width: 320px;	height: 230px;border-radius: 8px;"> 
					</div>
					
						<div id="room_inpo">
							
								<div class="hotel_name"> <%=yoyakuMain.get(0).getHot_name()%>, <%=yoyakuMain.get(0).getHot_star()%>성급</div>
								<div id="name_people">
									<div class="room_name">
										<%=yoyakuRoom.get(0).getHot_room_name()%> &nbsp;	
									</div>							
										<%if(yoyakuRoom.get(0).getHot_room_maxpeople()!=null){%>	
											<div class="hotel_people"> 													
													<i class="fa-solid fa-user"></i> 
													성인  <%=yoyakuRoom.get(0).getHot_room_maxpeople()%>명 이용가능												
											</div>
										<%} %> 									
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
										
										<%if(yoyakuRoom.get(0).getHot_room_breakfast()!=null){%>
											<div class="room_inpo_img"><i class="fa-solid fa-ban-smoking"> </i> <%=yoyakuRoom.get(0).getHot_room_breakfast()%></div>
										<%} %> 
										
										<%if(yoyakuRoom.get(0).getHot_room_Nobreakfast()!=null){%>
											<div class="room_inpo_img"><i class="fa-solid fa-ban-smoking"> </i> <%=yoyakuRoom.get(0).getHot_room_Nobreakfast()%></div>
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
							<div class="yonaiyo">투숙객 정보</div>
							<div class="yonaiyo_sub">투숙객 이름은 체크인 시 제시할 유효한 신분증 이름과 정확히 일치해야 합니다.</div>
							
							<div class="namebox1" >&nbsp; <%=yoyakuList.get(0).getMb_firstname() %> </div>
							<div class="namebox2">&nbsp; <%=yoyakuList.get(0).getMb_lastname() %> 님의 정보...</div><br><br>							
							<div class="emailbox">&nbsp; <%=yoyakuList.get(0).getMb_email() %> </div>							
							<div class="emailbox_sub">&nbsp; <%=yoyakuList.get(0).getMb_phonenum() %> </div>
							
							<div id="yoyakuBtnbox"><input class="yoyakuBtn" type="submit" name="yoyaku" value="예약하기" ></div>
							
							<input type="hidden" value="<%=yoyakuList.get(0).getMb_firstname() %>" name="mb_firstname">
							<input type="hidden" value="<%=yoyakuList.get(0).getMb_lastname() %>" name="mb_lastname">
							<input type="hidden" value="<%=yoyakuList.get(0).getMb_email() %>" name="mb_email">
							<input type="hidden" value="<%=yoyakuList.get(0).getMb_phonenum() %>" name="mb_phonenum">
							
						 </div>
					</div>
				</div>	
			
			<div id="rightBigbox">
				<div id="nedanbox">
						<div>오른쪽 </div>	
						<div class="nedanbox"><fmt:formatNumber value="<%=yoyakuRoom.get(0).getHot_room_price()%>" groupingUsed="true" />원</div>
						<div>							
							<!-- <input type="button"  value="예약하기" onclick="yoyakuBtn()"/> -->
						</div>
				</div>
				<div >		
					<div>1</div>	
					<div>1 </div>						
				</div>
			</div>
		</div>
			
	</form>
		<jsp:include page="../overlap/footer.jsp"/>
</body>
</html>