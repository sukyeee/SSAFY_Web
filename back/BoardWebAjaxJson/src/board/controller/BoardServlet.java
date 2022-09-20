package board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import board.dto.BoardDto;
import board.dto.UserDto;
import board.service.InsertBoardService;
import board.service.InsertBoardServiceImpl;

@WebServlet("/board/*")
public class BoardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.setCharacterEncoding("utf-8");
    response.setContentType("text/html;charset=utf-8");
    
    HttpSession session = request.getSession();
    UserDto userDto = (UserDto) session.getAttribute("userDto");
  
    
    if( userDto != null ) System.out.println("로그인 사용자 / 세션이 유효함");
    else System.out.println("미로그인 사용자/ 세션이 유효하지 않음");
    
    String contextPath = request.getContextPath();
    String path = request.getRequestURI().substring(contextPath.length());
    System.out.println(path);
   
    
    switch(path) {
    case "/board/boardMain": boardMain(request, response); break;
    case "/board/boardInsert": boardInsert(request, response, userDto.getUserSeq()); break;
    // 게시판의 다른 기능
    }
}

private void boardInsert(HttpServletRequest request, HttpServletResponse response, int userSeq) throws ServletException, IOException {
	 
		InsertBoardService insertboardService = InsertBoardServiceImpl.getInstance();
	    request.setCharacterEncoding("utf-8");

	    String title = request.getParameter("title"); // boardMain.jsp에서 가져온 title
	    String content = request.getParameter("content"); // boardMain.jsp에서 가져온 content
	   
	    System.out.println(title);
	    
	    BoardDto boardDto = new BoardDto();
	    boardDto.setUserSeq(userSeq);
	    boardDto.setTitle(title);
	    boardDto.setContent(content);

	    int ret = insertboardService.insertBoard(boardDto);

	    
	    Gson gson = new Gson();
	    JsonObject jsonObject = new JsonObject();
	    
	    if (ret == 1) {
	        // 성공
	        jsonObject.addProperty("result", "success");
	    } else {
	        // 실패
	        jsonObject.addProperty("result", "fail");
	    }
	    String jsonStr = gson.toJson(jsonObject);
	    response.getWriter().write(jsonStr);
}

	private void boardMain(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/board/boardMain.jsp");
	    dispatcher.forward(request, response);
	}
}

