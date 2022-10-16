package map.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import map.dto.DealDto;
import map.dto.DongDto;
import map.dto.LocDto;
import map.service.MapService;
import map.service.MapServiceImpl;

@WebServlet("/map/*")
public class MapServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MapService service = MapServiceImpl.getInstance();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

//		HttpSession session = request.getSession();
//		UserDto userDto = (UserDto) session.getAttribute("userDto");

		// LoginFilter로 대체
//		if(userDto != null) System.out.println("로그인 사용자 / 세션 유효");
//		else System.out.println("미로그인 사용자 / 세션이 유효하지 않음");

		String contextPath = request.getContextPath();
		String path = request.getRequestURI().substring(contextPath.length());

		
		switch (path) {
		case "/map/mapMain" : mapMain(request, response); break;
		case "/map/mapDongSelect": mapDongSelect(request, response); break;
		case "/map/mapList": mapList(request, response); break;
		case "/map/mapLocList": mapLocList(request, response); break;
		}

		
	}

	private void mapMain(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/map/mapMain.jsp");
		dispatcher.forward(request, response);
		
	}

	private void mapLocList(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int gugun = Integer.parseInt(request.getParameter("gugunCode"));
		String dong = request.getParameter("dong");
		String searchWord = request.getParameter("searchWord");
		
		List<LocDto> locList = new ArrayList<>();

		locList = service.mapLocList(gugun, dong, searchWord);

		
		Gson gson = new Gson();
        String jsonStr = gson.toJson(locList);
       
        response.getWriter().write(jsonStr);
	}

	private void mapList(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int gugun = Integer.parseInt(request.getParameter("gugunCode"));
		String dong = request.getParameter("dong");
		String searchWord = request.getParameter("searchWord");
		
		List<DealDto> mapList = new ArrayList<>();
		
		mapList = service.mapListSearch(gugun, dong, searchWord);

		
		Gson gson = new Gson();
        String jsonStr = gson.toJson(mapList);
       
        response.getWriter().write(jsonStr);
	}

	private void mapDongSelect(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String strGugunCode = request.getParameter("gugunCode");
		int gugunCode = Integer.parseInt(strGugunCode);

		List<DongDto> dongList;

		dongList = service.mapDongSelect(gugunCode);

		Gson gson = new Gson();
		String jsonStr = gson.toJson(dongList);
		response.getWriter().write(jsonStr);

	}
}
