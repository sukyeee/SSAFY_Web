package board.dao;

import board.dto.BoardDto_me;

public interface InsertBoardDao {
	int insertBoard(BoardDto_me boardDto);
}
