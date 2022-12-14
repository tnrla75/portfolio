<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ page import="java.util.*"%>
	<%@page import="vo.FlightTicketBean"%>
	<%@page import="vo.PageInfo"%>
	<%@ page import="java.text.SimpleDateFormat"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	<%
		ArrayList<FlightTicketBean> ticketBeanList2 = (ArrayList<FlightTicketBean>)request.getAttribute("ticketBeanList2"); 
		String people =request.getParameter("flight_people1");
		String seat = request.getParameter("seatGrade1");
		String totalprice= request.getParameter("totalprice");
		
		PageInfo pageInfo2 = (PageInfo)request.getAttribute("pageInfo2");
		int listCount2=pageInfo2.getListCount();
		int nowPage2=pageInfo2.getPage();
		int maxPage2=pageInfo2.getMaxPage();
		int startPage2=pageInfo2.getStartPage();
		int endPage2=pageInfo2.getEndPage();
		
	%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="../css/header_footer.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script src="http://use.fontawesome.com/releases/v6.1.2/js/all.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
	
	<title></title>
	<style>
		.people {
			width: 120px;
			padding: 5px;
			border-style: solid;
			border-width: 0;
			background: url(../img/icon/people.png);
			background-position: 100px;
			background-size: 15px;
			background-repeat: no-repeat;
			border-color: black;
			-webkit-appearance: none;
			-moz-appearance: none;
			appearance: none;
			position: relative;
			left: 30px;
		}
		#tab-2 {
			position: relative;
			height: 160px;
		}
		#tab-2 h3 {
			position: relative;
			right: 10px;
		}
		.seatGrade {
			width:120px;
			padding:5px;
			border-style: solid;
			border-width: 0;
			background:url(../img/icon/seat.png);
			background-position: 100px;
			background-size: 15px;
			background-repeat: no-repeat;
			border-color: black;
			-webkit-appearance: none;
			-moz-appearance: none;
			appearance : none;
			position: relative;
			left: 30px;
		}
		.seatGrade2 {
			width:150px;
			padding:5px;
			border-style: solid;
			border-width: 0;
			background:url(../img/icon/seat.png);
			background-position: 100px;
			background-size: 15px;
			background-repeat: no-repeat;
			border-color: black;
			-webkit-appearance: none;
			-moz-appearance: none;
			appearance : none;
			position: relative;
			left: 70px;
		}
		.searchBot {
			position: relative;
			left: 20px;
			padding-right: 50px;
		}
		.airplainchoice {
			float: left;
			margin-top: 10px;
		}
		.searchBot div{
			width: 1080px;
			height: 60px;
			border-style: solid;
			border-color: #E7E7E7;
			border-width: 1px;
			position: relative;
			padding-right: 50px;
		}
		.searchBot input {
			height: 40px;
			font-size: 12pt;
			border-style: none;
			background-color: white;
			border-top: 0px;
			border-left: 0px;
			border-right: 0px;
		}
		.departure {
			width: 200px;
			background-position: 5px;
			background-size: 30px;
			background-repeat: no-repeat;
		}
		.arrive {
			width: 200px;
			background-position: 5px;
			background-size: 20px;
			background-repeat: no-repeat;
			position: relative;
			left: 10px;
		}
		#datechoice1 {
			width: 120px;
			position: relative;
			left: 40px;
		}
		#datechoice2 {
			width: 120px;
			position: relative;
			left: 60px;
		}
		#datechoice5 {
			width: 150px;
			position: relative;
			left: 80px;
		}
		.searchicon1 {
			position: relative;
			left: 80px;
			width: 50px;
			height: 40px;
			border-style: none;
			background-color: white;
			background:url(../img/icon/loupe.png);
			background-position: center;
			background-size: 20px;
			background-repeat: no-repeat;
		}
		.searchicon2 {
			position: relative;
			left: 70px;
			width: 50px;
			height: 40px;
			border-style: none;
			background-color: white;
			background:url(../img/icon/loupe.png);
			background-position: center;
			background-size: 20px;
			background-repeat: no-repeat;
		}
		.searchicon3 {
			position: relative;
			left: 120px;
			width: 50px;
			height: 40px;
			border-style: none;
			background-color: white;
			background:url(../img/icon/loupe.png);
			background-position: center;
			background-size: 20px;
			background-repeat: no-repeat;
		}
		.people1 {
			background-image: url(img/icon/people.png);
			background-position: 1px center;
			background-size: 20px;
			background-repeat: no-repeat;
			width: 100px;
			position: relative;
			left: 20px;
			text-align: right;
			/*filter: opacity(0.5) drop-shadow(0 0 0 white);*/
		}
		.people2 {
			background-image: url(img/icon/people.png);
			background-position: 1px center;
			background-size: 20px;
			background-repeat: no-repeat;
			width: 100px;
			position: relative;
			left: 20px;
			text-align: right;
			/*filter: opacity(0.5) drop-shadow(0 0 0 white);*/
		}

		.airplaneDate {
			width: 150px;
			position: relative;
			padding-left: 30px;
			font-size: 10pt;
			left: 40px;
			bottom: 3px;
		}
		.tabset {
			position: relative;
			height: 140px;
		}
		.tab-panels {
			position: relative;
			bottom: 20px;
		}
		.tabset > input[type="radio"] {
			position: absolute;
			left: -200vw;
		}
		.tabset .tab-panel {
			display: none;
		}
		.tabset > input:first-child:checked ~ .tab-panels > .tab-panel:first-child,
		.tabset > input:nth-child(3):checked ~ .tab-panels > .tab-panel:nth-child(2) {
			display: block;
		}
		.tabset > label {
			position: relative;
			display: inline-block;
			padding: 15px 15px 25px;
			border-bottom: 0;
			cursor: pointer;
			font-weight: 600;
		}

		.tabset > label::after {
			content: "";
			position: absolute;
			left: 13px;
			bottom: 10px;
			width: 30px;
			height: 4px;
			background: #8d8d8d;
		}
		.tabset > label:hover,
		.tabset > input:focus + label {
			color: #003399;
		}

		.tabset > label:hover::after,
		.tabset > input:focus + label::after,
		.tabset > input:checked + label::after {
			background: #003399;
		}
		.tabset > input:checked + label {
			border-color: #ccc;
			border-bottom: 1px solid #fff;
			margin-bottom: -1px;
		}
		.tab-panel {
			padding: 30px 0;
		}
		#horizontalTab li img {
			filter: invert(100%) sepia(0%) saturate(7500%) hue-rotate(253deg) brightness(105%) contrast(108%);
		}
		.travel{
			padding-top: -10px;
		}
		.travelbtn{
			border-style: none;background-color: white;width: 200px;height: 25px;
		}
		#flightdiv1{
			width: 1200px; margin: 20px auto; height: 150px;
			background-color: white; 
			border-radius: 10px;
			box-shadow: rgba(50, 50, 93, 0.25) 0px 2px 5px -1px, rgba(0, 0, 0, 0.3) 0px 1px 3px -1px;
			position: relative;			   
    		top: 10px;
		}
		#flightdiv2{
			width: 290px;
			height: 600px;
			margin-right: 10px;
			float: left;
			overflow-y: scroll;	
			background-color: white;
		}
		/* ???????????? ??????*/
		#flightdiv2::-webkit-scrollbar{
		    width: 6px;
		}

		/* ???????????? ?????? ??????*/
		#flightdiv2::-webkit-scrollbar-thumb{
		    height: 17%;
		    background-color: rgba(3,0,102,1);
		    border-radius: 10px;  
		}

		/* ???????????? ??? ?????? ??????*/
		#flightdiv2::-webkit-scrollbar-track{
		    background-color: rgba(0,51,155,0.33);
		}
		.flightdiv2_indiv{
			width: 265px;
			margin: 5px;
			border-bottom: solid 1px rgba(0, 0, 0, 0.2);
			

		}
		#flightdiv3{
		
			width: 900px;
			border-radius: 5px;
			height: fit-content;
			float: left;
			background-color:white;
			border-radius: 10px;
			box-shadow: rgba(50, 50, 93, 0.25) 0px 2px 5px -1px, rgba(0, 0, 0, 0.3) 0px 1px 3px -1px;
			margin-bottom: 90px;
		}
		#flightdivmain{
			width: 1200px; height: 1200px; margin: 0 auto;
			
		}
		.flightlistdiv{
			border: solid 1px rgba(0,0,0,0.2);
			border-radius:5px;
			background-color:white;
			width: 880px;
			height: 120px;
			
		
			margin:4px;
		}
		.td1{
			height: 80px;
		}
		.td2{
			height: 80px;
		}
		.listtable{
			text-align:center;
			width :850px;			
			height: 120px;
			position:relative;
		}
		.td1{
		 	border-spacing: 0px;
			margin: 0px;
			padding: 0px;
		}
		.listtable  tr  td:nth-child(1), .listtable  tr  td:nth-child(3){
			width: 80px;
		}
		.listtable  tr  td:nth-child(even){
			width: 200px;
		}
		.listtable  tr  td:nth-child(5){
			width: 100px;
			padding-right:50px;
		}
		.flightimg{
			width: 50px;
			height: 50px;
			background-color: white;
		}
		.time{
			font-weight: bold;
		}
		.airport{
			font-size: 10pt;
			color: rgba(0, 0, 0, 0.6);
		}
		.airplanename{
			font-size: 10pt;
			color: rgba(0, 0, 0, 0.6);
		}
		.flightname{
			font-weight: bold;
			font-size: 14pt;
		}
		.choicebtn{
			border-radius: 3px;
			height: 30px;
			width: 70px;
			margin-left:20px;
			border-style:none;
			background-color: rgba(211, 10, 20, 0.9);
			color: white;
			font-weight:bold;
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
			position: relative;
			left: 200px;
			padding-left: 150px;
			
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
        	cursor: pointer;
        }
        .pageinfo{
        	float: left;
        	background-color: white;
        	width: 300px;
        	height: 60px;
        	line-height: 60px;        	
        }
        .pageinfo > button {
        	border-style: none;
        	background-color: white;
        	margin: 5px;
        	font-size: 12pt;
        }
        
        .pageinfo > button > img {
        	width:25px;
        	height:25px;
        	position: relative;
    		top: 6px;
        }
        #pagelistdiv{
        	margin:10px auto;
        }
        #pagelistdiv div{
        	margin: 0 auto;
        	width:fit-content;
        }
       
	 	.flightlistdiv:hover {
	 	background-color: rgba(242,242,242, 0.4);
		}  
		/* ?????? */
		#modal1 > *{
			padding: 0px;
			margin: 0px;
		}
		
		#modal1{
			display : none;
			z-index : 999;
			position:absolute;
			left:0;
			top: 198px;
			width:70%;
			height:650px;
		}
		#modal1>#content1{
			width:500px;
			height:484px;
			margin:100px auto;
			padding:20px;
			position: relative;
			background-color:#fff;
			box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
		}
		
		#modal1 .close{
			position:absolute;
			top:4px;
			right:4px;	
			font-size:20px;
			border:0;
			background-color:#F0F0F0;
		}
		
		#modal1 .close:hover,
		#modal1 .close:focus {
		  color : #000;
		  text-decoration: none;
		  cursor :pointer;
		}
		.modalul {
			width:500px;
		}
		.modalul li{
			list-style: none;
			float: left;
			width: 95px;
			height: 50px;
			line-height: 50px;
			position: relative;
			left:-60px;
			top:-36px;
		}
		.modalul li:nth-child(1){
			width: 540px;
			height: 40px;
			background-color: #F0F0F0;
			font-weight: bold;
			font-size:12pt;
			line-height: 40px;
		}
		.modalul li:nth-child(n+2){
			font-size:10pt;
			padding: 0 10px;
			margin: 2px 5px;
		}
		.modalul li:nth-child(n+2):hover{
			background-color: #5AA0FF ;
			color:white;
		}
		#btnOpen1:focus{
			outline: none;
			border-bottom: solid rgba(211, 10, 20, 0.9) 2px;
		}
		#backdiv{
			background-color: #f5f7fa;
			position: relative;
			top:-13px;
		}
		.flex{
		  display:flex
		}
		/* ??????????????? */
		.container {
		  display: flex;
		  position: relative;
		  cursor: pointer;
		  font-size: 22px;
		  width:202px;
		  height:120px;
		  -webkit-user-select: none;
		  -moz-user-select: none;
		  -ms-user-select: none;
		  user-select: none;
		  
		}
		
		.container input {
		  position: absolute;
		  opacity: 0;
		  cursor: pointer;
		}
		
		.checkmark {
		  display: flex;
		  flex-direction: column;
		  padding: 15px 25px;
		  background: #fff;
		  min-width: 150px;
/* 		  transition: all 0.3s linear */
		}
		
		.container:hover input ~ .checkmark {
		  background-color: #f7f7f7;
		}
		.container input:checked ~ .checkmark {
		  border: #002266 2px solid;
		  -webkit-box-shadow: 0px 3px 6px 2px rgba(0,0,0,0.16);
		  -moz-box-shadow: 0px 3px 6px 2px rgba(0,0,0,0.16);
		  box-shadow: 0px 3px 6px 2px rgba(0,0,0,0.16);
		  background-color: #002266;
		  color:white;
		  width: 202px;
		}
		
	.middle1, .middle2 {
  position: relative;
  width: 250px;
  max-width: 500px;
  margin-left: 10px;
}

