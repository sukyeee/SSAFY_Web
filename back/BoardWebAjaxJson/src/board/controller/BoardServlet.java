package board.controller;

import java.io.IOException;
import java.util.List;

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
import board.service.BoardService;
import board.service.BoardServiceImpl;

@WebServlet("/board/*")
public class BoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	BoardService service = BoardServiceImpl.getInstance();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		HttpSession session = request.getSession();
		UserDto userDto = (UserDto) session.getAttribute("userDto");

		// LoginFilter로 대체
//        if(userDto != null) System.out.println("로그인 사용자 / 세션이 유효함 ");
//        else System.out.println("미로그인 사용자 / 세션이 유효하지 않음. ");

		String contextPath = request.getContextPath();
		String path = request.getRequestURI().substring(contextPath.length());
		System.out.println(path);

		switch (path) {
		case "/board/boardMain":
			boardMain(request, response);
			break;
		case "/board/boardList":
			boardList(request, response);
			break;
		case "/board/boardListTotalCnt":
			boardListTotalCnt(request, response);
			break;
		case "/board/boardDetail":
			boardDetail(request, response);
			break;

		case "/board/boardInsert":
			boardInsert(request, response);
			break;
		case "/board/boardDelete":
			boardDelete(request, response);
			break;
		case "/board/boardUpdate":
			boardUpdate(request, response);
			break;
		// 게시판의 다른 기능

		}
	}

	
	

	private void boardMain(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/board/boardMain.jsp");
		dispatcher.forward(request, response);
	}

	private void boardList(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 파라미터 => title, content
		// limit, offset 같은 UI와 관련된 항목들은 front-end 의 결정사항!!!

		String strLimit = request.getParameter("limit");
		String strOffset = request.getParameter("offset");
		String searchWord = request.getParameter("searchWord");

		int limit = Integer.parseInt(strLimit);
		int offset = Integer.parseInt(strOffset);

		List<BoardDto> boardList;

		// 검색어 유무에 따라 별도로 처리
		if ("".equals(searchWord)) {
			boardList = service.boardList(limit, offset);
		} else {
			boardList = service.boardListSearchWord(limit, offset, searchWord);
		}

		Gson gson = new Gson();
		String jsonStr = gson.toJson(boardList);
		System.out.println(jsonStr);

		response.getWriter().write(jsonStr);
	}

	private void boardListTotalCnt(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 파라미터 => searchWord만
		String searchWord = request.getParameter("searchWord");

		int totalCnt;

		// 검색어 유무에 따라 별도로 처리
		if ("".equals(searchWord)) {
			totalCnt = service.boardListTotalCnt();
		} else {
			totalCnt = service.boardListSearchWordTotalCnt(searchWord);
		}

		Gson gson = new Gson();
		JsonObject jsonObject = new JsonObject();
		jsonObject.addProperty("totalCnt", totalCnt);

		String jsonStr = gson.toJson(jsonObject);
		response.getWriter().write(jsonStr);

	}

	private void boardDetail(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String strBoardId = request.getParameter("boardId");
		int boardId = Integer.parseInt(strBoardId);

		HttpSession session = request.getSession();
		UserDto userDto = (UserDto) session.getAttribute("userDto");
		int userSeq = userDto.getUserSeq();

		BoardDto boardDto = service.boardDetail(boardId, userSeq);

		Gson gson = new Gson();
		String jsonStr = gson.toJson(boardDto, BoardDto.class); // 보다 명확한 표현
		System.out.println(jsonStr);

		response.getWriter().write(jsonStr);
	}

	private void boardInsert(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 파라미터 => title, content
		// session => 현재 사용자의 userSeq
		// 3개로 BoardDto 객체를 생성해서 service 에 전달
		// service의 결과를 json으로 response

		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int userSeq = ((UserDto) request.getSession().getAttribute("userDto")).getUserSeq();
//        HttpSession session = request.getSession();
//        UserDto userDto = (UserDto) session.getAttribute("userDto");
//        userSeq = userDto.getUserSeq();

		// int ret = service.boardInsert(new BoardDto(userSeq, title, content));
		BoardDto boardDto = new BoardDto();
		boardDto.setUserSeq(userSeq);
		boardDto.setTitle(title);
		boardDto.setContent(content);
		int ret = service.boardInsert(boardDto);

		Gson gson = new Gson();
		JsonObject jsonObject = new JsonObject();
	
		if (ret == 1) {
			jsonObject.addProperty("result", "success");
		} else {
			jsonObject.addProperty("result", "fail");
		}

		String jsonStr = gson.toJson(jsonObject);
		response.getWriter().write(jsonStr);
	}
	
private void boardUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");	
		int boardId = Integer.parseInt(request.getParameter("boardId"));
		
		BoardDto boardDto = new BoardDto();
		boardDto.setBoardId(boardId);
		boardDto.setTitle(title);
		boardDto.setContent(content);
		
		HttpSession session = request.getSession();
		UserDto userDto = (UserDto) session.getAttribute("userDto");
		int userSeq = userDto.getUserSeq();

		int ret = service.boardUpdate(boardDto);

		
		Gson gson = new Gson();
		JsonObject jsonObject = new JsonObject();

		if (ret == 1) {
			jsonObject.addProperty("result", "success");
		} else {
			jsonObject.addProperty("result", "fail");
		}
		
		String jsonStr = gson.toJson(jsonObject);
		response.getWriter().write(jsonStr);
		
	}

	private void boardDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int boardId = Integer.parseInt(request.getParameter("boardId"));
		int ret = service.boardDelete(boardId);

		Gson gson = new Gson();
		JsonObject jsonObject = new JsonObject();

		if (ret == 1) {
			jsonObject.addProperty("result", "success");
		} else {
			jsonObject.addProperty("result", "fail");
		}
		
		String jsonStr = gson.toJson(jsonObject);
		response.getWriter().write(jsonStr);
		
	}
	
}