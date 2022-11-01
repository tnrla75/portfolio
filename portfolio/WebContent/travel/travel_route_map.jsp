<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>	
<%@page import="vo.Travelmap"%>
<!DOCTYPE html>
<% ArrayList<Travelmap> route = (ArrayList<Travelmap>)request.getAttribute("route"); %>

<html>
  <head>
 	<meta charset="utf-8">
    <title>여행 일정</title>
<link rel="stylesheet" type="text/css" href="../css/header_footer.css">    
<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="http://use.fontawesome.com/releases/v6.1.2/js/all.js"></script>
  </head>
  <style>
*{
   box-sizing: border-box;
}
#map {
  width: 900px;
  height: 900px;
  margin-top: 7px;
 margin-left: 353px;
}

#location{
  width: 300px;
  height: 900px;
  position: absolute;
  top: 218px;
  right: 350px;
  overflow: auto;
  background-color: rgba(231,231,231,0.2);
}
#location::-webkit-scrollbar{
	display: none;
}
#title2{
	margin-top: 10px;
	text-align: center;
	font-size: 15pt;
}
.routeatt{
  width: 270px;
  height:100px;
  margin: 15px auto;
  background-color: rgba(231,231,231,0.2); 
}
.routeatt img{
  width:100px;
  height:100px;
  float: left;
}
.routeatt div{
 	margin: 10px;
	width: 250px;
	font-size: 13pt;  
}
.routeatt input{
	float:right;
	margin-right: 5px;
	margin-top: 30px; 
	border-style: none;
	width: 70px;
	height: 30px;
	background-color: #CC3D3D;
	color: white;
	border-radius: 3px;
}
.plusbtn{
	border-style: none;
	width: 70px;
	height: 30px;
	background-color: #000054;
	color: white;
	float: right;
	border-radius: 3px;
	margin-top: 70px;
	margin-left: 20px;
	cursor: pointer;
}
.span2{
	line-height: 30px;
}
.chooseimg{
	width:100px;
	height:100px;
}
.datebox{
	width:300px;
	height: fit-content;
	margin-bottom:15px;
}
.ddd{
	width:300px;
	height: fit-content;
	border-style: solid;
	margin-bottom:15px;
}
.adddate{
	width: 300px;
	height: 50px;
	margin-top:20px;
	padding-top:10px;
	font-size: 13pt;
	background-color: skyblue;
	cursor: pointer;
	text-align: center;
	border-radius: 2px;
}
.aa .date{
    width: 300px;
    font-size: 13pt;
    padding-left: 20px;
    background-color:#000054;
    color:white;
    padding:5px;
}
.tab-border .date{
    width: 300px;
    font-size: 13pt;
    padding-left: 20px;
    background-color:red;
    color:white;
    padding:5px;
}
.deletebtn{
	width: 70px;
    float: right;
    margin-top: -25px;
    cursor: pointer;
}
.choosedate{
	width: 200px;
}
.topmenu{
	width: 1200px;	
	margin: 0 auto;
}	
	.topmenu input:first-of-type{
		font-size: 17pt;
		margin-top: 20px;
		margin-left: 20px;
		height: 40px;
		width: 700px;
		border-style: none;
		border-bottom: 2px black solid;
	}
	.buttonbox{
		width:  1200px;
		height: 120px;
		margin: 0 auto;
	}
	.buttonbox input{
		margin-top: 15px;
		width:  1200px;
		height: 80px;
		border-style: none;
		border-radius: 3px;
		font-size: 15pt;
	}
  </style>
	
  <body>
  <form action="travel_route.trl?command=makeroute" method="post" onsubmit="return routeinsert()">
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
	<div class="topmenu">
		<input type="text" placeholder="제목을 입력하세요." name="routetitle" id="routetitle"> 
	</div>
    <div id="map">
    </div>
    <div id="location">
      <div id="title2">관광명소</div>
      <div class="adddate" onclick="plusdate()">날짜추가하기</div>
      <div class="plus_att">
      <div>
     	 <div id='dat' class='datebox tab-border' >
     	 	<div class='date'>
     	 		<div class='choosedate'>
     	 			<span class='writedate'>1</span>일차
     	 		</div>
     	 	</div>
     	 </div>
     	 </div>
      </div>
    </div>
    <div class="buttonbox">
    	<input type="button" id="enroll" value="등록하기">
    </div>
    <jsp:include page="../overlap/footer.jsp"/>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB41DRUbKWJHPxaFjMAwdrzWzbVKartNGg&callback=initMap&v=weekly"defer></script>
    </form>
  </body>
  
  
  
  
  <script>
