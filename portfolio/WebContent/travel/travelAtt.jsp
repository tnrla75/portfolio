<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>    
<%@page import="vo.Travelatt"%>    
<%@page import="vo.Travelattandimg"%>
<%@page import="vo.PageInfo"%>
<%@page import="vo.Travelattre"%>  
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
</head>
<script src="http://use.fontawesome.com/releases/v6.1.2/js/all.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<style>
*{box-sizing:border-box;}
#mainheader{width: 1200px; height: 150px;
					margin: 0 auto;
					}
		#main1{width: 850px; height: 500px;
					margin: 20px auto 0 auto;
					}
		#mainframe{width: 1200px; height: 1800px;
					box-sizing: border-box;
					margin: 0 auto;
					}			
		#subframe{width: 960px; height: fit-content;
					box-sizing: border-box;
					margin-top: 15px;
					border-radius: 5px;
					float: left;
					}						
		#mainsection{width: 370px; height: 500px;
					margin: 0 0 10px 0;
					box-sizing: border-box;
					float: left;
					}
		#mainsection>header{width: 350px;
							box-sizing: border-box;
							text-align: left;
							font-size: 30pt
							}
		.openinghours{width: 400px; height: 50px;	
			margin: 30px 0 10px 0;
			font-size: 14pt;
			text-align: center;
		}
		.openinghours>div{
			width:300px; height: 50px;
			float: right; 
		}		
		.touraddress{
			width: 400px; height: 20px;
			margin: 10px 0 10px 0;
		}
		.maintext{width: 400px; height: 400px;
				box-sizing: border-box;

		}
		.mainimage{width: 450px; height: 400px;
					margin: 80px 0 0 0;
					box-sizing: border-box;
					float: right;
		}		
		#sub{width: 850px; height: 400px;
					margin: 0 auto;
					border-style: solid;		
					}
		
		.people{width: 250px; height: 30px;
				float: left;}
		.money{width: 250px; height: 30px;
				float: right;
				text-align: right;}	
		#final{width: 850px; height: fit-content;
				margin: 10px auto 0 auto;	
				}
		.reviewmain{width: 850px; height: fit-content;
					box-sizing: border-box;
					clear:both;
				}										
		.subreview{width: 750px; height: 195px; 
					margin: 0 0 20px 0; 
					box-sizing: border-box;
					}

		#place{width: 230px; height: 730px;
				margin-top: 15px;
				border-radius: 5px;
				box-sizing: border-box; 
				float: right;
				border: 3px solid #030066;
				
			}
		#chooseplace{width: 200px; height: 30px;
					margin: 10px auto 20px auto;}
		#chooseplace>select{width: 200px; height: 30px;
			font-size: 13pt;
		}
		.righttext{
			margin: 5px 0 5px 20px;
			margin-left: 10px;
		}
		.rightimg{
			width: 200px; height: 130px;
			margin: 0 auto;
			box-shadow: 2px 2px 2px #BDBDBD;
			overflow: hidden;
		}
		.rightimg>img{
			width: 200px; height: 130px;
		}
		.rightimg>img:hover{
			transform: scale(1.04);
			overflow: hidden;
		}
		#final>div>input{float: center; 
			width: 120px; height: 40px; 
			border-style: none; 
			background-color: #030066; 
			color: white; 
			border-radius: 5px;
			float: right;
		}
		#main1>input{
			float: right;
			height: 40px;
			border-style: none;
			background-color: #030066;
			color: white;
			border-radius: 5px;
			margin: 10px 0 0 0;
		}
		#pagelist{
			margin: 0 auto;
			width: 150px;
			height: 50px;
		}
		/* .reviewid{
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
		
		.reviewdate{
			width:100px;
			border-left: gray 2px solid;
			box-sizing:border-box;
			height: 50px;
			padding-top:5px;
			margin-top:5px;
			text-align: right;
		} */
		a{
			cursor: pointer;
		}
		.subtext{	
			width: 350px;
			height:200px;
			margin: 0 0 0 5px;
			padding: 5px;
			border-radius: 5px;
			background-color: rgba(234, 234, 234, 0.4);
		}
		.ticket{
			width: 350px;
			height:175px;
			border-radius: 5px;
			margin: 10px 0 0 5px;
			padding: 5px;
			background-color: rgba(234, 234, 234, 0.4);
		}
		.ticket header{
			font-size: 13pt;
			font-weight: bold;
		}
		.ticket article{
			width: 340px;
			height: 40px;
			/* background: white; */
			border: 1px gray solid;
			margin-top: 10px;
			border-radius: 3px;
		}
		.ticket div{
			margin: 3px auto 0 auto;
			width: 80px;
			height: 25px;	
			padding: 5px;
		}
		.ticket div input{
			float: center;
			width: 80px; height: 25px;
			border-style: none;
			background-color: #030066;
			color: white;
			margin-top: 5px;
			border-radius: 5px;
		}
		.ticket section{
			margin-top: 30px;
			margin-left: 10px;
		}
		.people{
			width: 150px;
			height:35px;
		}
		.money{
			margin-top: -5px;
			width:150px;
			height:35px;
		}
		.mainimage img{
				border-radius: 5px;
				width:450px; 
				height:400px;
		}		
		.reviewtitle{
				font-size: 	17pt;
				margin: 10px;
				font-weight: bold;
		}
		.star {
		filter: invert(84%) sepia(0%) saturate(1407%) hue-rotate(147deg) brightness(97%) contrast(76%);
		Loss: 0.7. This is a perfect result.
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
			<div class="touraddress"><i class="fa-solid fa-location-dot"></i>&nbsp;<%=travelatt.get(0).getAtt_address() %></div>
			<article class="maintext">
				<div class="subtext"><%=travelatt.get(0).getAtt_content()%> </div>
				<%if (travelatt.get(0).getAtt_adult_ticket() != 0){ %>
				<div class="ticket">
					<header>입장권 예약</header>
					<article>
						<div class="people">성인</div>
						<div class="money">₩<fmt:formatNumber value="<%=travelatt.get(0).getAtt_adult_ticket()%>" groupingUsed="true" /></div>
					</article>
					<article>
						<div class="people">학생</div>
						<div class="money">₩<fmt:formatNumber value="<%=travelatt.get(0).getAtt_student_ticket()%>" groupingUsed="true" /></div>
					</article>
					<div><input type="button" value="예약"></div>
				</div>
				<%}else{ %>
				<div class="ticket">
					<header>입장권 예약</header>
					<section>이 관광지는 입장권이 필요하지 않습니다.</section>
				</div>
				<%} %>
			</article>
		</section>
		<article class="mainimage">
			<img src="../img/travel<%=filename %>">
		</article>
	</div>
	<div id="sub">
		지도! 들어가요
	</div>
	<div id="final">
		<section class="reviewmain">
			<div class="reviewtitle">리뷰</div>
				<div class=" reviewlist" style="width: 850px;height:fit-content; ">
				<% if(travelattre.size() != 0){
				 for(int i=0; i<travelattre.size(); i++){ %>
					<div style="width:850px; height: 150px;border-bottom:gray 2px solid;margin-bottom:10px;">
						<div style="width:300px;height:30px;padding:3px 0 0 10px;float:left;">
							<%=travelattre.get(i).getMb_id() %>
						</div>
						<div style="width:110px;height:2px;margin-bottom:30px;margin-left:750px;padding-right: 10px;">
							<a href="Attraction_Review_updatepage.travel?renum=<%=travelattre.get(i).getAtt_reNum()%>&att=<%=travelatt.get(0).getAtt_name()%>&recon=<%=travelattre.get(i).getAtt_reContent()%>">수정</a>
								&nbsp;|&nbsp;
							<a href="Attraction_Review_delete.travel?renum=<%=travelattre.get(i).getAtt_reNum()%>&att=<%=travelatt.get(0).getAtt_name()%>">삭제</a>
						</div>
						<div style="width:300px;height:20px;float:right;font-size:10pt;text-align:right;margin:3px 10px 0 0;">
							<%=travelattre.get(i).getAtt_reDate()%>&nbsp;작성
						</div>
						<div style="width:300px; height:30px;padding-left:10px;">
						<%
							String star1 = "<img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'>";
							String star2 = "<img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'>";
							String star3 = "<img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'>";
							String star4 = "<img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'>";
							String star5 = "<img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'>";
							
							if(travelattre.get(i).getAtt_reRate() == 5 ){
								out.println(star5);	
							}else if (travelattre.get(i).getAtt_reRate() == 4) {
								out.println(star4);	
							} else if (travelattre.get(i).getAtt_reRate() == 3) {
								out.println(star3);
							} else if (travelattre.get(i).getAtt_reRate() == 2) {
								out.println(star2);
							} else {
								out.println(star1);
							}
						%>
						</div>
						<div style="width:850px; height:75px;padding:10px;">
							<%=travelattre.get(i).getAtt_reContent() %>
						</div>
					</div>
					<%} %>
				<%}else{ %>
					<div style="margin-left: 10px;">등록된 댓글이 없습니다.</div>
				<%} %>
				</div>
			<%if(maxPage > 1){ %>
			<div style="width:300px; height: 30px;clear:both;margin:0 auto;text-align: center;margin-top:50px;">
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
			<%}%>
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