.slider1, .slider2 {
  position: relative;
  z-index: 1;
  height: 10px;
  margin: 25px 0px;
}

.slider1 > .track1 , .slider2 > .track2 { 
	/* ?????? ??? */
  position: absolute;
  z-index: 1;
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
  border-radius: 5px;
  height: 5px;
  background-color: #FFCDCD;
}
.slider1 > .range1, .slider2 > .range2 {
	/* ????????? ?????? ??? */
  position: absolute;
  height: 5px;
  z-index: 2;
  left: 0%;
  right: 0%;
  top: 0;
  bottom: 0;
  border-radius: 5px;
  background-color: #CC3D3D;
}
.slider1 > .thumb1, .slider2 > .thumb2 {
  position: absolute;
  z-index: 3;
  width: 15px;
  height: 15px;
  background-color: #CC3D3D;
  border-radius: 50%;
}
.slider1 > .thumb1.left1, .slider2 > .thumb2.left2 {
  left: 5%;
  transform: translate(-14px, -5px);
}
.slider1 > .thumb1.right1, .slider2 > .thumb2.right2 {
  right: 5%;
  transform: translate(14px, -5px);
}

input[type="range"] {
  position: absolute;
  /* opacity??? ?????? ?????? ???????????? ?????????????????? ?????? */
  pointer-events: none;
  -webkit-appearance: none;
  z-index: 2;
  height: 10px;
  width: 270px;
  right: -7px;
  opacity: 0;
}
input[type="range"]::-webkit-slider-thumb {
  /* ????????? ??? thumb??? ?????? ????????? */
  pointer-events: all;
  width: 30px;
  height: 30px;
  border-radius: 0;
  border: 0 none;
  background-color: red;
  cursor: pointer;

  /* appearance??? ?????? ?????? ??????????????? ??? ??? ?????? */
  -webkit-appearance: none;
}
	</style>