function initMap() {
  const map = new google.maps.Map(document.getElementById("map"), {
    zoom: 12,
    center: { lat: <%=route.get(0).getLocal_latitude()%>, lng: <%=route.get(0).getLocal_longitude()%> },
  });
  const tourStops = [
	  <% for(int i=0; i<route.size(); i++){%>
    [{ lat: <%=route.get(i).getAtt_latitude()%>, lng: <%=route.get(i).getAtt_longitude()%> }, '<%=route.get(i).getAtt_name()%>','<%=route.get(i).getAtt_address()%>','<%=route.get(i).getAtt_img()%>',],
    <%}%>
    /* [{ lat: 37.5797, lng: 126.977 }, "경복궁","서울 종로구 사직로 161 경복궁"],
    [{ lat: 37.5815, lng: 126.9849 }, "북촌한옥마을","서울 종로구 계동길 37"],
    [{ lat: 37.5691, lng: 126.9786 }, "청계천","서울 종로구 창신동"],
    [{ lat: 37.5769, lng: 126.9768 }, "광화문","서울 종로구 효자로 12 국립고궁박물관"],
    [{ lat: 37.5632, lng: 126.9874 }, "명동성당","서울 중구 명동길 74"],
    [{ lat: 37.5722, lng: 126.9867 }, "인사동","서울특별시 종로구 인사동"], */
  ];
  const infoWindow = new google.maps.InfoWindow();

  tourStops.forEach(([position, title, address, img], i) => {
    const marker = new google.maps.Marker({
      position,
      map,
      title: `<div><span class="span1">장소명:`+ title+ `</span><br><span class="span2">주소명:` +address+ `</span><br><img src="../img/travel`+ img+ `" class="chooseimg"><input type="button" value="추가하기" class="plusbtn" onclick=plusatt(this)><input type="hidden" value=`+title+` class="aabb"><input type="hidden" value=`+img+` class="img"></div>`,
            optimized: false,
    });

    marker.addListener("click", () => {
      infoWindow.setContent(marker.getTitle());
      infoWindow.open(marker.getMap(), marker);
    });
    marker.addListener("mouseover", () =>{
      infoWindow.setContent(marker.getTitle());
      infoWindow.open(marker.getMap(), marker);
    });
  });
}
window.initMap = initMap;
</script>
  <script>
  var a = 0;
   function plusatt(e){
	var attname = document.querySelector(".routeatt span");
	var atta = $('.tab-border').find(".routeatt").length	
	var atta2 = $('.datebox').find(".routeatt").length	
    var i = document.getElementsByClassName('routeatt').length;
    const aa = document.querySelector(".aabb");
    const img = document.querySelector(".img");
    var title = document.getElementById("title2");
    var date = document.querySelector(".tab-border");  
    var name = document.createElement("div");
    if(atta<5){
		var check = true;
		  for(var x=0; x<atta2; x++){
			if($('.routeatt').find(".atta").eq(x).html() == aa.value){
				  check = false;
			}
    	}  
		if(check){
			name.innerHTML +="<div class='routeatt'><img src='../img/travel"+img.value+"'><div class='atta'>"+aa.value+"</div><input type='button' value='삭제하기' onclick='deleteRow(this)';><input type='hidden' value="+img.value+" name='attimg'><input type='hidden' value="+aa.value+" name='atttitle'></div>" ;
			date.append(name);
		}else{
			alert("이미 선택한 관광지입니다.");
		}
   }else{
	   alert("경로추가는 하루에 5곳만 가능합니다.");
   }
   }
   function deleteRow(ths){
	    var ths = $(ths);
	    ths.parents(".routeatt").remove();
	}   
   function plusdate(){
	   var plus_att = document.querySelector(".plus_att");
	   var z = document.getElementsByClassName('datebox').length;
	   if(z<5){
		   var name = document.createElement("div");
		   name.innerHTML += "<div id='dat' class='datebox aa'><div class='date'><div class='choosedate'><span class='writedate'>"+(z+1)+"</span>일차</div><div onclick='deletedate(this)' class='deletebtn'><i class='fa-solid fa-trash-can'></i>&nbsp;삭제</div></div></div>";
		   plus_att.append(name);
	   }
   }
   function deletedate(e){
	   var writedate = document.getElementsByClassName("writedate");																	
	   var e = $(e);
	   var date = document.getElementsByClassName('date');
	   e.parents(".datebox").remove();
	   for(var i=0; i <= date.length; i++){
		   writedate[i].innerText = i+1; 
		}
   }

  $(document).on("click", ".datebox", function () {
	  var a= document.querySelectorAll('.datebox').length;
	  var b =$( '.datebox' ).not(this);
	  console.log(b);
	  for(var i=0; i<b.length; i++){
		  b[i].classList.remove('tab-border');
		  b[i].classList.add('aa');
		  this.classList.remove('aa');	
			this.classList.add('tab-border');
	  }	  
});

  </script>
  <script>
	 $("#enroll").click(function () {
		  var title = document.getElementById("routetitle").value;
	     	 var result = "";
	       $(".datebox").each(function (i, e) {
	          let string_arr = [];
	          let day_string = $(".writedate", $(e)).text();
	             console.log(day_string+"===day_string");
	          $(".atta", $(e)).each(function (i2, e2) {
	             string_arr.push($(e2).text());
	             console.log("aa");
	             result += "&" + day_string + "-" + i2 + "=" + $(e2).text();
	          });
	       });
	       console.log(result+"==result");
	/*        location.href = "planinsert.mk?title="+title + result; */
			location.href="travel_route.trl?command=makeroute&local=<%=route.get(0).getLocal_name()%>&mb_id=<%= mb_id %>&title="+title + result;
 	 });
</script>

</html>
