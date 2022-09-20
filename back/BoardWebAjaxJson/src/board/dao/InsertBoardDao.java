package board.dao;


public interface InsertBoardDao {
	public int insertBoard(int userSeq, String title, String content, int boardReadCount);

	public static int insertBoard(InsertBoardDao insertBoardDao) {
		// TODO Auto-generated method stub
		return 0;
	}
}
