<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/index.css" />
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
<!-- CSS -->

<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
<!-- Default theme -->

<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
<!-- Semantic UI theme -->

<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
<!-- Bootstrap theme -->

<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/bootstrap.min.css"/>
</head>
<style>
   

</style>
<body>
  <div class="container-fluid">
  	<%@ include file="./header.jsp" %>

    <header>
        <div class="header-main">

            <!-- <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpBikJfmp4hdfGgW8rF5vhgNYDgv1KE6X1_w&usqp=CAU" alt="" style="width: 95%; height: 400px; margin-top: 2rem; margin-left: 2.5%"> -->
            <img class="header-main-img" src="img/house.jpeg" alt="">
            <div class="header-main-img-black"> </div>
            <div class="main-title">
              <div class="main-title-content">
                <p>구해줘 홈즈</p>
                <p>우리들을 위한 집</p>  
              </div>
            </div>
          </img>
            
            <div class="header-menu">
              <!-- <img class = "logo" style="width: 20rem; padding-left: 3rem" src="http://www.newsworker.co.kr/news/photo/202204/153752_169267_517.png" class="card-img-top" alt="..."> -->
            
              <div class="header-menu-right">
                <a href="#">오늘의 뉴스</a>
                <a href="#">공지사항</a>
              </div>
            </div>

        </div>
       
    </header>
    
    <main>
        <div class="main-top">
          
            
         </div>
        
        <div class="main-bottom">
          <div class="row col-md-8 justify-content-center mb-2">
     
             <form class="d-flex">
		      <input class="form-control me-2" id= "searchInputText" type="search" placeholder="아파트 검색" value="" aria-label="Search" >
              <button type="button" class="btn btn-light" id="searchBtn" onclick="search()">  <a href="aptlist_apt.jsp">🔍</a> </button>
		    </form>
		    
          </div>
        </div>
      
    </main>

    <footer>
    <div class="footer-card">
      <img src="img/house1.jpeg">
        <div class="footer-card-dark"></div>
        <p class="footer-card-title">지혜롭게 내집 마련하기</p>
        <div class="footer-card-content">
          <p>#대출</p>
          <p>#부동산</p>
          <p>#집구경</p>
        </div>
      </img>
    </div>
    <div class="footer-card">
      <img src="img/house2.jpg">
    </div>
    <div class="footer-card">
      <img src="img/house3.jpg">    
      <div class="footer-card-dark"></div>
        <p class="footer-card-title">부동산 뉴스</p>
        <div class="footer-card-content">
          <p>#서울아파트매매</p>
          <p>#거래한파</p>
          <p>#리모델링</p>
        </div>
      </img>  
    </div>

  </footer>

  </div>
  <!-- container -->
  </body>

  <script>

	   	function search() {
		     var keyword = document.querySelector("#searchInputText");
			 sessionStorage.setItem("keyword", keyword);
	   	}
	    
	    
	    
  </script>
</html>