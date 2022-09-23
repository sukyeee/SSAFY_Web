<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String contextPath = request.getContextPath();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=54ab79b2f09a0ef4ca2e0b896ef72a90"></script>
    <link rel="stylesheet" href="css/aptlist.css" />

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



    <nav class="navbar navbar-light bg-light">
        <div id="nav_menu">
            <button class="btn btn-sm btn-outline-secondary" type="button">login</button>
            <button class="btn btn-sm btn-outline-secondary" type="button">register</button>
        </div>
    </nav>

    <header>
        <!-- <div class="card" style="width: 100%; height: 300px;">
            <img src="..." class="card-img-top" alt="...">
            <div class="card-body">
              <p class="card-text">content..</p>
            </div>
        </div> -->
        <!-- <div class="card-menu">
       
            <div class="card-body" >
                <div class="row col-md-12 justify-content-center mb-2">
                    <div class="form-group col-md-2">
                      <select class="form-select bg-secondary text-light" id="sido">
                        <option value="">시도선택</option>
                      </select>
                    </div>
                    <div class="form-group col-md-2">
                      <select class="form-select bg-secondary text-light" id="gugun">
                        <option value="">구군선택</option>
                      </select>
                    </div>
                    <div class="form-group col-md-2">
                      <select class="form-select bg-secondary text-light" id="dong">
                        <option value="">동선택</option>
                      </select>
                </div>

              
            </div>
        </div> -->
    </header>
      

    <main>
      <div class="main-top">
      
       </div>
      
      <div class="main-bottom">
        <div class="row col-md-12 justify-content-center mb-2">
          <div class="form-group col-md-2">
            <select class="form-select  main-button" id="sido">
              <option value="">부산광역시</option>
            </select>
          </div>
          <div class="form-group col-md-2">
            <select class="form-select  main-button" id="gugun">
              <option value="">강서구</option>
            </select>
          </div>
          <div class="form-group col-md-2">
            <select class="form-select  main-button" id="dong">
              <option value="">녹산동</option>
            </select>
          </div>
        </div>
      </div>
      
      <form method="POST" action="<%= contextPath%>/findHouses">
      	<Input name="dong" />
      	<Input name="aptName" />
      	<button>test</button>
      </form>
    
  </main>



   
   <section>

     <!-- 지도 -->
     <div id="map" >
    
        <div class="list-group">
       
            <a href="#" class="list-group-item list-group-item-action active" aria-current="true">
            <div class="d-flex w-100 justify-content-between">
                <h5 class="list-group-title">아파트별 정보</h5>
            </div>
            </a>
    
            <a href="#" class="list-group-item list-group-item-action">
                <div class="d-flex w-100 justify-content-between">
                    <h5 class="mb-1">그린코아아파트</h5>
                </div>
                <p class="mb-1">거래금액: 100,000원</p>
                <p class="mb-1">면적: 90.83</p>
                <small class="text-muted">2022.09.05</small>
            </a>
    
             <a href="#" class="list-group-item list-group-item-action">
                <div class="d-flex w-100 justify-content-between">
                    <h5 class="mb-1">신호일천푸른마을아파트</h5>
                </div>
                <p class="mb-1">거래금액: 300,000원</p>
                <p class="mb-1">면적: 81.33</p>
                <small class="text-muted">2022.09.07</small>
            </a>
            
            <a href="#" class="list-group-item list-group-item-action">
                <div class="d-flex w-100 justify-content-between">
                    <h5 class="mb-1">아이유쉘아파트</h5>
                </div>
                <p class="mb-1">거래금액: 500,000원</p>
                <p class="mb-1">면적: 102.83</p>
                <small class="text-muted">2022.09.08</small>
            </a>
            
            <a href="#" class="list-group-item list-group-item-action">
                <div class="d-flex w-100 justify-content-between">
                    <h5 class="mb-1">윌더하임</h5>
                </div>
                <p class="mb-1">거래금액: 550,000원</p>
                <p class="mb-1">면적: 999.99</p>
                <small class="text-muted">2022.09.03</small>
            </a>
        </div>
    
    </div>

   </section>
   
       
</div>
      


    <!-- 왼쪽 거래 정보 메뉴 -->


    

    <!-- <table class="table table-striped table-hover" >
        <tr>
          <th>거래 정보</th>
        </tr>
        <tr>
            <th>극동
                <br>
                거래금액
            </th>
        </tr>
        <tbody id="aptlist"></tbody>
    </table> -->

   
</div>




<script>
   var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(35.0953265, 128.8556681), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 
// 마커를 표시할 위치와 title 객체 배열입니다 
var positions = [
    {
        title: '그린코아아파트', 
        latlng: new kakao.maps.LatLng(35.095185,128.8558505)
    },
    {
        title: '신호일천푸른마을아파트', 
        latlng: new kakao.maps.LatLng(35.0957265, 128.8596681)
    },
    {
        title: '아이유쉘아파트', 
        latlng: new kakao.maps.LatLng(35.096295, 128.8576681)
    },
    {
        title: '윌더하임',
        latlng: new kakao.maps.LatLng(35.0933265, 128.8556681)
    }
];

// 마커 이미지의 이미지 주소입니다
var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
    
for (var i = 0; i < positions.length; i ++) {
    
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(24, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지 
    });

    var iwContent = `<div class="marker-info" style="padding:5px;">${positions[i].title}</div>`, // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    iwPosition = new kakao.maps.LatLng(33.450701, 126.570667); //인포윈도우 표시 위치입니다

// 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({
    position : iwPosition, 
    content : iwContent 
});
  
// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
infowindow.open(map, marker); 

}


</script>
<script>
    window.onload = async () => {
      // 공공데이터 api 부분 return text

      const getData = async () => {
      try {
        const url =
          "http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptTrade?LAWD_CD=11110&DEAL_YMD=201512&serviceKey=l8mq0OCEjEDRDqtt8j2xS7kwK2OYgw6453AFkmdVkDF2YvF6LmHEEWCjZ2FnOrcnmipoquf7wccg21CEGTWVvA%3D%3D";
        const response = await fetch(url);
        return response.text();
      } catch (error) {
        console.error(error);
      }
    };
    
    const getAddressData = async () => {
    	
    }

    	
  
    };	

    function makeList(data) {
        // document.querySelector("table").setAttribute("style", "display: ;");
        // let tbody = document.querySelector("#aptlist");
        let parser = new DOMParser();
        const xml = parser.parseFromString(data, "application/xml");
        // console.log(xml);
        initTable();
        let apts = xml.querySelectorAll("item");
        apts.forEach((apt) => {
          let tr = document.createElement("tr");

          let nameTd = document.createElement("td");
          nameTd.appendChild(document.createTextNode(apt.querySelector("아파트").textContent));
          tr.appendChild(nameTd);

          let floorTd = document.createElement("td");
          floorTd.appendChild(document.createTextNode(apt.querySelector("층").textContent));
          tr.appendChild(floorTd);

          let areaTd = document.createElement("td");
          areaTd.appendChild(document.createTextNode(apt.querySelector("전용면적").textContent));
          tr.appendChild(areaTd);

          let dongTd = document.createElement("td");
          dongTd.appendChild(document.createTextNode(apt.querySelector("법정동").textContent));
          tr.appendChild(dongTd);

          let priceTd = document.createElement("td");
          priceTd.appendChild(
            document.createTextNode(apt.querySelector("거래금액").textContent + "만원"),
          );
          priceTd.classList.add("text-end");
          tr.appendChild(priceTd);

          tbody.appendChild(tr);
        });
      }
  </script>
</body>
</html>