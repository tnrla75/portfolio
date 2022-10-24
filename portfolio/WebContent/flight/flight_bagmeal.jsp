<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/header_footer.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

	<script src="http://use.fontawesome.com/releases/v6.1.2/js/all.js"></script>
<title>Insert title here</title>
<%
String[] lastname= request.getParameterValues("lastname");
String[] firstname= request.getParameterValues("firstname");
String totalprice = request.getParameter("totalprice");
String[] box1 = request.getParameterValues("box1");
String[] box2 = request.getParameterValues("box2");
String ticketNum1 = request.getParameter("ticketNum1");
String ticketNum2 = request.getParameter("ticketNum2");


System.out.println(totalprice);

%>
</head>
<style>
	#mb_name{
		width:900px;
		margin:15px auto;
		display: flex;
		flex-wrap: wrap;	
	}
	.container {
	  display: flex;
	  position: relative;
	  cursor: pointer;
	  font-size: 16px;
	  width:240px;
	  height:50px;
	  border-radius: 10px;
	  -webkit-user-select: none;
	  -moz-user-select: none;
	  -ms-user-select: none;
	  user-select: none;
	  line-height: 5px;
	  margin: 10px 27px;
	  box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
	}
	.choicebtn{

	}
	.container input {
	  position: absolute;
	  opacity: 0;
	  cursor: pointer;
	}
	.checkmark {
	  display: flex;
	  flex-direction: column;
	  background: #fff;
	  min-width: 150px;
	  border-radius:8px;
	}
	
	.container:hover input ~ .checkmark {
	}
	.container input:checked ~ .checkmark {
	  border: rgba(211, 10, 20, .7) 2px solid;
	  -webkit-box-shadow: 0px 3px 6px 2px rgba(0,0,0,0.16);
	  -moz-box-shadow: 0px 3px 6px 2px rgba(0,0,0,0.16);
	  box-shadow: 0px 3px 6px 2px rgba(0,0,0,0.16);
	  color: #002266;
	  width: 240px;
	}


/*Fun begins*/
.tab_container1, .tab_container2,
.tab_container3, .tab_container4,
.tab_container5, .tab_container6,
.tab_container7, .tab_container8,
.tab_container9, .tab_container10{
	width: 900px;
	margin: 0 auto;
	position: relative;
}



.tab_label {
  font-weight: 700;
  font-size: 18px;
  display: block;
  float: left;
  width: 42.8%;
  padding: 1.5em;
  color: black;
  cursor: pointer;
  text-decoration: none;
  text-align: center;
  background: white;
  font-size: 16pt;
}

#tab1:checked ~ #content1,
#tab2:checked ~ #content2,
#tab3:checked ~ #content3,
#tab4:checked ~ #content4,
#tab5:checked ~ #content5,
#tab6:checked ~ #content6,
#tab7:checked ~ #content7,
#tab8:checked ~ #content8,
#tab9:checked ~ #content9,
#tab10:checked ~ #content10 {
 	display: block;
    padding: 20px;
    background: #fff;
    color: black;
    border: 1px solid #000063;
    border-radius: 0 0 10px 10px;
  
}

.tab_container1 [id^="tab"]:checked + label,
.tab_container2 [id^="tab"]:checked + label,
.tab_container3 [id^="tab"]:checked + label,
.tab_container4 [id^="tab"]:checked + label,
.tab_container5 [id^="tab"]:checked + label {
	background: #fff;
    background-color: rgba(211, 10, 20, .7);
    color: white;
    border-bottom: 4px solid black;
    font-size: 16pt;
}

/*Media query*/
@media only screen and (max-width: 900px) {
  label span {
    display: none;
  }
  
  .tab_container {
    width: 98%;
  }
}


