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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

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
<section>
		<%
			MateController user = new MateController();
				String travelmateNum= request.getParameter("num");
				ArrayList<MateDTO> customer2= user.detail(travelmateNum);
				out.println("<div class='top'><div class='title'><div class='toptitle'>"+customer2.get(0).getTravelmateTitle()+"</div>");
				out.println("<div class='writer1'>작성자:"+customer2.get(0).getId()+"</div>");
				out.println("<div class='writer2'>"+customer2.get(0).getTravelmateDate()+"</div>");
				out.println("</div>");
				out.println("</div>");
				out.println("<div class='nav'><div class='destination'>여행지역:"+customer2.get(0).getDestination()+"</div>");
				out.println("<div class='startdate'>여행예상기간:"+customer2.get(0).getDepartureDate()+"~"+customer2.get(0).getArriveDate()+"</div>");
				out.println("<div class='reservation'>항공권예매여부: "+customer2.get(0).getReservationstatus()+"</div>");
				out.println("</div>");
				out.println("<article class='maincontents'>"+customer2.get(0).getTravelmateContent()+"</article>");
		%>
<div class="buttonbox">
	<%
	if(mb_id == null){	
	}else if(customer2.get(0).getId().equals(mb_id)){
		out.println("<a href='travel_mate_update.jsp?num="+customer2.get(0).getTravelmateNum()+"'><input class='updatebutton' type='button' value='글 수정'></a>");
		out.println("<input class='deletebutton' type='button' value='글 삭제' onclick='again()'>");
	}else if(!customer2.get(0).getId().equals(mb_id)){
		out.println("<input class='recruitbutton' type='button' value='여행메이트 신청'>");
	}
	%>
</div>
<script>
	function again(){
		if(!confirm('삭제하시면 복구할수 없습니다. \n정말로 삭제하시겠습니까?')){		
			alert('<%=customer2.get(0).getTravelmateNum()%>');
		}else{
			alert(<%=customer2.get(0).getTravelmateNum()%>);
			location.href="travel_mate_delete.jsp?travelmateNum="+<%=customer2.get(0).getTravelmateNum()%>;
		
		}
	}
</script>
</section>
	<jsp:include page="../overlap/footer.jsp"/>
	</form>
</body>
</html>