</head>
<script>	
$(document).ready(function() {
	var arr = new Array();
	var count = <%=nowPage2%>+1;
	var filtercount = <%=nowPage2%>+1;
	
	$(window).scroll(function() {
	    if ($(window).scrollTop() == $(document).height() - $(window).height()) {
	    	if($("input:checkbox[class='filter']").is(':checked') || ($('#startleftval1').text()!=00) || ($('#startrightval1').text() != 24) || ($('#startleftval2').text() != 00) || ($('#startrightval2').text() != 24)){
	    		arr = [];
	    		var startleftval1 = $('#startleftval1').text();
	    		var startrightval1 = $('#startrightval1').text();
	    		var startleftval2 = $('#startleftval2').text();
	    		var startrightval2 = $('#startrightval2').text();
	    		if($("#jejuair").is(":checked")){
	            	arr.push($("#jejuair").val());	
	            }
	            if($("#asianaair").is(":checked")){
	            	arr.push($("#asianaair").val());
	            }
	            if($("#koreanair").is(":checked")){
	            	arr.push($("#koreanair").val());
	            }
	    		$.ajax({
	                url : "../flight/flightFilter_back.air?startleftval1="+startleftval1+"&startrightval1="+startrightval1+"&startleftval2="+startleftval2+"&startrightval2="+startrightval2+"&arr="+arr+"&departure1=<%= request.getParameter("departure1") %>&arrive1=<%= request.getParameter("arrive1") %>&departureDay1=<%= request.getParameter("departureDay1") %>&arrivalDay1=<%= request.getParameter("arrivalDay1") %>&page1="+filtercount ,
	                dataType : "html" ,
	                success:function(data){
	                    $('#flightdiv3').append(data);
	                    filtercount++;
	                }, 
	                error : function(){
	                    alert("fail");
	                }
	            });
	    	}
	    	else{
	    		 $.ajax({
		                url : "../flight/TicketList_back.air?departure1=<%= request.getParameter("departure1") %>&arrive1=<%= request.getParameter("arrive1") %>&departureDay1=<%= request.getParameter("departureDay1") %>&arrivalDay1=<%= request.getParameter("arrivalDay1") %>&page1="+count ,
		                dataType : "html" ,
		                success:function(data){
		                    $('#flightdiv3').append(data);
		                    count++;
		                }, 
		                error : function(){
		                    alert("fail");
		                }
		         });
	    	}
	    	
	    }
	}); 

	
	$("input:radio[name='choicebtn']").change(function(){
		var checkBtn = $(this);
		var tr = checkBtn.parent().parent().parent();
		var td = tr.children();
	
		var numberStr1 = "<%= request.getParameter("totalprice") %>";
		var numberStr2 = td.find('.checkmark h4').text();
		
		var number1 = numberStr1.replace(/,/g, "");
		var number2 = numberStr2.replace(/,/g, "");	
		
		num1 = parseInt(number1);
		num2 = parseInt(number2);
		var total = num1 + num2;
		var result = total.toLocaleString();
		
		
		$('#ticketNum2').val(td.eq(0).find("input[type='hidden']").val());
		
		$('.span2').val(result);
		$('.span3').text("???");
		
	});
	$('.footer_backchoice').on('click',function(){
		myform.action = "../flight/flightDetail.air";
		myform.submit();
	});
	
	
	$('.flightdiv2_indiv > input').change(function(){
		/* ????????? ???????????? ?????? ????????? ????????? ?????? */
		count = 2;
		filtercount = 2;
		arr = [];
		var startleftval1 = $('#startleftval1').text();
		var startrightval1 = $('#startrightval1').text();
		var startleftval2 = $('#startleftval2').text();
		var startrightval2 = $('#startrightval2').text();
		
		if($(".flightdiv2_indiv > input").is(":checked")){
            if($("#jejuair").is(":checked")){
            	arr.push($("#jejuair").val());	
            }
            if($("#asianaair").is(":checked")){
            	arr.push($("#asianaair").val());
            }
            if($("#koreanair").is(":checked")){
            	arr.push($("#koreanair").val());
            }
            $.ajax({
                url : "../flight/flightFilter_back.air?startleftval1="+startleftval1+"&startrightval1="+startrightval1+"&startleftval2="+startleftval2+"&startrightval2="+startrightval2+"&arr="+arr+"&departure1=<%= request.getParameter("departure1") %>&arrive1=<%= request.getParameter("arrive1") %>&departureDay1=<%= request.getParameter("departureDay1") %>&arrivalDay1=<%= request.getParameter("arrivalDay1") %>" ,
                dataType : "html" ,
                success:function(data){
                    $('#flightdiv3').empty();  
                    $('#flightdiv3').append(data);
                }, 
                error : function(){
                    alert("fail");
                }
            });
		}
		else{
			location.reload();
		}
	}); 
	$('.range').change(function(){
		count = 2;
		filtercount = 2;
		/* ????????? ???????????? ?????? ????????? ????????? ?????? */
		arr = [];
		var startleftval1 = $('#startleftval1').text();
		var startrightval1 = $('#startrightval1').text();
		var startleftval2 = $('#startleftval2').text();
		var startrightval2 = $('#startrightval2').text();
		
            if($("#jejuair").is(":checked")){
            	arr.push($("#jejuair").val());	
            }
            if($("#asianaair").is(":checked")){
            	arr.push($("#asianaair").val());
            }
            if($("#koreanair").is(":checked")){
            	arr.push($("#koreanair").val());
            }
            $.ajax({
                url : "../flight/flightFilter_back.air?startleftval1="+startleftval1+"&startrightval1="+startrightval1+"&startleftval2="+startleftval2+"&startrightval2="+startrightval2+"&arr="+arr+"&departure1=<%= request.getParameter("departure1") %>&arrive1=<%= request.getParameter("arrive1") %>&departureDay1=<%= request.getParameter("departureDay1") %>&arrivalDay1=<%= request.getParameter("arrivalDay1") %>" ,
                dataType : "html" ,
                success:function(data){
                    $('#flightdiv3').empty();  
                    $('#flightdiv3').append(data);
                }, 
                error : function(){
                    alert("fail");
                }
            });
	}); 
	
});	
	
