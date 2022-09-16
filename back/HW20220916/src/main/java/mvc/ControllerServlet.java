	package mvc;
	
	import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.FoodDto;

	// 목록 : /mvc/list
	// 등록 : /mvc/insert
	// 수정 : /mvc/update
	// ...
	@WebServlet("/mvc/*")
	public class ControllerServlet extends HttpServlet {
	    private static final long serialVersionUID = 1L;
	
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        process(request, response);
	    }
	
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		    process(request, response);
		}
	
	// Controller 역할의 서블릿
	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
	    // 인코딩 처리
	    request.setCharacterEncoding("utf-8");
	    response.setContentType("text/html; charset=utf-8"); // jsp로 forward 할 경우는 필요X
	    
	    // 업무 구분 처리
	    String contextPath = request.getContextPath();
	    System.out.println(contextPath);
	    String path = request.getRequestURI().substring(contextPath.length());
	    System.out.println(path);
	    
	    switch(path) {
	    case "/mvc/list" : list(request, response); break;
	    case "/mvc/insert" : insert(request, response); break;
	    case "/mvc/delete" : delete(request, response); break;
	    case "/mvc/modify" : modify(request, response); break;
	    case "/mvc/detail" : detail(request, response); break;
	    
	    // .......
	    }
	}
	
	private void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    ArrayList<FoodDto> list = new ArrayList<>();
	    list.add(new FoodDto(1, "떡볶이", "3000"));
	    list.add(new FoodDto(2, "초밥", "20000"));
	    list.add(new FoodDto(3, "삼겹살", "50000"));
	    
	    // JSP로 Model(data)를 전달하고 forward
	    request.setAttribute("list", list);
	    RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/mvc/foodList.jsp");
	    dispatcher.forward(request, response);
	  
	}
	
	private void insert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// service - dao - db 등록 완료 
		String foodname = request.getParameter("foodname");
		String foodprice = request.getParameter("foodprice");
		System.out.println(foodname);
		System.out.println(foodprice);
		String[] spicy = request.getParameterValues("spicy");
		
		StringBuilder sb = new StringBuilder();
		sb.append("foodname : " + foodname).append("foodprice: " + foodprice);
		for (String str : spicy) {
			System.out.println(str);
			sb.append(" spicy: " + str );
		}
		
		
		FoodDto FoodDto = new FoodDto(4, foodname, "10000");
		
	    // JSP로 Model(data)를 전달하고 forward
	    request.setAttribute("FoodDto", FoodDto);
	    RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/mvc/foodInsertResult.jsp");
	    dispatcher.forward(request, response);
	}
	
	private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	  	
		String foodname = request.getParameter("foodname");
		FoodDto FoodDto = new FoodDto(4, foodname, "10000");
		
	    // JSP로 Model(data)를 전달하고 forward
	    request.setAttribute("FoodDto", FoodDto);
	    RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/mvc/foodDeleteResult.jsp");
	    dispatcher.forward(request, response);
	    
	    
	}
	private void modify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	  	
		String foodname = request.getParameter("foodname");
		FoodDto FoodDto = new FoodDto(4, foodname, "10000");
		
	    // JSP로 Model(data)를 전달하고 forward
	    request.setAttribute("FoodDto", FoodDto);
	    RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/mvc/foodModifyResult.jsp");
	    dispatcher.forward(request, response);
	    
	    
	}
private void detail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	  	
		String foodname = request.getParameter("foodname");
		FoodDto FoodDto = new FoodDto(4, foodname, "10000");

		if(foodname.equals("떡볶이")) {
			FoodDto = new FoodDto(1, foodname, "3000");
		}
		else if(foodname.equals("초밥")) {
			FoodDto = new FoodDto(2, foodname, "20000");
		}
		else if(foodname.equals("삼겹살")){
			FoodDto = new FoodDto(3, foodname, "50000");
		}
		else FoodDto = new FoodDto(4, foodname, "99999");
		
	    // JSP로 Model(data)를 전달하고 forward
	    request.setAttribute("FoodDto", FoodDto);
	    RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/mvc/foodDetailResult.jsp");
	    dispatcher.forward(request, response);
	    
	    
	}
	
	}