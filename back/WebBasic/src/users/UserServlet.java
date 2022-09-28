package users;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/user/*")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// /user/registerForm : 회원가입 페이지 요청 (get)
		// /user/register : 회원가입 요청 (post)
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	// CodeService => CodeDao
	protected void userRegister(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// CodeDaoImpl codeDao = CodeDaoImp.getInstance();
		List<CodeDto> codeList = codeDao.getCodeList("001"); // group_code 테이블의 회원 구분 코드
		request.setAttribute("codeList", codeList);
		doGet(request, response);
		//registerFrom.jsp로 forward
		
	}
	
	
}
