<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@page import="vo.Travellocal"%> 
<%@page import="action.IndexselectAction"%>	
<% 
	IndexselectAction indexselect = new IndexselectAction();
		indexselect.execute(request, response);
		ArrayList<Travellocal> travellocal=(ArrayList<Travellocal>)request.getAttribute("travellocal");
%> 	
<!DOCTYPE html>
<html>
<head>
<title></title>
<meta charset="utf-8">
<link
	href="https://fonts.googleapis.com/css2?family=Cairo&family=Indie+Flower&family=Koulen&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/header_footer.css">
<link type="text/css" rel="stylesheet" href="css/responsive-tabs.css" />
<link type="text/css" rel="stylesheet" href="css/style2.css" />
<script src="http://use.fontawesome.com/releases/v6.1.2/js/all.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<style>
.main_visual_wrap {
	position: relative;
	margin: 0;
	padding: 0;
	z-index: 0;
}

.imageBox .slide {
	position: relative;
	border-style: solid;
	border-width: 2px 0px 2px 0px;
	/*border-color: #CC3D3D;*/
	list-style: none;
	width: 100%;
	height: 400px;
	overflow: hidden;
	z-index: 0;
}

.search {
	margin: 0 auto;
	position: relative;
	top: 300px;
	width: 1200px;
	height: fit-content;
}

#tab-1 {
	padding-bottom: 40px;
	height: 160px
}

#tab-3 {
	padding-bottom: 35px;
	height: 145px;
}

#tab-3 div {
	width: 1120px;
	height: 60px;
	border-style: solid;
	border-color: #E7E7E7;
	border-width: 1px;
	position: relative;
	left: 10px;
	top: 5px;
	7
}

#tab-3 div img {
	position: static;
	padding-top: 20px;
	margin-left: 20px;
}

#datechoice3 {
	height: 50px;
	width: 150px;
	font-size: 10pt;
	border-style: none;
	background-color: white;
	position: relative;
	left: 40px;
	bottom: 5px;
}

#datechoice4 {
	height: 50px;
	width: 150px;
	font-size: 10pt;
	padding-right: 30px;
	border-style: none;
	background-color: white;
	position: relative;
	left: 70px;
	bottom: 5px;
}

#tab-3 div select {
	height: 56px;
	width: 100px;
	font-size: 10pt;
	border-style: none;
	position: relative;
	bottom: 5px;
}

#tab-2 {
	position: relative;
	height: 160px;
}

#tab-2 h3 {
	position: relative;
	right: 10px;
}

#tab-3 h3 {
	position: relative;
	left: 20px;
}

#tab-3 input:first-of-type {
	height: 50px;
	width: 450px;
	font-size: 10pt;
	padding-left: 30px padding-right: 30px;
	border-style: solid;
	border-width: 0;
	background-color: white;
	position: relative;
	bottom: 5px;
}

#tab-3 input:last-of-type {
	border-style: none;
	background: url(img/icon/loupe.png);
	width: 35px;
	height: 35px;
	background-size: 15px;
	background-repeat: no-repeat;
	position: relative;
	left: 70px;
	top: 20px;
}

.searchTop {
	position: relative;
	left: 20px;
	height: 100px;
	padding-left: 10px;
}

.image {
	position: relative;
	top: 5px;
	right: 5px;
	width: 20px;
	height: 20px;
}

