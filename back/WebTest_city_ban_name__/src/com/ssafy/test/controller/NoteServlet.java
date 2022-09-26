package com.ssafy.test.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssafy.test.dto.Note;
import com.ssafy.test.model.service.NoteService;
import com.ssafy.test.model.service.NoteServiceImpl;

/**
 * Servlet implementation class NoteController
 */
@WebServlet("/note/*")
public class NoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private final NoteService noteService = NoteServiceImpl.getInstance();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		process(request, response);
	}


	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		try {
			// 작업 구분 action
			String action = request.getParameter("action");
			
			switch(action) {
			case "list" : list(request, response); break;
			
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		}
	
	
		
	}


	private void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		List<Note> noteList = noteService.selectAll();
		request.setAttribute("noteList", noteList);
		request.getRequestDispatcher("/note/listNote.jsp").forward(request, response);
	}





	
	

}
