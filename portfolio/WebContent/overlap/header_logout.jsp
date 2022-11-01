<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<style>
	.icon-bag-dark{
		background-image: url(//static.wconcept.co.kr/web/images/icon/icon-bag-dark.png);
	}
</style>
<body>
	<div style="width:100%; height: 150px; box-shadow: 0px 5px 1px 1px #030066; ">
		<div style="width: 1200px; height: 150px; margin: 0 auto; ">
		<header>
			<div id="header">
			<div id="title">
				<a href="../index.jsp" style="width: 300px;height: 150px;">
					<header style="width: 250px;height: 150px; z-index: -2;position: relative;">
						<img src="../img/logo/logo1.png">
					</header>
				</a>
			</div>
			<div id="nav">
				<nav>
					<ul id="top" style="margin-left: 25px;">
					<% 
						if(!((String)session.getAttribute("mb_id")==null)){
							%><li class='commonnav'><%=(String)session.getAttribute("mb_id") %>��</li><% 
						}
					%>
						<li class='commonnav'><a href='../overlap/logout.jsp' >�α׾ƿ�</a></li>
						<li class="commonnav"><a href="../overlap/info.mypage?command=info&mb_id=<%= (String)session.getAttribute("mb_id")%>">����������</a></li>
						<li class="commonnav"><a href="../shopping/itemCartList.dutyfree?command=cartList">��ٱ���</a></li>
					</ul>
				<ul id="main">
						
						<li class="commonnav2">
							<p><a class="commonlink" href="../index.jsp">�װ�</a></p>
							<ul class="list">
								<li><a href="flight/">������ �װ���</a></li>
								<li><a href="flight/">�ΰ� ���� �ȳ�</a></li>
								<li><a href="flight/">�¼� �ȳ�</a></li>
							</ul>
						</li>
						<li class="commonnav3">
							<p><a class="commonlink" href="../hotel_main.html">ȣ��</a></p>
							<ul class="list">
								<li><a href="hotel/">��õ ȣ��</a></li>
								<li><a href="hotel/">ȣ�� �˻�</a></li>
								<li><a href="hotel/Hotel_review_01.jsp">ȣ�� Q&A �Խ���</a></li>
							</ul>
						</li>
						<li class="commonnav4">
							<p><a class="commonlink" href="../shopping/itemMain.dutyfree?command=itemMain">�鼼��</a></p>
							<ul class="list">
								<li><a href="shoping/">Best��</a></li>
								<li><a href="shoping/">����</a></li>
								<li><a href="shoping/">��ǰ��</a></li>
							</ul>
						</li>
						<li class="commonnav1">
							<p><a class="commonlink" href="../travel/TripGuide.travel" id="main1">����</a></p>
							<ul class="list">
								<li><a href="../travel/TripGuide.travel">Ʈ�� ���̵�</a></li>
								<li><a href="../travel/travel_route.jsp">�����Ʈ</a></li>
								<li><a href="../travel/travel_mate.travel">�������Ʈ</a></li>
							</ul>
						</li>
					</ul>
				</nav>
			</div>
		</div>
		</header>
	</div>
	<script>
	$(document).ready(function() {
		
		$('#main > li > ul').hide();
		$('.commonnav1').mouseenter(function(){
 			$('.commonnav1 > ul').slideDown(200);
 			$('.commonnav1 > p').css("border-bottom","solid 5px #CC3D3D");
 			$('.commonnav1 > ul').show();
 		});
 		$('.commonnav1').mouseleave(function(){
 			$('.commonnav1 > ul').slideUp(200);
 			$('.commonnav1 > p').css("border-bottom","none");
 		});
 		$('.commonnav2').mouseenter(function(){
 			$('.commonnav2 > ul').slideDown(200);
 			$('.commonnav2 > p').css("border-bottom","solid 5px #CC3D3D");
 			$('.commonnav2 > ul').show();
 		});
 		$('.commonnav2').mouseleave(function(){
 			$('.commonnav2 > ul').slideUp(200);
 			$('.commonnav2 > p').css("border-bottom","none");
 		});
 		$('.commonnav3').mouseenter(function(){
 			$('.commonnav3 > ul').slideDown(200);
 			$('.commonnav3 > p').css("border-bottom","solid 5px #CC3D3D");
 			$('.commonnav3 > ul').show();
 		});
 		$('.commonnav3').mouseleave(function(){
 			$('.commonnav3 > ul').slideUp(200);
 			$('.commonnav3 > p').css("border-bottom","none");
 		});
 		$('.commonnav4').mouseenter(function(){
 			$('.commonnav4 > ul').slideDown(200);
 			$('.commonnav4 > p').css("border-bottom","solid 5px #CC3D3D");
 			$('.commonnav4 > ul').show();
 		});
 		$('.commonnav4').mouseleave(function(){
 			$('.commonnav4 > ul').slideUp(200);
 			$('.commonnav4 > p').css("border-bottom","none");
 		});
 		$('.login_btn').click(function(){
	 		var idchidden = document.getElementById("idchidden");
			var login_id = $('.login_id').val(); 
			var login_pw = $('.login_pw').val();
 		});
	});
 </script>

</body>
</html>