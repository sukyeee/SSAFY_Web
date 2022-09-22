package board.service;

import java.util.List;

import board.dto.BoardDto;

public interface BoardService {
	int boardInsert(BoardDto dto);
	int boardDelete(int boardId ); // 삭제
	int boardUpdate(BoardDto dto ); // 수정

	List<BoardDto> boardList(int limit, int offset);
	List<BoardDto> boardListSearchWord(int limit, int offset, String searchWord);
	int boardListTotalCnt();
	int boardListSearchWordTotalCnt(String searchWord);
	
	BoardDto boardDetail(int boardId, int userSeq); // 상세
	
}
