package map.controller;

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

import map.dto.UserDto;
import map.service.UserServiceImpl;

@WebServlet("/user/*")
public class UserServlet extends HttpServlet {
	
	
	private static final long serialVersionUID = 1L;
	//private CreateService createService = CreateServiceImpl.getInstance();
	UserServiceImpl service = UserServiceImpl.getInstance();


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		//LoginFilter로 대체
//		if(userDto != null) System.out.println("로그인 사용자 / 세션이 유효함");
//		else System.out.println("미로그인 사용자 / 세션이 유효하지 않음");
		
		String contextPath = request.getContextPath();
		String path = request.getRequestURI().substring(contextPath.length());
		
		System.out.println(path);
		switch(path) {
		case "/user/userMain" : userMain(request,response); break;
		case "/user/userUpdate" : userUpdate(request, response); break;
		case "/user/userDelete" : userDelete(request, response); break;
		case "/user/userInfo" : userInfo(request, response); break;
		}
	}

	protected void userInfo(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		UserDto userDto = (UserDto) session.getAttribute("userDto");
		
		Gson gson = new Gson();
		JsonObject jsonObject = new JsonObject();
		
		
		jsonObject.addProperty("userName", userDto.getUserName());
		jsonObject.addProperty("userEmail", userDto.getUserEmail());
		jsonObject.addProperty("userPassword", userDto.getUserPassword());
		
		System.out.println(userDto.getUserName());
		String jsonStr = gson.toJson(jsonObject);
		response.getWriter().write(jsonStr);
	}


	private void userDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		UserDto userDto = (UserDto) session.getAttribute("userDto");
		
		String userEmail = userDto.getUserEmail();
		System.out.println(userEmail);
		int ret = service.userDelete(userEmail);
		
		//여기 아래 부분 이해안됨 !!!!!!
		Gson gson = new Gson();
		JsonObject jsonObject = new JsonObject();

		if(ret == 1) {
			jsonObject.addProperty("result", "success");
		}else {
			jsonObject.addProperty("result", "fail");
		}
		
		String jsonStr= gson.toJson(jsonObject);
		response.getWriter().write(jsonStr);
	}


	private void userUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String userEmail = request.getParameter("userEmail");
		String userPassword = request.getParameter("userPassword");
		String nextPassword = request.getParameter("nextPassword");
		
		HttpSession session = request.getSession();
		UserDto userDto = (UserDto) session.getAttribute("userDto");
		
		userDto.setUserPassword(nextPassword);
		
		System.out.println(userDto);
		
		int ret= service.userUpdate(userDto);
		
		//여기 아래 부분 이해안됨 !!!!!!
		Gson gson = new Gson();
		JsonObject jsonObject = new JsonObject();

		if(ret == 1) {
			jsonObject.addProperty("result", "success");
		}else {
			jsonObject.addProperty("result", "fail");
		}
		
		String jsonStr= gson.toJson(jsonObject);
		response.getWriter().write(jsonStr);
	}


	private void userMain(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/userMain.jsp");
		dispatcher.forward(request, response);
	}
}