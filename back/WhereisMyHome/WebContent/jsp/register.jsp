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
    <title>Document</title>
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
    <div class="container-fluid" style="width: 50%; padding-top: 10rem">
        <form class="row g-3">
            
            <div class="col-12">
              <label for="userName" class="form-label">이름</label>
              <input type="text" class="form-control" id="userName">
               <div class="valid-feedback">참 잘했어요!</div>  
           	   <div class="invalid-feedback">이름을 3자 이상 입력하세요.</div> 
            </div>
            
            <div class="col-md-6">
              <label for="userEmail" class="form-label">이메일</label>
              <input type="email" class="form-control" id="userEmail">
              <div class="valid-feedback">굿</div>  
              <div class="invalid-feedback">이메일을 확인해주세요.</div>  
            </div>
            
            <div class="col-md-6">
              <label for="userPassword" class="form-label">비밀번호</label>
              <input type="password" class="form-control" id="userPassword">
			   <div class="valid-feedback">좋은 비밀번호네요!</div>  
          	   <div class="invalid-feedback">1개 이상 특수 문자, 영문, 숫자를 포함하고 길이는 8이상이어야 합니다.</div>  
            </div>
            
            <div class="col-12">
              <div class="form-check">
                <input class="form-check-input" type="checkbox" id="gridCheck">
                <label class="form-check-label" for="gridCheck">
                  약관에 동의합니다.
                </label>
              </div>
              
            </div>
            <div class="col-12">
              <button type="submit" id="btnRegister" class="btn btn-primary">회원가입</button>
            </div>
          </form>    
    </div>
    
    <script>
    window.onload = function() {

    	   document.querySelector("#btnRegister").onclick = function(e) {
    			
    		   e.preventDefault();

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

            let response = await fetch( "<%= contextPath%>/user/userRegist", fetchOptions );
            let data = await response.json(); // json => javascript object <= JSON.parse()

            if( data.result == "success" ){ // register.jsp => login.jsp로 페이지 이동 ( 새로운 페이지(html....) 요청)
            	
            	alertify.alert("Welcome!", "회원가입을 축하합니다! 로그인 페이지로 go!", function(){
                	window.location.href = "<%= contextPath%>/jsp/index.jsp";
          		  });
            	
            }else if( data.result == "fail" ){
                alert('서버 오류!');
            }
            //fetch(url, option)
        };
        
    
    </script>
    
    
    
    
    
 
</body>
</html>