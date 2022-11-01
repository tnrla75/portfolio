<%@page import="vo.Mypage_qna"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.Member_info"%>
<%@page import="vo.Mypage_review"%>
<%@page import="vo.Mypage_travelmateapply"%>
<%@page import="vo.PageInfo"%>

<%
	ArrayList<Mypage_travelmateapply> list1 = (ArrayList<Mypage_travelmateapply>)request.getAttribute("travelmate_apply1");	
	ArrayList<Mypage_travelmateapply> list2 = (ArrayList<Mypage_travelmateapply>)request.getAttribute("travelmate_apply2");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Cairo&family=Indie+Flower&family=Koulen&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../css/header_footer.css">
<script src="http://use.fontawesome.com/releases/v6.1.2/js/all.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>마이 페이지</title>
<style type="text/css">
	#info {
		margin-top: 120px;
		text-align: center;
		font-size: 30pt;
		font-family: 'Poppins', sans-serif;
		letter-spacing: 5px;
	}
	section {
		width: 1200px;
		min-height: 900px;
		height: fit-content;
		margin: 10px auto;
	}
	#infoBox {
		float: left;
		width: 800px;
		height: fit-content;
	}	
	
	#info_title {
		width: 750px;
		height: fit-content;
		margin: 0 auto;
		border-bottom: solid;
	}
	.main{
		width: 750px;
		height: fit-content;
		margin: 0 auto;
	}
	#myapply2{
		margin:10px auto;
		width: 750px;
		border-collapse: collapse;
		text-align: center;
	}
	.reTableLine {
		border-bottom: 1px solid #D5D5D5;
		border-top: 1px solid #D5D5D5;
		text-align: center;
		height: 70px;
	}
	.cancel{
		border-style: none;
		background-color: #000054;
		color: white;
		width: 80px;
		height: 30px;
		border-radius: 3px;
	}
	.truebutton{
		border-style: none;
		background-color: #000054;
		color: white;
		width: 60px;
		height: 30px;
		border-radius: 3px;
	}
	.falsebutton{
		border-style: none;
		background-color: #CC3D3D;
		color: white;
		width: 60px;
		height: 30px;
		border-radius: 3px;
	}
</style>
</head>
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
		<header id="info">
			<h3>MY PAGE</h3>
		</header>
		<section>
			<jsp:include page="../overlap/myPageMenu.jsp"/>
			<div id="infoBox">
				<div id="info_title">
					<h2>신청받은 여행메이트 </h2>
				</div>	
			
			<div class="main">
				<table  id="myapply2" cellpadding="10px">
					<tr>
						<td>신청자</td>
						<td>글제목</td>
						<td>신청자 전화번호</td>
						<td>신청 인원</td>
						<td>현재상태</td>
						<td>확인</td>
					</tr>
					<% for(int i=0; i<list1.size(); i++) {
						%>
					<tr class="reTableLine">
						<td><%=list1.get(i).getMb_id() %></td>
						<td>
							<span><%=list1.get(i).getTravelmateTitle() %></span>
						</td>
						<td>
							<span><%=list1.get(i).getApply_pnNum() %></span>
						</td>
						<td>
							<span><%=list1.get(i).getApply_member() %>명</span>
						</td>
						<td>
							<span><%=list1.get(i).getStatus() %></span>
						</td>
						<%if(list1.get(i).getStatus().equals("대기")){ %>
						<td>
							<a href="mypage_mateapply_change.mypage?command=applycheck&applynum=<%= list1.get(i).getApply_num() %>&mb_id=<%= mb_id %>&status=수락"><input type="button" value="수락" class="truebutton"></a>
							<a href="mypage_mateapply_change.mypage?command=applycheck&applynum=<%= list1.get(i).getApply_num() %>&mb_id=<%= mb_id %>&status=거절"><input type="button" value="거절" class="falsebutton"></a>
						</td>
						<% }else { %>
						<td></td>
						<% } %>
					</tr>
					<% } %>
				</table>
			</div>
			
				<div id="info_title">
					<h2>내가 신청한 여행메이트 </h2>
				</div>	
			
			<div class="main">
				<table  id="myapply2" cellpadding="10px">
					<tr>
						<td>작성자</td>
						<td>글제목</td>
						<td>현재상태</td>
						<td>확인</td>
					</tr>
					<% for(int i=0; i<list2.size(); i++) {
						%>
					<tr class="reTableLine">
						<td><%=list2.get(i).getId() %></td>
						<td>
							<span><%=list2.get(i).getTravelmateTitle() %></span>
						</td>
						<td>
							<%=list2.get(i).getStatus() %>
						</td>
						<td>
							<a href="mypage_mateapply_cancel.mypage?command=cancel&applynum=<%= list2.get(i).getApply_num() %>&mb_id=<%= mb_id %>"><input type="button" value="신청취소" class="cancel"></a>
						</td>
					</tr>
					<% } %>
				</table>
				
			</div>
			</div>
		</section>
		<jsp:include page="../overlap/footer.jsp"/>
	</form>
</body>
</html>