package mvc;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.UserDto;

// 목록 : /mvc/list
// 등록 : /mvc/insert
// 수정 : /mvc/update
// .........
@WebServlet("/mvc/*")
public class ControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		process(request, response);
	}

	// Controller
	private void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 인코딩 처리
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8"); // jsp로 foward할 경우는 필요 X

		// 업무 구분처리
		String contextPath = request.getContextPath();
		System.out.println(contextPath);
		String path = request.getRequestURI().substring(contextPath.length());
		System.out.println(path);

		switch (path) {
		case "/mvc/list":
			list(request, response);
			break;
		case "/mvc/insert":
			insert(request, response);
			break;
		case "/mvc/modify":
			modify(request, response);
			break;
		case "/mvc/delete":
			delete(request, response);
			break;

		}

	}

	private void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<UserDto> list = new ArrayList<>();

		list.add(new UserDto(1, "홍길동", "hong@gmail.com"));
		list.add(new UserDto(2, "이길동", "lee@gmail.com"));
		list.add(new UserDto(3, "삼길동", "sam@gmail.com"));

		// JSP로 모뎅(data)를 전달하고 forward'
		request.setAttribute("list", list);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/mvc/userList.jsp");
		dispatcher.forward(request, response);
	}

	private void insert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(request);
		int number = Integer.parseInt(request.getParameter("number"));
		String username = request.getParameter("username");
		String email = request.getParameter("email");

		StringBuilder sb = new StringBuilder();
		sb.append("number : " + number).append(" username :" + username).append("email : " + email);
		UserDto userDto = new UserDto(number, username, email);

		// JSP로 모뎅(data)를 전달하고 forward'
		request.setAttribute("userDto", userDto);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/mvc/userInsertResult.jsp");
		dispatcher.forward(request, response);
	}

	private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println(request);
		int number = Integer.parseInt(request.getParameter("number"));
		String username = request.getParameter("username");
		String email = request.getParameter("email");

		StringBuilder sb = new StringBuilder();
		sb.append("number : " + number).append(" username :" + username).append("email : " + email);
		UserDto userDto = new UserDto(number, username, email);
		
		request.setAttribute("userDto", userDto);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/mvc/userDelete.jsp");
		dispatcher.forward(request, response);

	}

	private void modify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    //service - dao -db 등록 완료
		System.out.println(request);
		int number = Integer.parseInt(request.getParameter("number"));
		String username = request.getParameter("username");
		String email = request.getParameter("email");

		StringBuilder sb = new StringBuilder();
		sb.append("number : " + number).append(" username :" + username).append("email : " + email);
		UserDto userDto = new UserDto(number, username, email);
		
		request.setAttribute("userDto", userDto);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/mvc/userModify.jsp");
		dispatcher.forward(request, response);
	}
}
