package board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import board.common.DBManager;
import board.dto.BoardDto;

// Singleton 
public class InsertBoardDaoImpl implements InsertBoardDao{

	private static InsertBoardDaoImpl instance = new InsertBoardDaoImpl();
	private InsertBoardDaoImpl() {}
	
	public static InsertBoardDaoImpl getInstance() {
		return instance;
	}
	

	@Override
	public int insertBoard(BoardDto boardDto) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int ret = -1;
		
		try {
			// Connection 객체 획득
			con = DBManager.getConnection();
			StringBuilder sb = new StringBuilder();
			sb.append(" INSERT INTO board (`USER_SEQ`, `TITLE`, `CONTENT`, `REG_DT`, `READ_COUNT` ) VALUES (  ?, ?, ?, now(), 0) ");
			
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setInt(1, boardDto.getUserSeq());
			pstmt.setString(2, boardDto.getTitle());
			pstmt.setString(3, boardDto.getContent());
			
			System.out.println(sb.toString());
			
			ret = pstmt.executeUpdate(); // 영향받은 row 수 return
			

		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			// Connection 객체 반납
			DBManager.releaseConnection(rs, pstmt, con);
		}
		
		return ret;
	}

}
