package map.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import map.dto.UserDto;
import map.service.LoginService;
import map.service.LoginServiceImpl;

@WebServlet({"/login","/logout"})
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	// logout
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//필요한 작업 수행 (Log, 장바구니... DB 저장 ...)
		HttpSession session = request.getSession();
		session.invalidate();
		
		Gson gson = new Gson();
		JsonObject jsonObject = new JsonObject();
		jsonObject.addProperty("result", "fail");
		
		String jsonStr = gson.toJson(jsonObject);
		response.getWriter().write(jsonStr);
	}
	// login
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		String userEmail = request.getParameter("userEmail");
		String userPassword = request.getParameter("userPassword");
		
		LoginService loginService = LoginServiceImpl.getInstance();
		UserDto userDto = loginService.login(userEmail, userPassword);	
		
		// 성공, 실패에 대한 처리
		// 성공 : 1, session 에 사용자정보 UserDto 를 저장, 2. 로그인 성공 결과를 client에 return (json)
		// 실패 : 로그인 실패 결과를 client 에 return (json)
		
		if (userDto != null) {
			HttpSession session = request.getSession();
			session.setAttribute("userDto", userDto);
			// "result":"success"
			Gson gson = new Gson();
			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("result", "success");
			
			String jsonStr = gson.toJson(jsonObject);
			response.getWriter().write(jsonStr);
		} else {
			// "result":"fail"
			Gson gson = new Gson();
			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("result", "fail");
			
			String jsonStr = gson.toJson(jsonObject);
			response.getWriter().write(jsonStr);
		}
		
	}

}