.seatGrade {
	width: 120px;
	padding: 5px;
	border-style: solid;
	border-width: 0;
	background: url(img/icon/seat.png);
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
.people {
	width: 120px;
	padding: 5px;
	border-style: solid;
	border-width: 0;
	background: url(img/icon/people.png);
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

.seatGrade2 {
	width: 150px;
	padding: 5px;
	border-style: solid;
	border-width: 0;
	background: url(img/icon/seat.png);
	background-position: 100px;
	background-size: 15px;
	background-repeat: no-repeat;
	border-color: black;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
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

.searchBot div {
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
	margin-left: 10px;
	width: 200px;
	background-position: 5px;
	background-size: 30px;
	background-repeat: no-repeat;
}

.arrive {
	margin-left: 10px;
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
	width: 120px;
	position: relative;
	left: 80px;
}

.departureBtn {
	width: 180px;
	position: relative;
	text-align: left;
	right: 10px;
	background: url(img/icon/pin.png);
	background-position: 155px;
	background-size: 20px;
	background-repeat: no-repeat;
	/* filter: opacity(0.5) drop-shadow(0 0 0 white);*/
}

.searchicon1 {
	position: relative;
	left: 80px;
	width: 50px;
	height: 40px;
	border-style: none;
	background-color: white;
	background: url(img/icon/loupe.png);
	background-position: center;
	background-size: 20px;
	background-repeat: no-repeat;
}

.searchicon2 {
	position: relative;
	left: 300px;
	width: 50px;
	height: 40px;
	border-style: none;
	background-color: white;
	background: url(img/icon/loupe.png);
	background-position: center;
	background-size: 20px;
	background-repeat: no-repeat;
}
.searchicon3 {
	position: relative;
	left: 190px;
	width: 50px;
	height: 40px;
	border-style: none;
	background-color: white;
	background: url(img/icon/loupe.png);
	background-position: center;
	background-size: 20px;
	background-repeat: no-repeat;
}
.travelsearch{
	position: relative;
	left: 70px;
	width: 50px;
	height: 50px;
	border-style: none;
	background-color: white;
	background: url(img/icon/loupe.png);
	background-position: center;
	background-size: 20px;
	background-repeat: no-repeat;
	margin-top:10px;
}
.flighticon{
	margin-top:10px;
	margin-left:10px;
}

.arrivalBtn {
	width: 180px;
	position: relative;
	text-align: left;
	right: 5px;
	background: url(img/icon/pin.png);
	background-position: 155px;
	background-size: 20px;
	background-repeat: no-repeat;
	/* filter: opacity(0.5) drop-shadow(0 0 0 white);*/
}

.arrow {
	position: relative;
	right: 5px;
	top: 10px;
	filter: opacity(0.5) drop-shadow(0 0 0 white);
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

.icon {
	position: relative;
	left: 40px;
	top: 7px;
}
/*#tab-3 input {
			height: 30px;
			font-size: 13pt;
			padding-right: 30px;
			border-style: solid;
			background-color: white;
			border-top: 0px;
			border-left: 0px;
			border-right: 0px;
		}*/
.areaName {
	width: 230px;
	position: relative;
	text-align: left;
	left: 10px;
	background: url(img/icon/pin.png);
	background-position: 200px;
	background-size: 20px;
	background-repeat: no-repeat;
	/*filter: opacity(0.5) drop-shadow(0 0 0 white);*/
}

.check {
	width: 150px;
	position: relative;
	padding-left: 30px;
	left: 70px;
	bottom: 3px;
}

.check:last-of-type {
	position: relative;
	left: 90px;
}

#tab-3 img {
	position: relative;
	left: 100px;
	top: 7px;
}

.contents {
	width: 1200px;
	height: fit-content;
	margin: 0 auto;
	position: relative;
	top: 330px;
}

.travel {
	width: 1200px;
	height: 350px;
}

.travel:last-of-type {
	position: relative;
	top: 50px;
}

.travel h5 {
	font-size: 22pt;
	text-align: center;
	font-weight: bold;
}

.travellist1 {
	width: 280px;
	float: left;
	border-style: solid;
	box-shadow: 7px 7px 7px #BDBDBD;
	border-width: 2px;
	border-color: #BDBDBD;
	margin-left: 10px;
	position: relative;
	bottom: 10px;
	overflow: hidden;
}

.travellist1 p {
	font-size: 35pt;
	font-weight: bold;
	margin-left: 30px;
	color: white;
	position: relative;
	margin-top: -150px;
}

.travellist1 p img {
	position: relative;
	top: 3px;
	margin-left: 5px;
	filter: invert(100%) sepia(100%) saturate(0%) hue-rotate(288deg)
}

.travellist1 img {
	transition: all 0.2s linear;
}

.travellist1 img:hover {
	transform: scale(1.04);
	filter: brightness(50%);
	overflow: hidden;
}
/*		.travellist1 input {
			background:url(image/map_icon.png);
		    background-position: 10px;
		    background-size: 30px;
		    background-repeat: no-repeat;

		}*/
.travellist1 div {
	width: 280px;
	height: 200px;
}

.travellist2 {
	float: left;
	border-style: solid;
	height: 350px;
	box-shadow: 7px 7px 7px #BDBDBD;
	border-width: 2px;
	border-color: #BDBDBD;
	margin-left: 10px;
	position: relative;
	bottom: 10px;
	overflow: hidden;
}

.detail {
	position: relative;
	height: 100px;
	bottom: 123px;
	border-style: 100px;
	background-color: rgba(0, 0, 0, .6);
	color: white;
}

.travellist2 p:first-of-type {
	padding-top: 15px;
	font-size: 15pt;
	font-weight: bold;
	margin-left: 10px;
	line-height: 5pt;
}

.travellist2 p:nth-of-type(2) {
	font-size: 11pt;
	margin-left: 10px;
}

.travellist2 p:last-of-type {
	font-size: 13pt;
	font-weight: bold;
	color: red;
	margin-left: 10px;
	line-height: 2pt;
}

.travellist2>img {
	transition: all 0.2s linear;
}

.travellist2>img:hover {
	transform: scale(1.04);
	overflow: hidden;
}

.contents2 {
	position: relative;
	top: 10px;
}

.contents3 {
	position: relative;
	top: 30px;
}

.travellist3 {
	float: left;
	border-style: solid;
	box-shadow: 7px 7px 7px #BDBDBD;
	border-width: 2px;
	border-color: #BDBDBD;
	margin-left: 10px;
	background-color: white;
	overflow: hidden;
}

.travellist3 div {
	width: 280px;
	height: 230px;
	overflow: hidden;
}

.travellist3 p:first-of-type {
	font-size: 13pt;
	font-weight: bold;
	margin-left: 10px;
}

.travellist3 p:nth-of-type(2) {
	font-size: 11pt;
	margin-left: 10px;
}

.travellist3 p:last-of-type {
	font-size: 13pt;
	font-weight: bold;
	color: #050099;
	margin-left: 10px;
	line-height: 3pt;
}

.travellist3 img {
	transition: all 0.2s linear;
}

.travellist3 img:hover {
	transform: scale(1.04);
	overflow: hidden;
}

.gide {
	border-style: solid;
	border-color: #D5D5D5;
	background-color: white;
	margin-left: 10px;
	width: 260px;
	height: 30px;
	position: relative;
	bottom: 7px;
}

.back1 {
	width: 100%;
	height: 350px;
	position: relative;
	top: 150px;
	background-color: #EAEAEA;
	z-index: -10;
}

.plus {
	float: right;
}

.plusBtn {
	border-style: none;
	background-color: white;
	font-size: 12pt;
	position: relative;
	top: 5px;
	right: 10px;
}

.contents3 .plusBtn {
	background-color: #EAEAEA;
	position: relative;
	top: 20px;
}

.back2 {
	width: 100%;
	height: 400px;
	left: -45%;
	background-color: #FAECC5;
	position: relative;
	top: 300px;
	clip-path: polygon(100% 0, 100% 70%, 95% 100%, 0 100%, 0 0);
	z-index: -10;
}

.contents4 {
	float: left;
	width: 100%;
	height: 400px;
	position: relative;
	top: 190px;
}

.contents4 div {
	float: left;
}

.contents4 div p {
	position: relative;
	left: 220px;
	top: 80px;
	font-size: 19pt;
	font-weight: bold;
	line-height: 20pt;
}

.contents4 div p:nth-of-type(4) {
	position: relative;
	font-weight: none;
	left: 220px;
	top: 80px;
	font-size: 13pt;
	font-weight: normal;
	line-height: 20pt;
}

.contents4 div a p:last-of-type {
	float: left;
	font-size: 12pt;
	color: #003399;
	line-height: 20pt;
}

.contents4 div a img {
	filter: invert(14%) sepia(53%) saturate(4790%) hue-rotate(216deg)
		brightness(94%) contrast(106%);
	font-weight: normal;
	position: relative;
	left: 8px;
	top: 4px;
}

a {
	text-decoration-line: none;
	color: black;
}

a:hover {
	color: black;
}

a:active {
	color: black;
}

a:visited {
	color: black;
}

.tabset {
	position: relative;
	height: 140px;
}

.tab-panels {
	position: relative;
	bottom: 20px;
}

.tabset>input[type="radio"] {
	position: absolute;
	left: -200vw;
}

.tabset .tab-panel {
	display: none;
}

.tabset>input:first-child:checked ~ .tab-panels>.tab-panel:first-child,
	.tabset>input:nth-child(3):checked ~ .tab-panels>.tab-panel:nth-child(2)
	{
	display: block;
}

.tabset>label {
	position: relative;
	display: inline-block;
	padding: 15px 15px 25px;
	border-bottom: 0;
	cursor: pointer;
	font-weight: 600;
}

.tabset>label::after {
	content: "";
	position: absolute;
	left: 13px;
	bottom: 10px;
	width: 30px;
	height: 4px;
	background: #8d8d8d;
}

.tabset>label:hover, .tabset>input:focus+label {
	color: #003399;
}

.tabset>label:hover::after, .tabset>input:focus+label::after, .tabset>input:checked+label::after
	{
	background: #003399;
}

.tabset>input:checked+label {
	border-color: #ccc;
	border-bottom: 1px solid #fff;
	margin-bottom: -1px;
}

.tab-panel {
	padding: 30px 0;
}

#horizontalTab li img {
	filter: invert(100%) sepia(0%) saturate(7500%) hue-rotate(253deg)
		brightness(105%) contrast(108%);
}

.travel {
	padding-top: -10px;
}

.travelbtn {
	border-style: none;
	background-color: white;
	width: 200px;
	height: 25px;
}
.area{
	width: 900px;
	position: relative;
	bottom: 15px;
	
}
.mainsection{
	height:2500px;	
}
a{
	cursor: pointer;
}
/* 모달 */
		#modal1 > *{
			padding: 0px;
			margin: 0px;
		}
		
		#modal1{
			display : none;
			z-index : 999;
			position:absolute;
    		left: 30px;
    		top: 550px;
			width:70%;
			height:650px;
		}
		#modal1>#content1{
			width:500px;
			height: 390px;
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
		.modalul1 {
			width:500px;
		}
		.modalul1 li{
			list-style: none;
			float: left;
			width: 95px;
			height: 50px;
			line-height: 50px;
			position: relative;
			left:-60px;
			top:-36px;
		}
		.modalul1 li:nth-child(1){
			width: 540px;
			height: 40px;
			background-color: #F0F0F0;
			font-weight: bold;
			font-size:12pt;
			line-height: 40px;
		}
		.modalul1 li:nth-child(n+2){
			font-size:10pt;
			padding: 0 10px;
			margin: 2px 5px;
		}
		.modalul1 li:nth-child(n+2):hover{
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
		#modal2 > *{
			padding: 0px;
			margin: 0px;
		}
		
		#modal2{
			display : none;
			z-index : 999;
			position:absolute;
    		left: 280px;
    		top: 550px;
			width:70%;
			height:650px;
		}
		#modal2>#content2{
			width:500px;
			height: 390px;
			margin:100px auto;
			padding:20px;
			position: relative;
			background-color:#fff;
			box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
		}
		
		#modal2 .close{
			position:absolute;
			top:4px;
			right:4px;	
			font-size:20px;
			border:0;
			background-color:#F0F0F0;
		}
		
		#modal2 .close:hover,
		#modal2 .close:focus {
		  color : #000;
		  text-decoration: none;
		  cursor :pointer;
		}
		.modalul2 {
			width:500px;
		}
		.modalul2 li{
			list-style: none;
			float: left;
			width: 95px;
			height: 50px;
			line-height: 50px;
			position: relative;
			left:-60px;
			top:-36px;
		}
		.modalul2 li:nth-child(1){
			width: 540px;
			height: 40px;
			background-color: #F0F0F0;
			font-weight: bold;
			font-size:12pt;
			line-height: 40px;
		}
		.modalul2 li:nth-child(n+2){
			font-size:10pt;
			padding: 0 10px;
			margin: 2px 5px;
		}
		.modalul2 li:nth-child(n+2):hover{
			background-color: #5AA0FF ;
			color:white;
		}
		#btnOpen2:focus{
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

