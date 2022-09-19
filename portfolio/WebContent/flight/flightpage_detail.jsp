<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.util.*"%>
	<%@page import="vo.FlightTicketBean"%>
	<%
		ArrayList<FlightTicketBean> articleList=(ArrayList<FlightTicketBean>)request.getAttribute("articleList");
		String totalprice= request.getParameter("totalprice");
		System.out.println(totalprice);
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="../css/header_footer.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<title></title>
<style>
#flightdiv1 {
	width: 900px;
	height: 1200px;
	position: relative;
}

#flightdiv2 {
	width: 300px;
	height: fit-content;
	position: fixed;
	top: 160px;
	margin-left: 900px;
	background-color: #E7E7E7;
	border-radius: 10px;
}

#flightdiv2_indiv1 {
	width: 270px;
	margin: 0 10px;
	border-bottom: 1px dotted rgba(0, 0, 0, 0.2);
}

#flightdiv2_indiv2 {
	width: 270px;
	margin: 0 10px;
	border-bottom: 1px dotted rgba(0, 0, 0, 0.2);
}

#flightdiv2_indiv3 {
	width: 270px;
	margin: 0 10px;
	float: left;
}

#flightdiv2_indiv3>span {
	margin: 10px 0;
	font-weight: bold;
	font-size: 14pt;
}

.flightdiv1_indiv1 {
	margin-top: 10px;
	width: 850px;
	height: auto;
	padding: 10px;
	border: 2px solid rgba(0, 0, 0, 0.3);
}

.flightdiv1_indiv1 h2, .flightdiv1_indiv1 h3 {
	margin-left: 30px;
}

.flightdiv1_indiv1>div {
	border-bottom: solid 2px rgba(0, 0, 0, 0.3);
	width: 360px;
	float: left;
	margin: 20px 30px;
}

.flightdiv1_indiv1>div>input {
	border-style: none;
	line-height: 30px;
	width: 360px;
}
		#footerprice {
	        position: fixed;
	        background-color: white;
	        left: 0;
	        right: 0;
	        bottom: 0;
	        height: 60px;
	      	box-shadow: 0 0 4px rgba(0,0,0,0.5);
	        z-index: 1000;
        }
        #textdiv{
        	margin: 0 auto;
        	width: 1200px;
        }
        
        .footer_amount > .span1{
       		height: 60px;
			line-height: 60px;
			font-size: 14pt;
			font-weight: bold;
        }
        .footer_amount > .span2{
        	height: 60px;
			line-height: 60px;
			font-size: 14pt;
			font-weight: bold;
			color: #002266;
			margin-right: 20px;
			float: right;
			border-style: none;
			text-align: right;
        }
        .footer_backchoice{
        	height: 60px;
        	width: 250px;
        	font-weight:bold;
        	color: white;
        	font-size: 14pt;
        	background-color: #002266;
        	border-style: none;
        	float:right;
        }
</style>
</head>
<script>
	
	function addbtn() {
		var name = document.createElement("input");
	}
</script>
<body>
	<form>
		<%
		String id = (String)session.getAttribute("id"); 
		if(id == null){
			%>
			<jsp:include page="../overlap/header_login.jsp"/>
			<%
		}else{
			%>
			<jsp:include page="../overlap/header_logout.jsp"/>
			<%
		}
	%>
		<div id="footerprice">
	<div id="textdiv">
		<div class="footer_amount">
			<span class="span1">예상 결제 금액</span>
			<input type="button" class="footer_backchoice" value="회원 정보 입력">
			<input class="span2" name="totalprice" value='<%= request.getParameter("total") %>' readonly>
		</div>
	</div>
</div>
		<div style="width: 1200px; margin: 0 auto; height: auto;">
			<div id="flightdiv1">
				<h2>탑승객</h2>
				<div class="flightdiv1_indiv1">
					<h3>1.성인 항공권</h3>
					<div>
						<input type="text" placeholder="성">
					</div>
					<div>
						<input type="text" placeholder="이름">
					</div>
					<div>
						<input type="text" placeholder="성별">
					</div>
					<div>
						<input type="text" placeholder="생년월일">
					</div>
					<div>
						<input type="text" placeholder="국적">
					</div>
					<div>
						<input type="text" placeholder="여권">
					</div>
					<div>
						<input type="text" placeholder="여권번호">
					</div>
					<div>
						<input type="text" placeholder="유효기간">
					</div>
				</div>
				<input type="button" value="추가" id="addbtn">
			</div>
	
			<div id="flightdiv2">
				<div id="flightdiv2_indiv1">
					<h3>요금 상세 정보</h3>
				</div>
				<div id="flightdiv2_indiv2">
					<h4>탑승객</h4>
				</div>
				<div id="flightdiv2_indiv3">
					<span style="float: left;">총 금액</span> <span style="float: right;">222,222원</span>
				</div>
			</div>
		</div>


		<jsp:include page="../overlap/footer.jsp"/>
	</form>
</body>
</html>