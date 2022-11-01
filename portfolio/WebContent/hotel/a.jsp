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
				<%= mb_id %>님 신청이 완료되었습니다.
			</div>
			<div id="btndiv">
				<input type="button" value="신청정보 확인하기" onclick="gomypage()">
				<input type="button" value="메인 화면 이동" onclick="gomain()">
			</div>
		</div>
		
		<jsp:include page="../overlap/footer.jsp" />
	</form>
</body>
</html>
<style>
	/* #kanryobox{
		width: 690px;
		height: 830px;
		border-radius:7px;
		margin: 40px auto;
		background-color: rgba(231,231,231,0.7);
		box-shadow: 7px 7px 7px #BDBDBD;
		border: solid 3px rgba(0,0,0,0.4);
		 border-bottom: solid 3px rgba(0,0,0,0.4);
		border-bottom: solid 3px rgba(0,0,0,0.4); 
	}
	#kanryo{
		width: 250px;
		height: 80px;		
		margin: 20px auto;
		border-bottom: solid 1px rgba(0,0,0,0.4);
		font-size:50px;	
		text-align: center;
	}
	
	.midelbox{
		width: 480px;
		height: 450px;
		margin: 0 auto;
		
	}
	.nameleft{
		clear:left;
		width: 150px;
		height: 65px;
		padding-top:15px;
		margin: 0 auto;
		font-size:18px;	
		
		text-align:left;
		float: left;
	}
	.nameright{
		width: 300px;
		height: 80px;
		font-weight:bold;
		margin: 0 0 0 20px;
		font-size:18px;	
		
		float: left;
	}.leftbox{
		clear:left;
		width: 150px;
		height: 40px;
		margin: 10px auto;
		font-size:18px;			
		text-align:left;
		float: left;
	}
	.rightbox{
		width: 300px;
		height: 40px;
		margin: 10px 0 0 20px;
		font-size:18px;			
		float: left;
	}
	#sitabox{
		clear:left;
		width: 650px;
		height: 50px;
		margin: 20px auto;
		
		text-align: center;
	}
	.sub{
		width: 300px;
		height: 40px;
		
		margin: 0 auto;
	}
	 */
	
	// 체크 박스
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
<script type="text/javascript">

	function index(){
		alert("홈으로~");
		location.replace("../index.jsp");
	}
	function hotel(){
		alert("호텔 더보기.");
		/* location.replace("../hotel/hotelMainForm.ho"); */
	}
	
</script>
<%
	request.setCharacterEncoding("UTF-8");
	
	String mb_id = (String)session.getAttribute("mb_id"); 
	
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

<form action="../hotel/hotelMainForm.ho" method="post">

	<%-- <div id="kanryobox">
			<div id="kanryo" >예약 완료</div>		
			<br>
			<div class="midelbox">
				<div class="nameleft">
					호텔 이름
				</div>
				<div class="nameright">
					<%=kanryoList.get(0).getHot_name()%>
				</div>	
				<div class="leftbox">
					객실 이름
				</div>
				<div class="rightbox">
					<%=kanryoList.get(0).getHot_room_name()%>
				</div>		
	
				<div class="leftbox">
					이름
				</div>
				<div class="rightbox">
					<%=kanryoList.get(0).getMb_firstname()%> <%=kanryoList.get(0).getMb_lastname()%>
				</div>			
		
				<div class="leftbox">
					가져온 아이디
				</div>
				<div class="rightbox">
					<%=kanryoList.get(0).getMb_id()%>
				</div>			
			
				<div class="leftbox">
					가격
				</div>
				<div class="rightbox">
					<fmt:formatNumber value="<%=kanryoList.get(0).getHot_room_price()%>" groupingUsed="true" /> 원
				</div>	
				<div class="leftbox">
					체크 인 날짜
				</div>
				<div class="rightbox">
					<%=kanryoList.get(0).getHot_checkin_date()%>
				</div>			
				<div class="leftbox">
					체크 아웃 날짜
				</div>
				<div class="rightbox">
					<%=kanryoList.get(0).getHot_checkout_date()%>
				</div>		
				<div class="leftbox">
					체크인 시간 
				</div>
				<div class="rightbox">
					<%=kanryoList.get(0).getHot_checkin_time()%>
				</div>	
				<div class="leftbox">
					체크 아웃 시간
				</div>
				<div class="rightbox">
					<%=kanryoList.get(0).getHot_checkout_time()%>
				</div>		
				<div class="leftbox">
					예약번호 
				</div>
				<div class="rightbox">
					<%=kanryoList.get(0).getHot_yoyaku_num()%>
				</div>					
			</div>
			
			
			<div id="sitabox">
				<div class="sub">
					<input type="button" style="width: 100px; height: 40px; float: left; background-color: #000054; color:white; "  value="홈으로" onclick="index()">
					<input type="submit" style="width: 100px; height: 40px; margin-left: 30px; float: right;" value="호텔 더보기" onclick="hotel()">
				</div>
			</div>
		</div> --%>