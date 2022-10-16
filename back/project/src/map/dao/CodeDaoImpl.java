package map.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import map.common.DBManager;
import map.dto.CodeDto;

public class CodeDaoImpl implements CodeDao{
	
	private static CodeDaoImpl instance = new CodeDaoImpl();
	private CodeDaoImpl() {}
	
	public static CodeDaoImpl getInstance() {
		return instance;
	}

	@Override
	public List<CodeDto> getCodeList(String code) {
		List<CodeDto> list = new ArrayList<>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			// Connection 객체 획득
			con = DBManager.getConnection();
			StringBuilder sb = new StringBuilder();
			sb.append("SELECT * ")
			 .append("FROM common_code where parent_code = ?");

			pstmt = con.prepareStatement(sb.toString());
			pstmt.setString(1,code);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				CodeDto codeDto= new CodeDto();
				codeDto.setChildCode(rs.getString("child_code"));
				codeDto.setChildName(rs.getString("child_name"));
				list.add(codeDto);
			}			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// Connection 객체 반납
			DBManager.releaseConnection(rs, pstmt, con);
		}
		
		return list;
	}
	
}
