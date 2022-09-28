package home.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import home.common.DBManager;
import home.dto.CodeDto;

public class CodeDaoImpl implements CodeDao {

	private static CodeDaoImpl instance = new CodeDaoImpl();
	
	private CodeDaoImpl() {};
	
	public static CodeDaoImpl getInstance() {
		return instance;
	}
	
	@Override
	public List<CodeDto> getCodeList() {
		
		StringBuilder sb = new StringBuilder();

		List<CodeDto> codeList = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
		
			con = DBManager.getConnection();
			
			sb.append(" select c.group_code, c.code, c.code_name \n ")
				.append(" from code c join group_code g \n ")
				.append(" using (group_code) \n ")
				.append(" where g.group_code = ? ");
				
		
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setString(1, "001");
			
			rs = pstmt.executeQuery();
			while( rs.next() ) {
				CodeDto codeDto = new CodeDto();
				codeDto.setCode(rs.getString("code"));
				codeDto.setCodeName(rs.getString("code_name"));
				codeDto.setGroupCode(rs.getString("group_code"));
				
				codeList.add(codeDto);
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		} finally {
			// Connection 객체 반납
			DBManager.releaseConnection(rs, pstmt, con);
		}
		
		
		return codeList;
	}

}
