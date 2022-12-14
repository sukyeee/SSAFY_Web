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
    <title>login</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./css/style.css" type="text/css" />
     <!-- JavaScript -->
        <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
    
        <!-- CSS -->
        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css" />
        <!-- Default theme -->
        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css" />
        <!-- Semantic UI theme -->
        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css" />
        <!-- Bootstrap theme -->
        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/bootstrap.min.css" />
    
</head>
<body>
  <nav class="navbar navbar-expand-lg navbar-light bg-light shadow fixed-top">
    <div class="container">
      <a class="navbar-brand text-primary fw-bold" href="#">
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
    </div>
  </nav>
  <hr>
  <hr>
  <hr>
    <div class="container">
        <div class="row" style="height:85vh;">
            <div class="col-3"></div>
            <div class="col">
              <h2 class="text-center mt-5 mb-3">로그인</h2>
                <form>
                    <div class="mb-3">
                      <label for="exampleInputEmail1"  class="form-label">ID</label>
                      <input type="text" class="form-control" id="userEmail" aria-describedby="emailHelp">
                    </div>
                    <div class="mb-3">
                      <label for="exampleInputPassword1" class="form-label">Password</label>
                      <input type="password" class="form-control"id="userPassword">
                    </div>
                    <div class="mb-3 form-check">
                      <input type="checkbox" class="form-check-input" id="exampleCheck1">
                      <label class="form-check-label" for="exampleCheck1">자동로그인</label>
                    </div>
                    <button type="button" id="btnLogin" class="btn btn-primary">Login</button>
					<a href="./register.jsp" class="btn">회원가입</a>
        
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
          window.onload = function () {
            document.querySelector("#btnLogin").onclick = function () {
               //유효성 검사 => Post
              if (validate()) {
            	  console.log("여기")
                login();
              } else {
                //유효성 검사 실패에 대한 UI 처리
                alertify.alert("오류","아이디 또는 패스워드를 확인하세요");
              }
            };
            
            document.querySelector("#btnRegister").onclick =function(){
            	
            }
            
            
          };
          
          
          
          
    
          function validate() {
            let isUserEmailValid = false;
            let isUserPasswordValid = false;
            
            let userEmailValue = document.querySelector("#userEmail").value;
              if(userEmailValue.length > 0){	
            	  isUserEmailValid = true;
              }
            
            let userPassword = document.querySelector("#userPassword").value;
              if(userPassword.length > 0){
            	  isUserPasswordValid = true;
              }
            
            if(isUserEmailValid && isUserPasswordValid){
              return true;
            }
            return false;
          }
    
          async function login() {
            //validate()
    
            let userEmailValue = document.querySelector("#userEmail").value;
            let userPasswordValue = document.querySelector("#userPassword").value;
    
            let urlParams = new URLSearchParams({
              userEmail : userEmailValue,
              userPassword : userPasswordValue
            });
            
            let fetchOptions = {
              method : "POST",
              body:urlParams
            }
            
            let response = await fetch("<%= contextPath%>/login",fetchOptions);
            let data = await response.json();
            if(data.result=="success"){// login.jsp => boardMain.jsp
              window.location.href="<%= contextPath%>/jsp/map/mapMain.jsp"
            }
            else if(data.result == 'fail'){
            	alertify.alert("오류","아이디 또는 패스워드를 확인하세요");
            }
          }
    
        </script>
</body>
</html>
