package board.dao;

import board.dto.BoardDto;

public interface InsertBoardDao {
	int insertBoard(BoardDto boardDto);
}