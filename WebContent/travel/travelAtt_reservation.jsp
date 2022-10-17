<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ page import="java.util.*"%>   
<script src="http://use.fontawesome.com/releases/v6.1.2/js/all.js"></script>  
    <%
    String att= request.getParameter("att");
    String adult = request.getParameter("adult");
    String student = request.getParameter("student");
    String attnum = request.getParameter("attnum");
    String id=(String)session.getAttribute("mb_id");
    %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="../css/header_footer.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<title>Insert title here</title>	
</head>
<style>
	*{
		box-sizing:border-box;
	}
	.mainframe{
		width: 1200px;
		height: fit-content;
		margin: 0 auto;
	}
	.head{
		width: 900px;
		height: 90px;
		padding: 25px 0 0 0;
		font-size: 27pt;
		font-weight: bold;
	}
	.date{
		width: 900px;
		height: 30px;
		font-size: 15pt;
		border-bottom: 2px gray dotted;
	}
	section{
		margin-top: 10px;
		width: 900px;
		height: 650px;
	}
	.adult_ticket{
		width: 900px;
		height: 150px;
		border-radius: 5px;	
		background-color: rgba(234, 234, 234, 0.4);
	}
	.adulttitle{
		font-size: 17pt;
		font-weight: bold;
		padding: 15px 0 0 10px;
	}
	.adultinfo{
		padding: 0 0 0 10px;
	}
	.infobox{
		padding: 0 0 0 14px;
	}
	.student_ticket{
		width: 900px;
		height: 150px;
		margin-top: 10px;
		border-radius: 5px;	
		background-color: rgba(234, 234, 234, 0.4);
	}
	.studenttitle{
		font-size: 17pt;
		font-weight: bold;
		padding: 15px 0 0 10px;
	}
	.studentinfo{
		padding: 0 0 0 10px;
	}
	.customerinfo{
		width: 900px;
		height: 200px;
		margin-top: 10px;
		border-radius: 5px;	
		background-color: rgba(234, 234, 234, 0.4);
	}
	.infotitle{
		font-size: 17pt;
		font-weight: bold;
		padding: 15px 0 0 10px;
	}
	.price{
		margin-top: -5px;
		float: right;
	}
	.option_wr1{
		width: 230px;
		height: 50px;
		font-size: 20pt;
		margin-top: 30px;
		float: right;
	}
	#optionSel{
		width: 230px;
		height: 40px;
	}
	#optionSel input{
		border-radius:50px;
		border-style: none;
		
	}
	#result1, #result2{
		float: right;
		margin:-5px 10px 0 10px;
	}
	.finalprice{
		float:right;
		position: absolute;
		width: 290px;
		height: 200px;
		border-radius: 5px;	
		background-color: rgba(234, 234, 234, 0.4);
		top:278px;
		left: 1260px;
	}
	.info{
		width: 260px;
		height: 30px;
		border-bottom: 2px black dotted;
		margin: 0 auto;
	}
	.adultprice_info{
		width: 260px;
		height: 30px;
		margin: 10px auto 0 auto;
	}
	.studentprice_info{
		width: 260px;
		height: 30px;
		border-bottom: 2px black dotted;
		margin: 5px auto 10px auto;
	}
	.totalprice{
		width: 260px;
		height: 30px;
		margin: 10px auto 0 auto;
		font-size: 20pt;
		text-align: right;
		border-style:none;
		outline: none;
		font-weight: bold;
		background-color: rgba(0,0,0,0);
	}
	.pn{
		width: 320px;
		height: 40px;
		font-size: 14px;
		padding-left: 10px;
		border: #D5D5D5 1px solid;
		border-radius: 5px;
	}
	.pnbox{
		width: 320px;
		height: 50px;
		float: left;
		margin: 20px 20px 20px 100px;
	}
	select{
		border: #D5D5D5 1px solid; 
		height: 40px; 
		border-radius: 5px; 
		width: 125px; 
	}
	.buttonbox{
		width: 290px;
		height: 25px;
		margin: 10px auto;
	}
	.buttonbox input{
		width: 290px;
		height: 40px;
		border-radius: 3px;
		border-style: none;
		font-size: 17pt;
		background-color: #808080;
	}
</style>
<script>
function count(type)  {
	//결과를 표시할 element
	const resultElement1 = document.getElementById('result1');
	const resultElement2 = document.getElementById('result2');
	const adultcount = document.getElementById('adult');
	const adultcount2 = document.getElementById('adult2');
	const totalprice = document.getElementById('total');
	
	var number1 = resultElement1.innerText;
	var number2 = resultElement2.innerText;
	  
	// 더하기/빼기
	if(type === 'plus1' && number1<99) {
		number1 = parseInt(number1) + 1;
	} else if(type === 'minus1' && number1>1)  { 
		number1 = parseInt(number1) - 1;
	}
	resultElement1.innerText = number1;
	adultcount.innerText= number1;
	if(type === 'plus2' && number1<99) {
		number2 = parseInt(number2) + 1;
	} else if(type === 'minus2' && number2>0)  { 
		number2 = parseInt(number2) - 1;
	}
	resultElement2.innerText = number2;
	adultcount2.innerText= number2;
	
	var total= (number1*<%=adult%>)+(number2*<%=student%>);
	var resultprice = total.toLocaleString();
	
	document.getElementsByClassName('totalprice')[0].value = resultprice;
}