</script>
<script>
/* window.onload=function(){
	document.getElementById('datechoice1').value = new Date().toISOString().substring(0, 10);
	document.getElementById('datechoice2').value = new Date().toISOString().substring(0, 10);
	var today = new Date().toISOString().substring(0, 10);
	document.getElementById('datechoice1').setAttribute("min", today);
}
function changeDate1(){
	document.getElementById('datechoice2').setAttribute("min", document.getElementById('datechoice1').value);
	document.getElementById('datechoice2').value = document.getElementById('datechoice1').value;
} */


function getPost(mode)
{
	var myform = document.myform;
	/* 02 ?????? ?????? , 03 ?????? ?????? */
	if(mode == '02'){
		myform.action = "../flight/flightTicketSearch_go.air";
	}
	else if(mode == '03'){
		myform.action ="../flight/flightTicketSearch_oneway.air";
	}
	myform.submit();
};
</script>
<body>
	<form name="myform">
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
<div id="footerprice">
	<div id="textdiv">
		<div class="footer_amount">
			<span class="span1">?????? ?????? ??????</span>
			<input type="button" class="footer_backchoice" value="?????? ??? ??????">
			<span class="span3"></span>
			<input class="span2" name="totalprice" value='<%= request.getParameter("totalprice") %>' readonly>
			<input type="hidden" value="" name="ticketNum2" id="ticketNum2">
			<input type="hidden" value="<%=request.getParameter("ticketNum1")%>" name="ticketNum1" id="ticketNum1">
		</div>
		
	</div>
