<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="vo.Travel_selectroute" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Cairo&family=Indie+Flower&family=Koulen&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../css/header_footer.css">
<title>Insert title here</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="http://use.fontawesome.com/releases/v6.1.2/js/all.js"></script>
<style>
	*{
		box-sizing: border-box;
	}
	/* 맨 위 이미지   */
	.top_box{
		z-index:-1;
	    width:100%;
	    height:280px;
	    position:absolute;
	    overflow:hidden;
	}
	.top_smallbox{
      	border-radius:50%;
      	overflow:hidden;
	    background:transparent;
	    width:400vw;
	    height:400vw;
	}
	.top_imgbox,.top_smallbox{
	    position:absolute;
	    bottom:0;
	    left:50%;
	    -webkit-transform:translateX(-50%);
	    transform:translateX(-50%);
	}
	.top_imgbox{
     	width:100vw;
     	height:280px;
     }
     .guideheader{
     	position: absolute;
     	z-index: 8;
     	width: 400px;
     	height: 100px;
     	font-size: 30pt;
     	top:50px;
     	left: 18.75%;
     	color: white;
     	font-weight: bold;
     	
     }
     

	.tabs {
		margin-top: 130px;
		padding-top: 1rem;
		border-right: none;
	}
	.tabs .container {
		display: grid;
		grid-template-columns: repeat(2, 500px);
		align-items: center;
		justify-content: center;
		text-align: center;
		border-radius: 3px;
	}
	.tabs .container > div:hover {
		cursor: pointer;
	}
	.tab-border {
		border-bottom: #e50914 4px solid;
	}
	.aa {
		border-bottom: white 4px solid;
	}
	.tab-content {
		padding: 3rem 0;
		height: 1200px;
	}
	#tab-1-content,
	#tab-2-content{
		display: none;
		opacity: 0;
	}
	.show {
		display: block !important;
		opacity: 1 !important;
		transition: all 1000 ease-in;
	}
	.container {
		max-width: 1000px;
		margin: 0 auto;
		overflow: hidden;
		padding: 0 2rem;
		background-color: white;
		box-shadow: rgba(100, 100, 111, 0.4) 0px 7px 20px 0px;
	}
	@media (max-width: 960px) {
			.showcase {
			height: 70vh;
		}
	}
	.maindiv{
		border-radius: 10px;
		background-color: #e7e7e7;
		margin: 30px auto;
		width: 1200px;
		height: 1000px;
	}
	.routeinputdiv{
		margin: 35px;
		width: 1100px;
		height: 100px;
		
	}
	.routeinput{
		border-radius: 3px;
		height: 30px;
		
		border: solid 2px red;
		box-sizing: border-box;
	}
	.routeinputdiv input:first-of-type {
			width: 950px;
			height: 50px;
			border-radius: 5px;
			border-style: solid;
			border-color: #E7E7E7;
			position: relative;
			font-size: 10pt;
			top: 35px;
			left: 30px;
	}
	.routeinputdiv input:last-of-type {
		width:80px;
		height: 52px;
		border-style: solid;
		border-radius: 5px;
		font-weight: bold;
		background-color: #002266;
		color: white;
		position: relative;
		font-size: 13pt;
		top: 40px;
		left: 30px;
	}
	
	.routelistdiv{
		width: 1100px;
		height: 800px;
		border-radius: 15px;
		margin: 0 auto;
		/* background-color:white; */
	}
	.routelistindiv{
		
		width: 1000px;
		height: 180px;
		margin: 20px 40px;
		padding-top: 20px;
		display: flex;
		border-bottom:solid 1px rgba(0,0,0, 0.3);
	}
	.routelistindiv .div1{
		border: solid 2px black;
		box-sizing: border-box;
		width: 200px;
		height: 150px;
		margin: 10px;
		float: left;
	}
	.routelistindiv .div2{
		width: 750px;
		height: 150px;
		margin: 10px;
	}
	.div3{
		width:750px;
		height: 30px;
	}
	.div3 > .span1{
		float: left;
	}
	.div3 > .span2{
		float: right;
	}
	.div4{
		width:750px;
		height: 100px;
	}
	.routelistdiv a:link{
		text-decoration: none;
	}

	/*00000000000000000000000000000000000000000000000000000000  */
		
	*,
	*:after,
	*:before {
		-webkit-box-sizing: border-box;
		-moz-box-sizing: border-box;
		box-sizing: border-box;
	}

	.aaa, .tab_container> section{
		display: none;
	}
	
	
	/*Fun begins*/
	.tab_container {
		width: 800px;
		margin: 0 auto;
		padding-top: 70px;
		position: relative;
	}
	
	label {
  font-weight: 700;
  font-size: 18px;
  display: block;
  float: left;
  width: 25%;
  padding: 1.0em;
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
	#tab5:checked ~ #content5 {
	  display: block;
	  background: #fff;
	  color: #999;
	  border-bottom: 2px solid #f0f0f0;
	}
	
	.tab_container .tab-content p,
	.tab_container .tab-content h3 {
	  -webkit-animation: fadeInScale 0.7s ease-in-out;
	  -moz-animation: fadeInScale 0.7s ease-in-out;
	  animation: fadeInScale 0.7s ease-in-out;
	}
	.tab_container .tab-content h3  {
	  text-align: center;
	}
	
	.tab_container [id^="tab"]:checked + label {
		background: #fff;
  		box-shadow: inset 0 3px #98dde3;
  		background-color: #98dde3;
  		color: white;
	}
	
	label .fa {
	  font-size: 1.3em;
	  margin: 0 0.4em 0 0;
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
	/* local*/
	.localbox{
		width: 1000px;
		height: 900px;
		margin-left: -100px;
		margin-top: 50px;
	}
	.local{
		width: 229px;
		height: 220px;
		float: left;
		margin: 10px;
	}
	.localimg{
		overflow: hidden;
		width: 229px;
		height:220px;
		float: left;
		margin-left: -2px;
		background-position: center;
		background-repeat: no-repeat;
		background-size: 200px;
		text-align: center;
		color: white;
		font-weight: bold;
	}
	.localimg div{
		height: 30px;
		position: relative;
		font-size: 15pt;
		bottom: 35px;
		background-color: rgba(0, 0, 0, 0.5);
	}
	.localimg img:hover{
		transform: scale(1.04);
		overflow: hidden;
	}
	/* --------------detail--------------  */
	#detail_box {
		margin-top: 50px;
		height: 200px;
		font-weight: bold;
		font-size: 10pt;
		border-radius: 2px;
		box-shadow: rgba(6, 24, 44, 0.4) 0px 0px 0px 2px, rgba(6, 24, 44, 0.65) 0px 4px 6px -1px, rgba(255, 255, 255, 0.08) 0px 1px 0px inset;
		background-color: white;
	}
	#num {
		border-bottom: 2px solid #8C8C8C;
		margin: 0 auto;
		width: 738px;
		padding: 7px;
	}
	#num span:first-of-type {
		font-size: 17pt;
		margin-left: 10px;
	}
	#num span:last-of-type {
		color: #8C8C8C;
		margin-left: 10px;
	}
	#detail_box #img {
		float: left;
		margin-top: 15px;
		margin-left: 10px;
		width: 745px;
		font-size: 15pt;
	}
	#detail_box #detail {
		float: left;
		margin-left: 50px;
		line-height: 16pt;
	}
	#detail span:nth-of-type(3) {
		color: #A6A6A6;
		font-size: 9pt;
	}
	#detail span:last-of-type {
		font-size: 11pt;
	}
	#detail_box #img {
		float: left;
		margin-top: -10px;
		margin-left: 30px;
		width: 125px;
	}
	.routedetail{
		width: 700px;
		height: 35px;
		overflow: hidden;
		white-space:nowrap;
		box-shadow: rgba(99,99,99,0.4) 0px 2px 8px 0px;
		border-radius:2px;
		text-overflow: ellipsis;
		font-size: 12pt;	
		line-height: 35px;
		padding-left: 5px;
	}
	.routedetail> div{
		float: left;
	}
	.localname{
		width: 250px;
		height: 50px;
		margin-top: 15px;
		margin-left: 180px;
		font-size: 15pt;
	}
	.count{
		margin-top: 10px;
		width: 150px;
		height: 25px;
		color: #8C8C8C;
		font-size:11pt;
	}
	.date{
		width: 100px;
		height: 25px;
		float:right;
		margin-top:-25px;
	}
