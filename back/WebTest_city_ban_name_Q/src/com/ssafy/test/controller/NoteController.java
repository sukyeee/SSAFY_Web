package com.ssafy.test.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ssafy.test.dto.Note;
import com.ssafy.test.model.service.NoteService;
import com.ssafy.test.model.service.NoteServiceImpl;

/**
 * Servlet implementation class NoteController
 */
@WebServlet("/note/NoteController/*")
public class NoteController extends HttpServlet {
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
		
		String action = request.getParameter("action");
		System.out.println(action);
		System.out.println(request.getContextPath());
		
		switch(action) {
		case "regist":
			doRegist(request, response);
			break;
		case "list":
			doList(request, response);
			break;
		case "detailList":
			doDedailList(request, response);
			break;
		case "delete":
			doDel(request, response);
			break;

		}
	}


	private void doDel(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String id = request.getParameter("id");
		noteService.doRemove(id);
		
		RequestDispatcher disp = request.getRequestDispatcher("./listNote.jsp");
		disp.forward(request, response);
		
	}



	private void doDedailList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Note note = null;
		String model = request.getParameter("model");
		note = noteService.doDetail(model);
	
		request.setAttribute("note", note);
		RequestDispatcher disp = request.getRequestDispatcher("./listNote.jsp");
		disp.forward(request, response);
	}


	private void doList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Note> list = new ArrayList<>();
		
		list = noteService.doSelect();
		HttpSession session = request.getSession();
		session.setAttribute("list", list);
		RequestDispatcher disp = request.getRequestDispatcher("./listNote.jsp");
		disp.forward(request, response);
		
	}


	private void doRegist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String model = request.getParameter("model");
		int price = Integer.parseInt(request.getParameter("price"));
		String modelName = request.getParameter("modelName");
		String company = request.getParameter("company");
		
		Note note = new Note();
		note.setNoteCode(id);
		note.setModel(modelName);
		note.setPrice(price);
		note.setCompany(company);
		noteService.doRegist(note);
		
		RequestDispatcher disp = request.getRequestDispatcher("./listNote.jsp");
		disp.forward(request, response);
		
	}
	
	

}