</div>


<div id='modal1'>
	<div id='content1'>
		<div>
			<div class="modaltitle">
				<ul class="modalul">
					<li>&nbsp;&nbsp;???????????? <input type='button' value='X' class="close" id='btnClose1'/></li>
					<li>??????</li>
					<li>?????????</li>
				</ul>
			</div>
			<div class="modaltitle">
				<ul class="modalul">
					<li>&nbsp;&nbsp;??????</li>
					<li>ICN ??????/??????</li>
					<li>GMP ??????/??????</li>
					<li>CJU ??????</li>
				</ul>
			</div>
			<div class="modaltitle">
				<ul class="modalul">
					<li>&nbsp;&nbsp;??????</li>
					<li>??????</li>
					<li>?????????</li>
					<li>??????</li>
					<li>?????????</li>
					<li>?????????</li>
					<li>????????????</li>
				</ul>
			</div>			
			<div class="modaltitle">
				<ul class="modalul">
					<li>&nbsp;&nbsp;?????????</li>
					<li>?????????</li>
					<li>?????????</li>
					<li>??????</li>
					<li>?????????</li>
				</ul>
			</div>
			<div class="modaltitle">
				<ul class="modalul">
					<li>&nbsp;&nbsp;?????? ??????</li>
					<li>????????????</li>
					<li>??????</li>					
				</ul>
			</div>
			
		</div>
	</div>
