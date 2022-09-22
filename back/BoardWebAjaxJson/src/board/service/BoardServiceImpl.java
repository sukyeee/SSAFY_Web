package board.service;

import java.util.List;

import board.dao.BoardDao;
import board.dao.BoardDaoImpl;
import board.dto.BoardDto;

public class BoardServiceImpl implements BoardService{

	private static BoardServiceImpl instance = new BoardServiceImpl();
	private BoardServiceImpl() {};
	public static BoardServiceImpl getInstance() {
		return instance;
	}
	
	BoardDao dao = BoardDaoImpl.getInstance();
	@Override
	public int boardInsert(BoardDto dto) {
		return dao.boardInsert(dto);
	}
	@Override
	public int boardDelete(int boardId) {
		return dao.boardDelete(boardId);
	}
	@Override
	public int boardUpdate(BoardDto dto) {
		return dao.boardUpdate(dto);
	}

	@Override
	public List<BoardDto> boardList(int limit, int offset) {
		return dao.boardList(limit, offset);
	}
	@Override
	public List<BoardDto> boardListSearchWord(int limit, int offset, String searchWord) {
		return dao.boardListSearchWord(limit, offset, searchWord);
	}
	@Override
	public int boardListTotalCnt() {
		return dao.boardListTotalCnt();
	}
	@Override
	public int boardListSearchWordTotalCnt(String searchWord) {
		return dao.boardListSearchWordTotalCnt(searchWord);
	}
	@Override
	public BoardDto boardDetail(int boardId, int userSeq) { // userSeq는 현재 게시물을 클릭한 (접속한) 사용자의 userSeq
		BoardDto boardDto = dao.boardDetail(boardId); // 게시글 정보, 이곳의 userSeq는 글 작성자의 userSeq
		// 두 사용자가 같은지에 대한 sameUser 처리
		
		if(boardDto.getUserSeq() == userSeq) {
			boardDto.setSameUser(true);
		} else {
			boardDto.setSameUser(false);
		}
		return boardDto;
	}


}
