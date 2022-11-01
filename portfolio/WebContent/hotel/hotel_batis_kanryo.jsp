<%@page import="vo.Hotel_yoyaku_DTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="vo.Travelatt"%>
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
		height: 700px;
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
		line-height: 50px;
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
	
</style>
</head>
<script>
		<% String mb_id = (String)session.getAttribute("mb_id");%>
	function gomain(){
		location.href="../index.jsp";
	}
	function gomypage(){
		location.href="../overlap/mypage_mateapply.mypage?command=travel_mateApply&mb_id=<%= mb_id %>"
	}
	
</script>
<%
	request.setCharacterEncoding("UTF-8");
	
	
	ArrayList<Hotel_yoyaku_DTO> kanryoList = (ArrayList<Hotel_yoyaku_DTO>)request.getAttribute("kanryoList");
	
	
	String mb_firstname=request.getParameter("mb_firstname");
	String mb_lastname=request.getParameter("mb_lastname");
	String hot_checkin_date=request.getParameter("hot_checkin_date");
	String hot_checkout_date=request.getParameter("hot_checkout_date");
	String hot_room_price=request.getParameter("hot_room_price");
	
	
	System.out.println(mb_firstname+" : 완료페이지 JSP 성  ");
	System.out.println(mb_lastname+" : 완료페이지 JSP 이름  ");
	System.out.println(hot_checkin_date+" : 완료페이지 JSP 체크인  ");
	System.out.println(hot_checkout_date+" : 완료페이지 JSP 체크아웃  ");
	System.out.println(hot_room_price+" : 완료페이지 JSP 가격  ");
	System.out.println("예약 완료 JSP");
	
%>
<body>
	<form>
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
			<div id="textdiv">
				예약 번호 : <%=kanryoList.get(0).getHot_yoyaku_num()%>
			</div>
			<div id="btndiv">
				<input type="button" value="예약 정보 확인하기" onclick="gomypage()">
				<input type="button" value="메인 화면 이동" onclick="gomain()">
			</div>
		</div>
		
		<jsp:include page="../overlap/footer.jsp" />
	</form>
</body>
</html>