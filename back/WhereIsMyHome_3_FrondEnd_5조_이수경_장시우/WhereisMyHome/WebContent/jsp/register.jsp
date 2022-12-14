<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="home.dto.*" %>
<%@ page import="java.util.*" %>
<%
    String contextPath = request.getContextPath();
	// List<Hospital> hospitalList = (List<Hospital>) request.getAttribute("hospital");
	List<CodeDto> codeList = (List<CodeDto>) request.getAttribute("codeList");
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
              <label for="userName" class="form-label">??????</label>
              <input type="text" class="form-control" id="userName">
               <div class="valid-feedback">??? ????????????!</div>  
           	   <div class="invalid-feedback">????????? 3??? ?????? ???????????????.</div> 
            </div>
            
            <div class="col-md-6">
              <label for="userEmail" class="form-label">?????????</label>
              <input type="email" class="form-control" id="userEmail">
              <div class="valid-feedback">???</div>  
              <div class="invalid-feedback">???????????? ??????????????????.</div>  
            </div>
            
            <div class="col-md-6">
              <label for="userPassword" class="form-label">????????????</label>
              <input type="password" class="form-control" id="userPassword">
			   <div class="valid-feedback">?????? ??????????????????!</div>  
          	   <div class="invalid-feedback">1??? ?????? ?????? ??????, ??????, ????????? ???????????? ????????? 8??????????????? ?????????.</div>  
            </div>
      
            <div class="col-12">
        
		 	<div class="form-check form-check-inline">
			  <input class="form-check-input" type="radio" name="userClsf" id="inlineRadio1" value=<%= codeList.get(0).getCode() %>>
			  <label class="form-check-label" for="inlineRadio1"><%= codeList.get(0).getCodeName() %></label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="radio" name="userClsf" id="inlineRadio2" value=<%= codeList.get(1).getCode() %>>
			  <label class="form-check-label" for="inlineRadio2"><%= codeList.get(1).getCodeName() %></label>
			</div>
			<br>
            <br>
            <div class="col-12">
              <button type="submit" id="btnRegister" class="btn btn-primary">????????????</button>
            </div>
          </form>    
    </div>
    
    <script>
    window.onload = function() {
    	
    	
    	

    	   document.querySelector("#btnRegister").onclick = function(e) {
    			
    		   e.preventDefault();

    		   if( document.querySelectorAll("form .is-invalid").length > 0 ){
    			 alert("????????? ???????????? ????????????.");
    		   } else{
    			   register();
    		   }
    	 }
    		   
          
     };
     
     document.querySelector("#userName").focus();

     // ????????? ?????? ??????
     document.querySelector("#userName").onblur = function() {
         if( validateUserName( this.value ) ){ // ??????
             this.classList.remove('is-invalid');
             this.classList.add('is-valid');
         }else { // ?????? x
             this.classList.remove('is-valid');
             this.classList.add('is-invalid');
         }
     }

     document.querySelector("#userPassword").onblur = function() {
         if( validatePassword( this.value ) ){ // ??????
             this.classList.remove('is-invalid');
             this.classList.add('is-valid');
         }else { // ?????? x
             this.classList.remove('is-valid');
             this.classList.add('is-invalid');
         }
     }
    
     document.querySelector("#userEmail").onblur = function() {
         if( validateUserEmail( this.value ) ){ // ??????
             this.classList.remove('is-invalid');
             this.classList.add('is-valid');
         }else { // ?????? x
             this.classList.remove('is-valid');
             this.classList.add('is-invalid');
         }
     }
     
     // ????????? 3???????????? valid
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
	         // ^ ????????????, $ ??? ??????
	         // {2, 3} 2??? ~ 3???
	         // * 0??? ??????, + 1??? ??????
	         // [-_.] - ?????? _ ?????? .
	         // ? ????????? 1???
	         let regexp =
	         /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	         if (regexp.test(userEmail)) return true;
	         else return false;
     	}
    	
     	async function register() {
            
       		let userName = document.querySelector("#userName").value;
            let userEmail = document.querySelector("#userEmail").value;
            let userPassword = document.querySelector("#userPassword").value;
			let userClsfList = document.getElementsByName("userClsf");
			
			let userClsf = null;
			userClsfList.forEach((node) => {
				if(node.checked){
					userClsf = node.value;
				}
			})
			
            // parameter
            let urlParams = new URLSearchParams({
            	userName : userName,
            	userEmail : userEmail,
                userPassword: userPassword,
                userClsf: userClsf,
             
            });
            // fetch options
            let fetchOptions = {
                method: "POST",
                body: urlParams
            }

            let response = await fetch( "<%= contextPath%>/user/userRegist", fetchOptions );
            let data = await response.json(); // json => javascript object <= JSON.parse()

            if( data.result == "success" ){ // register.jsp => login.jsp??? ????????? ?????? ( ????????? ?????????(html....) ??????)
            	
            	alertify.alert("Welcome!", "??????????????? ???????????????! ????????? ???????????? go!", function(){
                	window.location.href = "<%= contextPath%>/jsp/index.jsp";
          		  });
            	
            }else if( data.result == "fail" ){
                alert('?????? ??????!');
            }
            //fetch(url, option)
        };
        
    
    </script>
    
    
    
    
    
 
</body>
</html>