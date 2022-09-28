package home.controller;

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

import home.dto.CodeDto;
import home.dto.HouseDto;
import home.dto.UserDto;
import home.service.CodeService;
import home.service.CodeServiceImpl;
import home.service.UserService;
import home.service.UserServiceImpl;

@WebServlet("/user/*")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	UserService userService = UserServiceImpl.getInstance();
	CodeService codeService = CodeServiceImpl.getInstance();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		String contextPath = request.getContextPath();
		String path = request.getRequestURI().substring(contextPath.length());
		System.out.println(path);
		
		switch (path) {
		
			case "/user/userLogin":
				userLogin(request, response);
				break;
				
			case "/user/userLogout":
				userLogout(request, response);
				break;
				
			case "/user/userRegist":
				userRegist(request, response);
				break;
				
			case "/user/userDelete":
				userDelete(request, response);
				break;
			
			case "/user/userUpdate":
				userUpdate(request, response);
				break;
				
			case "/user/registerForm":
				getCommon(request, response);
				break;
			
		
		}
		
		
	
	}

	private void getCommon(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		List<CodeDto> codeList = null;

		codeList = codeService.getCodeList();
		request.setAttribute("codeList", codeList);

		System.out.println( "111" );
		RequestDispatcher dispatcher = request.getRequestDispatcher("../jsp/register.jsp");
		dispatcher.forward(request, response);
		
	}

	private void userLogout(HttpServletRequest request, HttpServletResponse response) throws IOException {
	    String act = request.getParameter("act");
	    
	    String path = "../jsp/index.jsp";
	    if("logout".equals(act)) {
	        HttpSession session = request.getSession();
	        session.invalidate();
	        
	        response.sendRedirect(path);
	    }
	}

	private void userUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String userName = request.getParameter("userName");
		String userEmail = request.getParameter("userEmail");	
		String userPassword = request.getParameter("userPassword");
		
		UserDto userDto = new UserDto();
		userDto.setUserName(userName);
		userDto.setUserEmail(userEmail);
		userDto.setUserPassword(userPassword);
		
		HttpSession session = request.getSession();
		int userSeq = ((UserDto)session.getAttribute("userDto")).getUserSeq();
		
		System.out.println("userSeq ?  " + userSeq);
		int ret = userService.userUpdate(userDto, userSeq);

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

	private void userDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		
		int userSeq = Integer.parseInt(request.getParameter("userSeq"));
		int ret = userService.userDelete(userSeq);
		
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

	private void userLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {

		// 파라미터
		String userEmail = request.getParameter("userEmail");
		String userPassword = request.getParameter("userPassword");

		System.out.println(userEmail);
		System.out.println(userPassword);

		UserService service = UserServiceImpl.getInstance();
		UserDto userDto = service.login(userEmail, userPassword);

		System.out.println(userDto);

		// 성공, 실패에 대한 처리
		// 성공 : 1. Session에 사용자 정보 UserDto를 저장, 2. 로그인 성공 결과를 client에 return (json)
		// 실패 : 로그인 실패 결과를 client에 return (json)

		if (userDto != null) {
			HttpSession session = request.getSession();
			session.setAttribute("userDto", userDto);
			// "result" : "success"
			Gson gson = new Gson();
			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("result", "success");

			String jsonStr = gson.toJson(jsonObject);
			response.getWriter().write(jsonStr);

			System.out.println("LoginServlet - login success");
		} else {
			// "result" : "fail"
			Gson gson = new Gson();
			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("result", "fail");

			String jsonStr = gson.toJson(jsonObject);
			response.getWriter().write(jsonStr);

			System.out.println("LoginServlet - login fail");
		}
	}

	private void userRegist(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		
		String userName = request.getParameter("userName");
		String userEmail = request.getParameter("userEmail");
		String userPassword = request.getParameter("userPassword");
		String userClsf = request.getParameter("userClsf");
		
		
		System.out.println(userClsf);
		UserDto userDto = new UserDto();
		userDto.setUserName(userName);
		userDto.setUserEmail(userEmail);
		userDto.setUserPassword(userPassword);
		userDto.setUserClsf(userClsf);

		int ret = userService.userRegister(userDto);

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
	
	
	
	
	
	
	
}