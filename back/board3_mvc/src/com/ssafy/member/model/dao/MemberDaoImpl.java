package com.ssafy.member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ssafy.member.model.MemberDto;
import com.ssafy.util.DBUtil;

public class MemberDaoImpl implements MemberDao {
	
	private static MemberDao memberDao = new MemberDaoImpl();
	private DBUtil dbUtil;
	
	private MemberDaoImpl() {
		dbUtil = DBUtil.getInstance();
	}
	
	
	public static MemberDao getMemberDao() {
		return memberDao;
	}
	
	
	@Override
	public int idCheck(String userId) throws SQLException {
		int cnt = 1; // 0 만 아니면 된다. 1 , 1000... 등 상관 없음.
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select count(user_id) \n");
			sql.append("from members \n");
			sql.append("where user_id = ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1,  userId);
			rs = pstmt.executeQuery();
			rs.next();
			cnt = rs.getInt(1);
			
		} finally {
			dbUtil.close(rs, pstmt, conn);
		}
		
		
		return cnt;
	}

	@Override
	public void joinMember(MemberDto memberDto) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public MemberDto loginMember(String userId, String userPwd) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
