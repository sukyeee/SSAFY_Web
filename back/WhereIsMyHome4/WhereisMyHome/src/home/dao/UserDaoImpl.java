package home.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpSession;

import home.common.DBManager;
import home.dto.UserDto;

public class UserDaoImpl  implements UserDao{

	private static UserDaoImpl instance = new UserDaoImpl();
	
	private UserDaoImpl() {};
	
	public static UserDaoImpl getInstance() {
		return instance;
	}
	
	
	@Override
	public int userRegister(UserDto userDto) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int ret = -1;
		
		try {
			con = DBManager.getConnection();
			StringBuilder sb = new StringBuilder();
			sb.append(" insert into users ")
			.append(" (user_name, user_password, user_email, user_profile_image_url, user_register_date, user_clsf) ")
			.append(" values (?,?,?, null, now(), ?)  ");
			
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setString(1, userDto.getUserName());
			pstmt.setString(2, userDto.getUserPassword());
			pstmt.setString(3, userDto.getUserEmail());
			pstmt.setString(4, userDto.getUserClsf());
			
			ret = pstmt.executeUpdate(); // 영향받은 row 수 return
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.releaseConnection(rs, pstmt, con);
		}
		
		return ret;
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
			sb.append(" SELECT USER_SEQ, USER_NAME, USER_PASSWORD, USER_EMAIL, USER_PROFILE_IMAGE_URL, USER_REGISTER_DATE ")
				.append(" FROM USERS WHERE USER_EMAIL = ?" );
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setString(1, userEmail);
			System.out.println(sb.toString());
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				userDto = new UserDto();
				userDto.setUserSeq(rs.getInt("USER_SEQ"));
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

	@Override
	public int userUpdate(UserDto userDto, int userSeq) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int ret = -1;
		
		
		try {
			con = DBManager.getConnection();
			StringBuilder sb = new StringBuilder();
			sb.append( "UPDATE `users` SET `USER_NAME` = ?, `USER_EMAIL` = ?, `USER_PASSWORD` = ?  WHERE `USER_SEQ` = ?"  );

			pstmt = con.prepareStatement(sb.toString());
			pstmt.setString(1, userDto.getUserName());
			pstmt.setString(2, userDto.getUserEmail());
			pstmt.setString(3, userDto.getUserPassword());
			pstmt.setInt(4, userSeq);

			ret = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.releaseConnection(rs, pstmt, con);
		}

		return ret;
		
	}

	@Override
	public int userDelete(int userSeq) {
	
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int ret = -1;
		
		try {
			con = DBManager.getConnection();
			StringBuilder sb = new StringBuilder();
			sb.append( " delete from `users` where `USER_SEQ` = ? " );
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setInt(1, userSeq);
			
			ret = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.releaseConnection(rs, pstmt, con);
		}

		return ret;
	}

}
