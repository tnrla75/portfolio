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
	
	System.out.println(main_roomList.size()+" : mainAjaxJsp main_roomList");
	System.out.println(ajaxList+" : mainAjaxJsp ajaxList");
	
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
	<script>
	
	$(function(){
		$(".plus").slice(0, 4).show(); // 최초 4개 선택
		$(".plus").click(function(e){ // Load More를 위한 클릭 이벤트e
		e.preventDefault();
		$("#plus:hidden").slice(0, 4).show(); // 숨김 설정된 다음 10개를 선택하여 표시
		if($("#plus:hidden").length == 0){ // 숨겨진 DIV가 있는지 체크
		alert("더 이상 등록된 호텔이 없습니다.."); // 더 이상 로드할 항목이 없는 경우 경고
		}
		});
		});
	
	</script>
	<div id="up_rightbox">
		
	<h3 style="font-size: 20pt;">머무르고 싶은 지역을 입력하세요.</h3>
		<div>
			<img src="../img/icon/hotel.png" width="20" height="20"	class="hotelIcon"> 
			<input type="text" placeholder="여행지 또는 숙소 이름으로 검색"  id="btnOpen1" name="hot_nation" size="40"> 
			<select height="30" name="hot_room_maxpeople">
				<option value="인원수">인원수</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				
			</select> 
			<input type="date"  name="hot_checkin_date" id="datechoice3"> 
			<input type="date" name="hot_checkout_date" id="datechoice4"> 
			<input type="button"  name="kensakuBtn"  class="kensakuBtn" onClick="getPost('02')">
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
									<br>
									<div id="star"><%=ajaxList.get(i).getHot_star()%>성급<br></div>
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
		      <div id="plus"><div class="plus"><input type="button" name="plus" value="더보기" onclick="" ></div></div>
		      
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
	
	
	