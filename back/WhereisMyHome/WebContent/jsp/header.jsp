<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    String contextPath = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/header.css" />

</head>
<body>
    <nav class="navbar navbar-light bg-light">
      
      <div id="login-modal" style="position: relative;">
        <form>
          <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">이메일</label>
            <input type="email" class="form-control" id="userEmail" aria-describedby="idHelp">
          </div>
          <div class="mb-3">
            <label for="exampleInputPassword1" class="form-label">비밀번호</label>
            <input type="password" class="form-control" id="userPassword">
          </div>
          <button type="submit" class="btn btn-primary" id="btnLogin" onclick="loginBtnClick(event);">로그인</button>
        </form>
        <button class="btn btn-primary" style="position: absolute; bottom: 26px; right: 10px;"onclick="closeModal();">닫기</button>
      </div>

      <div id="nav-menu">
			
			<div id="nav-menu-left">
		 		<button class="btn btn-sm btn-outline-secondary" id="homeBtn"><a href="./index.jsp">Home</a></button>
			</div>
  			<div id="nav-menu-right">
	  			<button class="btn btn-sm btn-outline-secondary show-btn" type="button" id="login-btn" onclick="showModal();">login</button>
		        <button class="btn btn-sm btn-outline-secondary hide-btn" type="button" id="logout-btn" onclick="logout()"><a href="<%= contextPath %>/user/userLogout?act=logout" >logout</a></button>
		        
		        <button class="btn btn-sm btn-outline-secondary show-btn" type="button" id="register-btn" ><a href="../user/registerForm">register</a></button>
		        <button class="btn btn-sm btn-outline-secondary hide-btn" type="button" id="mypage-btn" >  <a href="myPage.jsp"> Mypage </a> </button>
  			</div>
   	
	   		
   		</div>
    	
    	
 
    </nav>
    
    <script>
    
    function loginBtnClick(e) {
		  
		  e.preventDefault();
		  
	      let userEmailValue = document.querySelector("#userEmail").value;
	      let userPasswordValue = document.querySelector("#userPassword").value;
	      
	      console.log(userEmailValue);
	      console.log(userPasswordValue);
	
	      if( validate() ){
	          login();
	      } else {
	          alert('다시');
	      }
	  }
	
	  function validate(){
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
	      // validate() 가 true 를 return 하면 수행
	      // 백엔드로 전송한 데이터(파라미터) 준비
	      // 비동기로 요청
	      // POST
	      // 로그인 성공 => 게시판 메인 페이지로 이동 ( /board/boardMain)
	      // 로그인 실패 => alert
	
	      let userEmailValue = document.querySelector("#userEmail").value;
	      let userPasswordValue = document.querySelector("#userPassword").value;
	      
	      console.log(userEmailValue);
	      console.log(userPasswordValue);
	
	      // parameter
	      let urlParams = new URLSearchParams({
	          userEmail : userEmailValue,
	          userPassword: userPasswordValue,
	      });
	      // fetch options
	      let fetchOptions = {
	          method: "POST",
	          body: urlParams,
	      }
	
	      let response = await fetch( "<%= contextPath%>/user/userLogin", fetchOptions );
	      let data = await response.json(); // json => javascript object <= JSON.parse()
	      if( data.result == "success" ){ // login.jsp => boardMain.jsp로 페이지 이동 ( 새로운 페이지(html....) 요청)
	          closeModal();
	      		
	      	document.querySelector("#login-btn").classList.remove("show-btn");
	      	document.querySelector("#login-btn").classList.add("hide-btn");
	      	
	      	document.querySelector("#logout-btn").classList.remove("hide-btn");
	      	document.querySelector("#logout-btn").classList.add("show-btn");

	      	document.querySelector("#register-btn").classList.remove("show-btn");
	      	document.querySelector("#register-btn").classList.add("hide-btn");

	      	
	      	document.querySelector("#mypage-btn").classList.remove("hide-btn");
	      	document.querySelector("#mypage-btn").classList.add("show-btn");

	      	
	      	
	      }else if( data.result == "fail" ){
	          alertify.error('다시');
	      }
	      //fetch(url, option)
	  }
	     function showModal() {
	      var element = document.querySelector("#login-modal");
	      element.setAttribute("style", "display: inline-block");
	    }
	
	    function closeModal() {
	      var element = document.querySelector("#login-modal");
	      element.setAttribute("style", "display: none");
	      console.log("closed");
	    }
	
	    function logout() {
	
	      // alert("정상적으로 로그아웃 되었습니다.");
	
	      var loginBtn = document.querySelector("#login-btn");
	      var logoutBtn = document.querySelector("#logout-btn");
	
	      loginBtn.classList.remove("hide-btn");
	      loginBtn.classList.add("show-btn");
	
	      logoutBtn.classList.remove("show-btn");
	      logoutBtn.classList.add("hide-btn");
	      
	      document.querySelector("#mypage-btn").classList.remove("show-btn");
	  	  document.querySelector("#mypage-btn").classList.add("hide-btn");

	    }
    
    </script>
</body>
</html>