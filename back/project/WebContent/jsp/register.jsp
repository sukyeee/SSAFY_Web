<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String contextPath = request.getContextPath();%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Document</title>
  <link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
    crossorigin="anonymous"
  />
  <script
    src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
    integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
    crossorigin="anonymous"
  ></script>
  <script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
    integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
    crossorigin="anonymous"
  ></script>
  
  <!-- JavaScript -->
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
 <body class="container">
<body>
  <nav class="navbar navbar-expand-lg navbar-light bg-light shadow fixed-top">
    <div class="container">
      <a class="navbar-brand text-primary fw-bold" href="/map/mapMain">
        구해줘 홈즈
      </a>
    
      </div>
      </nav>
      <hr>
      <hr>
      <hr>
    <div class="container">
        <div class="row" style="height:85vh;">
            <div class="col-3"></div>
            <div class="col">
              <h2 class="text-center mt-5 mb-3">회원가입</h2>
                <form>
                      <div class="mb-3">
                        <label for="exampleInputPassword1" class="form-label">E-Mail</label>
                        <input type="text" id="userEmail" class="form-control" id="exampleInputPassword1">
                      </div>
                    <div class="mb-3">
                      <label for="exampleInputPassword1" class="form-label" >Password</label>
                      <input type="password" id="userPassword" class="form-control" id="exampleInputPassword1">
                    </div>
                    <div class="mb-3">
                        <label for="exampleInputPassword1" class="form-label">Name</label>
                        <input type="text" id="userName" class="form-control" id="exampleInputPassword1">
                      </div>
                      <div class="mb-3">
                      
                      
                      
               
        <div class="row" id="deal-header"> 
            <div class="col-2 mb-2">관심지역 </div>
            <div class="col-2 mb-2"> 서울 > </div>
            <div class="col-3 mb-2 me-4">
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
            <div class="col-3 mb-2 me-4">
             <select id="dong-select" class="form-select form-select-sm" aria-label=".form-select-sm example">
             ...
             </select>
             </div>

            </div>
            <hr>
   			<p>회원 구분</p>
			<div id="radio">
			
			</div> 
                      
                      
                      
                      
                      
                      </div>
                    <button type="button" id="btnRegister" class="btn btn-primary">Sign Up</button>
                  </form>
            </div>
            <div class="col-3"></div>
        </div>
    </div>
    <footer class="navbar navbar-expand-lg navbar-light bg-light container justify-content-end">
      <div class="row">
        <ul class="navbar-nav"> 
          <li><a href="#" class="nav-link text-secondary">사이트 소개</a></li>
          <li><a href="#" class="nav-link text-secondary">개인정보처리방침</a></li>
          <li><a href="#" class="nav-link text-secondary">이용약관</a></li>
          <li><a href="#" class="nav-link text-secondary">오시는길</a></li>
          <li><label class="nav-link text-secondary">&copy; SaveHomes Corp.</label></li>
        </ul>
      </div>
    </footer>
    <script>
    
    window.onload = function(){
        let gugun_select = document.querySelector("#gugun-select");
        gugun_select.onchange = function(){
            let value = (gugun_select.options[gugun_select.selectedIndex].value);
            dongList(Number(value));
        }
     
        dd();
        
    }

    //GET
    async function dongList(gugun){
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
    
    function makeDongSelectHtml(list){
        let listHtml = ``;
        
        list.forEach( el => {
            let code = el.code;
            let dong = el.name;
            listHtml +=
                '<option value=' + code + '>' + dong + '</option>';
        });
        
        document.querySelector("#dong-select").innerHTML = listHtml;
        
        //makeListHtmlEventHandler();
    }
    
    
    
    async function dd(){
        let url = '<%= contextPath %>/code/grade';
        let urlParams = '?code=001';

        let fetchOptions = {
            method: 'GET',
        }
        
        try{
            let response = await fetch( url + urlParams);
            let data = await response.json();
            
            console.log(data);
            makeCodeHtml(data);
        }catch( error ){
            console.log(error);
        }
        
    }
    
    function makeCodeHtml(list){
    	let listHtml = ``;
    	
    	list.forEach( el => {
    		let code = el.childCode;
    		let name = el.childName;
    		listHtml +=
    		   "<label><input type=radio name=code value="+name+">"+name+"</label>"
   
    	});
    	
    	document.querySelector("#radio").innerHTML = listHtml;
    	
    	//makeListHtmlEventHandler();
    }
      document.querySelector("#btnRegister").addEventListener("click", btnRegisterClickListener);

      function btnRegisterClickListener(e) {
        const userEmail = document.querySelector("#userEmail").value;
        const userPassword = document.querySelector("#userPassword").value;
        const userName = document.querySelector("#userName").value;
        let interestCode = document.querySelector("#dong-select").value;
        let commonName = document.querySelector("input[name='code']:checked").value;
        
        console.log(commonName);
        
           register(userEmail, userPassword, userName, interestCode, commonName); 
        }
      

      async function register(userEmail, userPassword, userName, interestCode, commonName) {
        const urlParams = new URLSearchParams({
          userEmail,
          userPassword,
          userName,
          interestCode,
          commonName
       });

        const fetchOptions = {
          method: "POST",
          body: urlParams,
        };

        const response = await fetch("<%= contextPath%>/register", fetchOptions);
        const data = await response.json(); // json => javascript object <= JSON.parse()
        console.log(data);
        if (data.result === "success") {
          // login.jsp => boardMain.jsp로 페이지 이동 (새로운 페이지(html...) 요청)
          window.location.href = "<%= contextPath%>/jsp/login.jsp";
  
        } else if (data.result === "fail") {
          alertify.alert("오류","중복된 이메일이 존재합니다.");
        } 
      }
     
    </script>
  </body>
</html>