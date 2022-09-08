// 로그인
function login() {
    // 사용자 정보를 입력받는다.
    var userid = prompt("아이디입력", "ssafy");
    if (userid.length == 0) {
      alert("아이디 입력!!!");
      return;
    }
    var userpass = prompt("비밀번호입력", "1234");
    if (userpass.length == 0) {
      alert("비밀번호 입력!!!");
      return;
    }
    if (userid == "ssafy" && userpass == "1234") {
      alert("로그인 성공!!!");
      // id가 profile_img인 element의 src 속성의 값을 img/profile.png로 설정.
      document.getElementById("profile_img").src = "img/profile.png";
      document.getElementById("header_nav_confirm_off").style.display = "none";
      document.getElementById("header_nav_confirm_on").style.display = "block";
    } else {
      alert("아이디 또는 비밀번호 확인!!!");
    }
  }
  
  // 로그아웃
  function logout() {
    /* document.getElementById("profile_img").src = "img/profile.png";
      document.getElementById("header_nav_confirmon").style.display = "none";
      document.getElementById("header_nav_confirmoff").style.display = "block"; */
    // id가 profile_img인 element의 src 속성의 값을 img/noimg.png로 설정.
    document.querySelector("#profile_img").setAttribute("src", "img/noimg.png");
    document.querySelector("#header_nav_confirm_on").setAttribute("style", "display: none");
    document.querySelector("#header_nav_confirm_off").setAttribute("style", "display: block");
  }
  
  //왼쪽 메뉴
  var cnt = 0;
  function slideDown(areaid) {
    // 지역별 메뉴를 클릭시 펼치기/접기
    if (areaid.style.display == "none") {
      areaid.style.display = "block";
      cnt++;
    } else if (areaid.style.display == "block") {
      areaid.style.display = "none";
      cnt--;
    }
  
    if (cnt == 4) {
      // 모든 메뉴가 펼쳐졌다면 전국매장접기 버튼 활성화
      document.querySelector(".store_display_off").style.display = "block";
      document.querySelector(".store_display_on").style.display = "none";
    } else {
      // 모든 메뉴가 접혔다면 전국매장펼치기 버튼 활성화
      document.querySelector(".store_display_off").style.display = "none";
      document.querySelector(".store_display_on").style.display = "block";
    }
  }
  
  function allSlide(onoff) {
    if (onoff == "on") {
      // 모든 매장 펼치기
      document.querySelectorAll(".store_item_sub").forEach( el => el.style.display = "block" );
  
  document.querySelector(".store_display_off").style.display = "block";
  document.querySelector(".store_display_on").style.display = "none";
  cnt = 4;
    } else {
      // 모든 매장 접기
      document.querySelectorAll(".store_item_sub").forEach( el => el.style.display = "none" );
  
  document.querySelector(".store_display_off").style.display = "none";
  document.querySelector(".store_display_on").style.display = "block";
  cnt = 0;
    }
  }
  
  //투표하기
  function poll() {
    var sel_menu = document.querySelector("input[name='vote_answer']:checked").value;
    alert(sel_menu + "를 선택했습니다.");
  }
  
  // 투표만들기
  function pollMake() {
    // pollmake.html의 창아이디를 poll로 설정하고 가로 420, 세로 300인 창을 열기.
    window.open("pollmake.html", "poll", "width=420,height=300,top=300,left=400");
    // 새 창을 띄우는 건 지양해야한다! -> 보안에 취약함!!

  }
  
  // 답변 항목 추가
  function addAnswer() {
    var listDiv = document.getElementById("poll_answer_list");
  
    var divEl = document.createElement("div"); // <div></div>
    divEl.setAttribute("class", "poll_answer_item"); // <div class="poll_answer_item"></div>
    var inputEl = document.createElement("input"); // <input/>
    inputEl.setAttribute("type", "text"); // <input type="text"/>
    inputEl.setAttribute("name", "answer"); // <input type="text" name="answer"/>
    var buttonEl = document.createElement("button");
    buttonEl.setAttribute("type", "button");
    buttonEl.setAttribute("class", "button");
    // 버튼에 click 이벤트 리스너 등록.
    buttonEl.addEventListener("click", function (e) {
      var parent = this.parentNode;
      listDiv.removeChild(parent);
    });
    buttonEl.appendChild(document.createTextNode("삭제"));
  
    divEl.appendChild(inputEl);
    divEl.appendChild(buttonEl);
    listDiv.appendChild(divEl);
  }
  
  function addAnswer2() { // 위처럼 말고 아래처럼 하면 됨
    var pollAnswerList = document.getElementById("poll_answer_list");
  
    var html = `
      <div class="poll_answer_item">
        <input type="text" name="answer">
        <button type="button" class="button btnRemove">삭제</button>
      </div> `;
  
  pollAnswerList.insertAdjacentHTML('beforeend', html); // append() 는 바로 html 문자열이 더해진다.
  document.querySelector(".btnRemove").addEventListener("click", function(){
    this.parentElement.remove();
  })
  document.querySelector(".btnRemove").classList.remove("btnRemove");
  }
  
//   투표 생성
  function makePoll() {
    if (!document.querySelector("#question").value) {
      alert("질문 내용 입력!!!");
      return;
    }
    // forEach 는 break 가 어렵다.
    let answers = document.querySelectorAll("input[name='answer']");
    for (let answer of answers) {
      if( ! answer.value ) {
        alert("답변 항목 입력!!!");
        return;
      }
    }
  
    alert("투표를 생성합니다.");
    self.close();
  }