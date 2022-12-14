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
            <h1>π©βπ¨βπ©βπ§βπ¦μν¬ λ§μπ©βπ¨βπ©βπ§βπ¦</h1>
        </div>
        <div class="mb-3">
            <h2>Register</h2>
        </div>

        <!-- λΈλΌμ°μ μΌ λ°κΎΈμ§λ§! -->
        <form novalidate>

        
        <div class="mb-3">
            <label for="userName" class="form-label">User Name</label>
            <input type="text" class="form-control" id="userName" placeholder="μ΄λ¦μ μλ ₯νμΈμ.">
            <div class="valid-feedback">μ°Έ μνμ΄μ!</div>  
            <div class="invalid-feedback">μ΄λ¦μ 3μ μ΄μ μλ ₯νμΈμ.</div>  
        </div>
        <div class="mb-3">
            <label for="userPassword" class="form-label">Password</label>
            <input type="password" class="form-control" id="userPassword" placeholder="λΉλ°λ²νΈλ₯Ό μλ ₯νμΈμ.">
            <div class="valid-feedback">μ’μ λΉλ°λ²νΈλ€μ!</div>  
            <div class="invalid-feedback">1κ° μ΄μ νΉμ λ¬Έμ, μλ¬Έ, μ«μλ₯Ό ν¬ν¨νκ³  κΈΈμ΄λ 8μ΄μμ΄μ΄μΌ ν©λλ€.</div>  
        </div>
        <div class="mb-3">
            <label for="userPassword2" class="form-label">Password Confirm</label>
            <input type="password" class="form-control" id="userPassword2" placeholder="λΉλ°λ²νΈλ₯Ό λ€μ μλ ₯νμΈμ.">
            <div class="valid-feedback">μ’μ λΉλ°λ²νΈλ€μ!</div>  
            <div class="invalid-feedback">λΉλ°λ²νΈκ° λ€λ¦λλ€.</div>  
        </div>
        <div class="mb-3">
            <label for="userEmail" class="form-label">User Name</label>
            <input type="email" class="form-control" id="userEmail" placeholder="μ΄λ©μΌμ μλ ₯νμΈμ.">
            <div class="valid-feedback">κ΅Ώ</div>  
            <div class="invalid-feedback">μ΄λ©μΌμ νμΈν΄μ£ΌμΈμ.</div>  
        </div>
  
       
          <button id="btnRegister" type="button" class="btn btn-primary">
         	νμκ°μ
          </button>
       
        </form>
    </div>

    <script>
        window.onload = function() {

       	   document.querySelector("#btnRegister").onclick = function() {
       			console.log('btnregister !')
       			
       		   if( document.querySelectorAll("form .is-invalid").length > 0 ){
       			 alert("μλ ₯μ΄ μ¬λ°λ₯΄μ§ μμ΅λλ€.");
       		   } else{
       			   register();
       		   }
       	 }
       		   
             
        };
        
            document.querySelector("#userName").focus();

            // μ ν¨μ± κ²μ¬ μ²λ¦¬
            document.querySelector("#userName").onblur = function() {
                if( validateUserName( this.value ) ){ // μ ν¨
                    this.classList.remove('is-invalid');
                    this.classList.add('is-valid');
                }else { // μ ν¨ x
                    this.classList.remove('is-valid');
                    this.classList.add('is-invalid');
                }
            }

            document.querySelector("#userPassword").onblur = function() {
                if( validatePassword( this.value ) ){ // μ ν¨
                    this.classList.remove('is-invalid');
                    this.classList.add('is-valid');
                }else { // μ ν¨ x
                    this.classList.remove('is-valid');
                    this.classList.add('is-invalid');
                }
            }

            document.querySelector("#userPassword2").onblur = function() {
                if( validatePassword( this.value ) ){ // μ ν¨
                    this.classList.remove('is-invalid');
                    this.classList.add('is-valid');
                }else { // μ ν¨ x
                    this.classList.remove('is-valid');
                    this.classList.add('is-invalid');
                }
            }
 
            document.querySelector("#userEmail").onblur = function() {
                if( validateUserEmail( this.value ) ){ // μ ν¨
                    this.classList.remove('is-invalid');
                    this.classList.add('is-valid');
                }else { // μ ν¨ x
                    this.classList.remove('is-valid');
                    this.classList.add('is-invalid');
                }
            }

              // κΈΈμ΄κ° 3μ΄μμ΄λ©΄ valid
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
                // ^ μμμΌμΉ, $ λ μΌμΉ
                // {2, 3} 2κ° ~ 3κ°
                // * 0ν μ΄μ, + 1ν μ΄μ
                // [-_.] - λλ _ λλ .
                // ? μκ±°λ 1ν
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
                    if( data.result == "success" ){ // register.jsp => login.jspλ‘ νμ΄μ§ μ΄λ ( μλ‘μ΄ νμ΄μ§(html....) μμ²­)
                    	
                    	alertify.alert("Welcome!", "νμκ°μμ μΆνν©λλ€! λ‘κ·ΈμΈ νμ΄μ§λ‘ go!", function(){
                        	window.location.href = "<%= contextPath%>/jsp/login.jsp";
                  		  });
                    	
                    }else if( data.result == "fail" ){
                        alert('μλ² μ€λ₯!');
                    }
                    //fetch(url, option)
                };

        
  

    </script>
</body>
</html>