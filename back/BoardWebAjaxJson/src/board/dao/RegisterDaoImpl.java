package board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import board.common.DBManager;
import board.dto.UserDto;

// Singleton 
public class RegisterDaoImpl implements RegisterDao{

	private static RegisterDaoImpl instance = new RegisterDaoImpl();
	private RegisterDaoImpl() {}
	
	public static RegisterDaoImpl getInstance() {
		return instance;
	}
	
	@Override
	public boolean register(String userName, String userEmail, String userPassword) {
		UserDto userDto = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			// Connection 객체 획득
			con = DBManager.getConnection();
			StringBuilder sb = new StringBuilder();
			sb.append(" INSERT INTO `board`.`users` (`USER_NAME`, `USER_PASSWORD`, `USER_EMAIL`) VALUES ( ?, ?, ?) ");
			
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setString(1, userName);
			pstmt.setString(2, userPassword);
			pstmt.setString(3, userEmail);
			
			System.out.println(sb.toString());
			
			pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			// Connection 객체 반납
			DBManager.releaseConnection(rs, pstmt, con);
		}
		
		return true;
	}

}
