<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

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
	<body>
        <div class="container">
            <div class="mb-3 mt-3 d-flex justify-content-center">
                 <h1>👩‍👨‍👩‍👧‍👦숙희 마을👩‍👨‍👩‍👧‍👦</h1>
            </div>
            <div class="mb-3">
                <h2>Login</h2>
            </div>
            <div class="mb-3">
                <label for="userEmail" class="form-label">Email address</label>
                <input type="email" class="form-control" id="userEmail" placeholder="이메일을 입력하세요" value="hong@hong.com">
            </div>
            <div class="mb-3">
            <label for="userPassword" class="form-label">password</label>
            <input type="password" class="form-control" id="userPassword" placeholder="비밀번호를 입력하세요" value="1234">
            </div>
            
            <div>
                <button id="btnLogin" type="button" class="btn btn-primary">로그인</button>
                <a href="/BoardWebAjaxJson/jsp/register.jsp" class="btn btn-success">회원가입</a>
            </div>
        </div>
    
        <script>
            window.onload = function() {
            	document.querySelector("#btnLogin").onclick = function() {
                    let userEmailValue = document.querySelector("#userEmail").value;
                    let userPasswordValue = document.querySelector("#userPassword").value;
                    console.log( userEmailValue )
                    console.log( userPasswordValue )
    
                    // 프론트 -> 백엔드로 넘기기 전에,
                    // 유효성 검사 => post 전송 
                    if( validate() ){
                        alert('valid');
                        login();
                    } else {
                        // 유효성 검사 실패에 대한 UI 처리
                        alert('아이디 또는 패스워드를 확인하세요.');
                    }
                }
            };
    
            function validate(){
                // return true / false
                let isUserEmailValid = false;
                let isUserPasswordValid = false;
    
                let userEmailValue = document.querySelector("#userEmail").value;
                if( userEmailValue.length > 0 ){
                    isUserEmailValid = true;
                }
    
                let userPasswordValue = document.querySelector("#userPassword").value;
                if( userPasswordValue.length > 0 ){
                    isUserPasswordValid = true;
                }
             
                if( isUserEmailValid && isUserPasswordValid ){
                    return true;
                }
                return false;
    
            }
            
            async function login() {
                //validate() 가 true 를 return 하면 수행
                // 백엔드로 전송한 데이터(파라미터) 준비
                // 비동기로 요청
                // POST
                // 로그인 성공 => 게시판 메인 페이지로 이동 ( /board/boardMain)
                // 로그인 실패 => alert
    
                let userEmail = document.querySelector("#userEmail").value;
                let userPassword = document.querySelector("#userPassword").value;
    
                // parameter
                let urlParams = new URLSearchParams({
                    userEmail : userEmail,
                    userPassword: userPassword
                });
                // fetch options
                let fetchOptions = {
                    method: "POST",
                    body: urlParams
                }
    
                let response = await fetch( "<%= contextPath%>/login", fetchOptions );
                let data = await response.json(); // json => javascript object <= JSON.parse()
                if( data.result == "success" ){ // login.jsp => boardMain.jsp로 페이지 이동 ( 새로운 페이지(html....) 요청)
                    window.location.href = "<%= contextPath%>/board/boardMain";
                }else if( data.result == "fail" ){
                    alertify.error('아이디 또는 패스워드를 확인하세요');
                }
                //fetch(url, option)
            }
        </script>
    </body>
</body>
</html>