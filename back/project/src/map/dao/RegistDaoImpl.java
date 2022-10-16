package map.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import map.common.DBManager;
import map.dto.UserDto;

public class RegistDaoImpl implements RegistDao {
	
	private static RegistDaoImpl instance = new RegistDaoImpl();
	private RegistDaoImpl() {};
	public static RegistDaoImpl getInstance() {
		return instance;
	}

	public int userRegister(UserDto userDto) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int ret = -1;
		
		try {
			con = DBManager.getConnection();
			StringBuilder sb = new StringBuilder();
			sb.append("insert into users")
			.append("(user_name, user_password,user_email, user_profile_image_url, user_register_date, interest_code, grade_code)")
			.append(" values(?, ?, ?, ' ', now(), ?, ?)");
			
			pstmt = con.prepareStatement(sb.toString());
			
			pstmt.setString(1, userDto.getUserName());
			pstmt.setString(2, userDto.getUserPassword());
			pstmt.setString(3, userDto.getUserEmail());
			pstmt.setString(4, userDto.getInterestCode());
			pstmt.setString(5, userDto.getGradeCode());
			
			
			ret = pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			DBManager.releaseConnection(rs, pstmt, con);
		}
		return ret;
	}

}
