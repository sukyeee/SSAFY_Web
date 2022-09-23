package home.service;

import java.util.List;

import home.dao.HouseDao;
import home.dao.HouseDaoImpl;
import home.dto.HouseDto;

public class HouseServiceImpl implements HouseService {
	
	private static HouseServiceImpl instance = new HouseServiceImpl();
	
	private HouseServiceImpl() {};
	
	public static HouseServiceImpl getInstance() {
		return instance;
	}

	public List<HouseDto> findHouse(String dong, String aptName) {
		HouseDao houseDao = HouseDaoImpl.getInstance();
		List<HouseDto> houseList = houseDao.findHouses(dong, aptName);
		
		if (houseList != null) {
			return houseList;
		} else {
			return null;			
		}
	}

}