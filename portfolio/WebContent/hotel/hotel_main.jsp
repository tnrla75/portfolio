<%@page import="action.Hotel_MainAction"%>
<%@page import="vo.Hotel_main_DB"%>
<%@page import="vo.Hotel_review_DB"%>
<%@page import="vo.PageInfo"%>
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

	.section{
		width: 1200px;
		height: 1400px;
		padding-bottom:20px;
		margin: 40px auto;
		border-style: solid;		
	}
	#head{	
	width: 1200px;
	height: 50px;
	margin: 0 auto;
	
	text-align: center;
	
	}
	#up_rightbox{
		width: 800px;
		height: 150px;
		margin: 0 auto;
		border-radius: 7px;
		border-style: solid;
		float:right;
	}
	#up_leftbox{
		width: 360px;
		height: 1000px;
		margin: 0 auto;
		margin-right: 20px;
		text-align: center;
		border-style: solid;
		border-radius: 7px;
		float:left;
	}
	.up_rightbox{
		width: 800px;
		height: 150px;
		margin: 0 auto;	
		border-radius: 7px;	
		border-style: solid;
		float:right;
	}
	
	#centerbox{
		width: 800px;	
		height: 1300px;	
		margin: 0 auto;
		padding-bottom: 30px;		
		text-align: center;
		border-radius: 7px;
		border-style: solid;
		float:left;
	}
	
	.up_rightbox{
		width: 800px;
		height: 240px;
		margin: 15px auto;
		text-align: center;
		border-radius: 7px;
		border-style: solid;
		float:right;
	}
	.hot_centerimg{
		width: 200px;
		height: 240px;
		margin: 0 auto;
		border-radius: 7px;
		text-align: center;
		
		float:left;
	}
	
	.hot_centerbox{
		width: 590px;
		height: 240px;
		margin: 0 auto;
		
		text-align: left;
		border-style: solid;
		float:left;
	}
	.hot_centerbox_up{
		width: 580px;
		height: 80px;
		margin: 0 auto;		
		text-align: left;
		border-style: solid;
		padding-left:10px;
		float:left;
	}
	
	
	.hot_centerbox_up_left{
		width: 460px;
		height: 80px;
		margin: 0 auto;		
		text-align: left;
				
		float:left;
	}
	
	.hot_centerbox_up_right{
		width: 100px;
		height: 80px;
		margin: 0 auto;		
		text-align: right;
				
		float:left;
	}
	.hot_centerbox_down{
		width: 580px;
		height: 120px;
		margin: 5px auto;		
		text-align: left;
		border-style: solid;
		padding-left:10px;
		float:left;
	}
	.hot_centerbox_down_left{
		clear:left;
		width: 410px;
		height: 120px;
		margin: 0 auto;		
		text-align: left;
		
		padding-left:10px;
		float:left;
	}
	
	.hot_centerbox_down_rigth{
		width: 140px;
		height: 120px;
		margin: 0 auto;		
		text-align: right;
				
		float:left;
	}
	
</style>
<script type="text/javascript">
	function getPost(mode){
		 var myform=document.myfrom;
		if(mode=='4'){
			myform.action="/hotel_MainForm.ho";
		}
		myform.submit();
	}
</script>
<%
	
	request.setCharacterEncoding("UTF-8");

	String mb_id = (String)session.getAttribute("mb_id"); 
	
	ArrayList<Hotel_main_DB> mainList=(ArrayList<Hotel_main_DB>)request.getAttribute("mainList");	
	
	
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
<body>
	<form name="myform">
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
				dsfasdf
		</div>
		<div id="centerbox">
		 <div id="up_rightbox">
		 		
					<h3 style="font-size: 20pt;">머무르고 싶은 지역을 입력하세요.</h3>
		        		<img src="../img/icon/hotel.png" width="20" height="20" class="hotelIcon">
		        		<input type="text" placeholder="여행지 또는 숙소 이름으로 검색" size="40">
			            <select>
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
			        	<input type="submit" name="hotelBtn" class="hotelBtn" value="검색" onclick="getPost()"><hr>
		       
		      </div>  	
		     		<%	if(mainList != null && listCount > 0){	%>
					<% for(int i=0;i<mainList.size();i++){ %> 
			<div class="up_rightbox">
					
					<div class="hot_centerimg">
						<img alt="경로 잘못입력됨." src="../img/hotel_main/<%=mainList.get(i).getHot_main_img()%>" style="width: 200px; height: 240px;">
					</div>
					<div class="hot_centerbox">
						<br>
						<div class="hot_centerbox_up">
							<div class="hot_centerbox_up_left"> 
								<div class='centerbox' name='hot_main_num'><a href='../hotel/hotelRoomForm.ho?hot_main_num=<%=mainList.get(i).getHot_main_num()%>'><%=mainList.get(i).getHot_main_num() %></a></div><br>
								<div>호텔 주소 : <%=mainList.get(i).getHot_nation()%> <br></div>
							</div>
							<div class="hot_centerbox_up_right">
									<div>리뷰좋다<br></div>
									<div>리뷰좋다<br></div>
							</div>
						</div>
						<div class="hot_centerbox_down">
							<div class="hot_centerbox_down_left">
									<div>호텔 객실 : <%=mainList.get(i).getHot_name()%> <br></div>
									<div>호텔  정보: <%=mainList.get(i).getHot_name()%> <br></div>
							</div>								
							<div class="hot_centerbox_down_rigth">
									<div> 가격<br></div>
									<div>오른쪽<br></div>
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
	<section id="emptyArea">등록된 글이 없습니다.</section>
	<%}%>      	
		 </div>
	</section>
				</form>		
		
	<jsp:include page="../overlap/footer.jsp"/>
	
</body>
</html>