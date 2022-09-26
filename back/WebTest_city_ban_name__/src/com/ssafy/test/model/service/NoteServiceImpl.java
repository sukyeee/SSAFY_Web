package com.ssafy.test.model.service;

import java.sql.SQLException;
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
	public List<Note> selectAll() throws SQLException {
		return noteDao.selectAll();
	}

	@Override
	public Note selectByNoteCode(String noteCode) throws SQLException {
		return noteDao.selectByNoteCode(noteCode);
	}

	@Override
	public int insert(Note note) throws SQLException {
		return noteDao.insert(note);
	}

	@Override
	public int delete(String noteCode) throws SQLException {
		return noteDao.delete(noteCode);
	}


}
