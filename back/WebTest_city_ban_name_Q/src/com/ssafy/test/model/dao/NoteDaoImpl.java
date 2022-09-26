package com.ssafy.test.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ssafy.test.dto.Note;
import com.ssafy.test.util.DBUtil;

public class NoteDaoImpl implements NoteDao {

	private final DBUtil dbUtil = DBUtil.getInstance();
	private static NoteDaoImpl instance = new NoteDaoImpl();

	private NoteDaoImpl() {
	};

	public static NoteDaoImpl getInstance() {
		return instance;
	}

	@Override
	public Note doRegist(Note note) {

		String sql = "INSERT INTO `ssafytest`.`note` (`noteCode`, `model`, `price`, `company`) VALUES ( ?, ?, ?, ?); ";
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = dbUtil.getConnection();
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, note.getNoteCode());
			pstmt.setString(2, note.getModel());
			pstmt.setInt(3, note.getPrice());
			pstmt.setString(4, note.getCompany());

			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		finally {
			dbUtil.close(pstmt, con);
		}

		return note;

	}

	@Override
	public List<Note> doSelect() {
		
		List<Note> list = new ArrayList<>();
		
		String sql = "select * from note; ";
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dbUtil.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Note note = new Note();
				note.setNoteCode(rs.getString("noteCode"));
				note.setModel(rs.getString("model"));
				note.setPrice(rs.getInt("price"));
				note.setCompany(rs.getString("company"));
				
				list.add(note);
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		finally {
			dbUtil.close(pstmt, con);
		}
		
		return list;
	}

	@Override
	public int doDelete(String id) {
		String sql = "DELETE FROM `ssafytest`.`note` WHERE (`noteCode` = ?) ";
		Connection con = null;
		PreparedStatement pstmt = null;

		int ret = -1;
		try {
			con = dbUtil.getConnection();
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, id);
	

			ret = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		finally {
			dbUtil.close(pstmt, con);
		}

		return ret;
	}

	@Override
	public Note doDetail(String model) {

		Note note = null;
		
		String sql = "select * from note where model = ? ";
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dbUtil.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, model);
			if(rs.next()) {
				note.setNoteCode(rs.getString("noteCode"));
				note.setModel(rs.getString("model"));
				note.setPrice(rs.getInt("price"));
				note.setCompany(rs.getString("company"));
			}
		
			pstmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		finally {
			dbUtil.close(pstmt, con);
		}
		
		return note;
	}



}
