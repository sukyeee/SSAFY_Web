<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="home.dto.*"%>
<%
    String contextPath = request.getContextPath();
	UserDto userDto = (UserDto) session.getAttribute("userDto");

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
	       <div class="mb-3 mt-3 d-flex justify-content-center">
                 <h1>👩회원정보 수정‍‍👦</h1>
            </div>
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
         
            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
			  <button class="btn btn-primary "  type="submit" id="btnUpdate" >수정완료</button>
			  <button class="btn btn-danger" type="submit" id="btnDelete" >탈퇴</button>
			</div>
            
          </form>    
    </div>


 
    <script>
    window.onload = function() {
			
       
       	document.querySelector("#btnUpdate").onclick = function(e) {
       		e.preventDefault();
			if(validateUpdate()){
				userUpdate();
			}else{
				alertify.error("입력을 확인해 주세요.");
			}
		}
       	
     	document.querySelector("#btnDelete").onclick = function(e) {
       		e.preventDefault();
			userDelete();
		
		}
       	
        	
         
          
     };
    
     function validateUpdate(){
         // return true / false
         let isUserNameUpdateValid = false;
         let isUserEmailUpdateValid = false;
         let isUserPasswordUpdateValid = false;

         let isUserNameUpdateValue= document.querySelector("#userName").value;
         if( isUserNameUpdateValue.length > 0 ){
        	 isUserNameUpdateValid = true;
         }

         let isUserEmailUpdateValue = document.querySelector("#userEmail").value;
         if( isUserEmailUpdateValue.length > 0 ){
        	 isUserEmailUpdateValid = true;
         }

         let isUserPasswordUpdateValue = document.querySelector("#userPassword").value;
         if( isUserPasswordUpdateValue.length > 0 ){
        	 isUserPasswordUpdateValid = true;
         }

         
         if( isUserNameUpdateValid && isUserEmailUpdateValid && isUserPasswordUpdateValid ){
             return true;
         }
         return false;

     }
     
     async function userUpdate() {
     	let userName = document.querySelector("#userName").value;
   		let userEmail = document.querySelector("#userEmail").value;
        let userPassword = document.querySelector("#userPassword").value;

         // parameter
         let urlParams = new URLSearchParams({
        	 userName: userName,	
        	 userEmail : userEmail,
        	 userPassword: userPassword
         });
         // fetch options
         let fetchOptions = {
             method: "POST",
             body: urlParams
         }
         
         let url = "<%=contextPath%>/user/userUpdate";
				try{
				   let response = await fetch( url , fetchOptions );
	              let data = await response.json(); // json => javascript object <= JSON.parse()
	              if( data.result == "success" ){ 
	            	  alertify.success("회원 정보가 수정되었습니다.")

	              }else if( data.result == "fail" ){
	                  alertify.error('회원 정보 수정 과정에서 오류가 발생했습니다.');
	              }
				} catch(error){
               alertify.error('회원 정보 수정 과정에서 오류가 발생했습니다.');

				}
      
 	  }
     
     
     async function userDelete() {
     	 let userSeq = <%= userDto.getUserSeq() %>
         let url = "<%=contextPath%>/user/userDelete";
         let urlParams = "?userSeq=" + userSeq;
         
			try{
			   let response = await fetch( url + urlParams );
           let data = await response.json(); // json => javascript object <= JSON.parse()
           if( data.result == "success" ){ // login.jsp => boardMain.jsp로 페이지 이동 ( 새로운 페이지(html....) 요청)
         	  alertify.success("탈퇴 완료되었습니다.")
           }else if( data.result == "fail" ){
               alertify.error('탈퇴 과정에서 오류가 발생했습니다.');
           }
			} catch(error){
              alertify.error('탈퇴 과정에서 오류가 발생했습니다.');

			}
      
   	  }
	
     
     
     
    
    </script>
    

 
</body>
</html>