<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.util.ArrayList"%>    
<%@ page import="travel_package.MateController" %>
<%@ page import="travel_package.MateDTO" %>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<meta charset="utf-8">
	<link href="https://fonts.googleapis.com/css2?family=Cairo&family=Indie+Flower&family=Koulen&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="../css/style.css" />
	<link rel="stylesheet" type="text/css" href="../css/header_footer.css">
	<link type="text/css" rel="stylesheet" href="../css/responsive-tabs.css" />
    <link type="text/css" rel="stylesheet" href="../css/style.css" />
    <link type="text/css" rel="stylesheet" href="../css/travel_mate_recruit_detail.css" />
    
</head>
<style>
	 #modal1 > *{
	      padding: 0px;
	      margin: 0px;
	      box-sizing: border-box;
    }
    
    #modal1{
		  background-color: rgba(0, 0, 0, 0.4);   	
	      display : none;
	      z-index : 999;
	      position:absolute;
	      left:0;
	      width:100%;
	      height:101%;
    }
    #modal1>#content1{
      width:500px;
      height:fit-content;
      margin:100px auto;
      padding:40px;
      top: 250px;
      position: relative;
      border-radius: 2px;
      background-color:#fff;
      box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
    }
    .modalheader{
		  font-size: 20pt;
		  font-weight: bold;
		  margin-bottom: 20px;
		  text-align: center;
	}
	.modalsection{
		  font-size: 15pt;
		  font-weight: bold;
		  margin-bottom: 10px;
	}
	header{
		text-align: center;
		font-size: 15pt;
		font-weight: bold;
		margin-bottom: 10px;
	}
	.pnbox{
		width: 300px;
		height: 30px;
		padding: 10px;
		margin: 10px auto;
	}
	.pn{
		float: left;
	}
	.buttonbox2{
		width: 166px;
		height: 25px;
		margin: 10px auto;
	}
	.buttonbox2 input{
		width: 80px;
		height: 25px;
		border-style: none;
		border-radius: 3px;
	}
	.people{
		width: 300px;
		height: 30px;
		margin: 0 auto;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<body>
	<form action="travel_mate_apply.travel">
<%		String mb_id = (String)session.getAttribute("mb_id"); 
		MateController user = new MateController();
		String travelmateNum= request.getParameter("num");
		ArrayList<MateDTO> customer2= user.detail(travelmateNum);
%>
	<div id='modal1'>
	  <div id='content1'>
	  	<header>?????? ????????? ??????</header>
	  	<div class="pnbox">
	  	<div class="pn">????????????:&nbsp;</div>
	  		<input type="text" placeholder="????????? ??????????????????." name="pnNum">
			</div>
			<div class="people">????????????: 
				<select name="travelmateMember">
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				</select>???
			</div>
	  		<input type="hidden" value="<%=mb_id%>" name="mb_id">
	  		<input type="hidden" value="<%=customer2.get(0).getTravelmateNum()%>" name="mate_num">
	  	<div class="buttonbox2">
	  		<input type="button" value="??????" onclick="back()" style="background: #CC3D3D;color: white;">
	  		<input type="submit" value="??????" style="background: #030066; color: white;">
	  	</div>
	  </div>
	 </div>	
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
<section>
		<%
			
				out.println("<div class='top'><div class='title'><div class='toptitle'>"+customer2.get(0).getTravelmateTitle()+"</div>");
				out.println("<div class='writer1'>?????????:"+customer2.get(0).getId()+"</div>");
				out.println("<div class='writer2'>"+customer2.get(0).getTravelmateDate()+"</div>");
				out.println("</div>");
				out.println("</div>");
				out.println("<div class='nav'><div class='destination'>????????????:"+customer2.get(0).getDestination()+"</div>");
				out.println("<div class='startdate'>??????????????????:"+customer2.get(0).getDepartureDate()+"~"+customer2.get(0).getArriveDate()+"</div>");
				out.println("<div class='reservation'>?????????????????????: "+customer2.get(0).getReservationstatus()+"</div>");
				out.println("</div>");
				out.println("<article class='maincontents'>"+customer2.get(0).getTravelmateContent()+"</article>");
		%>
<div class="buttonbox">
		<%
		if(mb_id == null){	
	}else if(customer2.get(0).getId().equals(mb_id)){
		out.println("<a href='travel_mate_update.jsp?num="+customer2.get(0).getTravelmateNum()+"'><input class='updatebutton' type='button' value='??? ??????'></a>");
		out.println("<input class='deletebutton' type='button' value='??? ??????' onclick='again()'>");
	}else if(!customer2.get(0).getId().equals(mb_id)){
		out.println("<input class='recruitbutton' type='button' value='??????????????? ??????' onclick='apply()'>");
	}
	%>
</div>
<script>
	function apply(){
		  var modal1 = document.getElementById('modal1');
		  modal1.style.display = 'block';
	}
	function again(){
		if(!confirm('??????????????? ???????????? ????????????. \n????????? ?????????????????????????')){		
		}else{
			location.href="travel_mate_delete.jsp?travelmateNum="+<%=customer2.get(0).getTravelmateNum()%>;
		
		}
	}
	  function back(){
		  modal1.style.display = 'none';
	  }

</script>
</section>
	<jsp:include page="../overlap/footer.jsp"/>
	</form>
</body>
</html>