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
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("insert into members(user_id, user_name, user_password, email_id, email_domain, join_date) \n");
			sql.append(" values (?,?,?,?,?,now()) ");
			pstmt = conn.prepareStatement(sql.toString());
			int idx = 0;
			pstmt.setString(++idx, memberDto.getUserId());
			pstmt.setString(++idx, memberDto.getUserName());
			pstmt.setString(++idx, memberDto.getUserPwd());
			pstmt.setString(++idx, memberDto.getEmailId());
			pstmt.setString(++idx, memberDto.getEmailDomain());
			
			pstmt.executeUpdate();
		} finally {
			dbUtil.close(pstmt, conn);
			
		}
	}

	@Override
	public MemberDto loginMember(String userId, String userPwd) throws SQLException {
		
		MemberDto memberDto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append(" select user_id, user_name \n");
			sql.append(" from members \n");
			sql.append(" where user_id = ? and user_password = ? ");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1,  userId);
			pstmt.setString(2, userPwd);
			rs = pstmt.executeQuery();
			
			System.out.println("memberDao-" + userId);
			System.out.println(userPwd);
			
			
			if(rs.next()) {
				memberDto = new MemberDto();
				memberDto.setUserId(userId);
				memberDto.setUserName(rs.getString("user_name"));
				
			}
		} finally {
			dbUtil.close(rs, pstmt, conn);
		}
		
		return memberDto;
	}

}
