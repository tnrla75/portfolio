<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>    
<%@page import="vo.Travelatt"%>    
<%@page import="vo.Travelattandimg"%>
<%@page import="vo.PageInfo"%>
<%@page import="vo.Travelattre"%>  
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% 
	ArrayList<Travelatt> travelatt=(ArrayList<Travelatt>)request.getAttribute("travelatt"); 
	ArrayList<Travelattandimg> travelattimg = (ArrayList<Travelattandimg>)request.getAttribute("travelattimg");
	ArrayList<Travelattre> travelattre=(ArrayList<Travelattre>)request.getAttribute("travelattre");
	String filename= (String)request.getAttribute("filename");
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int listCount=pageInfo.getListCount();
	int nowPage=pageInfo.getPage();
	int maxPage=pageInfo.getMaxPage();
	int startPage=pageInfo.getStartPage();
	int endPage=pageInfo.getEndPage();
%> 
    <!DOCTYPE html>
<html>
<head>
	<title></title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<link href="https://fonts.googleapis.com/css2?family=Cairo&family=Indie+Flower&family=Koulen&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="../css/header_footer.css">
	<link type="text/css" rel="stylesheet" href="../css/responsive-tabs.css" />
    <link type="text/css" rel="stylesheet" href="../css/style.css" />
    <script src="http://use.fontawesome.com/releases/v6.1.2/js/all.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/handlebars/4.7.7/handlebars.min.js"></script>
    <script>
      'use strict';
      function LocatorPlus(configuration) {
        const locator = this;
        locator.locations = configuration.locations || [];
        locator.capabilities = configuration.capabilities || {};
        const mapEl = document.getElementById('gmp-map');
        const panelEl = document.getElementById('locations-panel');
        locator.panelListEl = document.getElementById('locations-panel-list');
        const sectionNameEl =
            document.getElementById('location-results-section-name');
        const resultsContainerEl = document.getElementById('location-results-list');
        const itemsTemplate = Handlebars.compile(
            document.getElementById('locator-result-items-tmpl').innerHTML);
        locator.searchLocation = null;
        locator.searchLocationMarker = null;
        locator.selectedLocationIdx = null;
        locator.userCountry = null;
        locator.map = new google.maps.Map(mapEl, configuration.mapOptions);
        const markers = locator.locations.map(function(location, index) {
          const marker = new google.maps.Marker({
            position: location.coords,
            map: locator.map,
            title: location.title,
          });
          marker.addListener('click', function() {
            selectResultItem(index, false, true);
          });
          return marker;
        });
        locator.updateBounds = function() {
          const bounds = new google.maps.LatLngBounds();
          if (locator.searchLocationMarker) {
            bounds.extend(locator.searchLocationMarker.getPosition());
          }
          for (let i = 0; i < markers.length; i++) {
            bounds.extend(markers[i].getPosition());
          }
          locator.map.fitBounds(bounds);
        };
        if (locator.locations.length) {
          locator.updateBounds();
        }
        const getResultIndex = function(elem) {
          return parseInt(elem.getAttribute('data-location-index'));
        };

        locator.renderResultsList = function() {
          let locations = locator.locations.slice();
          for (let i = 0; i < locations.length; i++) {
            locations[i].index = i;
          }
          if (locator.searchLocation) {
            sectionNameEl.textContent =
                'Nearest locations (' + locations.length + ')';
            locations.sort(function(a, b) {
              return getLocationDistance(a) - getLocationDistance(b);
            });
          } else {
            sectionNameEl.textContent = `All locations (${locations.length})`;
          }
          const resultItemContext = {locations: locations};
          resultsContainerEl.innerHTML = itemsTemplate(resultItemContext);
          for (let item of resultsContainerEl.children) {
            const resultIndex = getResultIndex(item);
            if (resultIndex === locator.selectedLocationIdx) {
              item.classList.add('selected');
            }

            const resultSelectionHandler = function() {
              if (resultIndex !== locator.selectedLocationIdx) {
                selectResultItem(resultIndex, true, false);
              }
            };
          }
        };
        initializeSearchInput(locator);
        locator.renderResultsList();
      }
      function initializeSearchInput(locator) {
        const geocodeCache = new Map();
        const geocoder = new google.maps.Geocoder();

        const searchInputEl = document.getElementById('location-search-input');
        const searchButtonEl = document.getElementById('location-search-button');

        const updateSearchLocation = function(address, location) {
          if (locator.searchLocationMarker) {
            locator.searchLocationMarker.setMap(null);
          }
          if (!location) {
            locator.searchLocation = null;
            return;
          }
          locator.searchLocation = {'address': address, 'location': location};
          locator.searchLocationMarker = new google.maps.Marker({
            position: location,
            map: locator.map,
            title: 'My location',
            icon: {
              path: google.maps.SymbolPath.CIRCLE,
              scale: 12,
              fillColor: '#3367D6',
              fillOpacity: 0.5,
              strokeOpacity: 0,
            }
          });
          const addressParts = address.split(' ');
          locator.userCountry = addressParts[addressParts.length - 1];
          locator.updateBounds();
          locator.renderResultsList();
        };

        const geocodeSearch = function(query) {
          if (!query) {
            return;
          }

          const handleResult = function(geocodeResult) {
            searchInputEl.value = geocodeResult.formatted_address;
            updateSearchLocation(
                geocodeResult.formatted_address, geocodeResult.geometry.location);
          };

          if (geocodeCache.has(query)) {
            handleResult(geocodeCache.get(query));
            return;
          }
          const request = {address: query, bounds: locator.map.getBounds()};
          geocoder.geocode(request, function(results, status) {
            if (status === 'OK') {
              if (results.length > 0) {
                const result = results[0];
                geocodeCache.set(query, result);
                handleResult(result);
              }
            }
          });
        };
        searchButtonEl.addEventListener('click', function() {
          geocodeSearch(searchInputEl.value.trim());
        });
      }
    
      const CONFIGURATION = {
        "locations": [ 
          {"coords":{"lat":<%=travelatt.get(0).getAtt_latitude()%>,"lng":<%=travelatt.get(0).getAtt_longitude()%>},"placeId":"ChIJqWqOqFeifDURpYJ5LnxX-Fw"}
        ],
        "mapOptions": {"center":{"lat":38.0,"lng":-100.0},"fullscreenControl":true,"mapTypeControl":false,"streetViewControl":false,"zoom":6,"zoomControl":true,"maxZoom":17,"mapId":""},
        "mapsApiKey": "AIzaSyCMF6muU7VHDkbFX-xuKoXma9JWt-mR0Bc",
        "capabilities": {"input":true,"autocomplete":false,"directions":false,"distanceMatrix":false,"details":false,"actions":false}
      };

      function initMap() {
        new LocatorPlus(CONFIGURATION);
      }
    </script>
    <script id="locator-result-items-tmpl" type="text/x-handlebars-template">
      {{#each locations}}
        <li class="location-result" data-location-index="{{index}}">
          <button class="select-location">
            <h2 class="name">{{title}}</h2>
          </button>
          <div class="address">{{address1}}<br>{{address2}}</div>
          <a class="directions-button" href="" target="_blank" title="Get directions to this location on Google Maps">
            <svg width="34" height="34" viewBox="0 0 34 34"
                  fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M17.5867 9.24375L17.9403 8.8902V8.8902L17.5867 9.24375ZM16.4117 9.24375L16.7653 9.59731L16.7675 9.59502L16.4117 9.24375ZM8.91172 16.7437L8.55817 16.3902L8.91172 16.7437ZM8.91172 17.9229L8.55817 18.2765L8.55826 18.2766L8.91172 17.9229ZM16.4117 25.4187H16.9117V25.2116L16.7652 25.0651L16.4117 25.4187ZM16.4117 25.4229H15.9117V25.63L16.0582 25.7765L16.4117 25.4229ZM25.0909 17.9229L25.4444 18.2765L25.4467 18.2742L25.0909 17.9229ZM25.4403 16.3902L17.9403 8.8902L17.2332 9.5973L24.7332 17.0973L25.4403 16.3902ZM17.9403 8.8902C17.4213 8.3712 16.5737 8.3679 16.0559 8.89248L16.7675 9.59502C16.8914 9.4696 17.1022 9.4663 17.2332 9.5973L17.9403 8.8902ZM16.0582 8.8902L8.55817 16.3902L9.26527 17.0973L16.7653 9.5973L16.0582 8.8902ZM8.55817 16.3902C8.0379 16.9105 8.0379 17.7562 8.55817 18.2765L9.26527 17.5694C9.13553 17.4396 9.13553 17.227 9.26527 17.0973L8.55817 16.3902ZM8.55826 18.2766L16.0583 25.7724L16.7652 25.0651L9.26517 17.5693L8.55826 18.2766ZM15.9117 25.4187V25.4229H16.9117V25.4187H15.9117ZM16.0582 25.7765C16.5784 26.2967 17.4242 26.2967 17.9444 25.7765L17.2373 25.0694C17.1076 25.1991 16.895 25.1991 16.7653 25.0694L16.0582 25.7765ZM17.9444 25.7765L25.4444 18.2765L24.7373 17.5694L17.2373 25.0694L17.9444 25.7765ZM25.4467 18.2742C25.9631 17.7512 25.9663 16.9096 25.438 16.3879L24.7354 17.0995C24.8655 17.2279 24.8687 17.4363 24.7351 17.5716L25.4467 18.2742Z" fill="#1967d2"/>
              <path fill-rule="evenodd" clip-rule="evenodd" d="M19 19.8333V17.75H15.6667V20.25H14V16.9167C14 16.4542 14.3708 16.0833 14.8333 16.0833H19V14L21.9167 16.9167L19 19.8333Z" fill="#1967d2"/>
              <circle class="directions-button-background" cx="17" cy="17" r="16.5" stroke="#1967d2"/>
            </svg>
          </a>
        </li>
      {{/each}}
    </script>    
</head>
<style>
*{box-sizing:border-box;}
#mainheader{width: 1200px; height: 150px;
					margin: 0 auto;
					}
		#main1{width: 850px; height: 500px;
					margin: 20px auto 0 auto;
					}
		#mainframe{width: 1200px; height: 1800px;
					box-sizing: border-box;
					margin: 0 auto;
					}			
		#subframe{width: 960px; height: fit-content;
					box-sizing: border-box;
					margin-top: 15px;
					border-radius: 5px;
					float: left;
					}						
		#mainsection{width: 370px; height: 500px;
					margin: 0 0 10px 0;
					box-sizing: border-box;
					float: left;
					}
		#mainsection>header{width: 350px;
							box-sizing: border-box;
							text-align: left;
							font-size: 30pt
							}
		.openinghours{width: 400px; height: 50px;	
			margin: 30px 0 10px 0;
			font-size: 14pt;
			text-align: center;
		}
		.openinghours>div{
			width:300px; height: 50px;
			float: right; 
		}		
		.touraddress{
			width: 400px; height: 20px;
			margin: 10px 0 10px 0;
		}
		.maintext{width: 400px; height: 400px;
				box-sizing: border-box;

		}
		.mainimage{width: 450px; height: 400px;
					margin: 80px 0 0 0;
					box-sizing: border-box;
					float: right;
		}		
		#map-container{
					width: 850px; height: 400px;
					margin: 0 auto;	
					position: relative;
        			font-family: "Roboto", sans-serif;
        			box-sizing: border-box;	
		}
      	#gmp-map {
			        position: absolute;
			        left: 0;
			        top: 0;
			        right: 0;
			        bottom: 0;
      	}
		.people{width: 250px; height: 30px;
				float: left;}
		.money{width: 250px; height: 30px;
				float: right;
				text-align: right;}	
		#final{width: 850px; height: fit-content;
				margin: 10px auto 0 auto;	
				}
		.reviewmain{width: 850px; height: fit-content;
					box-sizing: border-box;
					clear:both;
				}										
		.subreview{width: 750px; height: 195px; 
					margin: 0 0 20px 0; 
					box-sizing: border-box;
					}

		#place{width: 230px; height: 730px;
				margin-top: 15px;
				border-radius: 5px;
				box-sizing: border-box; 
				float: right;
				border: 3px solid #030066;
				
			}
		#chooseplace{width: 200px; height: 30px;
					margin: 10px auto 20px auto;}
		#chooseplace>select{width: 200px; height: 30px;
			font-size: 13pt;
		}
		.righttext{
			margin: 5px 0 5px 20px;
			margin-left: 10px;
		}
		.rightimg{
			width: 200px; height: 130px;
			margin: 0 auto;
			box-shadow: 2px 2px 2px #BDBDBD;
			overflow: hidden;
		}
		.rightimg>img{
			width: 200px; height: 130px;
		}
		.rightimg>img:hover{
			transform: scale(1.04);
			overflow: hidden;
		}
		#final>div>input{float: center; 
			width: 120px; height: 40px; 
			border-style: none; 
			background-color: #030066; 
			color: white; 
			border-radius: 5px;
			float: right;
		}
		#main1>input{
			float: right;
			height: 40px;
			border-style: none;
			background-color: #030066;
			color: white;
			border-radius: 5px;
			margin: 10px 0 0 0;
		}
		#pagelist{
			margin: 0 auto;
			width: 150px;
			height: 50px;
		}
		a{
			cursor: pointer;
		}
		.subtext{	
			width: 350px;
			height:200px;
			margin: 0 0 0 5px;
			padding: 5px;
			border-radius: 5px;
			background-color: rgba(234, 234, 234, 0.4);
		}
		.ticket{
			width: 350px;
			height:175px;
			border-radius: 5px;
			margin: 10px 0 0 5px;
			padding: 5px;
			background-color: rgba(234, 234, 234, 0.4);
		}
		.ticket header{
			font-size: 13pt;
			font-weight: bold;
		}
		.ticket article{
			width: 340px;
			height: 40px;
			/* background: white; */
			border: 1px gray solid;
			margin-top: 10px;
			border-radius: 3px;
		}
		.ticket div{
			margin: 3px auto 0 auto;
			width: 80px;
			height: 25px;	
			padding: 5px;
		}
		.ticket div input{
			float: center;
			width: 80px; height: 25px;
			border-style: none;
			background-color: #030066;
			color: white;
			margin-top: 5px;
			border-radius: 5px;
		}
		.ticket section{
			margin-top: 30px;
			margin-left: 10px;
		}
		.people{
			width: 150px;
			height:35px;
		}
		.money{
			margin-top: -5px;
			width:150px;
			height:35px;
		}
		.mainimage img{
				border-radius: 5px;
				width:450px; 
				height:400px;
		}		
		.reviewtitle{
				font-size: 	17pt;
				margin: 10px;
				font-weight: bold;
		}
		.star {
		filter: invert(84%) sepia(0%) saturate(1407%) hue-rotate(147deg) brightness(97%) contrast(76%);
		Loss: 0.7. This is a perfect result.
	}

