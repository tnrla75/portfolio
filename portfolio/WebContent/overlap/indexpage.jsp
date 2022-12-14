<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<meta charset="utf-8">
<link
	href="https://fonts.googleapis.com/css2?family=Cairo&family=Indie+Flower&family=Koulen&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="../css/style.css" />
<link rel="stylesheet" type="text/css" href="../css/header_footer.css">
<link type="text/css" rel="stylesheet" href="../css/responsive-tabs.css" />
<link type="text/css" rel="stylesheet" href="../css/style2.css" />
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
	background: url(../img/icon/loupe.png);
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
	background: url(../img/icon/seat.png);
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

.seatGrade2 {
	width: 150px;
	padding: 5px;
	border-style: solid;
	border-width: 0;
	background: url(../img/icon/seat.png);
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
	background: url(../img/icon/loupe.png);
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
	background: url(../img/icon/loupe.png);
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
	background: url(../img/icon/loupe.png);
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
	background: url(../img/icon/loupe.png);
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
	background-image: url(../img/icon/people.png);
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
	background: url(../img/icon/pin.png);
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
	height: 400px;
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
	font-size: 17pt;
	font-weight: bold;
	margin-left: 15px;
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

function getPost(mode)
{
	var myform = document.myform;
	if(mode == '01'){
		myform.action = "../travel/local.travel";
	}
	else if(mode == '02'){
		myform.action = "../travel/Attraction.travel";
	}
	else if(mode == '03'){
		myform.action = "../flight/flightTicketSearch_go.air";
	}
	else if(mode == '04'){
		myform.action = "../flight/flightTicketSearch_oneway.air";
	}
	else if(mode == '05'){
		myform.action = "../hotel/hotelMainForm.ho";
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
		<jsp:include page="../overlap/header_login.jsp" />
		<%
		}else{
			%>
		<jsp:include page="../overlap/header_logout.jsp" />
		<%
		}
	%>
		<section>
			<div class="main_visual_wrap">
				<div class="imageBox">
					<div id="revolver" class="revolver container stack">
						<img class="slide" src="../assets/img/main01.jpg" width="1920px"
							height="500px" /> <img class="slide hidden"
							src="../assets/img/main02.jpg" width="1920px" height="500px" /> <img
							class="slide hidden" src="../assets/img/main03.jpg"
							width="1920px" height="500px" /> <img class="slide hidden"
							src="../assets/img/main04.jpg" width="1920px" height="500px" /> <img
							class="slide hidden" src="../assets/img/main05.jpg"
							width="1920px" height="500px" />
					</div>
				</div>
			</div>
			<div class="search">
				<div id="horizontalTab">
					<ul>
						<li style="background-color: rgba(211, 10, 20, .7);"><a
							href="#tab-1"><img src="../img/icon/passenger.png"
								class="image">??????</a></li>
						<li style="background-color: rgba(34, 42, 115, .7);"><a
							href="#tab-2"><img src="../img/icon/flying-airplane.png"
								class="image">??????</a></li>
						<li style="background-color: rgba(212, 157, 2, .7);"><a
							href="#tab-3"><img src="../img/icon/hotel.png" class="image">??????</a></li>
					</ul>
					<div id="tab-1">
					<div class="tabset">
							<!-- Tab 1 -->
							<input type="radio" name="tabset1" id="tab3"
								aria-controls="marzen1" name='' checked> <label
								for="tab3">??????</label>
							<!-- Tab 2 -->
							<input type="radio" name="tabset1" id="tab4"
								aria-controls="rauchbier2" name=''> <label for="tab4">??????</label>
							<div class="tab-panels">
								<section id="marzen1" class="tab-panel">
									<div class="searchBot">
										<div style="float: left; width: 1080px; border: 1px solid #E7E7E7;">
											<input type="text" placeholder="????????? ????????? ???????????????." class="area" name="local">			
											<input type='button' class="travelsearch" onClick="getPost('01')">
										</div>
								</section>
								<section id="rauchbier2" class="tab-panel">
									<div class="searchBot">
										<div
											style="float: left; width: 1080px; border: 1px solid #E7E7E7;">
									<input type="text" placeholder="????????? ????????? ???????????????." class="area" name="att">
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
													name='departure1'>
											</section>
											<section class="airplainchoice">
												<img src="../img/icon/landing.png" width="20" height="20" class="flighticon"> 
												<input type="text" placeholder="?????????" class="arrive"
													name='arrive1'> 
													<select class="people"
													name="flight_people1">
													<option>?????????</option>
													<option>1</option>
													<option>2</option>
													<option>3</option>
												</select> <select class="seatGrade" name='seatGrade1'>
													<option>????????????</option>
													<option>???????????? ?????????</option>
													<option>???????????? ?????????</option>
													<option>????????? ?????????</option>
												</select>
											</section>
											<section class="airplainchoice">
												<input type="date" placeholder="?????????" id="datechoice1"
													name='departureDay1'>
											</section>
											<section class="airplainchoice">
												<input type="date" placeholder="?????????" id="datechoice2"
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
											<img src="../img/icon/take-off.png" width="20" height="20" class="flighticon"> 
												<input type="text" placeholder="?????????" class="departure">
											</section>
											<section class="airplainchoice">
											<img src="../img/icon/landing.png" width="20" height="20" class="flighticon"> 
												<input type="text" placeholder="?????????" class="arrive">
												<select class="people" name="flight_people2">
													<option>?????????</option>
													<option>1</option>
													<option>2</option>
													<option>3</option>
												</select> <select class="seatGrade" name="seatGrade2">
													<option>????????????</option>
													<option>???????????? ?????????</option>
													<option>???????????? ?????????</option>
													<option>????????? ?????????</option>
												</select>
											</section>
											<section class="airplainchoice">
												<input type="date" placeholder="?????????" id="datechoice5"
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
						<h3 style="font-size: 14pt;">???????????? ?????? ????????? ???????????????.</h3>

						<div>
							<img src="../img/icon/hotel.png" width="20" height="20"
								class="hotelIcon"> <input type="text"
								placeholder="????????? ?????? ?????? ???????????? ??????" size="40"> <select>
								<option value="?????????">?????????</option>
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
					<h5 style="margin-left: -10px;">?????? ?????????</h5>
					<a href="">
						<div class="travellist1" id="travel1">
							<div style="width: 280px; height: 230px; overflow: hidden;">
								<img src="../img/travel/austria.jpg" width="280px"
									height="230px">
								<p class="insert1">
									????????? ????????????<img src="../img/icon/next.png" width="25" height="25">
								</p>
							</div>
							<div style="width: 280px; height: 100px;">
								<a
									style="margin-left: 20px; font-size: 13pt; font-weight: bold;"
									href="#">???????????????</a>
								<div>
									<div
										style="margin: 5px auto 0 auto; border: 2px solid #BDBDBD; width: 230px; height: auto;">
										<button class="travelbtn"
											style="border-style: none; background-color: white; width: 200px; height: 25px;">
											<i style="float: left; margin-top: 3px;"
												class="fa-solid fa-location-dot"></i>????????? ????????????<i
												style="float: right; margin-top: 3px;"
												class="fa-solid fa-chevron-right"></i>
										</button>
									</div>
									<div
										style="margin: 5px auto 0 auto; border: 2px solid #BDBDBD; width: 230px; height: auto;">
										<button class="travelbtn">
											<i style="float: left; margin-top: 3px;"
												class="fa-solid fa-plane"></i>???????????????<i
												style="float: right; margin-top: 3px;"
												class="fa-solid fa-chevron-right"></i>
										</button>
									</div>
								</div>
							</div>
							<!-- <input type="button" class="gide" value="?????? ?????????"> -->
						</div>
					</a> <a href="">
						<div class="travellist1" id="travel2">
							<div style="width: 280px; height: 230px; overflow: hidden;">
								<img src="../img/travel/bolivia.jpg" width="280px"
									height="230px">
								<p class="insert2">
									????????? ????????????<img src="../img/icon/next.png" width="25" height="25">
								</p>
							</div>
							<div style="width: 280px; height: 100px;">
								<a
									style="margin-left: 20px; font-size: 13pt; font-weight: bold;"
									href="#">????????????</a>
								<div>
									<div
										style="margin: 5px auto 0 auto; border: 2px solid #BDBDBD; width: 230px; height: auto;">
										<button class="travelbtn">
											<i style="float: left; margin-top: 3px;"
												class="fa-solid fa-location-dot"></i>????????? ????????????<i
												style="float: right; margin-top: 3px;"
												class="fa-solid fa-chevron-right"></i>
										</button>
									</div>
									<div
										style="margin: 5px auto 0 auto; border: 2px solid #BDBDBD; width: 230px; height: auto;">
										<button class="travelbtn"
											style="border-style: none; background-color: white; width: 200px; height: 25px;">
											<i style="float: left; margin-top: 3px;"
												class="fa-solid fa-plane"></i>???????????????<i
												style="float: right; margin-top: 3px;"
												class="fa-solid fa-chevron-right"></i>
										</button>
									</div>
								</div>
							</div>
						</div>
					</a> <a href="">
						<div class="travellist1" id="travel3">
							<div style="width: 280px; height: 230px; overflow: hidden;">
								<img src="../img/travel/laos.jpg" width="280px" height="230px">
								<p class="insert3">
									????????? ????????????<img src="../img/icon/next.png" width="25" height="25">
								</p>
							</div>
							<div style="width: 280px; height: 100px;">
								<a
									style="margin-left: 20px; font-size: 13pt; font-weight: bold;"
									href="#">?????????</a>
								<div>
									<div
										style="margin: 5px auto 0 auto; border: 2px solid #BDBDBD; width: 230px; height: auto;">
										<button class="travelbtn">
											<i style="float: left; margin-top: 3px;"
												class="fa-solid fa-location-dot"></i>????????? ????????????<i
												style="float: right; margin-top: 3px;"
												class="fa-solid fa-chevron-right"></i>
										</button>
									</div>
									<div style="margin: 5px auto 0 auto; border: 2px solid #BDBDBD; width: 230px; height: auto;">
										<button class="travelbtn">
											<i style="float: left; margin-top: 3px;"
												class="fa-solid fa-plane"></i>???????????????<i
												style="float: right; margin-top: 3px;"
												class="fa-solid fa-chevron-right"></i>
										</button>
									</div>
								</div>
							</div>
						</div>
					</a> <a href="">
						<div class="travellist1" id="travel4">
							<div style="width: 280px; height: 230px; overflow: hidden;">
								<img src="../img/travel/switzerland.jpg" width="280px"
									height="230px">
								<p class="insert4">
									????????? ????????????<img src="../img/icon/next.png" width="25" height="25">
								</p>
							</div>
							<div style="width: 280px; height: 100px;">
								<a
									style="margin-left: 20px; font-size: 13pt; font-weight: bold;"
									href="#">?????????</a>
								<div>
									<div
										style="margin: 5px auto 0 auto; border: 2px solid #BDBDBD; width: 230px; height: auto;">
										<button class="travelbtn">
											<i style="float: left; margin-top: 3px;"
												class="fa-solid fa-location-dot"></i>????????? ????????????<i
												style="float: right; margin-top: 3px;"
												class="fa-solid fa-chevron-right"></i>
										</button>
									</div>
									<div
										style="margin: 5px auto 0 auto; border: 2px solid #BDBDBD; width: 230px; height: auto;">
										<button class="travelbtn">
											<i style="float: left; margin-top: 3px;"
												class="fa-solid fa-plane"></i>???????????????<i
												style="float: right; margin-top: 3px;"
												class="fa-solid fa-chevron-right"></i>
										</button>
									</div>
								</div>
							</div>
						</div>
					</a>
					<div class="plus">
						<input type="button" name="plus" class="plusBtn" value="> ?????????">
					</div>
				</div>
				<div class="travel">
					<div class="contents2">
						<h5 style="margin-left: -15px;">?????? ?????????</h5>
						<a href="">
							<div class="travellist2">
								<img src="../img/travel/phuket.jpg" width="280px" height="350px">
								<div class="detail">
									<p>??????</p>
									<p>????????? ??????</p>
									<p>KRW 1,564,200~</p>
								</div>
							</div>
						</a> <a href="">
							<div class="travellist2">
								<img src="../img/travel/guam.jpg" width="280px" height="350px">
								<div class="detail">
									<p>???</p>
									<p>????????? ??????</p>
									<p>KRW 1,637,600~</p>
								</div>
							</div>
						</a> <a href="">
							<div class="travellist2">
								<img src="../img/travel/berlin.jpg" width="280px" height="350px">
								<div class="detail">
									<p>?????????</p>
									<p>????????? ??????</p>
									<p>KRW 1,948,000~</p>
								</div>
							</div>
						</a> <a href="">
							<div class="travellist2">
								<img src="../img/travel/cebu.jpg" width="280px" height="350px">
								<div class="detail">
									<p>??????</p>
									<p>????????? ??????</p>
									<p>KRW 1,878,200~</p>
								</div>
							</div>
						</a>
						<div class="plus">
							<input type="button" name="plus" class="plusBtn" value="> ?????????">
						</div>
					</div>
				</div>
				<div class="travel">
					<div class="contents3">
						<h5 style="margin-left: 65px;">?????? ??????</h5>
						<a href="">
							<div class="travellist3">
								<div>
									<img src="../img/hotel/hotel01.jpg" width="280px"
										height="230px">
								</div>
								<p>
									?????? ???????????? <img src="../img/icon/star.png" width="15px"
										height="15px"> <img src="../img/icon/star.png"
										width="15px" height="15px"> <img
										src="../img/icon/star.png" width="15px" height="15px"> <img
										src="../img/icon/star.png" width="15px" height="15px">
								</p>
								<p>
									<b
										style="padding: 5px; background-color: #002266; color: white;">4.5/5</b>
									????????? ?????? 795???
								</p>
								<p>
									<b style="color: black; font-size: 10pt;">?????????</b> 380,000???
								</p>
							</div>
						</a> <a href="">
							<div class="travellist3">
								<div>
									<img src="../img/hotel/hotel02.jpg" width="280px"
										height="230px">
								</div>
								<p>
									???????????? ?????? <img src="../img/icon/star.png" width="15px"
										height="15px"> <img src="../img/icon/star.png"
										width="15px" height="15px"> <img
										src="../img/icon/star.png" width="15px" height="15px"> <img
										src="../img/icon/star.png" width="15px" height="15px">
								</p>
								<p>
									<b
										style="padding: 5px; background-color: #002266; color: white;">4.5/5</b>
									????????? ?????? 795???
								</p>
								<p>
									<b style="color: black; font-size: 10pt;">?????????</b> 380,000???
								</p>
							</div>
						</a> <a href="">
							<div class="travellist3">
								<div>
									<img src="../img/hotel/hotel03.jpg" width="280px"
										height="230px">
								</div>
								<p>
									????????? ????????? ?????? <img src="../img/icon/star.png" width="15px"
										height="15px"> <img src="../img/icon/star.png"
										width="15px" height="15px"> <img
										src="../img/icon/star.png" width="15px" height="15px"> <img
										src="../img/icon/star.png" width="15px" height="15px">
								</p>
								<p>
									<b
										style="padding: 5px; background-color: #002266; color: white;">4.5/5</b>
									????????? ?????? 795???
								</p>
								<p>
									<b style="color: black; font-size: 10pt;">?????????</b> 380,000???
								</p>
							</div>
						</a> <a href="">
							<div class="travellist3">
								<div>
									<img src="../img/hotel/hotel04.jpg" width="280px"
										height="230px">
								</div>
								<p>
									??????????????? ?????? ?????? <img src="../img/icon/star.png" width="15px"
										height="15px"> <img src="../img/icon/star.png"
										width="15px" height="15px"> <img
										src="../img/icon/star.png" width="15px" height="15px"> <img
										src="../img/icon/star.png" width="15px" height="15px">
								</p>
								<p>
									<b
										style="padding: 5px; background-color: #002266; color: white;">4.5/5</b>
									????????? ?????? 795???
								</p>
								<p>
									<b style="color: black; font-size: 10pt;">?????????</b> 380,000???
								</p>
							</div>
						</a>
						<div class="plus">
							<input type="button" name="plus" class="plusBtn" value="> ?????????">
						</div>
					</div>
					<div class="contents4">
						<div>
							<img src="../img/dutyfree/shop.jpg" width="580" height="400">
						</div>
						<div>
							<p>24?????? ?????? ????????????</p>
							<p>?????? 3?????? ?????????</p>
							<p>??????????????? ????????????</p>
							<p>????????? ??????????????? ?????? ????????? ???????????????!</p>
							<a href="../shopping/itemMain.jsp"><p>????????? ????????????
									<img src="../img/icon/right-arrow2.png" width="20" height="20"></p></a>
						</div>

					</div>
				</div>
			</div>
			<div class="back1"></div>
			<div class="back2"></div>

		</section>
		<jsp:include page="../overlap/footer.jsp" />


		<script src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
		<script src="../js/jquery.revolver.min.js"></script>
		<script src="../js/prettify.js"></script>
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
		<script src="../js/jquery-2.1.0.min.js"></script>
		<script src="../js/jquery.responsiveTabs.js" type="text/javascript"></script>
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
   		</script>

	</form>
</body>
</html>