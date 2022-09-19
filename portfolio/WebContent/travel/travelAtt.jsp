<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>    
<%@page import="vo.Travelatt"%>    
<%@page import="vo.Travelattandimg"%>
<%@page import="vo.PageInfo"%>
<%@page import="vo.Travelattre"%>  
<% 
	ArrayList<Travelatt> travelatt=(ArrayList<Travelatt>)request.getAttribute("travelatt"); 
	ArrayList<Travelattandimg> travelattimg = (ArrayList<Travelattandimg>)request.getAttribute("travelattimg");
	ArrayList<Travelattre> travelattre=(ArrayList<Travelattre>)request.getAttribute("travelattre");
	String filename= (String)request.getAttribute("filename");
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int listCount=pageInfo.getListCount();
	int nowPage=pageInfo.getPage();
	int maxPage=pageInfo.getMaxPage();
	int startPage=pageInfo.getStartPage();
	int endPage=pageInfo.getEndPage();
%> 
    <!DOCTYPE html>
<html>
<head>
	<title></title>
	<meta charset="utf-8">
	<link href="https://fonts.googleapis.com/css2?family=Cairo&family=Indie+Flower&family=Koulen&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="../css/header_footer.css">
	<link type="text/css" rel="stylesheet" href="../css/responsive-tabs.css" />
    <link type="text/css" rel="stylesheet" href="../css/style.css" />
    <link type="text/css" rel="stylesheet" href="../css/travelAtt.css" />
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<style>
.reviewmain{
clear:both;
}
#pagelist{
margin: 0 auto;
width: 150px;
height: 50px;
border-style:solid;
}
.reviewid{
box-sizing:border-box;
width:100px;
height: 50px;
padding-top:5px;
margin-top:5px;
border-right: gray 2px solid;

}
.reviewcon{
box-sizing:border-box;
width:600px;
height: 50px;
padding-top:5px;
margin-top:5px;
margin-left: 10px;
}
.reviewrate{
border-style:solid;
}
.reviewdate{
width:100px;
border-left: gray 2px solid;
box-sizing:border-box;
height: 50px;
padding-top:5px;
margin-top:5px;
text-align: right;

}
a{
	cursor: pointer;
}
.subtext{	
		width: 400px;
		height:150px;
		margin: 10px 0 0 5px;
		padding: 5px;
		border-radius: 5px;
		background-color: rgba(234, 234, 234, 0.4);
		}
.submap{
		width: 400px;
		height:160px;
		margin: 10px 0 0 5px;
		border-style: solid;
}
.mainimage img{
		border-radius: 5px;
		border: 3px #000054 solid;
		width:400px; 
		height:400px;
}		
</style>
<script>
var travelsearch =getParameter("travelsearch");
function review() {
	var mb_id = '<%= (String)session.getAttribute("mb_id") %>';
	if (mb_id == "null") {
		alert("로그인이 필요합니다.");
		location.href="../overlap/login.jsp";
	} else {
		location.href="Attraction_Review_Write.travel?attnum=<%=travelatt.get(0).getAtt_num()%>&att=<%=travelatt.get(0).getAtt_name()%>";
	}
}

</script>
<body>
	<form>
	<%	String mb_id=(String)session.getAttribute("mb_id");
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
	<%String id = request.getParameter("travelsearch"); %>
	<div id="mainframe">	
	<div id="subframe">
		
	<div id="main1">
		<section id="mainsection">
			<header><%=travelatt.get(0).getAtt_name() %></header>
			<article class="maintext">
				<div class="touraddress"> 주소 : <%=travelatt.get(0).getAtt_address() %></div>
				<div class="subtext"><%=travelatt.get(0).getAtt_content()%> </div>
				<div class=" submap"></div>
			</article>
		</section>
		<article class="mainimage">
			<img src="../img/travel<%=filename %>" style="width:400px; height:400px;">
		</article>
		<input type="submit" value="마이루트로 저장">
	</div>

	<div id="sub">
		<header>입장권 예약</header>

		<article>
			<div class="people">성인</div>
			<div class="money">₩ <%=travelatt.get(0).getAtt_adult_ticket()%></div>
		</article>
		<article>
			<div class="people">중•고등학생</div>
			<div class="money">₩ <%=travelatt.get(0).getAtt_student_ticket()%></div>
		</article>
		<div style="width: 120px; height: 40px; margin: 0 auto;">
			<input type="submit" value="입장권 예약">
		</div>
	</div>

	<div id="final">
		<section class="reviewmain">
				<%for(int i=0; i<travelattre.size(); i++){ %>
				<div style="width:830px; height:60px; border-bottom:gray 2px solid; margin:20px 0 0 7px;">
				<div class="reviewid" style="float: left;">
					<%=travelattre.get(i).getMb_id() %>
				</div>
				<div class="reviewcon" style="float: left;">
					<%=travelattre.get(i).getAtt_reContent() %>
				</div>
				<div class="reviewdate" style="float: left;">
					<%=travelattre.get(i).getAtt_reDate() %>
					<%if(travelattre.get(i).getMb_id().equals(mb_id)){ %>
					<div><a>수정</a>|&nbsp;<a href="Attraction_Review_delete.travel?renum=<%=travelattre.get(i).getAtt_reNum()%>&att=<%=travelatt.get(0).getAtt_name()%>">삭제</a></div>
					<%} %>
				</div>
		</div>
				<%} %>
			<%if(maxPage != 0){ %>
			<div style="width:300px; height: 30px;clear:both;margin:0 auto;text-align: center;margin-top:20px;">
			<section id="pageList">
				<%if(nowPage<=1){ %>
				[이전]&nbsp;
				<%}else{ %>
				<a href="Attraction.travel?page=<%=nowPage-1 %>&att=<%=travelatt.get(0).getAtt_name()%>">[이전]</a>&nbsp;
				<%} %>
		
				<%for(int a=startPage;a<=maxPage;a++){
						if(a==nowPage){%>
				[<%=a %>]
				<%}else{ %>
				<a href="Attraction.travel?page=<%=a %>&att=<%=travelatt.get(0).getAtt_name()%>">[<%=a %>]
				</a>&nbsp;
				<%} %>
				<%} %>
		
				<%if(nowPage>=maxPage){ %>
				[다음]	
				<%}else{ %>
				<a href="Attraction.travel?page=<%=nowPage+1 %>&att=<%=travelatt.get(0).getAtt_name()%>">[다음]</a>
				<%} %>
			</section>
			</div>
			<%} %>
				</section>
					<div style="width: 130px; height: 40px; margin: 30px 0 0 0;float:right;">
					<input type="button" value="리뷰 작성"  onClick="review()">
				</div>		
			</div>
		</div>