</style>
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
		<div class="top_box">
			<div class="guideheader">어디로 떠날까요?</div>
     		<div class="top_smallbox">
        		<div role="img" style="background:url(https://ak-d.tripcdn.com/images/0UC3u120008dn82sc2F9C.jpg_.webp)  right top / cover no-repeat" class="top_imgbox">
        		</div>
      		</div>
    	</div>

		<section class="tabs">
			<div class="container">
				<div id="tab-1" class="tab-item tab-border">
					<p class="hide-sm">여행루트</p>
				</div>
				<div id="tab-2" class="tab-item">
					<p class="hide-sm">여행루트 짜기</p>
				</div>
			</div>
		</section>

		<section class="tab-content">
			<div class="container2">
				<!-- Tab Content 1 -->
				<div id="tab-1-content" class="tab-content-item show">
					<div class="maindiv">
						<div class="routeinputdiv">
							<input type="text" class="routeinput" placeholder="원하는 루트를 검색하세요.">
							<input type="button" value="검색">
						</div>
						<jsp:useBean id="control" class="travel_package.RouteController">
						</jsp:useBean>
						<div class="routelistdiv">
							<% 
								ArrayList<Travel_selectroute> arr = control.routeselect();
								for(int i=arr.size()-1; i>=0; i--){
								int count = 0;
							%>
									
										
							<div id="detail_box">
									<div id="num">
										<span><%= arr.get(i).getRoutetitle() %></span>
										<span><%= arr.get(i).getWritedate() %></span>
									</div>
  										<div id="img"><img src="../img/travel<%=arr.get(i).getLocal_img()%>" width="120px" height="120px"></div>									
										 <div class="localname"><i style="color:#cc3d3d" class="fa-solid fa-location-dot"></i>&nbsp;<%=arr.get(i).getLocal() %></div>
										<div id="detail">
											<div class="routedetail">
												<%if(arr.get(i).getRoute1_1() != null){ count++;%><%=arr.get(i).getRoute1_1()%>><%}%>
												<%if(arr.get(i).getRoute1_2() != null){ count++;%><%=arr.get(i).getRoute1_2()%>><%}%>
												<%if(arr.get(i).getRoute1_3() != null){ count++;%><%=arr.get(i).getRoute1_3()%>><%}%>
												<%if(arr.get(i).getRoute1_4() != null){ count++;%><%=arr.get(i).getRoute1_4()%>><%}%>
												<%if(arr.get(i).getRoute1_5() != null){ count++;%><%=arr.get(i).getRoute1_5()%>><%}%>
												<%if(arr.get(i).getRoute2_1() != null){ count++;%><%=arr.get(i).getRoute2_1()%>><%}%>
												<%if(arr.get(i).getRoute2_2() != null){ count++;%><%=arr.get(i).getRoute2_2()%>><%}%>
												<%if(arr.get(i).getRoute2_3() != null){ count++;%><%=arr.get(i).getRoute2_3()%>><%}%>
												<%if(arr.get(i).getRoute2_4() != null){ count++;%><%=arr.get(i).getRoute2_4()%>><%}%>
												<%if(arr.get(i).getRoute2_5() != null){ count++;%><%=arr.get(i).getRoute2_5()%>><%}%>
												<%if(arr.get(i).getRoute3_1() != null){ count++;%><%=arr.get(i).getRoute3_1()%>><%}%>
												<%if(arr.get(i).getRoute3_2() != null){ count++;%><%=arr.get(i).getRoute3_2()%>><%}%>
												<%if(arr.get(i).getRoute3_3() != null){ count++;%><%=arr.get(i).getRoute3_3()%>><%}%>
												<%if(arr.get(i).getRoute3_4() != null){ count++;%><%=arr.get(i).getRoute3_4()%>><%}%>
												<%if(arr.get(i).getRoute3_5() != null){ count++;%><%=arr.get(i).getRoute3_5()%>><%}%>
												<%if(arr.get(i).getRoute4_1() != null){ count++;%><%=arr.get(i).getRoute4_1()%>><%}%>
												<%if(arr.get(i).getRoute4_2() != null){ count++;%><%=arr.get(i).getRoute4_2()%>><%}%>
												<%if(arr.get(i).getRoute4_3() != null){ count++;%><%=arr.get(i).getRoute4_3()%>><%}%>
												<%if(arr.get(i).getRoute4_4() != null){ count++;%><%=arr.get(i).getRoute4_4()%>><%}%>
												<%if(arr.get(i).getRoute4_5() != null){ count++;%><%=arr.get(i).getRoute4_5()%>><%}%>
												<%if(arr.get(i).getRoute5_1() != null){ count++;%><%=arr.get(i).getRoute5_1()%>><%}%>
												<%if(arr.get(i).getRoute5_2() != null){ count++;%><%=arr.get(i).getRoute5_2()%>><%}%>
												<%if(arr.get(i).getRoute5_3() != null){ count++;%><%=arr.get(i).getRoute5_3()%>><%}%>
												<%if(arr.get(i).getRoute5_4() != null){ count++;%><%=arr.get(i).getRoute5_4()%>><%}%>
												<%if(arr.get(i).getRoute5_5() != null){ count++;%><%=arr.get(i).getRoute5_5()%><%}%>
											
											</div>
											<div class="count">전체&nbsp;<%=count %>&nbsp;개&nbsp;장소</div>
											<div class="date">
												<%if(arr.get(i).getRoute2_1() == null){ %>
												PLAN&nbsp;·&nbsp;당일치기
												<%}else if(arr.get(i).getRoute3_1() == null){ %>
												PLAN&nbsp;·&nbsp;1박2일
												<%}else if(arr.get(i).getRoute4_1() == null){ %>
												PLAN&nbsp;·&nbsp;2박3일
												<%}else if(arr.get(i).getRoute5_1() == null){ %>
												PLAN&nbsp;·&nbsp;3박4일
												<%}else{%>
												PLAN&nbsp;·&nbsp;4박5일
												<%} %>
											</div>
										</div>	
								</div>
								<%} %>
							</div>
						</div>
				</div>
				<!-- Tab Content 2 -->
				<div id="tab-2-content" class="tab-content-item">
						<div class="tab_container">
							<input id="tab1" type="radio" class="aaa" name="tabs" checked>
							<label for="tab1"><span>대한민국</span></label>
				
							<input id="tab2" type="radio" class="aaa" name="tabs">
							<label for="tab2"><span>일본</span></label>
				
							<input id="tab3" type="radio" class="aaa" name="tabs">
							<label for="tab3"><span>홍콩 / 마카오</span></label>
				
							<input id="tab4" type="radio" class="aaa" name="tabs">
							<label for="tab4"><span>기타국가</span></label>

			

							<section id="content1" class="tab-content">
								<div class="localbox">
									<div class="local">
										<a href="travel_route.trl?command=routemap&local=서울">
										<div class="localimg">
											<img src="../img/travel/korea/seoul/Gyeongbokgung.jpg" width="229px" height="220px">
											<div>서울</div>
										</div></a>
									 </div>
									<div class="local">
										<a href="travel_route.trl?command=routemap&local=제주">
										<div class="localimg">
											<img src="../img/travel/korea/jeju/jeju.png" width="229px" height="220px">
											<div>제주</div>
										</div></a>
									 </div>
									<div class="local">
										<a href="travel_route.trl?command=routemap&local=부산">
										<div class="localimg">
											<img src="../img/travel/korea/busan/busan.png" width="229px" height="220px">
											<div>부산</div>
										</div></a>
									</div>
									<div class="local">
										<a href="travel_route.trl?command=routemap&local=전주">
										<div class="localimg">
											<img src="../img/travel/korea/jeonju/jeonju.png" width="229px" height="220px">
											<div>전주</div>
										</div></a>
									</div>
									
									<div class="local">
										<a href="travel_route.trl?command=routemap&local=강릉">
										<div class="localimg">
											<img src="../img/travel/korea/gangneung/gangneung.png" width="229px" height="220px">
											<div>강릉</div>
										</div></a>
									</div>
									<div class="local">
										<a href="travel_route.trl?command=routemap&local=경주">
										<div class="localimg">
											<img src="../img/travel/korea/gyeongju/gyeongju.png" width="229px" height="220px">
											<div>경주</div>
										</div></a>
									</div>
									<div class="local">
										<a href="travel_route.trl?command=routemap&local=여수">
										<div class="localimg">
											<img src="../img/travel/korea/yeosu/yeosu.png" width="229px" height="220px">
											<div>여수</div>
										</div></a>
									</div>
									<div class="local">
										<a href="travel_route.trl?command=routemap&local=인천">
										<div class="localimg">
											<img src="../img/travel/korea/incheon/incheon.png" width="229px" height="220px">
											<div>인천</div>
										</div></a>
									</div>
									
									<div class="local">
										<a href="travel_route.trl?command=routemap&local=대구">
										<div class="localimg">
											<img src="../img/travel/korea/daegu/daegu.png" width="229px" height="220px">
											<div>대구</div>
										</div></a>
									</div>
									<div class="local">
										<a href="travel_route.trl?command=routemap&local=속초">
										<div class="localimg">
											<img src="../img/travel/korea/sokcho/sokcho.png" width="229px" height="220px">
											<div>속초</div>
										</div></a>
									</div>
									<div class="local">
										
									</div>
									<div class="local">
										
									</div>
								</div>
								
							</section>
								
							<section id="content2" class="tab-content">
								<div class="localbox">
									<div class="local">
										<a href="#">
										<div class="localimg">
											<img src="../img/travel/seoul/Gyeongbokgung.jpg" width="229px" height="220px">
											<div>도쿄</div>
										</div></a>
									 </div>
									 <div class="local">
										<a href="#">
										<div class="localimg">
											<img src="../img/travel/seoul/Gyeongbokgung.jpg" width="229px" height="220px">
											<div>오사카</div>
										</div></a>
									 </div>
									 <div class="local">
										<a href="#">
										<div class="localimg">
											<img src="../img/travel/seoul/Gyeongbokgung.jpg" width="229px" height="220px">
											<div>후쿠오카</div>
										</div></a>
									 </div>
									  <div class="local">
										<a href="#">
										<div class="localimg">
											<img src="../img/travel/seoul/Gyeongbokgung.jpg" width="229px" height="220px">
											<div>삿포로</div>
										</div></a>
									 </div>
									  <div class="local">
										<a href="#">
										<div class="localimg">
											<img src="../img/travel/seoul/Gyeongbokgung.jpg" width="229px" height="220px">
											<div>교토</div>
										</div></a>
									 </div>
								</div>
							</section>
				
							<section id="content3" class="tab-content">
								
							</section>
				
							<section id="content4" class="tab-content">
								
							</section>
						</div>

				</div>
			</div>
		</section>
	
	<jsp:include page="../overlap/footer.jsp"/>
</form>
</body>
</html>
<script>
	const tabItems = document.querySelectorAll('.tab-item');
	const tabContentItems = document.querySelectorAll('.tab-content-item');
	
	// Select tab content item
	function selectItem(e) {
		console.log(tabItems.length);
		var abc= this.id;
		abc += "-content";
		// Remove all show and border classes
		removeBorder();
		removeShow();
		// Add border to current tab item
		this.classList.add('tab-border');
		this.classList.remove('aa'); 
		// Grab content item from DOM
		// Add show class
		const tabContentItem = document.getElementById(abc);
		tabContentItem.classList.add('show');
	}
	
	// Remove bottom borders from all tab items
	function removeBorder() {
		tabItems.forEach(item => {
			item.classList.remove('tab-border');
			item.classList.add('aa');
		});
	}
	
	// Remove show class from all content items
	function removeShow() {
		tabContentItems.forEach(item => {
			item.classList.remove('show');
		});
	}
	
	// Listen for tab item click
	tabItems.forEach(item => {
		item.addEventListener('click', selectItem);
	});

</script>