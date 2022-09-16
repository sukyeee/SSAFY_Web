package servlet;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/SessionMakeServlet")
public class SessionMakeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.setAttribute("userId", "sk"); // 문자열 저장
		int[] intArray = {1,2,3,4,5};
		session.setAttribute("intArray", intArray); // 배열 primitive
		
		String[] strArray = {"A","B","C"}; // 문자열 배열
		List<String> strList = Arrays.asList(strArray); // 문자열 리스트 
		session.setAttribute("strList", strList);
		
		System.out.println("Session에 객체를 저장했습니다.");
		response.getWriter().append("Session Add!!");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
