<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@page import="vo.Travellocal"%> 
<%@page import="vo.Travelatt"%> 
<%@page import="vo.Travelimg"%>  
<%@page import="vo.Travelattandimg"%>
<% 
	Travellocal travellocal=(Travellocal)request.getAttribute("travelocal");
	ArrayList<Travelattandimg> travelatt=(ArrayList<Travelattandimg>)request.getAttribute("travelimg");
%> 
<!DOCTYPE html>
<html>
<head>
<title>local</title>
	<meta charset="utf-8">
	<link href="https://fonts.googleapis.com/css2?family=Cairo&family=Indie+Flower&family=Koulen&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="../css/header_footer.css">
	<link type="text/css" rel="stylesheet" href="../css/responsive-tabs.css" />
    <link type="text/css" rel="stylesheet" href="../css/style.css" />
    <script src="http://use.fontawesome.com/releases/v6.1.2/js/all.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<style>
		* {
 			 box-sizing: border-box;
		}
		section{
			width:1200px;
			margin: 20px auto 50px auto;
		}
		.travel:last-of-type {
			position: relative;
			top: 50px;
		}
		.contents1 {
			width: 1060px;
			height: 500px;
			margin:10px auto;
		}
		.contents2 {
			width: 1060px;
			height: 350px;
			margin:0 auto;
			position: relative;
			top: 10px;
		}
		.travellist2 {
			float: left;
			border-style: solid;
			height: 250px;
			box-shadow: 7px 7px 7px #BDBDBD;
			border-width: 2px;
			border-color: #BDBDBD;
			margin-left: 10px;
			position: relative;
			overflow: hidden;
		}
	.travellist2 p {
			padding-top: 15px;
			font-size: 15pt;
			font-weight: bold;
			margin-left: 10px;
			line-height: 5pt;
		}
		.travellist2>img{
			transition: all 0.2s linear;
			width: 250px; 
			height: 250px;
		}
		.travellist2>img:hover{
			transform: scale(1.04);
			overflow: hidden;
		}
		.detail {
			position: relative;
			height: 50px;
			bottom: 74px;
			border-style: 100px;
			background-color:rgba(0,0,0,.6);
			color: white;
		}
		.localmap{
			margin-top: -70px;
			margin-right: 15px;
			width:400px;
			height: 400px;
			float: right;
		}
		.localmap img{
		width:400px;
		height:400px;
		}
		.localcontent{
			width: 600px;
			height: 330px;
			margin:-15px 0 0 10px;
			padding: 10px;
			font-size: 13pt;
			background-color: rgba(234, 234, 234, 0.4);
			border-radius: 5px;
		}
		.contents1 p{
			font-size: 30pt;
			width: 600px;
			height: 50px;
			margin-left: 15px;
		}
		.iconmenu{
			box-sizing: border-box;
			width: 1200px;	
			height: 180px;
			margin: 70px auto 50px auto;
		
		}
		.icon{
		 box-shadow: 5px 5px 5px #B5C1DB; 
		border-radius: 70px;
		box-sizing: border-box;
		width: 130px;
		height: 130px;
		margin-left: 135px;
		cursor: pointer;

		}
		.iconimg {
			width: 50px;
			margin: 20px auto;
		
		}
		.iconp{
			width:110px;
			text-align: center;
			margin: 0 auto;
		}
		
	 @import url('https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700,700i,900,900i');
	 @import url('https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i');
	 
	 .carousel {
    width: 1400px;
    height: 700px;
    margin-left: -100px;
    max-width: 1400px;
    max-height: 550px;   
    overflow: hidden;
  position: relative;
  box-shadow: 7px 7px 7px #BDBDBD;
  
}

.carousel-item {
  visibility:visible;
    display: flex;
    width: 100%;
    height: 100%;
    align-items: center;
   
    position: relative;
    background-color: #fff;
    flex-shrink: 0;
   -webkit-flex-shrink: 0;
    position: absolute;
    z-index: 0;
  transition: 0.6s all linear;
}

