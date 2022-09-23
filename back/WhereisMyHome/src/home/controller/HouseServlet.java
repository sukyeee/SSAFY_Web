package home.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import home.dto.HouseDto;
import home.service.HouseService;
import home.service.HouseServiceImpl;

@WebServlet("/findHouses")
public class HouseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		// 파라미터
		String dong = request.getParameter("dong");
		String aptName = request.getParameter("aptName");
		
		System.out.println("dong : " + dong);
		System.out.println("aptName : " + aptName);

		HouseService service = HouseServiceImpl.getInstance();
		List<HouseDto> houseList = service.findHouse(dong, aptName);
		
		for (HouseDto houseDto : houseList) {
			System.out.println("AptName : " + houseDto.getAptName());
		}

		if (houseList.size() >= 1) {
			Gson gson = new Gson();
			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("result", "success");

			String jsonStr = gson.toJson(jsonObject);
			response.getWriter().write(jsonStr);
		} else {
			// "result" : "fail"
			Gson gson = new Gson();
			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("result", "fail");

			String jsonStr = gson.toJson(jsonObject);
			response.getWriter().write(jsonStr);
		}
	}
}