</div>
<div id="backdiv">
		<div id="flightdiv1">
			<div class="tabset">
							<!-- Tab 1 -->
							<input type="radio" name="tabset" id="tab1"
								aria-controls="marzen" name='' checked> <label
								for="tab1">??????</label>
							<!-- Tab 2 -->
							<input type="radio" name="tabset" id="tab2"
								aria-controls="rauchbier" name=''> <label for="tab2">??????</label>
							<div class="tab-panels">
								<section id="marzen" class="tab-panel">
									<div class="searchBot">
										<div
											style="float: left; width: 1080px; border: 1px solid #E7E7E7;">
											<section class="airplainchoice">
										<img src="../img/icon/take-off.png" width="20" height="20" class="flighticon"> 
										
												<input type="text" placeholder="?????????" class="departure"
													name='departure1' value="<%= request.getParameter("departure1") %>">
											</section>
											<section class="airplainchoice">
												<img src="../img/icon/landing.png" width="20" height="20" class="flighticon"> 
												<input type="text" placeholder="?????????" class="arrive"
													name='arrive1' value="<%= request.getParameter("arrive1") %>"> 
											</section>
											<section class="airplainchoice">
												<input type="date" placeholder="?????????" id="datechoice1"
													name='departureDay1' value="<%= request.getParameter("departureDay1") %>" onchange="changeDate1()">
											</section>
											<section class="airplainchoice">
												<input type="date" placeholder="?????????" id="datechoice2"
													name='arrivalDay1' value="<%= request.getParameter("arrivalDay1") %>">
											</section>
											<section class="airplainchoice">
												<input type='button' class="searchicon2"
													onClick="getPost('02')">
											</section>
										</div>
									</div>
								</section>
								<section id="rauchbier" class="tab-panel">
									<div class="searchBot">
										<div>
											<section class="airplainchoice">
											<img src="../img/icon/take-off.png" width="20" height="20" class="flighticon"> 
												<input type="text" placeholder="?????????" class="departure" name='departure2'>
											</section>
											<section class="airplainchoice">
											<img src="../img/icon/landing.png" width="20" height="20" class="flighticon"> 
												<input type="text" placeholder="?????????" class="arrive" name='arrive2'>
											</section>
											<section class="airplainchoice">
												<input type="date" placeholder="?????????" id="datechoice5"
													name='departureDay2'>
											</section>
											<section class="airplainchoice">

												<input type='button' class="searchicon3"
													onClick="getPost('03')">
											</section>
										</div>
									</div>
								</section>
				</div>
			</div>
		</div>
		<div id="flightdivmain">
			<div id="flightdiv2">
				<div class="flightdiv2_indiv">
					<h4>&nbsp;&nbsp;?????????</h4>
						<input type="checkbox" name="jejuair" id="jejuair" value="??????" class="filter"> ??????<br><br>
						<input type="checkbox" name="asianaair" id="asianaair" value="????????????" class="filter"> ???????????? <br><br>
						<input type="checkbox" name="koreanair" id="koreanair" value="??????" class="filter"> ?????? <br><br>
				</div>
				<div class="flightdiv2_indiv">
				<h4> &nbsp;&nbsp;????????? ??????</h4>
				<i class="fa-solid fa-plane-departure"></i><span>?????? ??????</span><span id="startleftval1">00</span><span>: 00 - </span><span id="startrightval1">24</span><span>: 00</span>
					<div class="middle1">
					  <div class="multi-range-slider1" >
					    <input type="range" id="input1-left1" min="0" max="24" value="0" class="range" />
    					<input type="range" id="input1-right1" min="0" max="24" value="24" class="range" />
					    <div class="slider1">
					      <div class="track1"></div>
					      <div class="range1"></div>
					      <div class="thumb1 left1"></div>
					      <div class="thumb1 right1"></div>
					    </div>
					  </div>
					</div>	
					<i class="fa-solid fa-plane-arrival"></i><span>?????? ??????</span><span id="startleftval2">00</span><span>: 00 - </span><span id="startrightval2">24</span><span>: 00</span>
					<div class="middle2">
					  <div class="multi-range-slider2">
					    <input type="range" id="input2-left2" min="0" max="24" value="0" class="range" />
    					<input type="range" id="input2-right2" min="0" max="24" value="24" class="range" />
					    <div class="slider2">
					      <div class="track2"></div>
					      <div class="range2"></div>
					      <div class="thumb2 left2"></div>
					      <div class="thumb2 right2"></div>
					    </div>
					  </div>
					</div>			 
				</div>
				
			</div>
			<div id="flightdiv3">
			<div id="slider-div">
				<c:forEach  var="ticketBeanList2" items="${ticketBeanList2}">
					<div class="flightlistdiv">
					<table class="listtable" cellspacing="0">
						<tr class="tr1">
							<td class="td1">
							<input type="hidden" value="${ticketBeanList2.flight_Ticket_Num}" class="ticketNum2">
							<c:if test="${ticketBeanList2.flight_name eq '??????'}" var="bool">
								<img src="../img/flight/jejuair.png" class="flightimg">
							</c:if>
							<c:if test="${ticketBeanList2.flight_name eq '????????????'}" var="bool">
								<img src="../img/flight/asiana.png" class="flightimg">
							</c:if>
							<c:if test="${ticketBeanList2.flight_name eq '??????'}" var="bool">
								<img src="../img/flight/koreanair.png" class="flightimg">
							</c:if>
							</td>
							<td class="td1" style="text-align: left;"><span class="flightname">${ticketBeanList2.flight_name}</span><br><span class="airplanename">${ticketBeanList2.flight_airplaneName}</span></td>
							<td class="td1"><span class="time">${ticketBeanList2.flight_departureTime}</span><br><span class="airport">${ticketBeanList2.flight_departure}</span></td>
							<td class="td1"><span class="airport">${ticketBeanList2.estimated_time}</span><br><img src="aaa.jpg"></td>
							<td class="td1"><span class="time">${ticketBeanList2.flight_arrivalTime}</span><br><span class="airport">${ticketBeanList2.flight_arrival}</span></td>
							<td class="td1" rowspan="2" style="border-right: #E6E6E6 2px solid; border-left: #E6E6E6 2px solid;">
							<label class="container">
							  <input type="radio" class="choicebtn" name="choicebtn">
							  <span class="checkmark">
							    <h4><fmt:formatNumber value="${ticketBeanList2.flight_Ticket_Price}" groupingUsed="true"/></h4>
							  </span>
							</label> 
							</td>
						</tr>
					</table>
				</div>
				</c:forEach> 
			</div>	
			
			</div>
			
			
		</div>