.carousel-item__info {
  height: 100%;
  display: flex;
  justify-content: center;
  flex-direction: column;
  
    display: -webkit-flex;
  -webkit-justify-content: center;
  -webkit-flex-direction: column;
  
  order: 1;
  left: 0;
  margin: auto;
  padding: 0 40px;
  width: 40%;

}

.carousel-item__image {
    width: 60%;
    height: 100%;
    order: 2;
    align-self: flex-end;
    flex-basis: 60%;
  
      -webkit-order: 2;
    -webkit-align-self: flex-end;
    -webkit-flex-basis: 60%;
  
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
   position:relative;
  transform: translateX(100%);
  transition: 0.6s all ease-in-out;
}

.carousel-item__subtitle {
    font-family: 'Open Sans', sans-serif;
    letter-spacing: 3px;
    font-size: 10px;
    text-transform: uppercase;
    margin: 0;
    color: #7E7E7E;    
    font-weight: 700;
    transform: translateY(25%);
    opacity: 0;
    visibility: hidden;
    transition: 0.4s all ease-in-out;
}

.carousel-item__title {
    margin: 15px 0 0 0;
    font-family: 'Playfair Display', serif;
    font-size: 44px;
    line-height: 45px;
    letter-spacing: 3px;
    font-weight: 700;
    color: #2C2C2C;
    transform: translateY(25%);
    opacity: 0;
    visibility: hidden;
    transition: 0.6s all ease-in-out;
}

.carousel-item__description {
    transform: translateY(25%);
    opacity: 0;
    visibility: hidden;
    transition: 0.6s all ease-in-out;
    margin-top: 35px;
    font-family: 'Open Sans', sans-serif;
    font-size: 13px;
    color: #7e7e7e;
    line-height: 22px;
    margin-bottom: 35px;
}
.carousel-item--1 .carousel-item__image{
  background-image: url('https://images.pexels.com/photos/921294/pexels-photo-921294.png?auto=compress&cs=tinysrgb&h=750&w=1260');
}
.carousel-item--2 .carousel-item__image{
  background-image: url('https://images.pexels.com/photos/921294/pexels-photo-921294.png?auto=compress&cs=tinysrgb&h=750&w=1260');
}

.carousel-item--3 .carousel-item__image{
  background-image: url('https://images.pexels.com/photos/92733/pexels-photo-92733.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260');
}

.carousel-item--4 .carousel-item__image{
  background-image: url('https://images.pexels.com/photos/1008732/pexels-photo-1008732.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260');
}

.carousel-item--5 .carousel-item__image{
  background-image: url('https://images.pexels.com/photos/1029614/pexels-photo-1029614.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940');
}




.carousel-item__info{
 	background-color: rgba(254, 249, 230, 0.3);
 	
}

.carousel-item__btn {
    width: 35%;
    color: #2C2C2C;
    font-family: 'Open Sans', sans-serif;
    letter-spacing: 3px;
    font-size: 11px;
    text-transform: uppercase;
    margin: 0;
    width: 35%;
    font-weight: 700;
  	text-decoration: none;
    transform: translateY(25%);
    opacity: 0;
    visibility: hidden;
    transition: 0.6s all ease-in-out;
}

.carousel__nav {
    position: absolute;
    right: 0;
    z-index: 2;
    background-color: #fff;
 	 bottom: 0;
}

.carousel__icon {
    display: inline-block;
    vertical-align: middle;
    width: 16px;
  fill: #5d5d5d;
}

.carousel__arrow {
    cursor: pointer;
    display: inline-block;
    padding: 11px 15px;
    position: relative;
}

.carousel__arrow:nth-child(1):after {
    content:'';
    right: -3px;
    position: absolute;
    width: 1px;
    background-color: #b0b0b0;
    height: 14px;
    top: 50%;
    margin-top: -7px;
}

