<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="board.dto.*" %>
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
            integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
            crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
            integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
            crossorigin="anonymous"></script>
    
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
    
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container">
                <a class="navbar-brand" href="#"><img src="<%= contextPath + userDto.getUserProfileImageUrl() %>" style="width:50px; height:50px; border-radius:50%" ></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                    aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Link</a>
                        </li>
    
                    </ul>
    
                </div>
            </div>
        </nav>
    
    
        <div class="container">
            <h4 class="text-center mt-3">게시판</h4>
    
            <div class="input-group mb-3 mt-5">
                <input type="text" class="form-control" id="inputSearchWord" placeholder="Search" />
                <button class="btn btn-light" type="button" id="btnSearchWord">
                   	 🔍
                </button>
            </div>
    
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">작성자</th>
                        <th scope="col">제목</th>
                        <th scope="col">작성일자</th>
                        <th scope="col">조회수</th>
                    </tr>
                </thead>
                <tbody id="boardTbody">
                    
                </tbody>
            </table>
    		
            <div id="paginationWrapper"> </div>
    
            <button class="btn btn-primary" type="button" id="btnInsertPage" >
             	   글쓰기
            </button>
    
    
        </div>
    
    
    
        <!-- Modal -->
	<div class="modal fade" id="boardInsertModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">🎨숙희마을 게시판 작성🎨</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form>
						<div class="mb-3">
							<label for="titleInsert" class="form-label">제목</label>
							<input type="text" class="form-control" id="titleInsert">
						</div>
						<div class="mb-3">
							<label for="contentInsert" class="form-label">내용</label>
							<textarea class="form-control" id="contentInsert" rows="10"></textarea>
						</div>
						<button id="btnBoardInsert" type="button" class="btn btn-outline-primary float-end">등록</button>
				
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
					<h5 class="modal-title" id="exampleModalLabel">🎨숙희마을 게시판 상세보기 🎨</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
			    <table class="table table-hover">
	          	    <tbody >
	          	    	<tr><td>글 번호</td><td id="boardIdDetail">#</td></tr>
	          	    	<tr><td>제목</td><td id="titleDetail">#</td></tr>
	          	    	<tr><td>내용</td><td id="contentDetail">#</td></tr>
	          	    	<tr><td>작성자</td><td id="userNameDetail">#</td></tr>
	          	    	<tr><td>작성일시</td><td id="regDtDetail">#</td></tr>
	          	    	<tr><td>조회수</td><td id="readCountDetail">#</td></tr>
	                </tbody>
           		 </table>
           		 
           		 <button id="btnBoardUpdateForm" type="button" class="btn btn-sm btn-outline-primary float-end">글 수정하기</button>
           		 <button id="btnBoardDeleteConfirm" type="button" class="btn btn-sm btn-outline-warning float-end">글 삭제하기</button>
           		 
				</div>
			
			</div>
		</div>
	</div>
	
	<!-- Modal Update -->
	<div class="modal fade" id="boardUpdateModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">🎨숙희마을 게시판 상세보기 🎨</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
			    <table class="table table-hover">
	          	    <tbody >
	          	    	<tr><td>글 번호</td><td id="boardIdUpdate">#</td></tr>
	          	    	<tr><td>제목</td><td id="titleUpdate"><input type="text" id="titleInput"/></td></tr>
	          	    	<tr><td>내용</td><td id="contentUpdate"><input type="text" id="contentInput" /></td></tr>
	          	    	<tr><td>작성자</td><td id="userNameUpdate">#</td></tr>
	          	    	<tr><td>작성일시</td><td id="regDtUpdate">#</td></tr>
	          	    	<tr><td>조회수</td><td id="readCountUpdate">#</td></tr>
	                </tbody>
           		 </table>
           		 
           		 <button id="btnBoardUpdateComplete" type="button" class="btn btn-sm btn-outline-primary float-end">수정 완료</button>
           		 
				</div>
			
			</div>
		</div>
	</div>
	
	
	
	
	
	
	
	<script src="<%=contextPath %>/js/util.js"></script>
	<script>
	var OFFSET = 0;
		var SEARCH_WORD = '';
		
		// pagination
		var LIST_ROW_COUNT = 10; // limit
		var PAGE_LINK_COUNT = 10; // pagination link 갯수
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
			
		
   		} 
   
   		// GET
   		async function boardList() {
   			let url = '<%= contextPath %>/board/boardList';
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
   				let boardId = el.boardId;
   				let userName = el.userName;
   				let title = el.title;
   				let regDt = el.regDt;
   				let regDtStr = makeDateStr(regDt.date.year, regDt.date.month, regDt.date.day, '.');
   				let readCount = el.readCount;
   	   			
   				listHtml += 
   					`<tr style="cursor:pointer" data-boardId=\${boardId}>
   				<td>\${boardId}</td>
   				<td>\${userName}</td>
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
   			let url = '<%= contextPath %>/board/boardListTotalCnt';
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
          let url = '<%= contextPath %>/board/boardDetail';
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

			let boardId = detail.boardId;
			let userName = detail.userName;
			let title = detail.title;
			let content = detail.content;
			let regDt = detail.regDt;
			let regDtStr = makeDateStr(regDt.date.year, regDt.date.month, regDt.date.day, '.');
			let readCount = detail.readCount;
			let sameUser = detail.sameUser;
 	   	
   	    	document.querySelector("#boardIdDetail").innerHTML = boardId;
   	    	document.querySelector("#titleDetail").innerHTML = title;
   	    	document.querySelector("#contentDetail").innerHTML = content;
   	    	document.querySelector("#userNameDetail").innerHTML = userName;
   	    	document.querySelector("#regDtDetail").innerHTML = regDtStr;
   	 		document.querySelector("#readCountDetail").innerHTML = readCount;
   	    	
   	 		if( sameUser ){
   	   	    	document.querySelector("#btnBoardUpdateForm").style.display = "inline-block";
   	   	    	document.querySelector("#btnBoardDeleteConfirm").style.display = "inline-block";
   	 		} else {
   	 			document.querySelector("#btnBoardUpdateForm").style.display = "none";
	   	    	document.querySelector("#btnBoardDeleteConfirm").style.display = "none";
   	 		}
   	 		
   	 		let modal = new bootstrap.Modal(
					document.querySelector("#boardDetailModal")
				);
				
			modal.show();
			
			// delete
			document.querySelector("#btnBoardDeleteConfirm").onclick = function() {
				boardDelete(boardId);
			
			};
			
			// update
			document.querySelector("#btnBoardUpdateForm").onclick = function() {
				// 수정 버튼 누르면 모달 창 수정 상태로 변경되어야 함 
				document.querySelector("#boardIdUpdate").innerHTML = boardId;
	   	    	//document.querySelector("#titleUpdate").innerHTML = title;
	   	    	//document.querySelector("#contentUpdate").innerHTML = content;
	   	    	document.querySelector("#userNameUpdate").innerHTML = userName;
	   	    	document.querySelector("#regDtUpdate").innerHTML = regDtStr;
	   	 		document.querySelector("#readCountUpdate").innerHTML = readCount;
   	    	
			
				
				let modal = new bootstrap.Modal(
				document.querySelector("#boardUpdateModal")
				);
				modal.show();

			
				document.querySelector("#btnBoardUpdateComplete").onclick = function() {
				// 수정 완료 버튼
				 title = document.querySelector("#titleInput").value;
				 content = document.querySelector("#contentInput").value;	
				
				boardUpdate(boardId, title, content );
				};
				
			};
			
		
			
   		}
   		///////////////////////////////////////
        function validateInsert(){
            // return true / false
            let isTitleInsertValid = false;
            let isContentInsertValid = false;

            let titleInsertValue= document.querySelector("#titleInsert").value;
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
        
        async function boardInsert() {
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
  
              let response = await fetch( "<%= contextPath%>/board/boardInsert", fetchOptions );
              let data = await response.json(); // json => javascript object <= JSON.parse()
              if( data.result == "success" ){ // login.jsp => boardMain.jsp로 페이지 이동 ( 새로운 페이지(html....) 요청)
            	  alertify.success("글이 등록되었습니다.")
              }else if( data.result == "fail" ){
                  alertify.error('글 등록 과정에서 오류가 발생했습니다.');
              }
        }
        
        // delete
        
        async function boardDelete( boardId ) {
        	
            let url = '<%= contextPath %>/board/boardDelete';
            let urlParams = '?boardId=' + boardId;
             let fetchOptions = {
                method: 'GET',
                }

            try {
                let response = await fetch( url + urlParams, fetchOptions );
                let data = await response.json();
                console.log( data )
                boardDeleteConfirm( data ) 
                
            } catch( error ) {
                console.log(error);
                alertify.error('글 삭제 과정에서 문제가 생겼습니다.');
            }
        }
        
        // update 
     	 async function boardUpdate( boardId, title, content ) {
     		 
             let url = '<%= contextPath %>/board/boardUpdate';
             let urlParams = '?boardId=' + boardId + '&title=' + title + '&content=' + content;
             let fetchOptions = {
                method: 'GET',
                }
			console.log('boardUpdate - boardId' + boardId)
			console.log('boardUpdate - title' + title)
			console.log(content)
			
             
            try {
                let response = await fetch( url + urlParams, fetchOptions );
                let data = await response.json();
                console.log( data )
                
            } catch( error ) {
                console.log(error);
                alertify.error('글 수정 과정에서 문제가 생겼습니다.');
            }
        }
        
        
    </script>
    </body>
    
    </html>