<script>
window. onload=function(){

	$('.div').hide();
	$('#attraction').show();
}
$(function() {
	  $('#rightnav').change(function(){
	    $('.div').hide();
	    $('#' + $(this).val()).show();
	  });
	});		
</script>
		<nav id="place">
			<div id="chooseplace">
				<select size="1" id= "rightnav">
					<option value="attraction">주변 관광지</option>
					<option value="restaurant">주변 음식점</option>
					<option value="hotel">주변 호텔</option>
				</select>		
			</div>
			<div id="attraction" class="div attraction">
				<a href="../travel/Attraction.travel?att=<%=travelattimg.get(0).getAtt_name() %>">
					<section class="rightimg"><img src="../img/travel<%=travelattimg.get(0).getTravel_img1() %>"></section>
					<article class="righttext"><%=travelattimg.get(0).getAtt_name() %></article>
				</a>
				<a href="../travel/Attraction.travel?att=<%=travelattimg.get(1).getAtt_name() %>">
					<section class="rightimg"><img src="../img/travel<%=travelattimg.get(1).getTravel_img1() %>"></section>
					<article class="righttext"><%=travelattimg.get(1).getAtt_name() %></article>
				</a>
				<a href="../travel/Attraction.travel?att=<%=travelattimg.get(2).getAtt_name() %>">
					<section class="rightimg"><img src="../img/travel<%=travelattimg.get(2).getTravel_img1() %>"></section>
					<article class="righttext"><%=travelattimg.get(2).getAtt_name() %></article>
				</a>
				<a href="../travel/Attraction.travel?att=<%=travelattimg.get(3).getAtt_name() %>">
					<section class="rightimg"><img src="../img/travel<%=travelattimg.get(3).getTravel_img1() %>"></section>
					<article class="righttext"><%=travelattimg.get(3).getAtt_name() %></article>
				</a>
			</div>
			<div id= restaurant class="div restaurant">
				<a href=""><section class="rightimg"><img src="../img/travel/seoul/Gyeongbokgung.jpg"></section></a>
				<article class="righttext">111</article>
				<a href=""><section class="rightimg"><img src="../img/travel/seoul/Gwanghwamun.jpg"></section></a>
				<article class="righttext">222</article>
				<a href=""><section class="rightimg"><img src="../img/travel/seoul/Bukchon.jpg"></section></a>
				<article class="righttext">3333</article>
				<a href=""><section class="rightimg"><img src="../img/travel/seoul/Cheonggyecheon.jpg"></section></a>
				<article class="righttext">444</article>
			</div>
			<div id= hotel class="div hotel">
				<a href=""><section class="rightimg"><img src="../img/travel/seoul/Gyeongbokgung.jpg"></section></a>
				<article class="righttext">...</article>
				<a href=""><section class="rightimg"><img src="../img/travel/seoul/Gwanghwamun.jpg"></section></a>
				<article class="righttext">...</article>
				<a href=""><section class="rightimg"><img src="../img/travel/seoul/Bukchon.jpg"></section></a>
				<article class="righttext">...</article>
				<a href=""><section class="rightimg"><img src="../img/travel/seoul/Cheonggyecheon.jpg"></section></a>
				<article class="righttext">...</article>
			</div>
		</nav>
	</div>
		<jsp:include page="../overlap/footer.jsp"/>
	</form>
</body>
</html>