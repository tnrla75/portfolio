
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ page import="travel_package.RouteDTO" %>
<html>
<head>
<title></title>
<meta charset="utf-8">
<link
	href="https://fonts.googleapis.com/css2?family=Cairo&family=Indie+Flower&family=Koulen&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../css/header_footer.css">
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<style>

.maindiv {
	margin: 30px auto 0 auto;
	width: 1200px;
	height: 1200px;
}

.leftdiv {
	width: 650px;
	margin: 10px;
	height: auto;
	float: left;
	
	
}
.routediv {
	width: 500px;
	height: 600px;
	margin: 10px;
	border: solid 2px black;
	box-sizing: border-box;
	float: right;
	padding: 10px;
}


.titlediv {
	margin-left: 20px;
	width: 500px;
	float: left;
	font-size: 16pt;
}
.btndiv{
	width:100px;
	float: right;
	
	
}
.btndiv > input {
	border-style: none;
	background-color: white;
	width:45px;
	height: 30px;
}
.iddiv {
	width: 550px;
	display: flex;
	margin: 30px;
	
}
.iddiv > input{
	font-size: 12pt
}

.contentdiv {
	width: 650px;
	height: 550px;
	padding:10px;
	margin-top: 20px;
	border-radius: 10px;
	border-style: none;
	background-color: #e7e7e7;
}
</style>
<jsp:useBean id="control" class="travel_package.RouteController">
</jsp:useBean>
<%
	String num = request.getParameter("routeNum");
	ArrayList<RouteDTO> arr = control.routeNumselect(num);
	String mb_id = (String) session.getAttribute("mb_id");
%>
<script>
function removebtn() {
	/* 창을 띄우고 예아니오 물어본후 예누르면 삭제  - 삭제 시 DB까지 이어짐*/
	if(!confirm('삭제하시겠습니까?')){
		/* 취소버튼 */
		alert("취소");
	}else{
		/* 확인버튼 */
		alert("삭제");
		location.href("travel_routeRemove_call.jsp?remove_num="+<%= arr.get(0).getRouteNum() %>);
	}
}
function updatebtn() {
	/* 수정창으로 이동 후 다시 저장가능 */
	if(!confirm('수정하시겠습니까?')){
		/* 취소버튼 */
	}else{
		/* 확인버튼 */
		location.href("travel_routeupdate.jsp?routeNum="+<%= arr.get(0).getRouteNum() %>);
	}
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
			
			<div class="maindiv">
				<div class="leftdiv">
					<div class="titlediv">
						<span>제목 : <%=arr.get(0).getRouteTitle()%></span>
					</div>
					<div class="btndiv">		
						<%
							if (arr.get(0).getId().equals(mb_id)) {
								out.print(
									"<input type='button' value='수정' class='btn' name='update' onclick='updatebtn()'><input type='button' value='삭제' name='remove' class='btn' onclick='removebtn()' style='border-left: 1px solid rgba(0,0,0, 0.3);'>");
							} else {

							}
						%>
					</div>	
									
					<div class="iddiv">
						<span>ID : <%=arr.get(0).getId()%></span>
					</div>
					<div class="contentdiv">
						<%=arr.get(0).getRouteContent()%>
					</div>

				</div>
				<div class="routediv">route</div>
			</div>
			<jsp:include page="../overlap/footer.jsp"/>
	</form>
</body>
</html>