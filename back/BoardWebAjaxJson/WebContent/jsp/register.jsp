<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

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
<body>
    <div class="container">
        <div class="mb-3 mt-3 d-flex justify-content-center">
            <h1>👩‍👨‍👩‍👧‍👦숙희 마을👩‍👨‍👩‍👧‍👦</h1>
        </div>
        <div class="mb-3">
            <h2>Register</h2>
        </div>

        <!-- 브라우저야 바꾸지마! -->
        <form novalidate>

        
        <div class="mb-3">
            <label for="userName" class="form-label">User Name</label>
            <input type="text" class="form-control" id="userName" placeholder="이름을 입력하세요.">
            <div class="valid-feedback">참 잘했어요!</div>  
            <div class="invalid-feedback">이름을 3자 이상 입력하세요.</div>  
        </div>
        <div class="mb-3">
            <label for="userPassword" class="form-label">Password</label>
            <input type="password" class="form-control" id="userPassword" placeholder="비밀번호를 입력하세요.">
            <div class="valid-feedback">좋은 비밀번호네요!</div>  
            <div class="invalid-feedback">1개 이상 특수 문자, 영문, 숫자를 포함하고 길이는 8이상이어야 합니다.</div>  
        </div>
        <div class="mb-3">
            <label for="userPassword2" class="form-label">Password Confirm</label>
            <input type="password" class="form-control" id="userPassword2" placeholder="비밀번호를 다시 입력하세요.">
            <div class="valid-feedback">좋은 비밀번호네요!</div>  
            <div class="invalid-feedback">비밀번호가 다릅니다.</div>  
        </div>
        <div class="mb-3">
            <label for="userEmail" class="form-label">User Name</label>
            <input type="email" class="form-control" id="userEmail" placeholder="이메일을 입력하세요.">
            <div class="valid-feedback">굿</div>  
            <div class="invalid-feedback">이메일을 확인해주세요.</div>  
        </div>
  
       
          <button id="btnRegister" type="button" class="btn btn-primary">
         	회원가입
          </button>
       
        </form>
    </div>

    <script>
        window.onload = function() {

       	   document.querySelector("#btnRegister").onclick = function() {
       			console.log('btnregister !')
       			
       		   if( document.querySelectorAll("form .is-invalid").length > 0 ){
       			 alert("입력이 올바르지 않습니다.");
       		   } else{
       			   register();
       		   }
       	 }
       		   
             
        };
        
            document.querySelector("#userName").focus();

            // 유효성 검사 처리
            document.querySelector("#userName").onblur = function() {
                if( validateUserName( this.value ) ){ // 유효
                    this.classList.remove('is-invalid');
                    this.classList.add('is-valid');
                }else { // 유효 x
                    this.classList.remove('is-valid');
                    this.classList.add('is-invalid');
                }
            }

            document.querySelector("#userPassword").onblur = function() {
                if( validatePassword( this.value ) ){ // 유효
                    this.classList.remove('is-invalid');
                    this.classList.add('is-valid');
                }else { // 유효 x
                    this.classList.remove('is-valid');
                    this.classList.add('is-invalid');
                }
            }

            document.querySelector("#userPassword2").onblur = function() {
                if( validatePassword( this.value ) ){ // 유효
                    this.classList.remove('is-invalid');
                    this.classList.add('is-valid');
                }else { // 유효 x
                    this.classList.remove('is-valid');
                    this.classList.add('is-invalid');
                }
            }
 
            document.querySelector("#userEmail").onblur = function() {
                if( validateUserEmail( this.value ) ){ // 유효
                    this.classList.remove('is-invalid');
                    this.classList.add('is-valid');
                }else { // 유효 x
                    this.classList.remove('is-valid');
                    this.classList.add('is-invalid');
                }
            }

              // 길이가 3이상이면 valid
             function validateUserName( userName ){
                    if( userName.length >= 3 ) return true;
                    else return false;
                }

        
                function validatePassword(userPassword) {
       
                var patternEngAtListOne = new RegExp(/[a-zA-Z]+/);// + for at least one
                var patternSpeAtListOne = new RegExp(/[~!@#$%^&*()_+|<>?:{}]+/);// + for at least one
                var patternNumAtListOne = new RegExp(/[0-9]+/);// + for at least one

                if( patternEngAtListOne.test( userPassword ) 
                        && patternSpeAtListOne.test( userPassword )  
                        && patternNumAtListOne.test( userPassword )
                        && userPassword.length >= 8
                ){
                    return true;
                }
                else return false;
                }

                function validatePassword2(userPassword2) {
                    if (userPassword2 == document.querySelector("#userPassword").value ) return true;
                    else return false;
                }

                function validateUserEmail(userEmail) {
                // ^ 시작일치, $ 끝 일치
                // {2, 3} 2개 ~ 3개
                // * 0회 이상, + 1회 이상
                // [-_.] - 또는 _ 또는 .
                // ? 없거나 1회
                let regexp =
                /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
                if (regexp.test(userEmail)) return true;
                else return false;
            	}

                async function register() {
               
               		let userName = document.querySelector("#userName").value;
                    let userEmail = document.querySelector("#userEmail").value;
                    let userPassword = document.querySelector("#userPassword").value;
        
                    // parameter
                    let urlParams = new URLSearchParams({
                    	userName : userName,
                    	userEmail : userEmail,
                        userPassword: userPassword
                     
                    });
                    // fetch options
                    let fetchOptions = {
                        method: "POST",
                        body: urlParams
                    }
        
                    let response = await fetch( "<%= contextPath%>/register", fetchOptions );
                    let data = await response.json(); // json => javascript object <= JSON.parse()
                    if( data.result == "success" ){ // register.jsp => login.jsp로 페이지 이동 ( 새로운 페이지(html....) 요청)
                    	
                    	alertify.alert("Welcome!", "회원가입을 축하합니다! 로그인 페이지로 go!", function(){
                        	window.location.href = "<%= contextPath%>/jsp/login.jsp";
                  		  });
                    	
                    }else if( data.result == "fail" ){
                        alert('서버 오류!');
                    }
                    //fetch(url, option)
                };

        
  

    </script>
</body>
</html>