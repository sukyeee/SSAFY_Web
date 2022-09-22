package board.dao;

import java.util.List;

import board.dto.BoardDto;

public interface BoardDao {
	int boardInsert(BoardDto dto);
	int boardUpdate(BoardDto dto); // 수정
	int boardDelete(int boardId); // 삭제


	List<BoardDto> boardList(int limit, int offset);
	List<BoardDto> boardListSearchWord(int limit, int offset, String searchWord);
	int boardListTotalCnt();
	int boardListSearchWordTotalCnt(String searchWord);
	
	BoardDto boardDetail(int boardId); // 상세
	
}
