package home.dao;

import java.util.List;

import home.dto.HouseDto;

public interface HouseDao {
	public List<HouseDto> findHouses(String dong, String aptName);
}