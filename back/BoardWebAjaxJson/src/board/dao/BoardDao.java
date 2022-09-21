package board.dao;

import java.util.List;

import board.dto.BoardDto;

public interface BoardDao {
	int boardInsert(BoardDto dto);
	
	List<BoardDto> boardList(int limit, int offset);
	List<BoardDto> boardListSearchWord(int limit, int offset, String searchWord);
	int boardListTotalCnt();
	int boardListSearchWordTotalCnt(String searchWord);
	
	BoardDto boardDetail(int boardId); // 상세
	int boardDelete(int boardId); // 삭제
	int boardUpdate(BoardDto dto); // 수정
}
