package board.service;

import board.dao.InsertBoardDao;
import board.dao.InsertBoardDaoImpl;
import board.dao.UserDao;
import board.dao.UserDaoImpl;
import board.dto.BoardDto;
import board.dto.UserDto;

public class InsertBoardServiceImpl implements InsertBoardService{

	private static InsertBoardServiceImpl instance = new InsertBoardServiceImpl();
	
	private InsertBoardServiceImpl() {}
	
	public static InsertBoardServiceImpl getInstance() {
		return instance;
	}
	
	InsertBoardDao insertBoardDao = InsertBoardDaoImpl.getInstance();
	
	int sum = 0;
	@Override
	public int insertBoard(BoardDto boardDto) {
		
//		sum += 10; // 멤버변수가 상태값을 가져버면 thread-safe하지 않다!!!!
		// 이런 것은 싱글톤으로 만들면 안됌
		
		// dao 객체 생성
		return insertBoardDao.insertBoard(boardDto);
		// dao 객체 = null
		
	}
	
	
}
