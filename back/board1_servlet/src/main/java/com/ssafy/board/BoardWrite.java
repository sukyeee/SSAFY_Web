package com.ssafy.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BoardWrite
 */
@WebServlet("/register")
public class BoardWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	
	
	@Override
	public void init() throws ServletException {
		super.init();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}




	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		1. data get
		request.setCharacterEncoding("utf-8"); // doGet방식일땐 상관없지만 post일때는 바꿔줘야 함 
		String userId = request.getParameter("userid");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		System.out.println(userId + subject + content);
		
//		2. logic
		Connection conn = null;
		PreparedStatement pstmt = null;
		int cnt = 0;
		try {
			conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/ssafyweb?serverTimezone=UTC", "root","EyaEya9210814!");
			StringBuilder sql = new StringBuilder();
			sql.append("insert into board ( user_id, subject, content, hit, register_time ) \n");
			sql.append("values (?,?,?, 0, now())"); // 끝에 세미콜론 찍으면 문제생김!
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, userId);
			pstmt.setString(2, subject);
			pstmt.setString(3, content);
			cnt = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null)conn.close();
				
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
//		dirver : com.mysql.cj.jdbc.Driver
//		url : jdbc:mysql://127.0.0.1:3306/ssafyweb?serverTimezone=UTC
			
//		3. repsonse page
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html lang=\"ko\">");
		out.println("  <head>");
		out.println("    <meta charset=\"UTF-8\" />");
		out.println("    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\" />");
		out.println("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />");
		out.println("    <link");
		out.println("      href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css\"");
		out.println("      rel=\"stylesheet\"");
		out.println("      integrity=\"sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3\"");
		out.println("      crossorigin=\"anonymous\"");
		out.println("    />");
		out.println("    <link href=\"/board1_servlet/assets/css/app.css\" rel=\"stylesheet\" />");
		out.println("    <title>SSAFY</title>");
		out.println("  </head>");
		out.println("  <body>");
		out.println("    <div class=\"container\">");
		out.println("      <div class=\"row justify-content-center\">");

		out.println("        <div class=\"col-lg-8 col-md-10 col-sm-12\">");
		out.println("          <h2 class=\"my-3 py-3 shadow-sm bg-light text-center\">");
		out.println("            <mark class=\"sky\">글쓰기 결과</mark>");
		out.println("          </h2>");
		out.println("        </div>");
		out.println("        <div class=\"col-lg-8 col-md-10 col-sm-12\">");
		
		if(cnt != 0) {
			out.println("          <div class=\"card text-center bg-light\">");
			out.println("            <h2 class=\"fw-bold text-primary pt-3\">등록 완료!!!</h2>");
			out.println("            <div class=\"card-body\">");
			out.println("              <p class=\"card-text\">글작성이 완료되었습니다.</p>");
			out.println("              <button type=\"button\" id=\"btn-list\" class=\"btn btn-outline-primary\">");
			out.println("                글목록 페이지 이동...");
			out.println("              </button>");
			out.println("            </div>");
			out.println("          </div>");
		}
		else {
			out.println("          <div class=\"card text-center bg-light\">");
			out.println("            <h2 class=\"fw-bold text-danger pt-3\">등록 실패T.T</h2>");
			out.println("            <div class=\"card-body\">");
			out.println("              <p class=\"card-text\">");
			out.println("                글작성에 문제가 있습니다. <br />");
			out.println("                잠시 후 시도해주세요.");
			out.println("              </p>");
			out.println("              <button type=\"button\" id=\"btn-list\" class=\"btn btn-outline-danger\">");
			out.println("                글목록 페이지 이동...");
			out.println("              </button>");
			out.println("            </div>");
			out.println("          </div>");
			
		}
		
		out.println("        </div>");
		out.println("      </div>");
		out.println("    </div>");
		out.println("    <script");
		out.println("      src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js\"");
		out.println("      integrity=\"sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p\"");
		out.println("      crossorigin=\"anonymous\"");
		out.println("    ></script>");
		out.println("    <script>");
		out.println("      document.querySelector(\"#btn-list\").addEventListener(\"click\", function () {");
		out.println("        location.href = \"/board1_servlet/list\";");
		out.println("      });");
		out.println("    </script>");
		out.println("  </body>");
		out.println("</html>");

		
	}

}
