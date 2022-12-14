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
                 <h1>π©βπ¨βπ©βπ§βπ¦μν¬ λ§μπ©βπ¨βπ©βπ§βπ¦</h1>
            </div>
            <div class="mb-3">
                <h2>Login</h2>
            </div>
            <div class="mb-3">
                <label for="userEmail" class="form-label">Email address</label>
                <input type="email" class="form-control" id="userEmail" placeholder="μ΄λ©μΌμ μλ ₯νμΈμ" value="hong@hong.com">
            </div>
            <div class="mb-3">
            <label for="userPassword" class="form-label">password</label>
            <input type="password" class="form-control" id="userPassword" placeholder="λΉλ°λ²νΈλ₯Ό μλ ₯νμΈμ" value="1234">
            </div>
            
            <div>
                <button id="btnLogin" type="button" class="btn btn-primary">λ‘κ·ΈμΈ</button>
                <a href="/BoardWebAjaxJson/jsp/register.jsp" class="btn btn-success">νμκ°μ</a>
            </div>
        </div>
    
        <script>
            window.onload = function() {
            	document.querySelector("#btnLogin").onclick = function() {
                    let userEmailValue = document.querySelector("#userEmail").value;
                    let userPasswordValue = document.querySelector("#userPassword").value;
                    console.log( userEmailValue )
                    console.log( userPasswordValue )
    
                    // νλ‘ νΈ -> λ°±μλλ‘ λκΈ°κΈ° μ μ,
                    // μ ν¨μ± κ²μ¬ => post μ μ‘ 
                    if( validate() ){
                        alert('valid');
                        login();
                    } else {
                        // μ ν¨μ± κ²μ¬ μ€ν¨μ λν UI μ²λ¦¬
                        alert('μμ΄λ λλ ν¨μ€μλλ₯Ό νμΈνμΈμ.');
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
                //validate() κ° true λ₯Ό return νλ©΄ μν
                // λ°±μλλ‘ μ μ‘ν λ°μ΄ν°(νλΌλ―Έν°) μ€λΉ
                // λΉλκΈ°λ‘ μμ²­
                // POST
                // λ‘κ·ΈμΈ μ±κ³΅ => κ²μν λ©μΈ νμ΄μ§λ‘ μ΄λ ( /board/boardMain)
                // λ‘κ·ΈμΈ μ€ν¨ => alert
    
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
                if( data.result == "success" ){ // login.jsp => boardMain.jspλ‘ νμ΄μ§ μ΄λ ( μλ‘μ΄ νμ΄μ§(html....) μμ²­)
                    window.location.href = "<%= contextPath%>/board/boardMain";
                }else if( data.result == "fail" ){
                    alertify.error('μμ΄λ λλ ν¨μ€μλλ₯Ό νμΈνμΈμ');
                }
                //fetch(url, option)
            }
        </script>
    </body>
</body>
</html>