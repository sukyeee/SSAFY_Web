package map.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import map.dto.CodeDto;
import map.dto.DealDto;
import map.service.CodeService;
import map.service.CodeServiceImpl;

@WebServlet("/code/*")
public class CodeServlet  extends HttpServlet{
	private static final long serialVersionUID = 1L;
	CodeService service = CodeServiceImpl.getInstance();

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

		switch (path) {
		case "/code/grade" : getGarde(request, response); break;
		}

	}
	
	private void getGarde(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String code = request.getParameter("code");	
		List<CodeDto> list = service.getCodeList(code);

		
		Gson gson = new Gson();
		String jsonStr = gson.toJson(list);
		
		
		response.getWriter().write(jsonStr);
		
	}
}
