package board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import board.common.DBManager;
import board.dto.UserDto;

// Singleton 
public class LoginDaoImpl implements LoginDao{

	private static LoginDaoImpl instance = new LoginDaoImpl();
	private LoginDaoImpl() {}
	
	public static LoginDaoImpl getInstance() {
		return instance;
	}
	
	@Override
	public UserDto login(String userEmail) {
		UserDto userDto = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			// Connection 객체 획득
			con = DBManager.getConnection();
			StringBuilder sb = new StringBuilder();
			sb.append(" SELECT USER_SEQ, USER_NAME, USER_PASSWORD, USER_EMAIL, USER_PROFILE_IMAGE_URL,USER_REGISTER_DATE ")
			.append(" FROM USERS WHERE USER_EMAIL = ? ");
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setString(1, userEmail);
			System.out.println(sb.toString());
			
			rs = pstmt.executeQuery();
			if( rs.next() ) {
				userDto = new UserDto();
				userDto.setUserSeq( rs.getInt("USER_SEQ"));
				userDto.setUserName(rs.getString("USER_NAME"));
				userDto.setUserPassword(rs.getString("USER_PASSWORD"));
				userDto.setUserEmail(rs.getString("USER_EMAIL"));
				userDto.setUserProfileImageUrl(rs.getString("USER_PROFILE_IMAGE_URL"));
				userDto.setUserRegisterDate(rs.getDate("USER_REGISTER_DATE"));
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			// Connection 객체 반납
			DBManager.releaseConnection(rs, pstmt, con);
		}
		
		return userDto;
	}

}
