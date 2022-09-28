package home.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import home.common.DBManager;
import home.dto.DongDto;
import home.dto.GugunDto;
import home.dto.HouseDto;
import home.dto.SidoDto;

public class HouseDaoImpl implements HouseDao {
	
	private static HouseDaoImpl instance = new HouseDaoImpl();
	
	private HouseDaoImpl() {}
	
	public static HouseDaoImpl getInstance() {
		return instance;
	}

	@Override
	public List<SidoDto> getSido() {
		
	List<SidoDto> list = new ArrayList<>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			// Connection 객체 획득
			con = DBManager.getConnection();
			StringBuilder sb = new StringBuilder();
			sb.append(" SELECT * from sido_code ");
			pstmt = con.prepareStatement(sb.toString());
			System.out.println(sb.toString());
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				SidoDto sidoDto = new SidoDto();
			
				sidoDto.setCode(rs.getString("code"));
				sidoDto.setName(rs.getString("name"));
			
				list.add(sidoDto);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			// Connection 객체 반납
			DBManager.releaseConnection(rs, pstmt, con);
		}
		
		return list;
	}

	@Override
	public List<GugunDto> getGugun(String sido_code) {
	List<GugunDto> list = new ArrayList<>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			// Connection 객체 획득
			con = DBManager.getConnection();
			StringBuilder sb = new StringBuilder();
			sb.append(" SELECT * from gugun_code where sido_code = ?");
			pstmt = con.prepareStatement(sb.toString());
			System.out.println(sb.toString());
			pstmt.setString(1, sido_code);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				GugunDto gugunDto = new GugunDto();
			
				gugunDto.setCode(rs.getString("code"));
				gugunDto.setName(rs.getString("name"));
				gugunDto.setSido_code(sido_code);
				list.add(gugunDto);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			// Connection 객체 반납
			DBManager.releaseConnection(rs, pstmt, con);
		}
		
		return list;
		
	}

	@Override
	public List<DongDto> getDong(String gugun_code) {
	
	List<DongDto> list = new ArrayList<>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			// Connection 객체 획득
			con = DBManager.getConnection();
			StringBuilder sb = new StringBuilder();
			sb.append(" SELECT * from dong_code where gugun_code = ?");
			pstmt = con.prepareStatement(sb.toString());
			System.out.println(sb.toString());
			pstmt.setString(1, gugun_code);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				DongDto dongDto = new DongDto();
			
				dongDto.setCode(rs.getString("code"));
				dongDto.setName(rs.getString("name"));
				dongDto.setCity_code(rs.getString("city_code"));
				dongDto.setCity_name(rs.getString("city_name"));
				dongDto.setGugun_code(gugun_code);
				dongDto.setGugun_name(rs.getString("gugun_name"));
				
				
				list.add(dongDto);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			// Connection 객체 반납
			DBManager.releaseConnection(rs, pstmt, con);
		}
		
		return list;
		
		
	}

	@Override
	public List<HouseDto> getSearchByDong(String dong_name) {
		List<HouseDto> list = new ArrayList<>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			// Connection 객체 획득
			con = DBManager.getConnection();
			StringBuilder sb = new StringBuilder();
		
			sb.append(" select hd.no, hd.dong, hd.code, hd.AptName, hd.dealAmount, hd.dealYear, hd.dealMonth, hd.dealDay, hd.area, hi.lat, hi.lng  \n" );
			sb.append(" from housedeal hd join houseinfo hi  \n");
			sb.append(" where hd.AptName = hi.AptName  \n");
			sb.append(" and hd.dong = ?; ");
			
			
			pstmt = con.prepareStatement(sb.toString());
			System.out.println(sb.toString());
			pstmt.setString(1, dong_name);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				HouseDto houseDto = new HouseDto();
	
				houseDto.setDong(rs.getString("dong"));
				houseDto.setCode(rs.getString("code"));
				houseDto.setAptName(rs.getString("aptName"));
				houseDto.setDealAmount(rs.getString("dealAmount"));
				houseDto.setDealYear(rs.getString("dealYear"));
				houseDto.setDealMonth(rs.getString("dealMonth"));
				houseDto.setDealDay(rs.getString("dealDay"));
				houseDto.setArea(rs.getString("area"));
				houseDto.setLat(rs.getString("lat"));
				houseDto.setLng(rs.getString("lng"));
				
				list.add(houseDto);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			// Connection 객체 반납
			DBManager.releaseConnection(rs, pstmt, con);
		}
		
		return list;
		
	}

	@Override
	public List<HouseDto> getSearchByApt(String apt_name) {
		List<HouseDto> list = new ArrayList<>();
		
		System.out.println("아파트이름은???" + apt_name);
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			// Connection 객체 획득
			con = DBManager.getConnection();
			StringBuilder sb = new StringBuilder();
		
			sb.append(" select hd.no, hd.dong, hd.code, hd.AptName, hd.dealAmount, hd.dealYear, hd.dealMonth, hd.dealDay, hd.area, hi.lat, hi.lng  \n" );
			sb.append(" from housedeal hd join houseinfo hi  \n");
			sb.append(" where hd.AptName = hi.AptName  \n");
			sb.append(" and hd.AptName like ?; ");
			
			
			pstmt = con.prepareStatement(sb.toString());
			System.out.println(sb.toString());
			pstmt.setString(1, "%" + apt_name + "%");

			rs = pstmt.executeQuery();
			while (rs.next()) {
				HouseDto houseDto = new HouseDto();
	
				houseDto.setDong(rs.getString("dong"));
				houseDto.setCode(rs.getString("code"));
				houseDto.setAptName(rs.getString("aptName"));
				houseDto.setDealAmount(rs.getString("dealAmount"));
				houseDto.setDealYear(rs.getString("dealYear"));
				houseDto.setDealMonth(rs.getString("dealMonth"));
				houseDto.setDealDay(rs.getString("dealDay"));
				houseDto.setArea(rs.getString("area"));
				houseDto.setLat(rs.getString("lat"));
				houseDto.setLng(rs.getString("lng"));
				
				list.add(houseDto);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			// Connection 객체 반납
			DBManager.releaseConnection(rs, pstmt, con);
		}
		
		return list;
	}


}