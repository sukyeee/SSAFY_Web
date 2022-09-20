package board.service;

import board.dao.InsertBoardDao;
import board.dao.InsertBoardDaoImpl;
import board.dao.UserDao;
import board.dao.UserDaoImpl;

public class BoardServiceImpl implements BoardService{

	private static BoardServiceImpl instance = new BoardServiceImpl();
	
	private BoardServiceImpl() {}
	
	public static BoardServiceImpl getInstance() {
		return instance;
	}
	
	// 쓰레드에 의해서 userDao 가 공유된다면 ???
	// userDao 가 만약 멤버 변수가 있다면 해당 멤버 변수에 대해서 thread-safe 한 코딩이 필요 synchronize
	// userDao 가 만약 멤버 변수가 없다면 문제X
	// singleTon을 만든 이유 ? -> 싱글톤 디자인 패턴을 가진 객체가 상탯값을 갖지 않으면(메소드만 가지면) thread-safe하다.
	
	// 싱글턴 디자인 패턴을 적용한 객체가 상태값을 가지지 않으면 thread - safe 하다.
	// 싱글턴도 아니거나 객체가 상태값 가지면 thread safe 체크 해줘야 함!
	
	UserDao userDao = UserDaoImpl.getInstance(); // member
	InsertBoardDao insertBoardDao = InsertBoardDaoImpl.getInstance();
	int sum = 0;
	@Override
	public int insertBoard(InsertBoardDao insertBoardDao) {
		
//		sum += 10; // 멤버변수가 상태값을 가져버면 thread-safe하지 않다!!!!
		// 이런 것은 싱글톤으로 만들면 안됌
		
		// dao 객체 생성
		return InsertBoardDao.insertBoard(insertBoardDao);
		// dao 객체 = null
		
	}
	
}
