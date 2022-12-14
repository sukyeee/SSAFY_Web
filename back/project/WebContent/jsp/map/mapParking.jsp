<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="map.dto.*" %>
<%
    String contextPath = request.getContextPath();
	UserDto userDto = (UserDto) session.getAttribute("userDto");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>거래 조회</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    
    <link rel="stylesheet" href="<%=contextPath %>/css/style.css" type="text/css"></link>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light shadow fixed-top">
        <div class="container">
          <a class="navbar-brand text-primary fw-bold" href="<%=contextPath %>/map/mapMain">
            구해줘 홈즈
          </a>
          <button
            class="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent"
            aria-expanded="false"
            aria-label="Toggle navigation"
          >
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-lg-0">
            </ul>
            <!-- 로그인 전 -->
            
            <ul class="navbar-nav mb-2 me-2 mb-lg-0">
            <li class="nav-item">
                <a class="nav-link" aria-current="page" id="parking" href="<%=contextPath %>/jsp/map/mapParking.jsp">관심지역 주차장 정보</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" aria-current="page" id="logout"href="#">로그아웃</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" aria-current="page" id="myPage"href="<%=contextPath %>/user/userMain">마이페이지</a>
              </li>
            </ul>
          </div>
        </div>
      </nav>
      
      
      <br>
      <br>
      <br>
     
    <div class="contianer">
        
        <!-- 주차장 정보 -->
        <div class="row" id="deal-content">
            <div id="deal-wrapper" class="col-3">

                <div class="container"> 
                    <div class="row">
                        <h2 style="margin-top: 5px; margin-left: 0.5em;">관심지역 주차장 정보</h2>
                        <hr>
                    </div>
                    <div id="deal-list" class="row deal-list">
                    	..
                     
                    </div>
                </div>
            </div>        
            <div id="map-wrapper">
                <div id="map-detail"></div>
            </div>
        </div>
            

    </div>
    
<script type="text/javascript" src="<%=contextPath %>/js/util.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=30825d7ff55d14a818299c266e641081"></script>
<script>

/********************전역변수*********************/
let mapListArr;	// 거래내역 리스트



// 지도 설정
let defaultMapCenter = new kakao.maps.LatLng(37.575, 126.99);

var mapContainer = document.getElementById('map-detail'), // 지도를 표시할 div  
   mapOption = { 
       center: defaultMapCenter, // 지도의 중심좌표
       level: 7 // 지도의 확대 레벨
   };
let map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 마커 관련
let imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 	


window.onload = function(){
	let gugun_select = document.querySelector("#gugun-select");
	
	
	
	
	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new kakao.maps.MapTypeControl();
	
	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
	
	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	
	getParkingList();
}



// 지도에 넣을 데이터 가져오기
async function getParkingList(){
	let url = '<%= contextPath %>/parking';
	
	try{
		let response = await fetch( url);
		let data = await response.json();
		makeMapListHtml(data)
		makeMapMarker( data );
		
	}catch( error ){
		console.log(error);
		alert('주차장정보 조회 과정에서 문제가 생겼습니다.')
	}
}

function makeMapListHtml(list){
	let listHtml = ``;
	
	list.forEach( el => {

		let parkingName = el.parkingName;
		let addr = el.addr;
		let capacity = el.capacity;
		let rates = el.rates;
		let timeRate = el.timeRate;
		
		listHtml += 
			`
		 <div class="row deal-list-item" data-bs-toggle="modal" data-bs-target="#detail-modal">
         <div class="row parking-name">\${parkingName}</div>
         <div class="row parking-addr">\${addr}</div>
         <div class="row parking-money">기본요금: \${rates}원/ \${timeRate}분</div>
         <div class="row parking-capacity">\${capacity} 대 주차 가능</div>
     </div>
		`;
		
	});
	
	if(listHtml.length == 0)
		document.querySelector("#deal-list").innerHTML = "주변 주차장이 없습니다";
	else {
		document.querySelector("#deal-list").innerHTML = listHtml;
	}
	
	
	//boardListTotalCnt();
}

/******************** 지도 *********************/

function makeMapMarker(list){
	
	let latSum = list.reduce(function add(sum, el) {
		  return sum + Number(el.lat);
		}, 0);

	let latAverage = latSum / list.length;
	
	let lngSum = list.reduce(function add(sum, el) {
		  return sum + Number(el.lng);
		}, 0);

	let lngAverage = lngSum / list.length;

	list.forEach(el => {
		console.log(el.lat + " " + el.lng)
	    let imageSize = new kakao.maps.Size(24, 35); 
	    
	    // 마커 이미지를 생성합니다    
	    let markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
	    
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position:  new kakao.maps.LatLng(el.lat, el.lng),
	        title : el.parkingName, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	        image : markerImage // 마커 이미지 
	    });
	    
		
	})
	console.log(latAverage + " " + lngAverage)
	map.setCenter(new kakao.maps.LatLng(latAverage, lngAverage)); 
	map.setLevel(5);
}


    		document.querySelector("#logout").onclick = function(){
    			logout();
    		}

		async function logout(){
        	let url = "<%= contextPath%>/logout";
        	
        	try{
                let response = await fetch( url ); 
                let data = await response.json(); 
                if( data.result == "fail"){ 
                  window.location.href = "<%= contextPath%>/jsp/login.jsp";
                }else if( data.result == "fail"){
              	  alert('로그아웃 과정에서 오류가 발생했습니다.');
                }            	
            }catch(error){
            	alert('로그아웃 과정에서 오류가 발생했습니다.');
            }
        }
		


</script>


</body>
</html>