function pay(){
	const resultElement1 = document.getElementById('result1');
	const resultElement2 = document.getElementById('result2');
	var number1 = resultElement1.innerText;
	var number2 = resultElement2.innerText;
 	const pn = document.getElementById('phone').value; 
	
	 if(pn.length == 11){ 
	 	location.href="AttReservation.trl?command=attreservation&adult="+number1+"&student="+number2+"&attnum=<%=attnum%>&id=<%=id%>"; 
	 alert(<%=attnum%>);
	}else{
		alert("연락처를 작성해주세요.");
	} 
	
}
</script>
<body>
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
	<div class="mainframe">
		<div class="head">
			<%=att%>&nbsp;입장권
		</div>
		<div class="date">
			~2022년 12월 31일 기간 유효(현지 시간)
		</div>
		<section>
		<div class="adult_ticket">
			<div class="adulttitle">성인 입장권</div>
			<div class="adultinfo"><i class="fa-regular fa-user"></i>&nbsp;&nbsp;만 18세 이상</div> 
			<div class="infobox"><i class="fa-solid fa-info"></i>&nbsp;&nbsp;언제든지 취소 가능</div>
			<div class="option_wr1">
				<div id="optionSel">
					<i class="fa-solid fa-circle-plus" onclick='count("plus1")' style= "float:right;color: #808080;margin-right:5px;"></i>
					<div id='result1'>1</div>	
					<i class="fa-solid fa-circle-minus" onclick='count("minus1")' style="float: right;color: #808080;"></i>
				<div class="price">
					<fmt:formatNumber value="<%=adult%>" groupingUsed="true"/>원&nbsp;&nbsp;
				</div>
				</div>
			</div>
		</div>
		<div class="student_ticket">
			<div class="studenttitle">학생 입장권</div>
			<div class="studentinfo"><i class="fa-regular fa-user"></i>&nbsp;만 7세 ~ 만 18세</div>
			<div class="infobox"><i class="fa-solid fa-info"></i>&nbsp;&nbsp;언제든지 취소 가능</div>
			<div class="option_wr1">
				<div id="optionSel">
					<i class="fa-solid fa-circle-plus" onclick='count("plus2")' style="float: right;color: #808080;margin-right:5px;"></i>
					<div id='result2'>0</div>	
					<i class="fa-solid fa-circle-minus" onclick='count("minus2")' style="float: right;color:#808080;"></i>
				<div class="price">
					<fmt:formatNumber value="<%=student%>" groupingUsed="true"/>원&nbsp;&nbsp;
				</div>
				</div>
			</div>
		</div>
		<div class="customerinfo">
			<div class="infotitle">연락처 정보</div>
			<div style="font-size:13pt;margin:20px 0 0 100px;">휴대폰 연락처</div>
			<div class="pnbox" style="width: 400px;">
			<select id="" name="mb_phonenum1" style="width:100px;">
				<option>선택</option>
				<option value="+1">+1(미국)</option>
				<option value="+81">+81(일본)</option>
				<option value="+82">+82(대한민국)</option>
				<option value="+84">+84(베트남)</option>
				<option value="+86">+86(중국)</option>
			</select>
				<input type="text" placeholder="숫자만 입력해주세요." class="pn" id="phone" name="mb_phonenum2" style="width: 215px;" maxlength="11" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
			</div>
		</div>
		</section>
		<div class="finalprice">
			<div class="info">
				<h3>결제정보</h3>
			</div>
			<div class="adultprice_info">
				성인
				<fmt:formatNumber value="<%=adult%>" groupingUsed="true"/>&nbsp;<i class="fa-solid fa-xmark"></i>
				<span id="adult">1</span>명
			</div>
			<div class="studentprice_info">
				학생
				<fmt:formatNumber value="<%=student%>" groupingUsed="true"/>&nbsp;<i class="fa-solid fa-xmark"></i>
				<span id="adult2">0</span>명
			</div>
			<input class="totalprice" name="totalprice" value='<fmt:formatNumber value='<%=adult%>' groupingUsed="true"/>' readonly>원
			<div class="buttonbox"><input type="button" value="결제하기" onclick="pay()"></div>
			
		</div>
	</div>
	<jsp:include page="../overlap/footer.jsp"/>
</body>
</html>