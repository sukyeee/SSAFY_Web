package com.ssafy.test.model.service;

import java.util.List;

import com.ssafy.test.dto.Note;

public interface NoteService {

	Note doRegist(Note note);
	List<Note> doSelect();
	int doRemove(String id);
	Note doDetail(String model);

}
