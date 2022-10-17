<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/header_footer.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<title>Insert title here</title>
<%
String[] lastname= request.getParameterValues("lastname");
String[] firstname= request.getParameterValues("firstname");
String totalprice = request.getParameter("totalprice");
String[] box1 = request.getParameterValues("box1");
String[] box2 = request.getParameterValues("box2");
String ticketNum1 = request.getParameter("ticketNum1");
String ticketNum2 = request.getParameter("ticketNum2");

for( int i =0; i<box1.length; i++){
	System.out.println(box1[i] + " / "+ box2[i]);
}
System.out.println("box1 길이 : "+box1.length);
System.out.println(box2[0]);

%>
</head>
<style>
	#mb_name{
		width:900px;
		border-style:solid;
		margin:0 auto;
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
	padding-top: 70px;
	position: relative;
}



.tab_label {
  font-weight: 700;
  font-size: 18px;
  display: block;
  float: left;
  width: 44%;
  padding: 1.5em;
  color: black;
  cursor: pointer;
  text-decoration: none;
  text-align: center;
  background: white;
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
  color: #999;
  border-bottom: 2px solid #f0f0f0;
}

.tab_container1 [id^="tab"]:checked + label,
.tab_container2 [id^="tab"]:checked + label,
.tab_container3 [id^="tab"]:checked + label,
.tab_container4 [id^="tab"]:checked + label,
.tab_container5 [id^="tab"]:checked + label {
  background: #fff;
  box-shadow: inset 0 3px #0CE;
  background-color: #0CE;
  color: white;
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
	height: 150px;
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
	border: 1px solid #ccc;
	width: 250px;
	height: 150px;
	position: absolute;
	overflow: hidden;
	line-height: 50px;
	text-align: left;
	font-size: 10pt;
	left: 0;
}
.tab-content input:checked + span {
	background: #ccf;
	border-color: #ccf;
}
.tab-content{
	width: 900px;
	border-style: solid;
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
        	height: 800px;
        }
        .bagdiv input, .bagdiv section{
        	clear: both;
			padding-top: 10px;
			display: none;
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
});
</script>
<body>
	<form name="myform" action="flight_seat.do?command=flight_end" method="post">
<% for(int i = 0; i<lastname.length; i++){ %>
<span>	<%= box1[i] %><%= box2[i] %><%= lastname[i]%><%= firstname[i]%><%= ticketNum1 %><%= ticketNum2 %></span><br>
	<%} %>
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
<div id="mb_name">
	<% for(int i =0; i<lastname.length; i++){ %>

		<label class="container">
		  <input type="radio" class="choicebtn" name="choicebtn" value="<%=i%>">
		  <span class="checkmark">
		  	<input type="hidden" value="<%= lastname[i] %>" name="lastname">
			<input type="hidden" value="<%= firstname[i] %>" name="firstname">
			<input type="hidden" value="<%= box1[i] %>" name="box1">
			<input type="hidden" value="<%= box2[i] %>" name="box2">
		    <h4> &nbsp;<%=i %> <%= lastname[i] %><%= firstname[i] %></h4>
		  </span>
		</label>

	<%} %>
	<input type="hidden" value="<%= ticketNum1 %>" name="ticketNum1">
	<input type="hidden" value="<%= ticketNum2 %>" name="ticketNum2">
</div>
	<div id="footerprice">
		<div id="textdiv">
			<div class="footer_amount">
				<input type="hidden" value="" id="hiddenprice">
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
				<h3>가는 편 위탁 수하물11111111111</h3>
				<table>
					<tr>
						<td><label><input type="radio" name="select1" /><span>0kg<br><br>30,000원</span></label></td>
						<td><label><input type="radio" name="select1" /><span>15kg<br><br>60,000원</span></label></td>
						<td><label><input type="radio" name="select1" /><span>20kg<br><br>90,000원</span></label></td>
		     		</tr>
					<tr>
						<td><label><input type="radio" name="select1" /><span>25kg<br><br>120,000원</span></label></td>
						<td><label><input type="radio" name="select1" /><span>30kg<br><br>150,000원</span></label></td>
						<td><label><input type="radio" name="select1" /><span>35kg<br><br>180,000원</span></label></td>
		     		</tr>
				</table>
			</section>
			<section id="content2" class="tab-content">
				<h3>오는 편 위탁 수하물2222222222</h3>
		   		<table>
					<tr>
						<td><label><input type="radio" name="select2" /><span>0kg<br><br>30,000원</span></label></td>
						<td><label><input type="radio" name="select2" /><span>15kg<br><br>60,000원</span></label></td>
						<td><label><input type="radio" name="select2" /><span>20kg<br><br>90,000원</span></label></td>
		     		</tr>
					<tr>
						<td><label><input type="radio" name="select2" /><span>25kg<br><br>120,000원</span></label></td>
						<td><label><input type="radio" name="select2" /><span>30kg<br><br>150,000원</span></label></td>
						<td><label><input type="radio" name="select2" /><span>35kg<br><br>180,000원</span></label></td>
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
				<h3>가는 편 위탁 수하물3333333333</h3>
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
				<h3>오는 편 위탁 수하물4444444444</h3>
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
				<h3>가는 편 위탁 수하물55</h3>
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
				<h3>오는 편 위탁 수하물666</h3>
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
				<h3>가는 편 위탁 수하물77</h3>
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
				<h3>오는 편 위탁 수하물4888888</h3>
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
				<h3>가는 편 위탁 수하물9999</h3>
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
				<h3>오는 편 위탁 수하물5101010</h3>
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
	</form>
</body>
</html>