.tab-content label {
	margin: 10px;
	height: 120px;
	width: 250px;
	display: block;
	padding: 5px;
	position: relative;
	padding-left: 20px;
}
.tab-content label input {
	display: none;
}
.tab-content label span {
	border: 4px solid #ccc;
    width: 210px;
    height: 100px;
    position: absolute;
    overflow: hidden;
    line-height: 30px;
    text-align: left;
    font-size: 12pt;
    color: black;
    left: 0;
    padding-left: 20px;
    border-radius: 10px;
    padding-top: 10px;
}
.tab-content input:checked + span {
	background: white;
	border: rgba(211, 10, 20, .7) 4px solid;
	border-radius:10px;
}
.tab-content{
	width: 860px;
	box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
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
			outline: none;
        }
        .footer_amount > .span3{
        	height: 60px;

			line-height: 60px;
			font-size: 14pt;
			font-weight: bold;
			color: #002266;
			margin-right: 20px;
			margin-left: -15px;
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
        .bagdiv{
        	height: 530px;
        }
        .bagdiv input, .bagdiv section{
        	clear: both;
			padding-top: 10px;
			display: none;
        }
        #headtext{
        	width:900px;
        	margin: 0 auto;
        	font-size: 18pt;
        	font-weight: bold;
        	line-height:100px;
        	height: 70px;
        }
        #footertext{
        	margin: 0 auto 50px auto;
		    height: 150px;
		    width: 900px;
		    font-size: 12pt;
		    color: #ABABAB;
		    font-weight: bold;
		    line-height: 50px;
        }
</style>
<script>

$(document).ready(function() {
	$('.choicebtn:first').prop("checked", true);
	$('.tab_container1').show();
	$('.tab_container2').hide();
	$('.tab_container3').hide();
	$('.tab_container4').hide();
	$('.tab_container5').hide();
	
	$("input:radio[name='choicebtn']").change(function(){
		var aa = $("input:radio[name='choicebtn']:checked").val();
		if(aa == 0){
			$('.tab_container1').show();
			$('.tab_container2').hide();
			$('.tab_container3').hide();
			$('.tab_container4').hide();
			$('.tab_container5').hide();
		}
		else if(aa == 1){
			$('.tab_container1').hide();
			$('.tab_container2').show();
			$('.tab_container3').hide();
			$('.tab_container4').hide();
			$('.tab_container5').hide();
		}
		else if(aa == 2){
			$('.tab_container1').hide();
			$('.tab_container2').hide();
			$('.tab_container3').show();
			$('.tab_container4').hide();
			$('.tab_container5').hide();
		}
		else if(aa == 3){
			$('.tab_container1').hide();
			$('.tab_container2').hide();
			$('.tab_container3').hide();
			$('.tab_container4').show();
			$('.tab_container5').hide();
		}
		else if(aa == 4){
			$('.tab_container1').hide();
			$('.tab_container2').hide();
			$('.tab_container3').hide();
			$('.tab_container4').hide();
			$('.tab_container5').show();
		}
	});
	$("input:radio[name='select1']").change(function(){
		var price = 30000;
		for(var i = 0; i<6; i++){
			if($("input:radio[name='select1']:checked").val() == (price*(i+1))){
				var result = <%= request.getParameter("hiddenprice") %> + (price*(i+1));
				$("input[class='span2']").val(result.toLocaleString());
			}
		}
	});

	
	$("#myform").submit(function(){
		if(!($("input:radio[name='select1']").is(':checked') && $("input:radio[name='select2']").is(':checked'))){
			alert("수화물 무게를 선택해주세요");
			return false;
		}
		return true;
	});
});


</script>
<body>
	<form id="myform" name="myform" action="flight_seat.do?command=flight_end" method="post">

	<%
	String id = (String)session.getAttribute("mb_id"); 
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
<div id="headtext">
	추가 수하물로 마음까지 넉넉한 여행
</div>
<div id="mb_name">
	
	<% for(int i =0; i<lastname.length; i++){ %>
		<label class="container">
		  <input type="radio" class="choicebtn" name="choicebtn" value="<%=i%>">
		  <span class="checkmark">
		  	<input type="hidden" value="<%= lastname[i] %>" name="lastname">
			<input type="hidden" value="<%= firstname[i] %>" name="firstname">
			<input type="hidden" value="<%= box1[i] %>" name="box1">
			<input type="hidden" value="<%= box2[i] %>" name="box2">
		    <h4> &nbsp;<%=i+1 %> <%= lastname[i] %> &nbsp; <%= firstname[i] %></h4>
		  </span>
		</label>

	<%} %>
	<input type="hidden" value="<%= ticketNum1 %>" name="ticketNum1">
	<input type="hidden" value="<%= ticketNum2 %>" name="ticketNum2">
