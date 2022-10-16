<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="map.dto.*"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
	integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
	integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
	crossorigin="anonymous"></script>

<!-- JavaScript -->
<script
	src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>

<!-- CSS -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css" />
<!-- Default theme -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css" />
<!-- Semantic UI theme -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css" />
<!-- Bootstrap theme -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/bootstrap.min.css" />

</head>

<body>
  	<%@ include file="../header.jsp" %>



	<div class="container">
		<h4 class="text-center mt-3">이벤트 목록</h4>

		<div class="input-group mb-3 mt-5">
			<input type="text" class="form-control" id="inputSearchWord"
				placeholder="Search" />
			<button class="btn btn-light" type="button" id="btnSearchWord">
				🔍</button>
		</div>

		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">제목</th>
					<th scope="col">작성일자</th>
					<th scope="col">조회수</th>
				</tr>
			</thead>
			<tbody id="boardTbody">

			</tbody>
		</table>

		<div id="paginationWrapper"></div>

		<button class="btn btn-primary" type="button" id="btnInsertPage">
			글쓰기</button>


	</div>



	<!-- Modal insert -->
	<div class="modal fade" id="boardInsertModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">🎨이벤트 등록🎨</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form>
						<div class="mb-3">
							<label for="titleInsert" class="form-label">제목</label> <input
								type="text" class="form-control" id="titleInsert">
						</div>
						<div class="mb-3">
							<label for="contentInsert" class="form-label">내용</label>
							<textarea class="form-control" id="contentInsert" rows="10"></textarea>
						</div>
						<button id="btnBoardInsert" type="button"
							class="btn btn-sm btn-primary float-end">등록</button>

					</form>
				</div>


			</div>
		</div>
	</div>


	<!-- Modal Detail -->
	<div class="modal fade" id="boardDetailModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">🎨이벤트 상세보기🎨</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<table class="table table-hover">
						<tbody>
							<tr>
								<td>글 번호</td>
								<td id="boardIdDetail">#</td>
							</tr>
							<tr>
								<td>제목</td>
								<td id="titleDetail">#</td>
							</tr>
							<tr>
								<td>내용</td>
								<td id="contentDetail">#</td>
							</tr>
							<tr>
								<td>작성자</td>
								<td id="userNameDetail">#</td>
							</tr>
							<tr>
								<td>작성일시</td>
								<td id="regDtDetail">#</td>
							</tr>
							<tr>
								<td>조회수</td>
								<td id="readCountDetail">#</td>
							</tr>
						</tbody>
					</table>

					<button id="btnBoardUpdateForm" type="button"
						class="btn btn-sm btn-primary float-end">수정</button>
					<button id="btnBoardDeleteConfirm" type="button"
						class="btn btn-sm btn-warning float-end">삭제</button>

				</div>

			</div>
		</div>
	</div>


	<!-- Modal update-->
	<div class="modal fade" id="boardUpdateModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">🔧이벤트 수정🔨</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form>
						<div class="mb-3">
							<label for="titleUpdate" class="form-label">제목</label> <input
								type="text" class="form-control" id="titleUpdate">
						</div>
						<div class="mb-3">
							<label for="contentUpdate" class="form-label">내용</label>
							<textarea class="form-control" id="contentUpdate" rows="10"></textarea>
						</div>
						<button id="btnBoardUpdate" type="button"
							class="btn btn-sm btn-primary float-end">수정</button>

					</form>
				</div>


			</div>
		</div>
	</div>


	<script src="<%=contextPath%>/js/util.js"></script>
	<script>
		var OFFSET = 0;
		var SEARCH_WORD = '';
		
		// pagination
		var LIST_ROW_COUNT = 10; // limit
		var PAGE_LINK_COUNT = 3; // pagination link 갯수
		var CURRENT_PAGE_INDEX = 1;
		var TOTAL_LIST_ITEM_COUNT = 0; // 총 건수
		
   		window.onload = function() {
   			
   			boardList(); // 백엔드를 갔다와서 수행, 비동기 통신이므로 비동기 통신 하자마자 makeListHtmlEventHandler 클릭하면 반응없음   			
   			// makeListHtmlEventHandler();
   			
   			document.querySelector("#btnSearchWord").onclick = function() {
   				SEARCH_WORD = document.querySelector("#inputSearchWord").value;
   				// 초기화
   				OFFSET = 0;
   				CURRENT_PAGE_INDEX = 1;
   				boardList();
   			}
   			
   			// insert page
   			// javascript로 bootstrap modal 제어
   			document.querySelector("#btnInsertPage").onclick = function() {
   				
   				document.querySelector("#titleInsert").value = "";
   				document.querySelector("#contentInsert").value = "";
   				
   				
   				let modal = new bootstrap.Modal(
   					document.querySelector("#boardInsertModal")
   				);
   				
   				modal.show();
   			}
   			
   			// insert
			document.querySelector("#btnBoardInsert").onclick = function() {
   				
				
				if(validateInsert()){
					boardInsert();
				}else{
					alertify.error("입력을 확인해 주세요.");
				}
			};
			
			// delete
			document.querySelector("#btnBoardDeleteConfirm").onclick = function() {
				alertify.confirm("삭제 확인", "글을 삭제하시겠습니까?", 
						function(){
							// ok
							boardDelete();

						},
						function(){
							console.log('user cancel');		
						});
			};
		
			// update
			document.querySelector("#btnBoardUpdateForm").onclick = function() {
			
				// detail => update 글 상세 내용을 복사 ( key 인 boardId 를 복사 )
				// detail modal 닫고 update modal 을 띄운다.
				let boardId = document.querySelector("#boardDetailModal").getAttribute("data-boardId");
	   			document.querySelector("#boardUpdateModal").setAttribute("data-boardId", boardId);
	
	   			document.querySelector("#titleUpdate").value = document.querySelector("#titleDetail").innerHTML;
	   			document.querySelector("#contentUpdate").value = document.querySelector("#contentDetail").innerHTML;
	   			
	   			let modalDetail = new bootstrap.Modal(
	   					document.querySelector("#boardDetailModal")
	   				);
	   				
	   			modalDetail.hide();
	   			
	   			let modalUpdate = new bootstrap.Modal(
	   					document.querySelector("#boardUpdateModal")
	   				);
	   				
	   			modalUpdate.show();
	   			
   			} 
			
			document.querySelector("#btnBoardUpdate").onclick = function() {
				if(validateUpdate()){
					boardUpdate();
				}else{
					alertify.error("입력을 확인해 주세요.");
				}
			}
		
			
			// logout
			document.querySelector("#btnLogout").onclick = function() {
				logout();
			}
			
			
		}
   
		
		
		
   		// GET
   		async function boardList() {
   			let url = '<%=contextPath%>/board/boardList';
   			let urlParams = '?limit=' + LIST_ROW_COUNT + '&offset=' + OFFSET  + '&searchWord=' + SEARCH_WORD;
   			//let urlParams = `?limit=${LIST_ROW_COUNT}&offset=${OFFSET}`; // jsp EL표기법과 javascript es6 literal template와 충돌.
			let fetchOptions = {
   					method: 'GET',
   			}
   			
   			try {
   				let response = await fetch( url + urlParams, fetchOptions );
   				let data = await response.json();
   				console.log( data )
   				makeListHtml( data );
   				
   				
   			} catch( error ) {
   				console.log(error);
   				alertify.error('글 조회 과정에서 문제가 생겼습니다.');
   			}
   		}
   		
   	
		
   		// javascript array를 이용해서 테이블 <tr> 을 반복적으로 만들어서 목록을 완성
   		function makeListHtml( list ){
   			let listHtml = ``;
   			
   			list.forEach( el => {
   				
   				console.log(el);
   				
   				let boardId = el.eventKey;
   				let userName = el.name;
   				let title = el.name;
   				let regDt = el.registerDateTime;
   				let regDtStr = el.registerDateTime;
   				let readCount = "0";
   	   			
   				listHtml += 
   					`<tr style="cursor:pointer" data-boardId=\${boardId}>
   				<td>\${boardId}</td>
   				<td>\${title}</td>
   				<td>\${regDtStr}</td>
   				<td>\${readCount}</td>
   					</tr>`;
   			});
   			
   			document.querySelector("#boardTbody").innerHTML = listHtml;
   			makeListHtmlEventHandler();
   			boardListTotalCnt();
   		}
   		
   		
   		function makeListHtmlEventHandler() {
   			document.querySelectorAll("#boardTbody tr").forEach( el => {
   				el.onclick = function() {
   					let boardId = this.getAttribute("data-boardId");
   					boardDetail(boardId);
   				}
   			})

   			
   		}
   		
   		
		async function boardListTotalCnt() {
   			let url = '<%=contextPath%>/board/boardListTotalCnt';
   			let urlParams = '?searchWord=' + SEARCH_WORD;
   			//let urlParams = `?limit=${LIST_ROW_COUNT}&offset=${OFFSET}`; // jsp EL표기법과 javascript es6 literal template와 충돌.
			let fetchOptions = {
   					method: 'GET',
   			}
   			
   			try {
   				let response = await fetch( url + urlParams, fetchOptions );
   				let data = await response.json();
   				console.log( data )
   				TOTAL_LIST_ITEM_COUNT = data.totalCnt;
   			
   				console.log(LIST_ROW_COUNT);
   				console.log(PAGE_LINK_COUNT);
   				console.log(CURRENT_PAGE_INDEX);
   				console.log(TOTAL_LIST_ITEM_COUNT);
   				
   				
   				makePaginationHtml( LIST_ROW_COUNT, PAGE_LINK_COUNT, CURRENT_PAGE_INDEX, TOTAL_LIST_ITEM_COUNT,  "paginationWrapper" );
   				
   			} catch( error ) {
   				console.log(error);
   				alertify.error('글 조회 과정에서 문제가 생겼습니다.');
   			}
   		}
   		
   		function movePage(pageIndex){
   			OFFSET = (pageIndex - 1) * LIST_ROW_COUNT;
   			CURRENT_PAGE_INDEX = pageIndex;
   			boardList();
   		}
   		
   	  async function boardDetail(boardId) {
          let url = '<%=contextPath%>/board/boardDetail';
          let urlParams = '?boardId=' + boardId;
          //let urlParams = ?limit=${LIST_ROW_COUNT}&offset=${OFFSET}; // jsp EL표기법과 javascript es6 literal template와 충돌.
           let fetchOptions = {
              method: 'GET',
              }

          try {
              let response = await fetch( url + urlParams, fetchOptions );
              let data = await response.json();
              console.log( data )
              makeDetailHtml( data );

          } catch( error ) {
              console.log(error);
              alertify.error('글 조회 과정에서 문제가 생겼습니다.');
          }
      }
   		
   		function makeDetailHtml( detail ){
		
   			console.log(detail);
   			
			let boardId = detail.eventKey;
			let userName = detail.registerId;
			let title = detail.name;
			let content = detail.name;
			let regDt = detail.registerDateTime;
			let regDtStr =  detail.registerDateTime;
				// makeDateStr(regDt.date.year, regDt.date.month, regDt.date.day, '/') + ' ' + 
				// makeTimeStr(regDt.time.hour, regDt.time.minute, regDt.time.second, ':');
			let readCount = "0";
			let sameUser = detail.sameUser;
 	   	
			
			document.querySelector("#boardDetailModal").setAttribute("data-boardId", boardId);
   	    	document.querySelector("#boardIdDetail").innerHTML = boardId;
   	    	document.querySelector("#titleDetail").innerHTML = title;
   	    	document.querySelector("#contentDetail").innerHTML = content;
   	    	document.querySelector("#userNameDetail").innerHTML = userName;
   	    	document.querySelector("#regDtDetail").innerHTML = regDtStr;
   	 		document.querySelector("#readCountDetail").innerHTML = readCount;
   	    	
   	
   	 		let modal = new bootstrap.Modal(
					document.querySelector("#boardDetailModal")
				);
				
			modal.show();
			
	
			
   		}
   		///////////////////////////////////////
        function validateInsert(){
            // return true / false
            let isTitleInsertValid = false;
            let isContentInsertValid = false;

            let titleInsertValue = document.querySelector("#titleInsert").value;
           
            if( titleInsertValue.length > 0 ){
            	isTitleInsertValid = true;
            }

            let contentInsertValue= document.querySelector("#contentInsert").value;
            if( contentInsertValue.length > 0 ){
            	isContentInsertValid = true;
            }
	
          
         
            if( isTitleInsertValid && isContentInsertValid ){
                return true;
            }
            return false;

        }
        
        function validateUpdate(){
            // return true / false
            let isTitleUpdateValid = false;
            let isContentUpdateValid = false;

            let titleUpdateValue = document.querySelector("#titleUpdate").value;
           
            if( titleUpdateValue.length > 0 ){
            	isTitleUpdateValid = true;
            }

            let contentUpdateValue = document.querySelector("#contentUpdate").value;
            if( contentUpdateValue.length > 0 ){
            	isContentUpdateValid = true;
            }
	
            
            if( isTitleUpdateValid && isContentUpdateValid ){
                return true;
            }
            return false;

        }
        
        async function boardInsert() {
        	
        		console.log('boardInsert....');
        	  let title = document.querySelector("#titleInsert").value;
              let content = document.querySelector("#contentInsert").value;
  
              // parameter
              let urlParams = new URLSearchParams({
            	  title : title,
            	  content: content
              });
              // fetch options
              let fetchOptions = {
                  method: "POST",
                  body: urlParams
              }
              
              let url = "<%=contextPath%>/board/boardInsert";
  				try{
  				   let response = await fetch( url , fetchOptions );
  	              let data = await response.json(); // json => javascript object <= JSON.parse()
  	              if( data.result == "success" ){ // login.jsp => boardMain.jsp로 페이지 이동 ( 새로운 페이지(html....) 요청)
  	            	  alertify.success("글이 등록되었습니다.")
  	            	  boardList();
  	              }else if( data.result == "fail" ){
  	                  alertify.error('글 등록 과정에서 오류가 발생했습니다.');
  	              }
  				} catch(error){
                    alertify.error('글 등록 과정에서 오류가 발생했습니다.');

  				}
           
        }
        
		///////////////////////////////////////

        async function boardUpdate() {
        	let boardId = document.querySelector("#boardUpdateModal").getAttribute("data-boardId");
      		let title = document.querySelector("#titleUpdate").value;
            let content = document.querySelector("#contentUpdate").value;

            // parameter
            let urlParams = new URLSearchParams({
          		boardId: boardId,	
            	title : title,
          	  	content: content
            });
            // fetch options
            let fetchOptions = {
                method: "POST",
                body: urlParams
            }
            
            let url = "<%=contextPath%>/board/boardUpdate";
				try{
				   let response = await fetch( url , fetchOptions );
	              let data = await response.json(); // json => javascript object <= JSON.parse()
	              if( data.result == "success" ){ // login.jsp => boardMain.jsp로 페이지 이동 ( 새로운 페이지(html....) 요청)
	            	  alertify.success("글이 수정되었습니다.")
	            	  boardList();
	              }else if( data.result == "fail" ){
	                  alertify.error('글 수정 과정에서 오류가 발생했습니다.');
	              }
				} catch(error){
                  alertify.error('글 수정 과정에서 오류가 발생했습니다.');

				}
         
    	  }
        
        async function boardDelete() {
        	let boardId = document.querySelector("#boardDetailModal").getAttribute("data-boardId");
      	
            let url = "<%=contextPath%>/board/boardDelete";
            let urlParams = "?boardId=" + boardId;
            
			try{
			   let response = await fetch( url + urlParams );
              let data = await response.json(); // json => javascript object <= JSON.parse()
              if( data.result == "success" ){ // login.jsp => boardMain.jsp로 페이지 이동 ( 새로운 페이지(html....) 요청)
            	  alertify.success("글이 삭제되었습니다.")
            	  boardList();
              }else if( data.result == "fail" ){
                  alertify.error('글 삭제 과정에서 오류가 발생했습니다.');
              }
			} catch(error){
                 alertify.error('글 삭제 과정에서 오류가 발생했습니다.');

			}
         
      }
  	
        async function logout() {
        	// logout 요청 => 백엔드에서는 session.invalidate(); result:success
        	// result가 success => login 페이지 이동 (ajax X, window.location.href 로 이동)
        	let url = "<%= contextPath %>/logout";	
        	
			try{
				   let response = await fetch( url );
	              let data = await response.json(); // json => javascript object <= JSON.parse()
	              if( data.result == "success" ){ // login.jsp => boardMain.jsp로 페이지 이동 ( 새로운 페이지(html....) 요청)
	            	window.location.href = "<%= contextPath%>/jsp/login.jsp";
	              }else if( data.result == "fail" ){
	                  alertify.error('로그아웃 과정에서 오류가 발생했습니다.');
	              }
				} catch(error){
               alertify.error('로그아웃 과정에서 오류가 발생했습니다.');

				}
        }
        
    </script>
</body>

</html>