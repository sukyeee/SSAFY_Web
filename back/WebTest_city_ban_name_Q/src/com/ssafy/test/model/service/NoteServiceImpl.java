package com.ssafy.test.model.service;

import java.util.List;

import com.ssafy.test.dto.Note;
import com.ssafy.test.model.dao.NoteDao;
import com.ssafy.test.model.dao.NoteDaoImpl;

public class NoteServiceImpl implements NoteService {

	private static NoteServiceImpl instance = new NoteServiceImpl();
	private NoteServiceImpl() {};
	
	public static NoteServiceImpl getInstance() {
		return instance;
	}

	NoteDao noteDao = NoteDaoImpl.getInstance();
	@Override
	public Note doRegist(Note note) {
		return noteDao.doRegist(note);
	}

	@Override
	public List<Note> doSelect() {
		return noteDao.doSelect();
	}

	@Override
	public int doRemove(String id) {
		return noteDao.doDelete(id);
	}

	@Override
	public Note doDetail(String model) {

		return noteDao.doDetail(model);
	}
	


}
