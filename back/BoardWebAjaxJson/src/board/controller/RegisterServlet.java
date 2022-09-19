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
import board.service.RegisterService;
import board.service.RegisterServiceImpl;


@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//		Connection con = DBManager.getConnection();
//		System.out.println(con);
//		DBManager.releaseConnection(null, null, con);
		
		
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		// 파라미터
		String userName = request.getParameter("userName");
		String userEmail = request.getParameter("userEmail");
		String userPassword = request.getParameter("userPassword");
		
//		LoginService service = LoginServiceImpl.getInstance();
//		UserDto userDto = service.login(userEmail, userPassword);
		RegisterService service = RegisterServiceImpl.getInstance();
		boolean alreadyUserExist = service.register(userName, userEmail, userPassword);
	
		System.out.println(alreadyUserExist);
		
		// 성공, 실패에 대한 처리
		// 성공: 1. session 에 사용자 정보 UserDto 를 저장, 2. 로그인 성공 결과를 client 에 return (json)
		// 실패: 로그인 실패 결과를 client에 return (json)
		
		if( !alreadyUserExist ) { 
		// "result":"success"
			Gson gson = new Gson();
			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("result", "success");
			
			String jsonStr = gson.toJson(jsonObject);
			response.getWriter().write(jsonStr);
			
			System.out.println("RegisterServlet - register success");
		} else {
			// "result":"fail"
			
			HttpSession session = request.getSession();
			session.setAttribute("alreadyUserExist", true); // 이미 유저 있음 
			
			Gson gson = new Gson();
			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("result", "fail");
			
			String jsonStr = gson.toJson(jsonObject);
			response.getWriter().write(jsonStr);
			
			System.out.println("RegisterServlet - register fail");
		}
	}

}
