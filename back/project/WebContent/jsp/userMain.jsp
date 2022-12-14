<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
        String contextPath = request.getContextPath();
    %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>info</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous"
    />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css"
    />
    <link rel="stylesheet" href="./style.css" type="text/css" />
    
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
          <a class="navbar-brand text-primary fw-bold" href="<%=contextPath %>/map/mapMain">
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
            <!-- 로그인 전 -->
            
            <ul class="navbar-nav mb-2 me-2 mb-lg-0">
            <li class="nav-item">
                <a class="nav-link" aria-current="page" id="parking" href="<%=contextPath %>/jsp/map/mapParking.jsp">관심지역 주차장 정보</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" aria-current="page" id="logout" href="#">로그아웃</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" aria-current="page" href="#">마이페이지</a>
              </li>
            </ul>
          </div>
        </div>
    </nav>
    <hr>
    <hr>
    <hr>
    <!-- 상단 navbar end -->
    <!-- 중앙 content start -->
    <div class="container">
      <div style="height: 70px"></div>
      <h2 class="text-center mt-5 mb-3">내 정보</h2>
      <div class="container">
         <table class="table">
			  <thead>
			    <tr>
			      <th scope="col">이메일</th>
			      <th scope="col">비밀번호</th>
			      <th scope="col">이름</th>
			    </tr>
			  </thead>
			  <tbody id="userTbody">
			    <tr>
			      <td></td>
			      <td></td>
			      <td></td>
			    </tr>
			  </tbody>
			</table>
           	<button id="btnChangePassword" type="button" class="btn btn-sm btn-primary">비밀번호 변경</button>
           	<button id="btnDeleteUser" type="button" class="btn btn-sm btn-warning">탈퇴하기</button>
        </div>
      </div>
      <hr>
      </div>
            <!-- Modal Update-->
        <div class="modal fade" id="UserUpdateModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">비밀번호 수정</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">            
                <div class="mb-3">
                    <label for="titleUpdate" class="form-label">현재 비밀번호</label>
                    <input type="text" class="form-control" id="currentPassword">
                  </div>
                  <div class="mb-3">
                    <label for="contentUpdate" class="form-label">바꿀 비밀번호</label>
                    <textarea class="form-control" id="nextPassword" rows="1"></textarea>
                  </div>
                  <button id="btnUserUpdate" type="button" class="btn btn-sm btn-primary float-end">수정</button>
            </div>            
          </div>
        </div>
      </div>
    <!-- 중앙 content end -->
    <footer
      class="navbar navbar-expand-lg navbar-light bg-light container justify-content-end fixed-bottom bottom-0"
    >
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
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
      crossorigin="anonymous">
    </script>
    <script>
	window.onload = function(){
			userInfo();
	}
		async function userInfo(){
    		let url = '<%= contextPath %>/user/userInfo';
    		console.log(url);
    		let fetchOptions = {
    			method: 'GET',
    		}
    		
    		try{
    			
    			let response = await fetch( url, fetchOptions);
    			console.log(response);
    			let data = await response.json();
    			console.log( data );
    			makeListHtml( data );
    		}catch( error ){
          console.log(error);
          alertify.alert("오류",'정보를 불러오지 못하였습니다.')
    		}
    	}
    	
    	// javascript array 를 이용해서 테이블 <tr> 을 반복적으로 만들어서 목록을 완성
    	function makeListHtml( list ){
    		console.log(list);
    		let listHtml = ``;
    			listHtml +=
    				`<tr><td id="userEmail">\${list.userEmail}</td><td>\${list.userPassword}</td><td>\${list.userName}</td></tr>`;
    
    		document.querySelector("#userTbody").innerHTML = listHtml;
    	}
    	
		document.querySelector("#btnChangePassword").onclick = function(){
			let modalUpdate = new bootstrap.Modal(
					document.querySelector("#UserUpdateModal")
			);
			modalUpdate.show();
		}
    	
		document.querySelector("#btnUserUpdate").onclick = function(){
			userUpdate();
		}
		
        async function userUpdate(){
        	let userEmail = document.querySelector("#userEmail").value;
        	let userPassword = document.querySelector("#currentPassword").value;
            let nextPassword = document.querySelector("#nextPassword").value;

            // parameter 
            let urlParams = new URLSearchParams({
            	userEmail: userEmail,
            	userPassword: userPassword,
            	nextPassword: nextPassword
            });
            // fetch options
            let fetchOptions = {
              method: "POST",
              body: urlParams
            }

            let url = "<%= contextPath%>/user/userUpdate";
            try{
                let response = await fetch( url, fetchOptions);
                let data = await response.json(); // json => javascript object <= JSON.parse()
                if( data.result == "success"){ // login.jsp => boardMain.jsp 로 페이지 이동 ( 새로운 페이지(html....) 요청)
                	alertify.alert("성공",'비밀번호가 변경되었습니다..');
                  userInfo();
                }else if( data.result == "fail"){
                	alertify.alert("오류",'비밀번호가 변경 과정에서 오류가 발생했습니다.');
                }            	
            }catch(error){
            	alertify.alert("오류",'글 수정 과정에서 오류가 발생했습니다.');
            }

        }
        
		 document.querySelector("#btnDeleteUser").onclick = function(){
					alertify.confirm("삭제 확인", "정말 탈퇴하실겁니까?", 
							function(){
								console.log("sss");
								userDelete();
							}, 
							function(){
								console.log('user cancel');
							});	
		} 
		
    async function userDelete(){
 
            let url = "<%= contextPath%>/user/userDelete";
          
            
            try{
                let response = await fetch( url ); // default GET
                let data = await response.json(); // json => javascript object <= JSON.parse()
                if( data.result == "success"){ // login.jsp => boardMain.jsp 로 페이지 이동 ( 새로운 페이지(html....) 요청)
                  alertify.success("성공",'탈퇴되었습니다.');
                  logout();
                }else if( data.result == "fail"){
                	console.log("fail'")
              	  alertify.alert("오류",'탈퇴과정에서 오류가 발생했습니다.');
                }            	
            }catch(error){
            	console.log(error)
            }

        }
    
	document.querySelector("#logout").onclick = function(){
		logout();
	}

async function logout(){
	let url = "<%= contextPath%>/logout";
	
	try{
        let response = await fetch( url ); 
        let data = await response.json(); 
        if( data.result == "fail"){ 
          window.location.href = "<%= contextPath%>/jsp/login.jsp";
        }else if( data.result == "fail"){
        	alertify.alert("오류",'로그아웃 과정에서 오류가 발생했습니다.');
        }            	
    }catch(error){
    	alertify.alert("오류",'로그아웃 과정에서 오류가 발생했습니다.');
    }
}

    </script>
  </body>
</html>