</style>
</head>

<script>
	$(document).ready(function() {
 		$('.insert1').hide();
        $('#travel1').mouseover(function(){
            $('.insert1').show();
        });
        $('#travel1').mouseout(function(){
            $('.insert1').hide();
        });
        $('.insert2').hide();
        $('#travel2').mouseover(function(){
            $('.insert2').show();
        });
        $('#travel2').mouseout(function(){
            $('.insert2').hide();
        });
        $('.insert3').hide();
        $('#travel3').mouseover(function(){
            $('.insert3').show();
        });
        $('#travel3').mouseout(function(){
            $('.insert3').hide();
        });
        $('.insert4').hide();
        $('#travel4').mouseover(function(){
            $('.insert4').show();
        });
        $('#travel4').mouseout(function(){
            $('.insert4').hide();
        });
	});	
</script>
<script>
window.onload=function(){
	document.getElementById('datechoice1').value = new Date().toISOString().substring(0, 10);
	document.getElementById('datechoice2').value = new Date().toISOString().substring(0, 10);
	var today = new Date().toISOString().substring(0, 10);
	document.getElementById('datechoice1').setAttribute("min", today);
	document.getElementById('datechoice2').setAttribute("min", today);
}
function changeDate1(){
	document.getElementById('datechoice2').setAttribute("min", document.getElementById('datechoice1').value);
	document.getElementById('datechoice2').value = document.getElementById('datechoice1').value;
}  

