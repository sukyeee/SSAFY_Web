package com.ssafy.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssafy.member.model.service.MemberService;
import com.ssafy.member.model.service.MemberServiceImpl;

@WebServlet("/user")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private MemberService memberService;
	
	public void init() {
		memberService = MemberServiceImpl.getMemberService();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String act = request.getParameter("act");
		
		String path = "/index.jsp";
		if("mvjoin".equals(act)) {
			path = "/user/join.jsp";
			redirect(request, response, path);
		} else if("idcheck".equals(act)) { 
			// 얘를 제외한 나머지는 다 path임
			int cnt = idCheck(request, response);
			response.setContentType("text/plain);charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(cnt);
		} else if("".equals(act)) {
			
		} else if("".equals(act)) {
			
		} else if("".equals(act)) {
			
		} else {
			redirect(request, response, path);
		}
	}

	
	
	private void redirect(HttpServletRequest request, HttpServletResponse response, String path) throws IOException{
		response.sendRedirect(request.getContextPath() + path );
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// 로직을 호출하는 부분  . 클래스로 뺄 수 있다! 
	private int idCheck(HttpServletRequest request, HttpServletResponse response) {
		
		String userId = request.getParameter("userid");
		try {
			int count = memberService.idCheck(userId);
			return count;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 500;
		
	}


}