</style>
<script>
var travelsearch =getParameter("travelsearch");
function review() {
	var mb_id = '<%= (String)session.getAttribute("mb_id") %>';
	if (mb_id == "null") {
		alert("로그인이 필요합니다.");
		location.href="../overlap/login.jsp";
	} else {
		location.href="Attraction_Review_Write.travel?attnum=<%=travelatt.get(0).getAtt_num()%>&att=<%=travelatt.get(0).getAtt_name()%>";
	}
}
function reservation(){
	var mb_id = '<%= (String)session.getAttribute("mb_id") %>';
	if (mb_id == "null") {
		alert("로그인이 필요합니다.");
		location.href="../overlap/login.jsp";
	} else {
		location.href="../travel/travelAtt_reservation.jsp?adult=<%=travelatt.get(0).getAtt_adult_ticket()%>&student=<%=travelatt.get(0).getAtt_student_ticket()%>&att=<%=travelatt.get(0).getAtt_name()%>&attnum=<%=travelatt.get(0).getAtt_num()%>";
	}
}

</script>

<body>
	<form>
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
	<%String id = request.getParameter("travelsearch"); %>
	<div id="mainframe">	
	<div id="subframe">
		
	<div id="main1">
		<section id="mainsection">
			<header><%=travelatt.get(0).getAtt_name() %></header>
			<div class="touraddress">&nbsp;<i class="fa-solid fa-location-dot"></i>&nbsp;<%=travelatt.get(0).getAtt_address() %></div>
			<article class="maintext">
				<div class="subtext"><%=travelatt.get(0).getAtt_content()%> </div>
				<%if (travelatt.get(0).getAtt_adult_ticket() != 0 && travelatt.get(0).getAtt_student_ticket() != 0 ){ %>
				<div class="ticket">
					<header>입장권 예약</header>
					<article>
						<div class="people">성인</div>
						<div class="money">₩<fmt:formatNumber value="<%=travelatt.get(0).getAtt_adult_ticket()%>" groupingUsed="true" /></div>
					</article>
					<article>
						<div class="people">학생</div>
						<div class="money">₩<fmt:formatNumber value="<%=travelatt.get(0).getAtt_student_ticket()%>" groupingUsed="true" /></div>
					</article>
					<div><input type="button" value="예약" onclick="reservation()"></div>
				</div>
				<%}else if(travelatt.get(0).getAtt_adult_ticket() != 0 || travelatt.get(0).getAtt_student_ticket() != 0){ %>
				<div class="ticket">
					<header>입장권 예약</header>
					<article>
					<div class="people">성인</div>
						<div class="money">₩<fmt:formatNumber value="<%=travelatt.get(0).getAtt_adult_ticket()%>" groupingUsed="true" /></div>
					</article>
					<div><input type="button" value="예약" onclick="reservation()"></div>
				<%}else if (travelatt.get(0).getAtt_adult_ticket() == 0 ){ %>
					<div class="ticket">
					<header>입장권 예약</header>
					<section>이 관광지는 입장권이 필요하지 않습니다.</section>	
				</div>
				<%} %>
			</article>
		</section>
		<article class="mainimage">
			<img src="../img/travel<%=filename %>">
		</article>
	</div>
	<div id="map-container">
     	 <div id="gmp-map"></div>	 
   	</div>
   	 <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCMF6muU7VHDkbFX-xuKoXma9JWt-mR0Bc&callback=initMap&libraries=places,geometry&solution_channel=GMP_QB_locatorplus_v6_cA" async defer></script>
	<div id="final">
		<section class="reviewmain">
			<div class="reviewtitle">리뷰</div>
				<div class=" reviewlist" style="width: 850px;height:fit-content; ">
				<% if(travelattre.size() != 0){
				 for(int i=0; i<travelattre.size(); i++){ %>
					<div style="width:850px; height: 150px;border-bottom:gray 2px solid;margin-bottom:10px;">
						<div style="width:300px;height:30px;padding:3px 0 0 10px;float:left;">
							<%=travelattre.get(i).getMb_id() %>
						</div>
						<div style="width:110px;height:2px;margin-bottom:30px;margin-left:750px;padding-right: 10px;">
							<a href="Attraction_Review_updatepage.travel?renum=<%=travelattre.get(i).getAtt_reNum()%>&att=<%=travelatt.get(0).getAtt_name()%>&recon=<%=travelattre.get(i).getAtt_reContent()%>">수정</a>
								&nbsp;|&nbsp;
							<a href="Attraction_Review_delete.travel?renum=<%=travelattre.get(i).getAtt_reNum()%>&att=<%=travelatt.get(0).getAtt_name()%>">삭제</a>
						</div>
						<div style="width:300px;height:20px;float:right;font-size:10pt;text-align:right;margin:3px 10px 0 0;">
							<%=travelattre.get(i).getAtt_reDate()%>&nbsp;작성
						</div>
						<div style="width:300px; height:30px;padding-left:10px;">
						<%
							String star1 = "<img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'>";
							String star2 = "<img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'>";
							String star3 = "<img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'>";
							String star4 = "<img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star3.png' width='20px' height='20px' class='star'>";
							String star5 = "<img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'><img src='../img/dutyfree/star.png' width='20px' height='20px'>";
							
							if(travelattre.get(i).getAtt_reRate() == 5 ){
								out.println(star5);	
							}else if (travelattre.get(i).getAtt_reRate() == 4) {
								out.println(star4);	
							} else if (travelattre.get(i).getAtt_reRate() == 3) {
								out.println(star3);
							} else if (travelattre.get(i).getAtt_reRate() == 2) {
								out.println(star2);
							} else {
								out.println(star1);
							}
						%>
						</div>
						<div style="width:850px; height:75px;padding:10px;">
							<%=travelattre.get(i).getAtt_reContent() %>
						</div>
					</div>
					<%} %>
				<%}else{ %>
					<div style="margin-left: 10px;">등록된 댓글이 없습니다.</div>
				<%} %>
				</div>
			<%if(maxPage > 1){ %>
			<div style="width:300px; height: 30px;clear:both;margin:0 auto;text-align: center;margin-top:50px;">
			<section id="pageList">
				<%if(nowPage<=1){ %>
				[이전]&nbsp;
				<%}else{ %>
				<a href="Attraction.travel?page=<%=nowPage-1 %>&att=<%=travelatt.get(0).getAtt_name()%>">[이전]</a>&nbsp;
				<%} %>
		
				<%for(int a=startPage;a<=maxPage;a++){
						if(a==nowPage){%>
				[<%=a %>]
				<%}else{ %>
				<a href="Attraction.travel?page=<%=a %>&att=<%=travelatt.get(0).getAtt_name()%>">[<%=a %>]
				</a>&nbsp;
				<%} %>
				<%} %>
		
				<%if(nowPage>=maxPage){ %>
				[다음]	
				<%}else{ %>
				<a href="Attraction.travel?page=<%=nowPage+1 %>&att=<%=travelatt.get(0).getAtt_name()%>">[다음]</a>
				<%} %>
			</section>
			</div>
			<%}%>
				</section>
					<div style="width: 130px; height: 40px; margin: 30px 0 0 0;float:right;">
					<input type="button" value="리뷰 작성"  onClick="review()">
				</div>		
			</div>
		</div>
