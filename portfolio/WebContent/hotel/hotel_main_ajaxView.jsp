<%@page import="vo.PageInfo"%>
<%@page import="vo.Hotel_room_DTO"%>
<%@page import="java.util.TreeMap"%>
<%@page import="vo.Hotel_main_DTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
	<!-- fmt사용할 수 있게 lib선언 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>

<%
	request.setCharacterEncoding("UTF-8");
	
	String mb_id = (String)session.getAttribute("mb_id"); 
	
	
	ArrayList<Hotel_main_DTO> ajaxList=(ArrayList<Hotel_main_DTO>)request.getAttribute("ajaxList");	
	TreeMap<Integer, Hotel_room_DTO> main_roomList=(TreeMap<Integer, Hotel_room_DTO>)request.getAttribute("main_roomList");	
	
	
	System.out.println(main_roomList.size()+" : mainViewJsp main_roomList");
	System.out.println(ajaxList.get(0).getHot_main_num()+" : mainViewJsp starList");
	
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
	
		     		<%if(ajaxList != null ){	%>
					<% for(int i=0;i<ajaxList.size();i++){ %> 
					
					
				<div class="up_rightbox">
					<a href="../hotel/hotelRoomForm.ho?hot_main_num=<%=ajaxList.get(i).getHot_main_num()%>">
					<div class="hot_centerimg">
						<img alt="경로 잘못입력됨." src="../img/hotel/hotel_main/<%=ajaxList.get(i).getHot_main_img()%>" style="width: 180px; height: 200px; border-radius: 8px">						
					</div>
					 </a>	
					<div class="hot_centerbox">
						
						<div class="hot_centerbox_up">
							<div class="hot_centerbox_up_left"> 
																
									<div id="hotel_name"><a href="../hotel/hotelRoomForm.ho?hot_main_num=<%=ajaxList.get(i).getHot_main_num()%>"><%=ajaxList.get(i).getHot_name()%> </a><br></div>
									
									<div id="room_name"><%=ajaxList.get(i).getHot_nation()%> <br></div>
								
							</div>
							<div class="hot_centerbox_up_right">
									<div>리뷰좋다<br></div>
									<div>리뷰좋다<br></div>
							</div>
						</div>
						<div class="hot_centerbox_down">
							<div class="hot_centerbox_down_left">
									
									<div class="room_bold">  <%=main_roomList.get(ajaxList.get(i).getHot_main_num()).getHot_room_name() %><br></div>
									
									<div> 
										<%if(ajaxList.get(0).getHot_wifi()!=null){%>						
											<div class="hot_centerbox_down_left_sub"><i class='fa-solid fa-wifi'></i> <%=ajaxList.get(0).getHot_wifi()%></div>
										<%} %> 
										<%if(ajaxList.get(0).getHot_meetRoom()!=null){%>						
											<div class="hot_centerbox_down_left_sub"><i class="fa-regular fa-handshake"></i> <%=ajaxList.get(0).getHot_meetRoom()%></div>
										<%} %>
										
										<%if(ajaxList.get(0).getHot_smoking()!=null){%>						
											<div class="hot_centerbox_down_left_sub"><i class="fa-solid fa-smoking"></i> <%=ajaxList.get(0).getHot_smoking()%></div><br>
										<%} %>	
														
										<%if(ajaxList.get(0).getHot_restaurant()!=null){%>
											<div class="hot_centerbox_down_left_sub"><i class="fa-solid fa-utensils"></i> <%=ajaxList.get(0).getHot_restaurant()%></div>
										<%} %> 
										
										<%if(ajaxList.get(0).getHot_bar()!=null){%>						
											<div class="hot_centerbox_down_left_sub"><i class="fa-solid fa-martini-glass"></i> <%=ajaxList.get(0).getHot_bar()%></div><br>
										<%} %>						
										<%if(ajaxList.get(0).getHot_cafe()!=null){%>						
											<div class="hot_centerbox_down_left_sub"><i class="fa-solid fa-mug-saucer"></i> <%=ajaxList.get(0).getHot_cafe()%></div>
										<%} %>
										<br>
									</div>									
							</div>	
							<div class="hot_centerbox_down_rigth">
									<br>
									<div class="line">
										<fmt:formatNumber value="<%=main_roomList.get(ajaxList.get(i).getHot_main_num()).getHot_room_price()%>" groupingUsed="true" /> 원
									</div>
									
							</div>
		       			</div>
		        	</div>		       
		     </div>	 
		     
		      
		      <%} %>  
		      
		      <section id="pageList">
			<%if(nowPage<=1){ %>
			[이전]&nbsp;
			<%}else{ %>
			<a href="hotel/hotelMainStarForm.ho?page=<%=nowPage-1 %>">[이전]</a>&nbsp;
			<%} %>
	
			<%for(int a=startPage;a<=endPage;a++){
					if(a==nowPage){%>
			[<%=a %>]
			<%}else{ %>
			<a href="hotel/hotelMainStarForm.ho?page=<%=a %>">[<%=a %>]
			</a>&nbsp;
			<%} %>
			<%} %>
	
			<%if(nowPage>=maxPage){ %>
			[다음]
			<%}else{ %>
			<a href="hotel/hotelMainStarForm.ho?page=<%=nowPage+1 %>">[다음]</a>
			<%} %>
		</section>
	
	<%}else{%>
		<section id="emptyArea">등록된 호텔이 없습니다.</section>
	<%}%> 
	
	
	