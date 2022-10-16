package map.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import map.dto.UserDto;
import map.service.RegistService;
import map.service.RegistServiceImpl;

/**
 * Servlet implementation class RegistServlet
 */
@WebServlet("/register")
public class RegistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String userName = request.getParameter("userName");
		String userEmail = request.getParameter("userEmail");
		String userPassword = request.getParameter("userPassword");
		String interestCode = request.getParameter("interestCode");
		String code = request.getParameter("commonName");
		if(code.equals("준회원")) {
			code = "001";
		}else if(code.equals("일반회원")) {
			code = "002";
		}else if(code.equals("VIP")) {
			code = "003";
		}
		System.out.println(code);
		
		RegistService registService = RegistServiceImpl.getInstance();
		UserDto userDto = new UserDto();
		
		userDto.setUserName(userName);
		userDto.setUserEmail(userEmail);
		userDto.setUserPassword(userPassword);
		userDto.setInterestCode(interestCode);
		userDto.setGradeCode(code);
		
		System.out.println(userDto);
		
		int ret = registService.userRegister(userDto);
		
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
}
