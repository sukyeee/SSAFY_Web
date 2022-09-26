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
	public List<Note> selectAll() throws SQLException {

		List<Note> notelist = new ArrayList<>();
		
		String sql = "select * from note; ";
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dbUtil.getConnection();
			pstmt = con.prepareStatement(sql);
			rs  = pstmt.executeQuery();			
			while(rs.next()) {
				Note note = new Note();
				note.setNoteCode(rs.getString("noteCode"));
				note.setModel(rs.getString("model"));
				note.setPrice(rs.getInt("price"));
				note.setCompany(rs.getString("company"));
				
				notelist.add(note);
			}
		

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		finally {
			dbUtil.close(pstmt, con);
		}
		
		return notelist;
	}

	@Override
	public Note selectByNoteCode(String noteCode) throws SQLException {

		Note note = null;
		String sql = "select noteCode, model, price, company from note where noteCode = ? ";
		
		try(
				Connection con = dbUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				){
			
			pstmt.setString(1, noteCode);
			try(
					ResultSet rs = pstmt.executeQuery();
					){
				if(rs.next()) {
					note = new Note();
					note.setNoteCode(rs.getString("noteCode"));
					note.setModel(rs.getString("model"));
					note.setPrice(rs.getInt("price"));
					note.setCompany(rs.getString("company"));
					
				}
			}	
		} 
		
		
		return note;
	}

	@Override
	public int insert(Note note) throws SQLException {

		int ret = -1;
		
		String sql = " insert into note ( noteCode, model, price, company ) values ( ?, ?, ?, ? ); ";
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = dbUtil.getConnection();
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, note.getNoteCode());
			pstmt.setString(2, note.getModel());
			pstmt.setInt(3, note.getPrice());
			pstmt.setString(4, note.getCompany());

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
	public int delete(String noteCode) throws SQLException {
		int ret = -1;
	
		String sql = "DELETE FROM note WHERE noteCode= ? ";
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = dbUtil.getConnection();
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, noteCode);
	

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

	



}