</div>
	<div id="footerprice">
		<div id="textdiv">
			<div class="footer_amount">
				<input type="hidden" value="<%= request.getParameter("hiddenprice") %>" id="hiddenprice">
				<span class="span1">예상 결제 금액</span>
				<input type="submit" class="footer_backchoice" value="예약하기">
				<span class="span3">원</span>
				<input class="span2" name="totalprice" value='<%= totalprice %>' readonly>
			</div>
		</div>
	</div>
	<div class="bagdiv">
<!-- ---------------------  11111111111111111111-->
		<div class="tab_container1">
			<input id="tab1" type="radio" name="tabs1" checked>
			<label for="tab1" class="tab_label"><span>가는편</span></label>

			<input id="tab2" type="radio" name="tabs1">
			<label for="tab2" class="tab_label"><span>오는편</span></label>
			<section id="content1" class="tab-content">
				<h3><img src="../img/flight/travel-bag.png" style=" width: 50px; height: 35px;">1 . 가는 편 위탁 수하물</h3>
				<table>
					<tr>
						<td><label><input type="radio" name="select1" value="30000"/><span>0kg<br><br>30,000원</span></label></td>
						<td><label><input type="radio" name="select1" value="60000" /><span>15kg<br><br>60,000원</span></label></td>
						<td><label><input type="radio" name="select1" value="90000" /><span>20kg<br><br>90,000원</span></label></td>
		     		</tr>
					<tr>
						<td><label><input type="radio" name="select1" value="120000" /><span>25kg<br><br>120,000원</span></label></td>
						<td><label><input type="radio" name="select1" value="150000" /><span>30kg<br><br>150,000원</span></label></td>
						<td><label><input type="radio" name="select1" value="180000" /><span>35kg<br><br>180,000원</span></label></td>
		     		</tr>
				</table>
			</section>
			<section id="content2" class="tab-content">
				<h3><img src="../img/flight/travel-bag.png" style=" width: 50px; height: 35px;">1 . 오는 편 위탁 수하물</h3>
		   		<table>
					<tr>
						<td><label><input type="radio" name="select2" value="30000" /><span>0kg<br><br>30,000원</span></label></td>
						<td><label><input type="radio" name="select2" value="60000" /><span>15kg<br><br>60,000원</span></label></td>
						<td><label><input type="radio" name="select2" value="90000" /><span>20kg<br><br>90,000원</span></label></td>
		     		</tr>
					<tr>
						<td><label><input type="radio" name="select2" value="120000" /><span>25kg<br><br>120,000원</span></label></td>
						<td><label><input type="radio" name="select2" value="150000" /><span>30kg<br><br>150,000원</span></label></td>
						<td><label><input type="radio" name="select2" value="180000" /><span>35kg<br><br>180,000원</span></label></td>
		      		</tr>
				</table>
			</section>
		</div>
	<!-- ---------------------  222222222222222222-->
		<div class="tab_container2">
			<input id="tab3" type="radio" name="tabs2" checked>
			<label for="tab3" class="tab_label"><span>가는편</span></label>

			<input id="tab4" type="radio" name="tabs2">
			<label for="tab4" class="tab_label"><span>오는편</span></label>
			<section id="content3" class="tab-content">
				<h3><img src="../img/flight/travel-bag.png" style=" width: 50px; height: 35px;">2 . 가는 편 위탁 수하물</h3>
				<table>
					<tr>
						<td><label><input type="radio" name="select3" /><span>0kg<br><br>30,000원</span></label></td>
						<td><label><input type="radio" name="select3" /><span>15kg<br><br>60,000원</span></label></td>
						<td><label><input type="radio" name="select3" /><span>20kg<br><br>90,000원</span></label></td>
		     		</tr>
					<tr>
						<td><label><input type="radio" name="select3" /><span>25kg<br><br>120,000원</span></label></td>
						<td><label><input type="radio" name="select3" /><span>30kg<br><br>150,000원</span></label></td>
						<td><label><input type="radio" name="select3" /><span>35kg<br><br>180,000원</span></label></td>
		     		</tr>
				</table>
			</section>
			<section id="content4" class="tab-content">
				<h3><img src="../img/flight/travel-bag.png" style=" width: 50px; height: 35px;">2 . 오는 편 위탁 수하물</h3>
		   		<table>
					<tr>
						<td><label><input type="radio" name="select4" /><span>0kg<br><br>30,000원</span></label></td>
						<td><label><input type="radio" name="select4" /><span>15kg<br><br>60,000원</span></label></td>
						<td><label><input type="radio" name="select4" /><span>20kg<br><br>90,000원</span></label></td>
		     		</tr>
					<tr>
						<td><label><input type="radio" name="select4" /><span>25kg<br><br>120,000원</span></label></td>
						<td><label><input type="radio" name="select4" /><span>30kg<br><br>150,000원</span></label></td>
						<td><label><input type="radio" name="select4" /><span>35kg<br><br>180,000원</span></label></td>
		      		</tr>
				</table>
			</section>
		</div>
		<!-- ---------------------33333333333333333333333 -->
		<div class="tab_container3">
			<input id="tab5" type="radio" name="tabs3" checked>
			<label for="tab5" class="tab_label"><span>가는편</span></label>

			<input id="tab6" type="radio" name="tabs3">
			<label for="tab6" class="tab_label"><span>오는편</span></label>
			
			<section id="content5" class="tab-content">
				<h3><img src="../img/flight/travel-bag.png" style=" width: 50px; height: 35px;">3 . 가는 편 위탁 수하물</h3>
				<table>
					<tr>
						<td><label><input type="radio" name="select5" /><span>0kg<br><br>30,000원</span></label></td>
						<td><label><input type="radio" name="select5" /><span>15kg<br><br>60,000원</span></label></td>
						<td><label><input type="radio" name="select5" /><span>20kg<br><br>90,000원</span></label></td>
		     		</tr>
					<tr>
						<td><label><input type="radio" name="select5" /><span>25kg<br><br>120,000원</span></label></td>
						<td><label><input type="radio" name="select5" /><span>30kg<br><br>150,000원</span></label></td>
						<td><label><input type="radio" name="select5" /><span>35kg<br><br>180,000원</span></label></td>
		     		</tr>
				</table>
			</section>
			<section id="content6" class="tab-content">
				<h3><img src="../img/flight/travel-bag.png" style=" width: 50px; height: 35px;">3 . 오는 편 위탁 수하물</h3>
		   		<table>
					<tr>
						<td><label><input type="radio" name="select6" /><span>0kg<br><br>30,000원</span></label></td>
						<td><label><input type="radio" name="select6" /><span>15kg<br><br>60,000원</span></label></td>
						<td><label><input type="radio" name="select6" /><span>20kg<br><br>90,000원</span></label></td>
		     		</tr>
					<tr>
						<td><label><input type="radio" name="select6" /><span>25kg<br><br>120,000원</span></label></td>
						<td><label><input type="radio" name="select6" /><span>30kg<br><br>150,000원</span></label></td>
						<td><label><input type="radio" name="select6" /><span>35kg<br><br>180,000원</span></label></td>
		      		</tr>
				</table>
			</section>
		</div>
	<div class="tab_container4">
			<input id="tab7" type="radio" name="tabs4" checked>
			<label for="tab7" class="tab_label"><span>가는편</span></label>

			<input id="tab8" type="radio" name="tabs4">
			<label for="tab8" class="tab_label"><span>오는편</span></label>
			<section id="content7" class="tab-content">
				<h3><img src="../img/flight/travel-bag.png" style=" width: 50px; height: 35px;">4 . 가는 편 위탁 수하물</h3>
				<table>
					<tr>
						<td><label><input type="radio" name="select7" /><span>0kg<br><br>30,000원</span></label></td>
						<td><label><input type="radio" name="select7" /><span>15kg<br><br>60,000원</span></label></td>
						<td><label><input type="radio" name="select7" /><span>20kg<br><br>90,000원</span></label></td>
		     		</tr>
					<tr>
						<td><label><input type="radio" name="select7" /><span>25kg<br><br>120,000원</span></label></td>
						<td><label><input type="radio" name="select7" /><span>30kg<br><br>150,000원</span></label></td>
						<td><label><input type="radio" name="select7" /><span>35kg<br><br>180,000원</span></label></td>
		     		</tr>
				</table>
			</section>
			<section id="content8" class="tab-content">
				<h3><img src="../img/flight/travel-bag.png" style=" width: 50px; height: 35px;">4 . 오는 편 위탁 수하물</h3>
		   		<table>
					<tr>
						<td><label><input type="radio" name="select8" /><span>0kg<br><br>30,000원</span></label></td>
						<td><label><input type="radio" name="select8" /><span>15kg<br><br>60,000원</span></label></td>
						<td><label><input type="radio" name="select8" /><span>20kg<br><br>90,000원</span></label></td>
		     		</tr>
					<tr>
						<td><label><input type="radio" name="select8" /><span>25kg<br><br>120,000원</span></label></td>
						<td><label><input type="radio" name="select8" /><span>30kg<br><br>150,000원</span></label></td>
						<td><label><input type="radio" name="select8" /><span>35kg<br><br>180,000원</span></label></td>
		      		</tr>
				</table>
			</section>
		</div>
	<div class="tab_container5">
			<input id="tab9" type="radio" name="tabs5" checked>
			<label for="tab9" class="tab_label"><span>가는편</span></label>

			<input id="tab10" type="radio" name="tabs5">
			<label for="tab10" class="tab_label"><span>오는편</span></label>
			<section id="content9" class="tab-content">
				<h3><img src="../img/flight/travel-bag.png" style=" width: 50px; height: 35px;">5 . 가는 편 위탁 수하물</h3>
				<table>
					<tr>
						<td><label><input type="radio" name="select9" /><span>0kg<br><br>30,000원</span></label></td>
						<td><label><input type="radio" name="select9" /><span>15kg<br><br>60,000원</span></label></td>
						<td><label><input type="radio" name="select9" /><span>20kg<br><br>90,000원</span></label></td>
		     		</tr>
					<tr>
						<td><label><input type="radio" name="select9" /><span>25kg<br><br>120,000원</span></label></td>
						<td><label><input type="radio" name="select9" /><span>30kg<br><br>150,000원</span></label></td>
						<td><label><input type="radio" name="select9" /><span>35kg<br><br>180,000원</span></label></td>
		     		</tr>
				</table>
			</section>
			<section id="content10" class="tab-content">
				<h3><img src="../img/flight/travel-bag.png" style=" width: 50px; height: 35px;">5 . 오는 편 위탁 수하물</h3>
		   		<table>
					<tr>
						<td><label><input type="radio" name="select10" /><span>0kg<br><br>30,000원</span></label></td>
						<td><label><input type="radio" name="select10" /><span>15kg<br><br>60,000원</span></label></td>
						<td><label><input type="radio" name="select10" /><span>20kg<br><br>90,000원</span></label></td>
		     		</tr>
					<tr>
						<td><label><input type="radio" name="select10" /><span>25kg<br><br>120,000원</span></label></td>
						<td><label><input type="radio" name="select10" /><span>30kg<br><br>150,000원</span></label></td>
						<td><label><input type="radio" name="select10" /><span>35kg<br><br>180,000원</span></label></td>
		      		</tr>
				</table>
			</section>
		</div>
		</div>
		<div id="footertext">
			<i class="fa-regular fa-circle-question"></i>무게 초과 시 초과 수하물 요금이 발생합니다.
		</div>
	</form>
</body>
</html>
