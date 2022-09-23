package home.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import home.dto.DongDto;
import home.dto.GugunDto;
import home.dto.HouseDto;
import home.dto.SidoDto;
import home.service.HouseService;
import home.service.HouseServiceImpl;

@WebServlet("/house/*")
public class HouseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	HouseService houseService = HouseServiceImpl.getInstance();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		

		String contextPath = request.getContextPath();
		String path = request.getRequestURI().substring(contextPath.length());
		System.out.println(path);
		
		switch (path) {
		
			case "/house/sido":
				sido(request, response);
				break;
			case "/house/gugun":
				gugun(request, response);
				break;
			case "/house/dong":
				dong(request, response);
				break;
			case "/house/search":
				searchByDong(request, response);
				break;
			case "/house/searchApt":
				searchByApt(request, response);
				break;
			
		
		}
		
	
	}

	private void searchByApt(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 아파트 별 검색 
		List<HouseDto> houseList = null;

		String apt_name = request.getParameter("apt_name");

		houseList = houseService.getSearchByApt(apt_name);
		Gson gson = new Gson();
		String jsonStr = gson.toJson(houseList);
		System.out.println(jsonStr);

		response.getWriter().write(jsonStr);
		
		
	}

	private void searchByDong(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 동 별 검색
		List<HouseDto> houseList = null;

		String dong_name = request.getParameter("dong_name");
		
		houseList = houseService.getSearchByDong(dong_name);
		Gson gson = new Gson();
		String jsonStr = gson.toJson(houseList);
		System.out.println(jsonStr);

		response.getWriter().write(jsonStr);
	}

	private void dong(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 동 정보를 select
		List<DongDto> dongList = null;

		String gugun_code = request.getParameter("gugun_code");
		
		dongList = houseService.getDong(gugun_code);
		Gson gson = new Gson();
		String jsonStr = gson.toJson(dongList);
		System.out.println(jsonStr);

		response.getWriter().write(jsonStr);
		
	}

	private void gugun(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 구군 정보를 select
		List<GugunDto> gugunList = null;

		String sido_code = request.getParameter("sido_code");
		
		gugunList = houseService.getGugun(sido_code);
		Gson gson = new Gson();
		String jsonStr = gson.toJson(gugunList);
		System.out.println(jsonStr);

		response.getWriter().write(jsonStr);
	}

	private void sido(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 시도 정보를 select
	
		List<SidoDto> sidoList = null;

		sidoList = houseService.getSido();
		Gson gson = new Gson();
		String jsonStr = gson.toJson(sidoList);
		System.out.println(jsonStr);

		response.getWriter().write(jsonStr);
		
	}
}