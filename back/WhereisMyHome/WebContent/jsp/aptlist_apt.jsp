<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=54ab79b2f09a0ef4ca2e0b896ef72a90&libraries=services,clusterer,drawing"></script>
<link rel="stylesheet" href="css/aptlist.css" />
<link rel="stylesheet" href="css/header.css" />

<!-- JavaScript -->
<script
	src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>

<!-- CSS -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css" />
<!-- Default theme -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css" />
<!-- Semantic UI theme -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css" />
<!-- Bootstrap theme -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/bootstrap.min.css" />

<title>Document</title>
</head>
<style>
.marker-info {
	text-align: center;
}
</style>
<body>
	<!-- 아파트 실거래가 조회 페이지 -->
	<div class="container-fluid">

		<%@ include file="./header.jsp" %>

		<main>

<!-- 	
  		<form class="main-form" method="POST" action="<%=contextPath%>/findHouses">			 
          <div class="main-form-input">
              <Input name="dong" placeholder="동 검색"/> 
              <Input name="aptName" placeholder="아파트 검색"/>
          </div>
          <button class="btn btn-light" id="searchBtn"> 🔍  </button>

		  </form>
 -->	
	
	       <div class="main-bottom">
	          <div class="row col-md-12 justify-content-center mb-2">
	            <div class="form-group col-md-2">
	              <select class="form-select  main-button" id="sido">
	                <option value="">시도선택</option>
	                
	              </select>
	            </div>
	            <div class="form-group col-md-2">
	              <select class="form-select  main-button" id="gugun">
	                <option value="">구군선택</option>
	              </select>
	            </div>
	            <div class="form-group col-md-2">
	              <select class="form-select  main-button" id="dong">
	                <option value="">동선택</option>
	              </select>
	            </div>
	            <div class="form-group col-md-2">
	              
	                <input type="search" placeholder="아파트 검색" id="searchInput" value=""></input>
	            
	            </div>
	            <div class="form-group col-md-1">
	              <button type="button" class="btn btn-light" id="list-btn">  <a href="aptlist_apt.jsp">🔍</a> </button>
	            </div>
	          </div>
	          
	     
        </div>
      
      
		</main>


		<section>

			<!-- 지도 -->
			<!-- 
			<div id="map">

				<div class="list-group">

					<a href="#" class="list-group-item list-group-item-action active"
						aria-current="true">
						<div class="d-flex w-100 justify-content-between">
							<h5 class="list-group-title">아파트별 정보</h5>
						</div>
					</a> <a href="#" class="list-group-item list-group-item-action">
						<div class="d-flex w-100 justify-content-between">
							<h5 class="mb-1">그린코아아파트</h5>
						</div>
						<p class="mb-1">거래금액: 100,000원</p>
						<p class="mb-1">면적: 90.83</p> <small class="text-muted">2022.09.05</small>
					</a> <a href="#" class="list-group-item list-group-item-action">
						<div class="d-flex w-100 justify-content-between">
							<h5 class="mb-1">신호일천푸른마을아파트</h5>
						</div>
						<p class="mb-1">거래금액: 300,000원</p>
						<p class="mb-1">면적: 81.33</p> <small class="text-muted">2022.09.07</small>
					</a> <a href="#" class="list-group-item list-group-item-action">
						<div class="d-flex w-100 justify-content-between">
							<h5 class="mb-1">아이유쉘아파트</h5>
						</div>
						<p class="mb-1">거래금액: 500,000원</p>
						<p class="mb-1">면적: 102.83</p> <small class="text-muted">2022.09.08</small>
					</a> <a href="#" class="list-group-item list-group-item-action">
						<div class="d-flex w-100 justify-content-between">
							<h5 class="mb-1">윌더하임</h5>
						</div>
						<p class="mb-1">거래금액: 550,000원</p>
						<p class="mb-1">면적: 999.99</p> <small class="text-muted">2022.09.03</small>
					</a>
				</div>

			</div>
			
			 -->
			<div class="map_wrap">
			    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
			
			    <div id="menu_wrap" class="bg_white">
			        <div class="option">
			            <div>
			                <form onsubmit="searchPlaces(); return false;">
			                    키워드 : <input type="text" value="아파트 검색" id="keyword" size="15"> 
			                    <button type="submit">검색하기</button> 
			                </form>
			            </div>
			        </div>
			        <hr>
			        <ul id="placesList"></ul>
			        <div id="pagination"></div>
			    </div>
			</div>

		</section>
	
		<section id="section-aptlist">
		
		 <table class="table table-hover text-center aptlist" style="display: none">
	        <tr>
	          <th>아파트이름</th>
	          <th>동</th>
	          <th>거래금액</th>
	          <th>면적</th>
	          <th>거래일시</th>
	        </tr>
	        <tbody id="aptlist"></tbody>
     	 </table>
		
		
		</section>

	</div>



	<script>
	let DongData = null;
	let AptData = null;
    window.onload = function() {
    	
     	 // 브라우저가 열리면 시도정보 얻기.
        sido();
     
        // 리스트 버튼 (검색버튼) 클릭 
        document.querySelector("#list-btn").addEventListener("click", function (e) {
        	e.preventDefault();
      		// db에서 동별, 아파트별 검색
      		// ㅁㅁ시 ㅁㅁ구 ㅁㅁ동 검색 -> 해당 "동"의 코드에 해당하는 아파트 이름, 거래가격, 위치 등 다 불러오기
      		let dong = document.querySelector("#dong");
      		console.log(dong[dong.selectedIndex].innerHTML);
      		let regcode = dong[dong.selectedIndex].innerHTML;
      		
      		console.log(document.querySelector("#searchInput").value)
      		
      		let inputValue = document.querySelector("#searchInput").value;
      		if( inputValue != "" ){
      			console.log('아파트 검색!');
      			searchByApt(inputValue);
      		}
      		else {
      			// 동별 검색
          		searchByDong(regcode);
      		}
      		
      		// 아파트별은 검색어 입력으로 찾기.
        });
  
    };	
	

    // 시도가 바뀌면 구군정보 얻기.
    document.querySelector("#sido").addEventListener("change", function () {
      if (this[this.selectedIndex].value) {
        let regcode = this[this.selectedIndex].value; // 앞에있는 두자리가 시.도  (11:서울)
		gugun(regcode);
      } else {
        initOption("gugun");
        initOption("dong");
      }
    });

    // 구군이 바뀌면 동정보 얻기.
    document.querySelector("#gugun").addEventListener("change", function () {
      if (this[this.selectedIndex].value) {
        let regcode = this[this.selectedIndex].value; // 나머지 세자리는 구군 앞에 두자리는 시도 
        dong(regcode);
      } else {
        initOption("dong");
      }
    });
    
    
    async function sido() {
		let url = '<%=contextPath%>/house/sido';
  			//let urlParams = `?limit=${LIST_ROW_COUNT}&offset=${OFFSET}`; // jsp EL표기법과 javascript es6 literal template와 충돌.
		let fetchOptions = {
  					method: 'GET',
  			}
  			
  			try {
  				let response = await fetch( url , fetchOptions );
  				let data = await response.json();
  				console.log( data )
  				
  				addOption("sido", data)
  				
  			} catch( error ) {
  				console.log(error);
  				alertify.error('시도 조회 과정에서 문제가 생겼습니다.');
  			}
    }
    
    async function gugun(regcode) {
		let url = '<%=contextPath%>/house/gugun?sido_code=' + regcode;
  			//let urlParams = `?limit=${LIST_ROW_COUNT}&offset=${OFFSET}`; // jsp EL표기법과 javascript es6 literal template와 충돌.
		let fetchOptions = {
  					method: 'GET',
  			}
  			
  			try {
  				let response = await fetch( url , fetchOptions );
  				let data = await response.json();
  				console.log( data )
  				
  				addOption("gugun", data)
  				
  			} catch( error ) {
  				console.log(error);
  				alertify.error('시도 조회 과정에서 문제가 생겼습니다.');
  			}
    }
    
    async function dong(regcode) {
		let url = '<%=contextPath%>/house/dong?gugun_code=' + regcode;
  			//let urlParams = `?limit=${LIST_ROW_COUNT}&offset=${OFFSET}`; // jsp EL표기법과 javascript es6 literal template와 충돌.
		let fetchOptions = {
  					method: 'GET',
  			}
  			
  			try {
  				let response = await fetch( url , fetchOptions );
  				let data = await response.json();
  				console.log( data )
  				
  				addOption("dong", data)
  				
  			} catch( error ) {
  				console.log(error);
  				alertify.error('시도 조회 과정에서 문제가 생겼습니다.');
  			}
    }
    
    function initOption(selid) {
    	let options = document.querySelector("#" + selid);
        options.length = 0;
      }
    
    function addOption(selid, data) {
        let opt = ``;
        initOption(selid);
        switch (selid) {
          case "sido":
            opt += `<option value="">시도선택</option>`;
            
            data.forEach(function (regcode) {
            
            	
            	opt += ` <option value=` + regcode.code + `>` + regcode.name + `</option> `;
            });
            break;
            
          case "gugun":
            opt += `<option value="">구군선택</option>`;
            
            data.forEach(function (regcode) {
            
            	
            	opt += ` <option value=` + regcode.code + `>` + regcode.name + `</option> `;
            });
            break;
            
          case "dong":
            opt += `<option value="">동선택</option>`;
            data.forEach(function (regcode) {
            	
            	
            	opt += ` <option value=` + regcode.code + `>` + regcode.name + `</option> `;
            });
        }
        document.querySelector("#" + selid).innerHTML = opt;
      }
    
    
    
    // 동 별 검색
    async function searchByDong(regcode) {
    	
    	let url = '<%=contextPath%>/house/search?dong_name=' + regcode;
			//let urlParams = `?limit=${LIST_ROW_COUNT}&offset=${OFFSET}`; // jsp EL표기법과 javascript es6 literal template와 충돌.
		let fetchOptions = {
					method: 'GET',
			}
			
			try {
				let response = await fetch( url , fetchOptions );
				let data = await response.json();
				console.log( data )
				sessionStorage.setItem("DongData", data);
			
				// 동 별 검색 테이블 만들기
				makeList(data)
				
			} catch( error ) {
				console.log(error);
				alertify.error('시도 조회 과정에서 문제가 생겼습니다.');
			}
    	
    }
    
    // 아파트 별 검색
    async function searchByApt(regcode) {
    	
    	let url = '<%=contextPath%>/house/searchApt?apt_name=' + regcode;
			//let urlParams = `?limit=${LIST_ROW_COUNT}&offset=${OFFSET}`; // jsp EL표기법과 javascript es6 literal template와 충돌.
		let fetchOptions = {
					method: 'GET',
			}
			
			try {
				let response = await fetch( url , fetchOptions );
				let data = await response.json();
				console.log( data )
				sessionStorage.setItem("AptData", data);

				// 아파트 별 검색 테이블 만들기
				makeList(data)
				
			} catch( error ) {
				console.log(error);
				alertify.error('시도 조회 과정에서 문제가 생겼습니다.');
			}
    	
    }
    
    
    
    function makeList(data) {
        document.querySelector("table").setAttribute("style", "display:  ;");
        let tbody = document.querySelector("#aptlist");

        initTable();
        
        data.forEach((apt) => {
        	
          // 아파트 이름
          let tr = document.createElement("tr");
        	
		  let nameTd = document.createElement("td");
		  nameTd.appendChild(document.createTextNode(apt.AptName));
          tr.appendChild(nameTd);
        
          // 동 주소
          let dongName = document.createElement("td");
          dongName.appendChild(document.createTextNode(apt.dong));
          tr.appendChild(dongName);
          
          // 거래 금액
          let dealAmount = document.createElement("td");
          let dealStr = apt.dealAmount + "만원";
          dealAmount.appendChild(document.createTextNode(dealStr) );
          tr.appendChild(dealAmount);
         
          // 면적
          let area = document.createElement("td");
          area.appendChild(document.createTextNode(apt.area));
          tr.appendChild(area);
        
          // 거래일시 
          let dealDate = document.createElement("td");
          let dateString = apt.dealYear +"."+ apt.dealMonth +"."+ apt.dealDay;
          console.log(dateString)
          dealDate.appendChild(document.createTextNode( dateString ) );
          tr.appendChild(dealDate);
         

          tbody.appendChild(tr);
        });
      }
    
    function initTable() {
        let tbody = document.querySelector("#aptlist");
        let len = tbody.rows.length;
        for (let i = len - 1; i >= 0; i--) {
          tbody.deleteRow(i);
        }
    }
    
    
    //////////////////////////////////////////////////////////////////지도 출력
 
		// 마커를 담을 배열입니다
		var markers = [];
		// DongDada
		// AptData
			
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  
		
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
	// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({zIndex:1});
		
		// 키워드 검색을 요청하는 함수입니다
		function searchPlaces() {
			
		    var keyword = document.getElementById('keyword').value;
		    searchByApt(keyword);
			
		    if (!keyword.replace(/^\s+|\s+$/g, '')) {
		        alert('키워드를 입력해주세요!');
		        return false;
		    }
		    
		    
		    console.log("AptData"+  sessionStorage.getItem("AptData"))
		   let AptData = sessionStorage.getItem("AptData")[0].dong;
		   console.log(AptData)
	
		    
		}
		
	
		
	
</script>

</body>
</html>