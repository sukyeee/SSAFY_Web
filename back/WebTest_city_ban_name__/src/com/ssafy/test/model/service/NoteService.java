package com.ssafy.test.model.service;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.test.dto.Note;

public interface NoteService {

	List<Note> selectAll() throws SQLException;
	
	Note selectByNoteCode(String noteCode) throws SQLException;
	int insert(Note note) throws SQLException;
	int delete(String noteCode) throws SQLException;
}
