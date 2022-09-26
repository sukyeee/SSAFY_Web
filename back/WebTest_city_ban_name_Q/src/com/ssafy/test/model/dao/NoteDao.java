package com.ssafy.test.model.dao;

import java.util.List;

import com.ssafy.test.dto.Note;

public interface NoteDao {

	Note doRegist(Note note);

	List<Note> doSelect();

	int doDelete(String id);

	Note doDetail(String model);
}
