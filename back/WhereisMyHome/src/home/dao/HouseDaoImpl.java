package home.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import home.common.DBManager;
import home.dto.HouseDto;
import home.dto.UserDto;

public class HouseDaoImpl implements HouseDao {
	
	private static HouseDaoImpl instance = new HouseDaoImpl();
	
	private HouseDaoImpl() {}
	
	public static HouseDaoImpl getInstance() {
		return instance;
	}

	@Override
	public List<HouseDto> findHouses(String dong, String aptName) {
		List<HouseDto> houseList = new ArrayList<>();
		HouseDto houseDto = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = DBManager.getConnection();
			StringBuilder sb = new StringBuilder();
			
			if (!dong.equals("") && !aptName.equals("")) {
				sb.append(" SELECT hi.dong, hi.AptName, hi.lat, hi.lng, hd.dealAmount, hd.area \n ")
				.append(" FROM houseinfo hi, housedeal hd \n" )
				.append(" WHERE hi.AptName = hd.AptName \n ")
				.append(" AND hi.dong = ? AND hi.AptName like ? \n ");
				
				pstmt = con.prepareStatement(sb.toString());
				pstmt.setString(1, dong);
				pstmt.setString(2, "%" + aptName + "%");
			} else if (!dong.equals("") && aptName.equals("")) {
				sb.append(" SELECT hi.dong, hi.AptName, hi.lat, hi.lng, hd.dealAmount, hd.area \n ")
				.append(" FROM houseinfo hi, housedeal hd \n" )
				.append(" WHERE hi.AptName = hd.AptName \n ")
				.append(" AND hi.dong = ? \n ");
				
				pstmt = con.prepareStatement(sb.toString());
				pstmt.setString(1, dong);
			} else if (dong.equals("") && !aptName.equals("")) {
				sb.append(" SELECT hi.dong, hi.AptName, hi.lat, hi.lng, hd.dealAmount, hd.area \n ")
				.append(" FROM houseinfo hi, housedeal hd \n" )
				.append(" WHERE hi.AptName = hd.AptName \n ")
				.append(" AND hi.aptName like ? \n ");
				
				pstmt = con.prepareStatement(sb.toString());
				pstmt.setString(1, "%" + aptName + "%");
			}
						
			System.out.println(sb.toString());
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				houseDto = new HouseDto();
				houseDto.setDong(rs.getString("hi.dong"));
				houseDto.setAptName(rs.getString("hi.AptName"));
				houseDto.setLat(rs.getDouble("hi.lat"));
				houseDto.setLng(rs.getDouble("hi.lng"));
				houseDto.setDealAmount(rs.getString("hd.dealAmount"));
				houseDto.setArea(rs.getString("hd.area"));
				
				houseList.add(houseDto);
			}
			
			System.out.println(houseList.size());
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			// Connection 객체 반납
			DBManager.releaseConnection(rs, pstmt, con);
		}
		
		return houseList;
	}

}