.active{
   z-index: 1;
  display: flex;
  visibility:visible;
}
.active .carousel-item__subtitle, .active .carousel-item__title, .active .carousel-item__description,.active .carousel-item__btn{
   
    opacity: 1;
  transition: 0.6s all ease-in-out;
    visibility: visible;
}


.active .carousel-item__image{ 
transition: 0.6s all ease-in-out;
transform: translateX(0);
}
	</style>
</head>
<script>
$(function(){
  $('.carousel-item').eq(0).addClass('active');
  var total = $('.carousel-item').length;
  var current = 0;
  $('#moveRight').on('click', function(){
    var next=current;
    current= current+1;
    setSlide(next, current);
  });
  $('#moveLeft').on('click', function(){
    var prev=current;
    current = current- 1;
    setSlide(prev, current);
  });
  function setSlide(prev, next){
    var slide= current;
    if(next>total-1){
     slide=0;
      current=0;
    }
    if(next<0){
      slide=total - 1;
      current=total - 1;
    }
           $('.carousel-item').eq(prev).removeClass('active');
           $('.carousel-item').eq(slide).addClass('active');
      setTimeout(function(){

      },800);
    

    
    console.log('current '+current);
    console.log('prev '+prev);	
  }
});
</script>
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
				<div class="carousel">
		  <div class="carousel__nav">
		   <span id="moveLeft" class="carousel__arrow">
		        <svg class="carousel__icon" width="24" height="24" viewBox="0 0 24 24">
		    <path d="M20,11V13H8L13.5,18.5L12.08,19.92L4.16,12L12.08,4.08L13.5,5.5L8,11H20Z"></path>
		</svg>
		    </span>
		    <span id="moveRight" class="carousel__arrow" >
		      <svg class="carousel__icon"  width="24" height="24" viewBox="0 0 24 24">
		  <path d="M4,11V13H16L10.5,18.5L11.92,19.92L19.84,12L11.92,4.08L10.5,5.5L16,11H4Z"></path>
		</svg>    
		    </span>
		  </div>
		  <div class="carousel-item carousel-item--1">
		    <div class="carousel-item__image" style="background-image: url('../img/travel<%=travelatt.get(4).getTravel_img1() %>');"></div>
		    <div class="carousel-item__info">
		      <div class="carousel-item__container">
		      <h2 class="carousel-item__subtitle"><%=travellocal.getLocal_nation() %></h2>
		      <h1 class="carousel-item__title"><%=travellocal.getLocal_name() %></h1>
		      <p class="carousel-item__description"><%=travellocal.getLocal_content() %></p>
		      <a href="../travel/Attraction.travel?att=<%=travelatt.get(4).getAtt_name() %>" class="carousel-item__btn"><%=travelatt.get(4).getAtt_name() %></a>
		        </div>
		    </div>
		  </div>
		  <div class="carousel-item carousel-item--2">
		    <div class="carousel-item__image" style="background-image: url('../img/travel<%=travelatt.get(5).getTravel_img1() %>');"></div>
		    <div class="carousel-item__info">
		      <div class="carousel-item__container">
		      <h2 class="carousel-item__subtitle"><%=travellocal.getLocal_nation() %></h2>
		      <h1 class="carousel-item__title"><%=travellocal.getLocal_name() %></h1>
		      <p class="carousel-item__description"><%=travellocal.getLocal_content() %></p>
		      <a href="../travel/Attraction.travel?att=<%=travelatt.get(5).getAtt_name() %>" class="carousel-item__btn"><%=travelatt.get(5).getAtt_name() %></a>
		        </div>
		    </div>
		  </div>
		    <div class="carousel-item carousel-item--3">
		    <div class="carousel-item__image" style="background-image: url('../img/travel<%=travelatt.get(6).getTravel_img1() %>');"></div>
		    <div class="carousel-item__info">
		      <div class="carousel-item__container">
		      <h2 class="carousel-item__subtitle"><%=travellocal.getLocal_nation() %></h2>
		      <h1 class="carousel-item__title"><%=travellocal.getLocal_name() %></h1>
		      <p class="carousel-item__description"><%=travellocal.getLocal_content() %></p>
		      <a href="../travel/Attraction.travel?att=<%=travelatt.get(6).getAtt_name() %>" class="carousel-item__btn"><%=travelatt.get(6).getAtt_name() %></a>
		        </div>
		    </div>
		  </div>
		
		</div>
			<div>
				<div class="iconmenu">	
					<div class="icon" style="float: left;">
						<a href=""><div class="iconimg"><i class="fa-sharp fa-solid fa-hotel" style="width:50px; height:50px;"></i></div>
						<div class="iconp">호텔</div></a>
					</div>
					<div class="icon" style="float: left;">
						<a href="../shopping/itemMain.jsp"><div class="iconimg"><i class="fa-solid fa-basket-shopping" style="width:50px; height:50px;"></i></div>
						<div class="iconp">면세점</div></a>
					</div>
					<div class="icon" style="float: left;">
						<a href="../travel/travel_route.jsp""><div class="iconimg"><i class="fa-solid fa-route" style="width:50px; height:50px;"></i></div>
						<div class="iconp">여행 루트</div></a>
					</div>
					<div class="icon" style="float: left;">
						<a href="../travel/travel_mate.jsp"><div class="iconimg"><i class="fa-solid fa-user-group" style="width:50px; height:50px;"></i></div>
						<div class="iconp">여행 메이트</div></a>
					</div>
				</div>
			</div>
			<div class="contents2">
			<h4>주변 관광명소</h4>
					<a href="../travel/Attraction.travel?att=<%=travelatt.get(0).getAtt_name() %>">
						<div class="travellist2">
							<img src="../img/travel<%=travelatt.get(0).getTravel_img1() %>">
							<div class="detail">
								<p><%=travelatt.get(0).getAtt_name() %></p>
								
							</div>
						</div>
					</a>
					<a href="../travel/Attraction.travel?att=<%=travelatt.get(1).getAtt_name() %>">
						<div class="travellist2">
							<img src="../img/travel<%=travelatt.get(1).getTravel_img1()%>">
							<div class="detail">
								<p><%=travelatt.get(1).getAtt_name() %></p>
								
							</div>
						</div>
					</a>
					<a href="../travel/Attraction.travel?att=<%=travelatt.get(2).getAtt_name() %>">
						<div class="travellist2">
							<img src="../img/travel<%=travelatt.get(2).getTravel_img1()%>">
							<div class="detail">
								<p><%=travelatt.get(2).getAtt_name() %></p>
							</div>
						</div>
					</a>
					<a href="../travel/Attraction.travel?att=<%=travelatt.get(3).getAtt_name() %>">
						<div class="travellist2">
							<img src="../img/travel<%=travelatt.get(3).getTravel_img1()%>">
							<div class="detail">
								<p><%=travelatt.get(3).getAtt_name() %></p>
							</div>
						</div>
					</a>
				</div>
				<div class="contents2">
				<h4> 주변 호텔</h4>
					<a href="">
						<div class="travellist2">
							<img src="../img/travel/phuket.jpg">
							<div class="detail">
								<p>푸켓</p>
								
							</div>
						</div>
					</a>
					<a href="">
						<div class="travellist2">
							<img src="../img/travel/guam.jpg">
							<div class="detail">
								<p>괌</p>
								
							</div>
						</div>
					</a>
					<a href="">
						<div class="travellist2">
							<img src="../img/travel/berlin.jpg">
							<div class="detail">
								<p>베를린</p>
							</div>
						</div>
					</a>
					<a href="">
						<div class="travellist2">
							<img src="../img/travel/cebu.jpg">
							<div class="detail">
								<p>세부</p>
							</div>
						</div>
					</a>
				</div>
				
		</section>
		<jsp:include page="../overlap/footer.jsp"/>
	</form>
</body>
</html>