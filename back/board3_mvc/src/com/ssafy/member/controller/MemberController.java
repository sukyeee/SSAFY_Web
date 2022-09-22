package com.ssafy.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ssafy.member.model.MemberDto;
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
			response.setContentType("text/plain;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(cnt);
		} else if("join".equals(act)) {
			path = join(request, response);
			forward(request, response, path);
		} else if("mvlogin".equals(act)) {
			path = "/user/login.jsp";
			redirect(request, response, path);
		} else if("login".equals(act)) {
			path = login(request, response);
			forward(request, response, path);
		} else if("logout".equals(act)) {
			path = logout(request, response);
			forward(request, response, path);
		}else {
			redirect(request, response, path);
		}
	}


	
	private String logout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
//		session.removeAttribute("userinfo"); // 하나씩 지우기 
		session.invalidate(); // 다 지우기
		return "/index.jsp";
	}

	private String login(HttpServletRequest request, HttpServletResponse response) {
		
		String userId = request.getParameter("userid");
		String userPwd = request.getParameter("userpwd");
		System.out.println(userId);
		System.out.println(userPwd);
		try {
			MemberDto memberDto = memberService.loginMember(userId, userPwd);
			if(memberDto != null) { // 로그인 성공
				
				String saveid = request.getParameter("saveid");
				if("ok".equals(saveid)) { // 아이디 저장 체크 o
					Cookie cookie = new Cookie("ssafy_id", userId ); // 쿠키는 중요정보 저장하면 안됌 
					cookie.setMaxAge(60*60*24*365*40); // 유효기간 설정 하지 않으면 브라우저 종료 시 쿠키사라짐
					cookie.setPath(request.getContextPath()); // 도메인 당 여러개 저장 가능
					
					response.addCookie(cookie); // 클라이언트에게 쿠키 보내기
				} else {
					Cookie[] cookies = request.getCookies();
					if(cookies != null) {
						for (Cookie cookie : cookies) {
							if(cookie.getName().equals("ssafy_id")) {
								cookie.setMaxAge(0);
								cookie.setPath(request.getContextPath()); // 도메인 당 여러개 저장 가능
								
								response.addCookie(cookie); // 클라이언트에게 쿠키 보내기
								break;
							}
						}
					}
					
				}
				HttpSession session = request.getSession();
				session.setAttribute("userinfo", memberDto);
				return "/index.jsp";
			} else {
				request.setAttribute("msg", "아이디 또는 비밀번호 확인 후 다시 로그인!!");
				return "/user/login.jsp";
			}
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			request.setAttribute("msg", "로그인 처리중 에러 발생!!");
			return "error/error.jsp";
		}
	}

	private String join(HttpServletRequest request, HttpServletResponse response) {
		MemberDto memberDto = new MemberDto();
		memberDto.setUserId(request.getParameter("userid"));
		memberDto.setUserName(request.getParameter("username"));
		memberDto.setUserPwd(request.getParameter("userpwd"));
		memberDto.setEmailId(request.getParameter("emailid"));
		memberDto.setEmailDomain(request.getParameter("emaildomain"));
		
		try {
			memberService.joinMember(memberDto);
			return "/user?act=mvlogin";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			request.setAttribute("msg", "회원가입 처리중 에러 발생!!");
			return "/error/error.jsp";
		}
		
	}

	private void forward(HttpServletRequest request, HttpServletResponse response, String path)  throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher(path) ;
		dispatcher.forward(request, response);
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
