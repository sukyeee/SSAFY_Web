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
        <!-- 헤더 위치입니다 -->
        <div class="row" id="deal-header"> 
        	<div class="col-3"></div>
        	<div class="col-1 mb-2"> 서울 > </div>
        	<div class="col-1 mb-2 me-4">
        	<select id="gugun-select" class="form-select form-select-sm" aria-label=".form-select-sm example">
  			  <option value="11110">종로구</option>
			  <option value="11140">중구</option>
			  <option value="11170">용산구</option>
			  <option  value="11200">성동구</option>
			  <option  value="11215">광진구</option>
			  <option  value="11230">동대문구</option>
			  <option  value="11260">중랑구</option>
			  <option  value="11290">성북구</option>
			  <option  value="11305">강북구</option>
			  <option  value="11320">도봉구</option>
			  <option  value="11350">노원구</option>
			  <option value="11380">은평구</option>
			  <option value="11410">서대문구</option>
			  <option  value="11440">마포구</option>
			  <option  value="11470">양천구</option>
			  <option  value="11500">강서구</option>
			  <option  value="11530">구로구</option>
			  <option  value="11545">금천구</option>
			  <option  value="11560">영등포구</option>
			  <option  value="11590">동작구</option>
			  <option  value="11620">관악구</option>
			  <option  value="11650">서초구</option>
			  <option  value="11680">강남구</option>
			  <option  value="11710">송파구</option>
			  <option  value="11740">강동구</option>
			</select>
			</div>
			<div class="col-1 mb-2 me-4">
			 <select id="dong-select" class="form-select form-select-sm" aria-label=".form-select-sm example">
			 ...
			 </select>
			 </div>
			 <div class="col-2 mb-2 me-4">
			 	<input id="search-input" class="form-control form-control-sm" type="search" placeholder="Search" aria-label="Search">
			 </div>
			  <div class="col-1 mb-2">
			  	<button id="search-button" class="btn btn-outline-primary" type="button">Search</button>
			  </div>
				</div>
        	</div>
        </div>
        <!-- 거래정보 -->
        <div class="row" id="deal-content">
            <div id="deal-wrapper" class="col-3">

                <div class="container"> 
                    <div class="row">
                        <h2 style="margin-top: 5px; margin-left: 0.5em;">거래정보</h2>
                        <hr>
                    </div>
                    <div id="deal-list" class="row deal-list">
                    	검색해주세요
                     
                    </div>
                </div>
            </div>        
            <div id="map-wrapper">
                <div id="map-detail"></div>
            </div>
        </div>
            

        <!-- 상세정보 modal -->
  <div id="detail-modal" class="modal fade" id="detail-modal" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="staticBackdropLabel">상세정보</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div id="modal-body">
          ...
        </div>
        <div class="modal-footer">
            <i class="bi bi-suit-heart" id="interest"></i>
        </div>
      </div>
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
let markers = [];	// 마커 배열


window.onload = function(){
	let gugun_select = document.querySelector("#gugun-select");
	
	gugun_select.onchange = function(){
		let value = (gugun_select.options[gugun_select.selectedIndex].value);
		dongList(Number(value));

	}
	
	document.querySelector("#search-button").onclick = async function search(){
		
		if(validateSearch()){
			await mapList();
			await mapLocList();
			
		} else{
			alert("검색 범위가 너무 넓습니다");
		}
	}
	
	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new kakao.maps.MapTypeControl();
	
	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
	
	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	
}

//GET
async function dongList(gugun){
	
	console.log(gugun)
	
	let url = '<%= contextPath %>/map/mapDongSelect';
	let urlParams = '?gugunCode=' + gugun ;

	let fetchOptions = {
		method: 'GET',
	}
	
	try{
		let response = await fetch( url + urlParams);
		let data = await response.json();
		makeDongSelectHtml( data );	
	}catch( error ){
		console.log(error);
	}
}

function validateSearch(){
	let isGugunExist = false;
	let isDongExist = false;
	let isSearchInputExist = false;
	
	let gugunVal = document.querySelector("#gugun-select").value;
	let dongVal = document.querySelector("#dong-select").value;
	let searchVal = document.querySelector("#search-input").value;
	
	 if( gugunVal.length > 0 ){
		 isGugunExist = true;
     }
	 if( dongVal.length > 0 ){
		 isDongExist = true;
     }
	 if( searchVal.length > 0 ){
		 isSearchInputExist = true;
     }
	 
	 if((isGugunExist && isDongExist) ||(isGugunExist && isSearchInputExist))
		 return true;
	 
	 return false;
}

async function mapList(){
	let url = '<%= contextPath %>/map/mapList';
	
	let gugun_select = document.querySelector("#gugun-select");
	let gugunCode = (gugun_select.options[gugun_select.selectedIndex].value);
	
	//let gugunCode = (document.querySelector("#gugun-select").options[gugun-select.selectedIndex].value);
	let dong = document.querySelector("#dong-select").value;
	let searchWord = document.querySelector("#search-input").value;
	
	let urlParams = '?gugunCode=' + gugunCode + '&dong=' + dong + '&searchWord=' + searchWord;
	//let urlParams = `?limit=${LIST_ROW_COUNT}&offset=${OFFSET}`; // jsp el 표기법과 javascript es6 literal template 과 충돌
	let fetchOptions = {
		method: 'GET',
	}
	
	try{
		let response = await fetch( url + urlParams, fetchOptions);
		let data = await response.json();
		mapListArr = null;
		mapListArr = data;
		
		makeMapListHtml( data );
		
	}catch( error ){
		console.log(error);
		alert('거래내역 조회 과정에서 문제가 생겼습니다.')
	}
}