function getPost(mode)
{
	var myform = document.myform;
	if(mode == '01'){
		myform.action = "travel/local.travel";
	}
	else if(mode == '02'){
		myform.action = "travel/Attraction.travel";
	}
	else if(mode == '03'){
		myform.action = "flight/flightTicketSearch_go.air";
	}
	else if(mode == '04'){
		myform.action = "flight/flightTicketSearch_oneway.air";
	}
	else if(mode == '05'){
		myform.action = "hotel/hotelMainForm.ho";
	}
	myform.submit();
};

</script>
<body>
	<form name="myform">
		<%
		String mb_id = (String)session.getAttribute("mb_id"); 
		if(mb_id == null){
			%>
		<jsp:include page="overlap/index_header_login.jsp" />
		<%
		}else{
			%>
		<jsp:include page="overlap/index_header_logout.jsp" />
		<%
		}
	%>
	
<div id='modal1'>
	<div id='content1'>
		<div>
			<div class="modaltitle">
				<ul class="modalul1">
					<li>&nbsp;&nbsp;한국<input type='button' value='X' class="close" id='btnClose1'/></li>
					<li>서울/인천</li>
					<li>제주</li>
				</ul>
			</div>
			<div class="modaltitle">
				<ul class="modalul1">
					<li>&nbsp;&nbsp;중국</li>
					<li>도쿄</li>
					<li>오사카</li>
					<li>교토</li>
					<li>삿포로</li>
					<li>나고야</li>
					<li>오키나와</li>
				</ul>
			</div>			
			<div class="modaltitle">
				<ul class="modalul1">
					<li>&nbsp;&nbsp;베트남</li>
					<li>호치민</li>
					<li>호이안</li>
					<li>다낭</li>
					<li>하노이</li>
				</ul>
			</div>
			<div class="modaltitle">
				<ul class="modalul1">
					<li>&nbsp;&nbsp;기타 국가</li>
					<li>싱가포르</li>
					<li>홍콩</li>					
				</ul>
			</div>
			
		</div>
	</div>