</div>

	</form>
</body>
<script>
		
const inputLeft1 = document.getElementById("input1-left1");
const inputRight1 = document.getElementById("input1-right1");

const thumbLeft1 = document.querySelector(".slider1 > .thumb1.left1");
const thumbRight1 = document.querySelector(".slider1 > .thumb1.right1");
const range1 = document.querySelector(".slider1 > .range1");
	
	const setLeftValue1 = () => {
		  const _this = inputLeft1;
		  const [min, max] = [parseInt(_this.min), parseInt(_this.max)];
		  // ???????????? ??????, 1??? ?????? ??? ????????? ?????????????????? ?????? ?????? ????????? ???????????? ??????.
		  _this.value = Math.min(parseInt(_this.value), parseInt(inputRight1.value) - 1);
		  // input, thumb ?????? ???????????????
		  const percent = ((_this.value - min) / (max - min)) * 100;
		  thumbLeft1.style.left = percent + "%";
		  range1.style.left = percent + "%";
	  if($('#input1-left1').val().length == 1){
			var rightval = "0"+ $('#input1-left1').val();
		  	$('#startleftval1').text(rightval);
		  }
		  else{
			  $('#startleftval1').text($('#input1-left1').val());
		  }
	};
	
	const setRightValue1 = () => {
		  const _this = inputRight1;
		  const [min, max] = [parseInt(_this.min), parseInt(_this.max)];
		  // ???????????? ??????, 1??? ????????? ??? ????????? ?????????????????? ?????? ?????? ????????? ???????????? ??????.
		  _this.value = Math.max(parseInt(_this.value), parseInt(inputLeft1.value) + 1);
		  // input, thumb ?????? ???????????????
		  const percent = ((_this.value - min) / (max - min)) * 100;
		  thumbRight1.style.right = 100 - percent + "%";
		  range1.style.right = 100 - percent + "%";
	  
	  if($('#input1-right1').val().length == 1){
		var rightval = "0"+ $('#input1-right1').val();
	  	$('#startrightval1').text(rightval);
	  }
	  else{
		  $('#startrightval1').text($('#input1-right1').val());
	  }
	};
	
	inputLeft1.addEventListener("input", setLeftValue1);
	inputRight1.addEventListener("input", setRightValue1);

	
	
	const inputLeft2 = document.getElementById("input2-left2");
	const inputRight2 = document.getElementById("input2-right2");

	const thumbLeft2 = document.querySelector(".slider2 > .thumb2.left2");
	const thumbRight2 = document.querySelector(".slider2 > .thumb2.right2");
	const range2 = document.querySelector(".slider2 > .range2");
		
		const setLeftValue2 = () => {
			  const _this = inputLeft2;
			  const [min, max] = [parseInt(_this.min), parseInt(_this.max)];
			  // ???????????? ??????, 1??? ?????? ??? ????????? ?????????????????? ?????? ?????? ????????? ???????????? ??????.
			  _this.value = Math.min(parseInt(_this.value), parseInt(inputRight2.value) - 1);
			  // input, thumb ?????? ???????????????
			  const percent = ((_this.value - min) / (max - min)) * 100;
			  thumbLeft2.style.left = percent + "%";
			  range2.style.left = percent + "%";
		  if($('#input2-left2').val().length == 1){
				var rightval = "0"+ $('#input2-left2').val();
			  	$('#startleftval2').text(rightval);
			  }
			  else{
				  $('#startleftval2').text($('#input2-left2').val());
			  }
		};
		
		const setRightValue2 = () => {
			  const _this = inputRight2;
			  const [min, max] = [parseInt(_this.min), parseInt(_this.max)];
			  // ???????????? ??????, 1??? ????????? ??? ????????? ?????????????????? ?????? ?????? ????????? ???????????? ??????.
			  _this.value = Math.max(parseInt(_this.value), parseInt(inputLeft2.value) + 1);
			  // input, thumb ?????? ???????????????
			  const percent = ((_this.value - min) / (max - min)) * 100;
			  thumbRight2.style.right = 100 - percent + "%";
			  range2.style.right = 100 - percent + "%";
		  
		  if($('#input2-right2').val().length == 1){
			var rightval = "0"+ $('#input2-right2').val();
		  	$('#startrightval2').text(rightval);
		  }
		  else{
			  $('#startrightval2').text($('#input2-right2').val());
		  }
		};
		
		inputLeft2.addEventListener("input", setLeftValue2);
		inputRight2.addEventListener("input", setRightValue2);

	// modal ??? 1??? 
	var btnOpen1  = document.getElementById('btnOpen1');
	var btnClose1 = document.getElementById('btnClose1');
	
	// modal ?????? ??????
	var closeRtn = function(){
		var modal1 = document.getElementById('modal1');
		modal1.style.display = 'none';
	}
	// modal ?????? ?????????
	btnOpen1.onclick = function(){
		var modal1 = document.getElementById('modal1');
		modal1.style.display = 'block';
	}
	window.onclick = function(e) {
		if(e.target == modal1){
			modal1.style.display = 'none';
		}
	}
	btnClose1.onclick = closeRtn;
	$(document).ready(function() {
		$(".modalul li:nth-child(n+2)").on('click', function(e) {
			$('#btnOpen1').val($(this).text());
			modal1.style.display = 'none';
		}); 
	});
</script>
</html>

