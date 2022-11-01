<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="vo.Travelattandimg"%>
    <%@page import="java.util.ArrayList"%>
<%	request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/header_footer.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="http://use.fontawesome.com/releases/v6.1.2/js/all.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<title>Insert title here</title>
<style>
	#maindiv{
		border: solid 2px rgba(0,0,0,0.3);
		width: 1200px;
		height: 550px;
		margin: 20px auto;
	}
	#textdiv{
		width: 1200px;
		height: 70px;
		position: relative;
		top: 300px;
		text-align: center;
		font-weight:bold;
		font-size: 26pt;
		
	}
	
	#btndiv{
		width: 1200px;
		height: 70px;
		position: relative;
		top: 300px;
		text-align: center;
	 }
	#btndiv > input{
		display :inline-block;
		font-size: 14pt;
		font-weight:bold;
		color:white;
		background-color: #002266;
		width: 200px;
		height: 70px;
		margin: 0 10px;
	}
	svg {
		width : 150px;
		height: 150px;
		position: absolute;
		top: 300px;
		left: 49%;
		margin-left: -50px;
	}
	svg.animate path {
	  animation: dash 0.75s linear both;
	  animation-delay: 0.5s;
	}

	@keyframes dash {
	  0% { stroke-dashoffset: 210; }
	  75% { stroke-dashoffset: -220; }
	  100% { stroke-dashoffset: -205; }
	}
	#offerdiv{
		width:1200px;
		height: 800px;
		margin:0 auto;
	}
	#offerdiv > div{
		width:1200px;
		height:350px;
	}
	.offertitle{
		text-align: center;
		font-size: 16pt;
		font-weight: bold;
		line-height: 70px;
	}
	.listdiv{
		width:1200px;
		height:300px;
	}
	.listdiv > div{
		width:250px;
		height:300px;
		margin:0 20px;
		float: left;
	}
	/* attimg  */
	.localbox{
		width: 1200px;
		height: 200px;
		margin-bottom: 40px;
	}
	.localimg{
		overflow: hidden;
		width: 280px;
		height:200px;
		float: left;
		margin-left: 15px;
		background-position: center;
		background-repeat: no-repeat;
		background-size: 200px;
		text-align: center;
		color: white;
		font-weight: bold;
	}
	.localimg div{
		height: 30px;
		position: relative;
		font-size: 15pt;
		bottom: 35px;
		background-color: rgba(0, 0, 0, 0.5);
	}
	.localimg img:hover{
		transform: scale(1.04);
		overflow: hidden;
	}
	
</style>
</head>
<script>

</script>
<body>
	<form>
		<%
		String mb_id = (String)session.getAttribute("mb_id"); 
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
		<svg viewBox="0 0 100 100" class="animate">
  					<filter id="dropshadow" height="100%">
    					<feGaussianBlur in="SourceAlpha" stdDeviation="3" result="blur"/>
    						<feFlood flood-color="rgba(76, 175, 80, 1)" flood-opacity="0.5" result="color"/>
    							<feComposite in="color" in2="blur" operator="in" result="blur"/>
    								<feMerge> 
      								<feMergeNode/>
      							<feMergeNode in="SourceGraphic"/>
    						</feMerge>
  					</filter>
 					<circle cx="50" cy="50" r="46.5" fill="none" stroke="rgba(76, 175, 80, 0.8)" stroke-width="5"/>
  					<path d="M67,93 A46.5,46.5 0,1,0 7,32 L43,67 L88,19" fill="none" stroke="rgba(76, 175, 80, 1)" stroke-width="5" stroke-linecap="round" stroke-dasharray="80 1000" stroke-dashoffset="-220"  style="filter:url(#dropshadow)"/>
				</svg>
		<div id="maindiv">
			<div id="textdiv">
				<%= mb_id %>님 예약이 완료되었습니다.
			</div>
			<div id="btndiv">
				<input type="button" value="예약정보 확인하기" onclick="location.href='mypage_itemqna.mypage?command=ticketOrder&mb_id=<%= mb_id %>'">
				<input type="button" value="메인 화면 이동">
			</div>
		</div>
		<div id="offerdiv">
			<div>
				<div class="offertitle">
					추천 명소
				</div>
				<div class="listdiv">
				<%
					ArrayList<Travelattandimg> list = (ArrayList<Travelattandimg>)request.getAttribute("data");
				%>
					<a href="../travel/Attraction.travel?att=<%=list.get(0).getAtt_name()%>">
			<div class="localimg">
				<img src="../img/travel<%=list.get(0).getAtt_img1()%>" width="280px" height="200px">
				<div><%=list.get(0).getAtt_name() %></div>
			</div></a>
			<a href=../travel/Attraction.travel?att=<%=list.get(1).getAtt_name()%>">
			<div class="localimg">
				<img src="../img/travel<%=list.get(1).getAtt_img1()%>" width="280px" height="200px">
				<div><%=list.get(1).getAtt_name() %></div>
			</div></a>
			<a href="../travel/Attraction.travel?att=<%=list.get(2).getAtt_name()%>">
			<div class="localimg">
				<img src="../img/travel<%=list.get(2).getAtt_img1()%>" width="280px" height="200px">
				<div><%=list.get(2).getAtt_name() %></div>
			</div></a>
			<a href="../travel/Attraction.travel?att=<%=list.get(3).getAtt_name()%>">
			<div class="localimg">
				<img src="../img/travel<%=list.get(3).getAtt_img1()%>" width="280px" height="200px">
				<div><%=list.get(3).getAtt_name() %></div>
			</div></a>
				</div>
			</div>
			<div>
				<div class="offertitle">
					추천 호텔
				</div>
				<div class="listdiv">
					<div>
					
					</div>
					<div>
					
					</div>
					<div>
					
					</div>
					<div>
					
					</div>
				</div>
			</div>
			
		</div>
		<jsp:include page="../overlap/footer.jsp" />
	</form>
</body>
</html>