</div>

<div id='modal2'>
	<div id='content2'>
		<div>
			<div class="modaltitle">
				<ul class="modalul2">
					<li>&nbsp;&nbsp;한국<input type='button' value='X' class="close" id='btnClose2'/></li>
					<li>서울/인천</li>
					<li>제주</li>
				</ul>
			</div>
			<div class="modaltitle">
				<ul class="modalul2">
					<li>&nbsp;&nbsp;중국</li>
					<li>도쿄</li>
					<li>오사카</li>
					<li>교토</li>
					<li>삿포로</li>
					<li>나고야</li>
					<li>오키나와</li>
				</ul>
			</div>			
			<div class="modaltitle">
				<ul class="modalul2">
					<li>&nbsp;&nbsp;베트남</li>
					<li>호치민</li>
					<li>호이안</li>
					<li>다낭</li>
					<li>하노이</li>
				</ul>
			</div>
			<div class="modaltitle">
				<ul class="modalul2">
					<li>&nbsp;&nbsp;기타 국가</li>
					<li>싱가포르</li>
					<li>홍콩</li>					
				</ul>
			</div>
			
		</div>
	</div>
</div>
	
		<section>
			<div class="main_visual_wrap">
				<div class="imageBox">
					<div id="revolver" class="revolver container stack">
						<img class="slide" src="assets/img/main01.jpg" width="1920px"
							height="500px" /> <img class="slide hidden"
							src="assets/img/main02.jpg" width="1920px" height="500px" /> <img
							class="slide hidden" src="assets/img/main03.jpg"
							width="1920px" height="500px" /> <img class="slide hidden"
							src="assets/img/main04.jpg" width="1920px" height="500px" /> <img
							class="slide hidden" src="assets/img/main05.jpg"
							width="1920px" height="500px" />
					</div>
				</div>
			</div>
			<div class="search">
				<div id="horizontalTab">
					<ul>
						<li style="background-color: rgba(211, 10, 20, .7);"><a
							href="#tab-1"><img src="img/icon/passenger.png"
								class="image">여행</a></li>
						<li style="background-color: rgba(34, 42, 115, .7);"><a
							href="#tab-2"><img src="img/icon/flying-airplane.png"
								class="image">항공</a></li>
						<li style="background-color: rgba(212, 157, 2, .7);"><a
							href="#tab-3"><img src="img/icon/hotel.png" class="image">호텔</a></li>
					</ul>
					<div id="tab-1">
					<div class="tabset">
							<!-- Tab 1 -->
							<input type="radio" name="tabset1" id="tab3"
								aria-controls="marzen1" name='' checked> <label
								for="tab3">지역</label>
							<!-- Tab 2 -->
							<input type="radio" name="tabset1" id="tab4"
								aria-controls="rauchbier2" name=''> <label for="tab4">명소</label>
							<div class="tab-panels">
								<section id="marzen1" class="tab-panel">
									<div class="searchBot">
										<div style="float: left; width: 1080px; border: 1px solid #E7E7E7;">
											<input type="text" placeholder="원하는 지역을 입력하세요." class="area" name="local">			
											<input type='button' class="travelsearch" onClick="getPost('01')">
										</div>
								</section>
								<section id="rauchbier2" class="tab-panel">
									<div class="searchBot">
										<div
											style="float: left; width: 1080px; border: 1px solid #E7E7E7;">
									<input type="text" placeholder="원하는 명소를 입력하세요." class="area" name="att">
									<input type='button' class="travelsearch" onClick="getPost('02')">
										</div>
									</div>
								</section>
							</div>
						</div>
					</div>
					<div id="tab-2">
						<div class="tabset">
							<!-- Tab 1 -->
							<input type="radio" name="tabset" id="tab1"
								aria-controls="marzen" name='' checked> <label
								for="tab1">왕복</label>
							<!-- Tab 2 -->
							<input type="radio" name="tabset" id="tab2"
								aria-controls="rauchbier" name=''> <label for="tab2">편도</label>
							<div class="tab-panels">
								<section id="marzen" class="tab-panel">
									<div class="searchBot">
										<div
											style="float: left; width: 1080px; border: 1px solid #E7E7E7;">
											<section class="airplainchoice">
										<img src="img/icon/take-off.png" width="20" height="20" class="flighticon"> 
										
												<input type="text" placeholder="출발지" class="departure"
													name='departure1' id='btnOpen1'>
											</section>
											<section class="airplainchoice">
												<img src="img/icon/landing.png" width="20" height="20" class="flighticon"> 
												<input type="text" placeholder="도착지" class="arrive"
													name='arrive1' id='btnOpen2'> 
											</section>
											<section class="airplainchoice">
												<input type="date" placeholder="출발일" id="datechoice1"
													name='departureDay1'  onchange="changeDate1()">
											</section>
											<section class="airplainchoice">
												<input type="date" placeholder="도착일" id="datechoice2"
													name='arrivalDay1'>
											</section>
											<section class="airplainchoice">
												<input type='button' class="searchicon2"
													onClick="getPost('03')">
											</section>
										</div>
									</div>
								</section>
								<section id="rauchbier" class="tab-panel">
									<div class="searchBot">
										<div>
											<section class="airplainchoice">
											<img src="img/icon/take-off.png" width="20" height="20" class="flighticon"> 
												<input type="text" placeholder="출발지" class="departure">
											</section>
											<section class="airplainchoice">
											<img src="img/icon/landing.png" width="20" height="20" class="flighticon"> 
												<input type="text" placeholder="도착지" class="arrive">
												<select class="people" name="flight_people2">
													<option>인원수</option>
													<option>1</option>
													<option>2</option>
													<option>3</option>
												</select> <select class="seatGrade" name="seatGrade2">
													<option>좌석등급</option>
													<option>이코노미 클래스</option>
													<option>비지니스 클래스</option>
													<option>퍼스트 클래스</option>
												</select>
											</section>
											<section class="airplainchoice">
												<input type="date" placeholder="출발일" id="datechoice5"
													name='departureDay2'>
											</section>
											<section class="airplainchoice">

												<input type='button' class="searchicon3"
													onClick="getPost('04')">
											</section>
										</div>
									</div>
								</section>
							</div>
						</div>
					</div>
					<div id="tab-3">
						<h3 style="font-size: 14pt;">머무르고 싶은 지역을 입력하세요.</h3>

						<div>
							<img src="img/icon/hotel.png" width="20" height="20"
								class="hotelIcon"> <input type="text"
								placeholder="여행지 또는 숙소 이름으로 검색" size="40"> <select>
								<option value="인원수">인원수</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
							</select> <input type="date" name="checkin" id="datechoice3"> <input
								type="date" name="checkout" id="datechoice4"> <input
								type="button" name="hotelBtn" class="hotelBtn"
								onClick="getPost('05')">
						</div>

						<script>
						document.getElementById('datechoice1').valueAsDate=new Date();
						document.getElementById('datechoice2').valueAsDate=new Date();
						document.getElementById('datechoice3').valueAsDate=new Date();
						document.getElementById('datechoice4').valueAsDate=new Date();
						document.getElementById('datechoice5').valueAsDate=new Date();
						$("#datechoice1").datepicker();
						$("#datechoice2").datepicker();
						$("#datechoice3").datepicker();
						$("#datechoice4").datepicker();
						$("#datechoice5").datepicker();
					</script>
					</div>
				</div>
			</div>
		</section>
		<section class="mainsection">
			<div class="contents">
				
				<div class="travel">
					<div class="contents2">
						<h5 style="margin-left: -15px;">추천 항공권</h5>
						<a href="">
							<div class="travellist2">
								<img src="img/travel/phuket.jpg" width="280px" height="350px">
								<div class="detail">
									<p>푸켓</p>
									<p>일반석 왕복</p>
									<p>KRW 1,564,200~</p>
								</div>
							</div>
						</a> <a href="">
							<div class="travellist2">
								<img src="img/travel/guam.jpg" width="280px" height="350px">
								<div class="detail">
									<p>괌</p>
									<p>일반석 왕복</p>
									<p>KRW 1,637,600~</p>
								</div>
							</div>
						</a> <a href="">
							<div class="travellist2">
								<img src="img/travel/berlin.jpg" width="280px" height="350px">
								<div class="detail">
									<p>베를린</p>
									<p>일반석 왕복</p>
									<p>KRW 1,948,000~</p>
								</div>
							</div>
						</a> <a href="">
							<div class="travellist2">
								<img src="img/travel/cebu.jpg" width="280px" height="350px">
								<div class="detail">
									<p>세부</p>
									<p>일반석 왕복</p>
									<p>KRW 1,878,200~</p>
								</div>
							</div>
						</a>
						<div class="plus">
							<input type="button" name="plus" class="plusBtn" value="> 더보기">
						</div>
					</div>
				</div>
				<div class="travel">
					<div class="contents3">
						<h5 style="margin-left: 65px;">인기 호텔</h5>
						<a href="">
							<div class="travellist3">
								<div>
									<img src="img/hotel/hotel01.jpg" width="280px"
										height="230px">
								</div>
								<p>
									서울 신라호텔 <img src="img/icon/star.png" width="15px"
										height="15px"> <img src="img/icon/star.png"
										width="15px" height="15px"> <img
										src="img/icon/star.png" width="15px" height="15px"> <img
										src="img/icon/star.png" width="15px" height="15px">
								</p>
								<p>
									<b
										style="padding: 5px; background-color: #002266; color: white;">4.5/5</b>
									이용자 리뷰 795개
								</p>
								<p>
									<b style="color: black; font-size: 10pt;">최저가</b> 380,000원
								</p>
							</div>
						</a> <a href="">
							<div class="travellist3">
								<div>
									<img src="img/hotel/hotel02.jpg" width="280px"
										height="230px">
								</div>
								<p>
									시그니엘 부산 <img src="img/icon/star.png" width="15px"
										height="15px"> <img src="img/icon/star.png"
										width="15px" height="15px"> <img
										src="img/icon/star.png" width="15px" height="15px"> <img
										src="img/icon/star.png" width="15px" height="15px">
								</p>
								<p>
									<b
										style="padding: 5px; background-color: #002266; color: white;">4.5/5</b>
									이용자 리뷰 795개
								</p>
								<p>
									<b style="color: black; font-size: 10pt;">최저가</b> 380,000원
								</p>
							</div>
						</a> <a href="">
							<div class="travellist3">
								<div>
									<img src="img/hotel/hotel03.jpg" width="280px"
										height="230px">
								</div>
								<p>
									그랜드 하얏트 제주 <img src="img/icon/star.png" width="15px"
										height="15px"> <img src="img/icon/star.png"
										width="15px" height="15px"> <img
										src="img/icon/star.png" width="15px" height="15px"> <img
										src="img/icon/star.png" width="15px" height="15px">
								</p>
								<p>
									<b
										style="padding: 5px; background-color: #002266; color: white;">4.5/5</b>
									이용자 리뷰 795개
								</p>
								<p>
									<b style="color: black; font-size: 10pt;">최저가</b> 380,000원
								</p>
							</div>
						</a> <a href="">
							<div class="travellist3">
								<div>
									<img src="img/hotel/hotel04.jpg" width="280px"
										height="230px">
								</div>
								<p>
									파라다이스 시티 인천 <img src="img/icon/star.png" width="15px"
										height="15px"> <img src="img/icon/star.png"
										width="15px" height="15px"> <img
										src="img/icon/star.png" width="15px" height="15px"> <img
										src="img/icon/star.png" width="15px" height="15px">
								</p>
								<p>
									<b
										style="padding: 5px; background-color: #002266; color: white;">4.5/5</b>
									이용자 리뷰 795개
								</p>	
								<p>
									<b style="color: black; font-size: 10pt;">최저가</b> 380,000원
								</p>
							</div>
						</a>
						<div class="plus">
							<input type="button" name="plus" class="plusBtn" value="> 더보기">
						</div>
					</div>
					<div class="contents4">
						<div>
							<img src="img/dutyfree/shop.jpg" width="580" height="400">
						</div>
						<div>
							<p>24시간 언제 어디서든</p>
							<p>출굴 3시간 전까지</p>
							<p>인터넷으로 간편하게</p>
							<p>온라인 면세점으로 쇼핑 시간을 절약하세요!</p>
							<a href="shopping/itemMain.jsp"><p>면세점 둘러보기
									<img src="img/icon/right-arrow2.png" width="20" height="20"></p></a>
						</div>

					</div>
				</div>
			</div>
			<div class="back1"></div>
			<div class="back2"></div>

		</section>
		<jsp:include page="overlap/footer.jsp" />


		<script src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
		<script src="js/jquery.revolver.min.js"></script>
		<script src="js/prettify.js"></script>
		<script type="text/javascript">
            var $revolver = $('#revolver').revolver(),
                revolver  = $revolver.data('revolver'),
                $controls = $('.controls');
            $controls.find('.first, .previous, .next, .last, .play, .stop, .pause, .restart').click(function(e){
                e.preventDefault();
                revolver[this.className]();
            });

            $controls.find('.goto').click(function(e){
                e.preventDefault();
                revolver.goTo($(this).data('goto'));
            });
        </script>
		<script src="js/jquery-2.1.0.min.js"></script>
		<script src="js/jquery.responsiveTabs.js" type="text/javascript"></script>
		<script type="text/javascript">
	        $(document).ready(function () {
	            var $tabs = $('#horizontalTab');
	            $tabs.responsiveTabs({
	                rotate: false,
	                startCollapsed: 'accordion',
	                collapsible: 'accordion',
	                setHash: true,
	                disabled: [3,4],
	                click: function(e, tab) {
	                    $('.info').html('Tab <strong>' + tab.id + '</strong> clicked!');
	                },
	                activate: function(e, tab) {
	                    $('.info').html('Tab <strong>' + tab.id + '</strong> activated!');
	                },
	                activateState: function(e, state) {
	                    $('.info').html('Switched from <strong>' + state.oldState + '</strong> state to <strong>' + state.newState + '</strong> state!');
	                }
	            });

	            $('#start-rotation').on('click', function() {
	                $tabs.responsiveTabs('startRotation', 1000);
	            });
	            $('#stop-rotation').on('click', function() {
	                $tabs.responsiveTabs('stopRotation');
	            });
	            $('#start-rotation').on('click', function() {
	                $tabs.responsiveTabs('active');
	            });
	            $('#enable-tab').on('click', function() {
	                $tabs.responsiveTabs('enable', 3);
	            });
	            $('#disable-tab').on('click', function() {
	                $tabs.responsiveTabs('disable', 3);
	            });
	            $('.select-tab').on('click', function() {
	                $tabs.responsiveTabs('activate', $(this).val());
	            });
	        });
	        
	        var btnOpen1  = document.getElementById('btnOpen1');
	    	var btnClose1 = document.getElementById('btnClose1');
	    	
	    	// modal 창을 감춤
	    	var closeRtn1 = function(){
	    		var modal1 = document.getElementById('modal1');
	    		modal1.style.display = 'none';
	    	}
	    	// modal 창을 보여줌
	    	btnOpen1.onclick = function(){
	    		var modal1 = document.getElementById('modal1');
	    		modal1.style.display = 'block';
	    	}
	    	window.onclick = function(e) {
	    		if(e.target == modal1){
	    			modal1.style.display = 'none';
	    		}
	    	}
	    	btnClose1.onclick = closeRtn1;
	    	
	    	$(document).ready(function() {
	    		$(".modalul1 li:nth-child(n+2)").on('click', function(e) {
	    			$('#btnOpen1').val($(this).text());
	    			modal1.style.display = 'none'; 
	    		}); 
	    	});
	    	
	    	// modal 창 1번 
	    	var btnOpen2  = document.getElementById('btnOpen2');
	    	var btnClose2 = document.getElementById('btnClose2');
	    	
	    	// modal 창을 감춤
	    	var closeRtn2 = function(){
	    		var modal2 = document.getElementById('modal2');
	    		modal2.style.display = 'none';
	    	}
	    	// modal 창을 보여줌
	    	btnOpen2.onclick = function(){
	    		var modal2 = document.getElementById('modal2');
	    		modal2.style.display = 'block';
	    	}
	    	window.onclick = function(e) {
	    		if(e.target == modal2){
	    			modal2.style.display = 'none';
	    		}
	    	}
	    	btnClose2.onclick = closeRtn2;
	    	$(document).ready(function() {
	    		$(".modalul2 li:nth-child(n+2)").on('click', function(e) {
	    			$('#btnOpen2').val($(this).text());
	    			modal2.style.display = 'none';
	    		}); 
	    	}); 
   		</script>

	</form>
</body>
</html>