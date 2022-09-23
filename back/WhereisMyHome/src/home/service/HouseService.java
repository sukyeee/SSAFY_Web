package home.service;

import java.util.List;

import home.dto.HouseDto;

public interface HouseService {
	public List<HouseDto> findHouse(String dong, String aptName);
}