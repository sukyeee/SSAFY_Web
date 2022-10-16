package map.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import map.common.DBManager;
import map.dto.UserDto;

public class UserDaoImpl implements UserDao{
	
	private static UserDaoImpl instance = new UserDaoImpl();
	public static UserDaoImpl getInstance() {
		return instance;
	}
	private UserDaoImpl() {};

	@Override
	public int userUpdate(UserDto dto) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int ret = -1;
		
		try {
			con = DBManager.getConnection();
			StringBuilder sb = new StringBuilder();
			sb.append("update users ")
			.append(" set user_password = ? ")
			.append(" where user_email = ? ");
			
			pstmt = con.prepareStatement(sb.toString());
			
			pstmt.setString(1, dto.getUserPassword());
			pstmt.setString(2, dto.getUserEmail());
			
			System.out.println(dto.getUserSeq());
			
			ret = pstmt.executeUpdate();
			System.out.println(ret);
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			DBManager.releaseConnection(rs, pstmt, con);
		}
		
		return ret;
	}

	@Override
	public int userDelete(String userEmail) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int ret = -1;
		
		try {
			con = DBManager.getConnection();
			StringBuilder sb = new StringBuilder();
			sb.append("delete from users")
			.append(" where user_email = ? ");
			
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setString(1, userEmail);
			
			ret = pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			DBManager.releaseConnection(rs, pstmt, con);
		}
		
		return ret;
	}

}
