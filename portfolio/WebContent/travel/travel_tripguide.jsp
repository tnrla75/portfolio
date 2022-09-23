<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@page import="vo.Travellocal"%> 
    
   <% ArrayList<Travellocal> travellocal=(ArrayList<Travellocal>)request.getAttribute("travellocal");%>
   <%System.out.println(travellocal+"==222"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="../css/header_footer.css">
<link type="text/css" rel="stylesheet" href="../css/responsive-tabs.css" />
<link type="text/css" rel="stylesheet" href="../css/style.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<title>트립가이드</title>
</head>
<style>
	*{
		box-sizing: border-box;
	}
	.top_box{
		z-index:1;
	    width:100%;
	    height:280px;
	    position:absolute;
	    overflow:hidden;
	}
	.top_smallbox{
      	border-radius:50%;
      	overflow:hidden;
	    background:transparent;
	    width:400vw;
	    height:400vw;
	}
	.top_imgbox,.top_smallbox{
	    position:absolute;
	    bottom:0;
	    left:50%;
	    -webkit-transform:translateX(-50%);
	    transform:translateX(-50%);
	}
	.top_imgbox{
     	width:100vw;
     	height:280px;
     }
     .guideheader{
     	position: absolute;
     	z-index: 8;
     	width: 300px;
     	height: 100px;
     	font-size: 30pt;
     	top:50px;
     	left: 18.75%;
     	color: white;
     	font-weight: bold;
     	
     }
	.searchbox{
		position:absolute;
		top:350px;
		left: 18.75%;
		background: white;
		width:1200px;
		height:100px;
		z-index:8;
		box-shadow: rgba(100, 100, 111, 0.4) 0px 7px 20px 0px;
	}
	.insearchbox{
		width: 1150px;
		height: 70px;
		border: 1px #BDBDBD solid;
		margin: 15px 25px 15px 25px;
	}
	.searchtext{
		width:1000px;
		height:66px;
		font-size: 17pt;
		padding-left: 10px;
		border-style: none;
		margin-top: 2px;
	}
	.searchbtn{
		float: right;
		width: 80px;
		height: 70px;
		border-style: none;
		background: url(../img/icon/loupe.png);
		background-position: center;
		background-size: 40px;
		background-repeat: no-repeat;
	} 
	article{
	margin: 0 auto;
		width: 1200px;
		height: 600px;
	}
	.recommand{
		font-size: 16pt;
		font-weight: bold;
		margin-bottom: 15px;
	}
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

<body>
	<form action="../travel/local.travel">
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
	<section style="width:100%; height: 400px;">
		<div class="top_box">
			<div class="guideheader">트립 가이드<span style="color: #ffb400; font-size:45pt;">.</span></div>
     		<div class="top_smallbox">
        		<div role="img" style="background:url(https://ak-d.tripcdn.com/images/01013120003uuicgh8950.png)  right top / cover no-repeat" class="top_imgbox">
        		</div>
      		</div>
    	</div>
    	<div class="searchbox">
    		<div class="insearchbox">
    			<input type="text" class="searchtext" placeholder="검색하고 싶은 여행지를 검색하세요." name="local">
    			<input type="submit" class="searchbtn" value="">
    		</div>
    	</div>
	</section>
	<article>
		<div class="recommand">추천 여행지</div>
		<div class="localbox">
			<a href="../travel/local.travel?local=<%=travellocal.get(0).getLocal_name()%>">
			<div class="localimg">
				<img src="../img/travel<%=travellocal.get(0).getLocal_img()%>" width="280px" height="200px">
				<div><%=travellocal.get(0).getLocal_name() %></div>
			</div></a>
			<a href="../travel/local.travel?local=<%=travellocal.get(1).getLocal_name()%>">
			<div class="localimg">
				<img src="../img/travel<%=travellocal.get(1).getLocal_img()%>" width="280px" height="200px">
				<div><%=travellocal.get(1).getLocal_name() %></div>
			</div></a>
			<a href="../travel/local.travel?local=<%=travellocal.get(2).getLocal_name()%>">
			<div class="localimg">
				<img src="../img/travel<%=travellocal.get(2).getLocal_img()%>" width="280px" height="200px">
				<div><%=travellocal.get(2).getLocal_name() %></div>
			</div></a>
			<a href="../travel/local.travel?local=<%=travellocal.get(3).getLocal_name()%>">
			<div class="localimg">
				<img src="../img/travel<%=travellocal.get(3).getLocal_img()%>" width="280px" height="200px">
				<div><%=travellocal.get(3).getLocal_name() %></div>
			</div></a>
			
		</div>
			
		<div class="recommand">추천 호텔</div>
		<div class="localbox">
			<div class="localimg">
				<img src="https://ak-d.tripcdn.com/images/01013120003uuicgh8950.png" width="280px" height="200px">
				<div>강릉</div>
			</div>
			<div class="localimg">
				<img src="https://ak-d.tripcdn.com/images/01013120003uuicgh8950.png" width="280px" height="200px">
				<div>서울</div>
			</div>
			<div class="localimg"><img src="https://ak-d.tripcdn.com/images/01013120003uuicgh8950.png" width="280px" height="200px">
				<div>부산</div>
			</div>
			<div class="localimg"><img src="https://ak-d.tripcdn.com/images/01013120003uuicgh8950.png" width="280px" height="200px">
				<div>제주</div>
			</div>
		</div>
	</article>
	<jsp:include page="../overlap/footer.jsp"/>
	</form>
</body>
</html>