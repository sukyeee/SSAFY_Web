package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import board.dto.UserDto;
import board.service.LoginService;
import board.service.LoginServiceImpl;


@WebServlet({"/login", "/logout"})
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    // logout
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 필요한 작업 수행( Log, 장바구니...DB 저장...) 후
		HttpSession session = request.getSession();
		session.invalidate();
		
		Gson gson = new Gson();
		JsonObject jsonObject = new JsonObject();
		jsonObject.addProperty("result", "success");
		
		String jsonStr = gson.toJson(jsonObject);
		response.getWriter().write(jsonStr);

	}

	// login
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		// 파라미터
		String userEmail = request.getParameter("userEmail");
		String userPassword = request.getParameter("userPassword");
		
		LoginService service = LoginServiceImpl.getInstance();
		UserDto userDto = service.login(userEmail, userPassword);
	
		System.out.println(userDto);
		
		// 성공, 실패에 대한 처리
		// 성공: 1. session 에 사용자 정보 UserDto 를 저장, 2. 로그인 성공 결과를 client 에 return (json)
		// 실패: 로그인 실패 결과를 client에 return (json)
		
		if( userDto != null ) {
			HttpSession session = request.getSession();
			session.setAttribute("userDto", userDto);
			// "result":"success"
			Gson gson = new Gson();
			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("result", "success");
			
			String jsonStr = gson.toJson(jsonObject);
			response.getWriter().write(jsonStr);
			
			System.out.println("LoginServlet - login success");
		} else {
			// "result":"success"
			Gson gson = new Gson();
			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("result", "fail");
			
			String jsonStr = gson.toJson(jsonObject);
			response.getWriter().write(jsonStr);
			
			System.out.println("LoginServlet - login fail");
		}
	}

}