<script>
window. onload=function(){

	$('.div').hide();
	$('#attraction').show();
}
$(function() {
	  $('#rightnav').change(function(){
	    $('.div').hide();
	    $('#' + $(this).val()).show();
	  });
	});		
</script>
		<nav id="place">
			<div id="chooseplace">
				<select size="1" id= "rightnav">
					<option value="attraction">주변 관광지</option>
					<option value="hotel">주변 호텔</option>
				</select>		
			</div>
			<div id="attraction" class="div attraction">
				<a href="../travel/Attraction.travel?att=<%=travelattimg.get(0).getAtt_name() %>">
					<section class="rightimg"><img src="../img/travel<%=travelattimg.get(0).getTravel_img1() %>"></section>
					<article class="righttext"><%=travelattimg.get(0).getAtt_name() %></article>
				</a>
				<a href="../travel/Attraction.travel?att=<%=travelattimg.get(1).getAtt_name() %>">
					<section class="rightimg"><img src="../img/travel<%=travelattimg.get(1).getTravel_img1() %>"></section>
					<article class="righttext"><%=travelattimg.get(1).getAtt_name() %></article>
				</a>
				
				<a href="../travel/Attraction.travel?att=<%=travelattimg.get(2).getAtt_name() %>">
					<section class="rightimg"><img src="../img/travel<%=travelattimg.get(2).getTravel_img1() %>"></section>
					<article class="righttext"><%=travelattimg.get(2).getAtt_name() %></article>
				</a>
				<a href="../travel/Attraction.travel?att=<%=travelattimg.get(3).getAtt_name() %>">
					<section class="rightimg"><img src="../img/travel<%=travelattimg.get(3).getTravel_img1() %>"></section>
					<article class="righttext"><%=travelattimg.get(3).getAtt_name() %></article>
				</a>
			</div>
			<div id= restaurant class="div restaurant">
				<a href=""><section class="rightimg"><img src="../img/travel/seoul/Gyeongbokgung.jpg"></section></a>
				<article class="righttext">111</article>
				<a href=""><section class="rightimg"><img src="../img/travel/seoul/Gwanghwamun.jpg"></section></a>
				<article class="righttext">222</article>
				<a href=""><section class="rightimg"><img src="../img/travel/seoul/Bukchon.jpg"></section></a>
				<article class="righttext">3333</article>
				<a href=""><section class="rightimg"><img src="../img/travel/seoul/Cheonggyecheon.jpg"></section></a>
				<article class="righttext">444</article>
			</div>
			<div id= hotel class="div hotel">
				<a href=""><section class="rightimg"><img src="../img/travel/seoul/Gyeongbokgung.jpg"></section></a>
				<article class="righttext">...</article>
				<a href=""><section class="rightimg"><img src="../img/travel/seoul/Gwanghwamun.jpg"></section></a>
				<article class="righttext">...</article>
				<a href=""><section class="rightimg"><img src="../img/travel/seoul/Bukchon.jpg"></section></a>
				<article class="righttext">...</article>
				<a href=""><section class="rightimg"><img src="../img/travel/seoul/Cheonggyecheon.jpg"></section></a>
				<article class="righttext">...</article>
			</div>
		</nav>
	</div>
		<jsp:include page="../overlap/footer.jsp"/>
	</form>
</body>
</html>
