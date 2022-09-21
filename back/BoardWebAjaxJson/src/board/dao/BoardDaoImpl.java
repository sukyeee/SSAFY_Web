package board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import board.common.DBManager;
import board.dto.BoardDto;

public class BoardDaoImpl implements BoardDao {

	private static BoardDaoImpl instance = new BoardDaoImpl();

	private BoardDaoImpl() {

	}

	public static BoardDaoImpl getInstance() {
		return instance;
	}

	@Override
	public int boardInsert(BoardDto dto) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int ret = -1;

		try {
			con = DBManager.getConnection();
			StringBuilder sb = new StringBuilder();
			sb.append(" insert into BOARD ").append("(user_seq, title, content, reg_dt, read_count)")
					.append("values ( ?, ?, ?, now(), 0 )");

			pstmt = con.prepareStatement(sb.toString());
			pstmt.setInt(1, dto.getUserSeq());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());

			ret = pstmt.executeUpdate(); // 영향받은 row 수 return
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.releaseConnection(rs, pstmt, con);
		}

		return ret;
	}

	@Override
	public List<BoardDto> boardList(int limit, int offset) {

		List<BoardDto> list = new ArrayList<>();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = DBManager.getConnection();
			StringBuilder sb = new StringBuilder();
			sb.append(
					" select b.board_id, b.user_seq, u.user_name, u.user_profile_image_url, b.title, b.content, b.reg_dt, b.read_count \n ")
					.append(" from BOARD b, USERS u \n").append(" where b.user_seq = u.user_seq\n ")
					.append(" order by board_id desc\n ").append(" limit ? offset ?"); // offset은 처음으로부터 N 번째 출력

			pstmt = con.prepareStatement(sb.toString());
			pstmt.setInt(1, limit);
			pstmt.setInt(2, offset);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardDto boardDto = new BoardDto();
				boardDto.setBoardId(rs.getInt("board_id"));
				boardDto.setUserSeq(rs.getInt("user_seq"));
				boardDto.setUserName(rs.getString("user_name"));
				boardDto.setUserProfileImageUrl(rs.getString("user_profile_image_url"));
				boardDto.setTitle(rs.getString("title"));
				boardDto.setContent(rs.getString("content"));
				boardDto.setRegDt(rs.getTimestamp("reg_dt").toLocalDateTime()); // LocalDateTime
				boardDto.setReadCount(rs.getInt("read_count"));

				list.add(boardDto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.releaseConnection(rs, pstmt, con);
		}

		return list;
	}

	@Override
	public List<BoardDto> boardListSearchWord(int limit, int offset, String searchWord) {

		List<BoardDto> list = new ArrayList<>();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = DBManager.getConnection();
			StringBuilder sb = new StringBuilder();
			sb.append(
					" select b.board_id, b.user_seq, u.user_name, u.user_profile_image_url, b.title, b.content, b.reg_dt, b.read_count \n ")
					.append(" from BOARD b, USERS u \n").append(" where b.user_seq = u.user_seq\n ")
					.append(" and b.title like ? ") // 주의!!! LIKE에 ? 처리 => %?% X
					.append(" order by board_id desc\n ").append(" limit ? offset ?"); // offset은 처음으로부터 N 번째 출력

			pstmt = con.prepareStatement(sb.toString());
			pstmt.setString(1, "%" + searchWord + "%");

			pstmt.setInt(2, limit);
			pstmt.setInt(3, offset);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardDto boardDto = new BoardDto();
				boardDto.setBoardId(rs.getInt("board_id"));
				boardDto.setUserSeq(rs.getInt("user_seq"));
				boardDto.setUserName(rs.getString("user_name"));
				boardDto.setUserProfileImageUrl(rs.getString("user_profile_image_url"));
				boardDto.setTitle(rs.getString("title"));
				boardDto.setContent(rs.getString("content"));
				boardDto.setRegDt(rs.getTimestamp("reg_dt").toLocalDateTime()); // LocalDateTime
				boardDto.setReadCount(rs.getInt("read_count"));

				list.add(boardDto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.releaseConnection(rs, pstmt, con);
		}

		return list;
	}

	@Override
	public int boardListTotalCnt() {
		int totalCnt = -1;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = DBManager.getConnection();
			StringBuilder sb = new StringBuilder();
			sb.append(" select count(*) from BOARD ");
			pstmt = con.prepareStatement(sb.toString());

			rs = pstmt.executeQuery();
			while (rs.next()) {
				totalCnt = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.releaseConnection(rs, pstmt, con);
		}

		return totalCnt;
	}

	@Override
	public int boardListSearchWordTotalCnt(String searchWord) {
		int totalCnt = -1;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = DBManager.getConnection();
			StringBuilder sb = new StringBuilder();
			sb.append(" select count(*) from BOARD where title like ? ");
			pstmt = con.prepareStatement(sb.toString());

			pstmt.setString(1, "%" + searchWord + "%");

			rs = pstmt.executeQuery();
			while (rs.next()) {
				totalCnt = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.releaseConnection(rs, pstmt, con);
		}

		return totalCnt;
	}

	@Override
	public BoardDto boardDetail(int boardId) {
		BoardDto boardDto = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = DBManager.getConnection();
			StringBuilder sb = new StringBuilder();
			sb.append(
					" select b.board_id, b.user_seq, u.user_name, u.user_profile_image_url, b.title, b.content, b.reg_dt, b.read_count \n ")
					.append(" from BOARD b, USERS u \n").append(" where b.user_seq = u.user_seq\n ")
					.append(" and b.board_id = ? "); // key

			pstmt = con.prepareStatement(sb.toString());
			pstmt.setInt(1, boardId);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				boardDto = new BoardDto();
				boardDto.setBoardId(rs.getInt("board_id"));
				boardDto.setUserSeq(rs.getInt("user_seq"));
				boardDto.setUserName(rs.getString("user_name"));
				boardDto.setUserProfileImageUrl(rs.getString("user_profile_image_url"));
				boardDto.setTitle(rs.getString("title"));
				boardDto.setContent(rs.getString("content"));
				boardDto.setRegDt(rs.getTimestamp("reg_dt").toLocalDateTime()); // LocalDateTime
				boardDto.setReadCount(rs.getInt("read_count"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.releaseConnection(rs, pstmt, con);
		}

		return boardDto;
	}

	@Override
	public int boardDelete(int boardId) {
	
		BoardDto boardDto = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int ret = -1;
		
		try {
			con = DBManager.getConnection();
			StringBuilder sb = new StringBuilder();
			sb.append( " delete from board where board_id = ? " );
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setInt(1, boardId);
			
			ret = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.releaseConnection(rs, pstmt, con);
		}

		return ret;
	}
}