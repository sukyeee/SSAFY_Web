package map.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import map.common.DBManager;
import map.dto.DealDto;
import map.dto.DongDto;
import map.dto.LocDto;

public class MapDaoImpl implements MapDao {

	private static MapDaoImpl instance = new MapDaoImpl();
	
	private MapDaoImpl() {}
	
	public static MapDaoImpl getInstance() {
		return instance;
	}

	@Override
	public List<DongDto> mapDongSelect(int gugunCode) {
		List<DongDto> dongList = new ArrayList<>();
		
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			StringBuilder sb = new StringBuilder();
			
			sb.append(" select code, name ")
			.append(" from dong_code ")
			.append(" where gugun_code = ? ");
			
		pstmt = conn.prepareStatement(sb.toString());
		pstmt.setInt(1, gugunCode);
		
		rs = pstmt.executeQuery();	// select한 row resultset에 저장
		
		while(rs.next()) {

			DongDto dto = new DongDto();
			dto.setCode(rs.getString("code"));
			dto.setName(rs.getString("name"));
			dongList.add(dto);
		}
			
		} catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.releaseConnection(rs, pstmt, conn);
		}
		
		return dongList;
	}

	@Override
	public List<DealDto> mapListSearch(int gugunCode, String dong, String searchWord) {
		List<DealDto> list = new ArrayList<>();
		
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			StringBuilder sb = new StringBuilder();
			
			sb.append(" select d.no, d.dong, d.AptName, gu.name, d.code, d.dealAmount, d.buildYear, d.dealYear, d.dealMonth, d.dealDay, d.area, d.floor, d.jibun, d.house_no ")
			.append(" from ( ")
			.append(" select * ")
			.append(" from  housedeal ")
			.append(" where code = ? ");
			
			if(!"".equals(dong)) sb.append(" and dong = ? ");
			if(!"".equals(searchWord))sb.append(" and AptName like ? ");
				
			sb.append(" ) d ")
			.append(" left join gugun_code gu ")
			.append(" using(code) ");
			
	
		pstmt = conn.prepareStatement(sb.toString());
		pstmt.setInt(1, gugunCode);
		
		int i = 2;
		if(!"".equals(dong))	pstmt.setString(i++, dong);
		if(!"".equals(searchWord)) pstmt.setString(i, "%" + searchWord + "%");
		
		rs = pstmt.executeQuery();	// select한 row resultset에 저장
		
		while(rs.next()) {
			DealDto dealDto = new DealDto();
			dealDto.setNo(rs.getInt("d.no"));
			dealDto.setDong(rs.getString("d.dong"));
			dealDto.setAptName(rs.getString("d.AptName"));
			dealDto.setGugun(rs.getString("gu.name"));
			dealDto.setGugun_code(rs.getInt("d.code"));
			dealDto.setDealAmount(rs.getString("d.dealAmount"));
			dealDto.setBuildYear(rs.getInt("d.buildYear"));
			dealDto.setDealYear(rs.getInt("d.dealYear"));
			dealDto.setDealMonth(rs.getInt("d.dealMonth"));
			dealDto.setDealDay(rs.getInt("d.dealDay"));
			dealDto.setArea(rs.getString("d.area"));
			dealDto.setFloor(rs.getInt("d.floor"));
			dealDto.setJibun(rs.getString("d.jibun"));
			dealDto.setHouse_no(rs.getInt("d.house_no"));
			
			list.add(dealDto);
		}
			
		} catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.releaseConnection(rs, pstmt, conn);
		}
			
		return list;
	}


	@Override
	public List<LocDto> mapLocList(int gugunCode, String dong, String searchWord) {
		List<LocDto> list = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			StringBuilder sb = new StringBuilder();
			
			
			sb.append(" select * ")
			.append(" from houseinfo ")
			.append(" where code = ? ");
			
			if(!"".equals(dong)) sb.append(" and dong = ? ");
			if(!"".equals(searchWord))sb.append(" and AptName like ? ");
				
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, gugunCode);
			
			int i = 2;
			
			if(!"".equals(dong))	pstmt.setString(i++, dong);
			if(!"".equals(searchWord)) pstmt.setString(i, "%" + searchWord + "%");
			
			rs = pstmt.executeQuery();	// select한 row resultset에 저장
			
			while(rs.next()) {
				LocDto locDto = new LocDto();
				locDto.setNo(rs.getInt("no"));
				locDto.setDong(rs.getString("dong"));
				locDto.setAptName(rs.getString("AptName"));
				locDto.setCode(rs.getInt("code"));
				locDto.setLat(rs.getDouble("lat"));
				locDto.setLng(rs.getDouble("lng"));
				
				list.add(locDto);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.releaseConnection(rs, pstmt, conn);
		}
		
		
		return list;
	}
	
	
}