function makeMapListHtml(){
	let listHtml = ``;
	
	mapListArr.forEach( el => {

		let no = el.no;
		let AptName = el.AptName;
		let dealAmount = el.dealAmount;
		let dealDateStr = makeDateStr( el.dealYear, el.dealMonth, el.dealDay, '.');
		let area = el.area;
		
		listHtml += 
			`
		 <div class="row deal-list-item" data-dealNo="\${no}" data-bs-toggle="modal" data-bs-target="#detail-modal">
         <div class="row deal-name">\${AptName}</div>
         <div class="row deal-money">거래금액: \${dealAmount} <br>면적: \${area}</div>
         <div class="row deal-date">\${dealDateStr}</div>
     </div>
		`;
		
	});
	
	if(listHtml.length == 0)
		document.querySelector("#deal-list").innerHTML = "검색 결과가 없습니다";
	else {
		document.querySelector("#deal-list").innerHTML = listHtml;
		makeListHtmlEventHandler();
	}
	
	
	//boardListTotalCnt();
}

function makeListHtmlEventHandler(){
	document.querySelectorAll("#deal-list > div").forEach( el => {
		el.onclick = function(){
			let no = this.getAttribute("data-dealNo");
			makeDetailHtml(no);
		}
	})
}


function makeDetailHtml(no){
	const item = mapListArr.find(el => el.no == no);	// mapListArr: 전역 변수 dealDto 리스트
		
	let gugun = item.gugun;
	let dong = item.dong;
	let jibun = item.jibun;
	
	
	let address = makeAddressStr(gugun, dong, jibun);
	let dealDate = makeDateStr(item.dealYear, item.dealMonth, item.dealDay, ".");
	
	document.querySelector('#modal-body').innerHTML = `건물명: \${item.AptName}<br>주소: \${address}<br>매매가: \${item.dealAmount}<br>거래일자: \${dealDate}<br>건축년도: \${item.buildYear}<br>층수: \${item.floor}<br>전용면적: \${item.area}`
	 
}


// 지도에 넣을 데이터 가져오기
async function mapLocList(){
	let url = '<%= contextPath %>/map/mapLocList';
	
	let gugun_select = document.querySelector("#gugun-select");
	let gugunCode = (gugun_select.options[gugun_select.selectedIndex].value);
	
	let dong = document.querySelector("#dong-select").value;
	let searchWord = document.querySelector("#search-input").value;
	
	let urlParams = '?gugunCode=' + gugunCode + '&dong=' + dong + '&searchWord=' + searchWord;
	let fetchOptions = {
		method: 'GET',
	}
	
	try{
		let response = await fetch( url + urlParams, fetchOptions);
		let data = await response.json();
		
		if(data.length == 0) clearMap();
		else makeMapMarker( data );
		
	}catch( error ){
		console.log(error);
		alert('위치정보 조회 과정에서 문제가 생겼습니다.')
	}
}

function makeDongSelectHtml(list){
	let listHtml = ``;
	
	list.forEach( el => {
		
		let dong = el;
		listHtml +=
			'<option value=' + dong + '>' + dong.name + '</option>';
	});
	
	document.querySelector("#dong-select").innerHTML = listHtml;
	
	//makeListHtmlEventHandler();
}

/******************** 지도 *********************/

// 지도 초기화
function clearMap(){
	map.setCenter(defaultMapCenter); 
	map.setLevel(7);
	
	deleteMarkers();
	
}

function deleteMarkers(){
	markers.forEach(el => {
		el.setMap(null);
	})
	
	markers = [];
}
function makeMapMarker(list){
	
	deleteMarkers();
	
	let latSum = list.reduce(function add(sum, el) {
		  return sum + el.lat;
		}, 0);

	let latAverage = latSum / list.length;
	
	let lngSum = list.reduce(function add(sum, el) {
		  return sum + el.lng;
		}, 0);

	let lngAverage = lngSum / list.length;

	list.forEach(el => {
	    let imageSize = new kakao.maps.Size(24, 35); 
	    
	    // 마커 이미지를 생성합니다    
	    let markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
	    
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position:  new kakao.maps.LatLng(el.lat, el.lng),
	        title : el.AptName, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	        image : markerImage // 마커 이미지 
	    });
	    
	    markers.push(marker);
		
	})
	
	map.setCenter(new kakao.maps.LatLng(latAverage, lngAverage)); 
	map.setLevel(4);
}


// detail modal - 하트찍기
var i = 0;
let interest = document.querySelector('#interest')
interest.addEventListener("click", function(){
    if(i==0){
               interest.classList.add('bi-suit-heart');
               interest.classList.remove('bi-suit-heart-fill');
                i++;
            }else if(i==1){
                interest.classList.remove('bi-suit-heart');
                interest.classList.add('bi-suit-heart-fill');

                i--;
            }
})


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