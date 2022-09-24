package home.service;

import java.util.List;

import home.dao.HouseDao;
import home.dao.HouseDaoImpl;
import home.dto.DongDto;
import home.dto.GugunDto;
import home.dto.HouseDto;
import home.dto.SidoDto;

public class HouseServiceImpl implements HouseService {
	
	private static HouseServiceImpl instance = new HouseServiceImpl();
	
	private HouseServiceImpl() {};
	
	public static HouseServiceImpl getInstance() {
		return instance;
	}

	
	HouseDao sidoDao = HouseDaoImpl.getInstance();
	HouseDao gugunDao = HouseDaoImpl.getInstance();
	HouseDao dongDao = HouseDaoImpl.getInstance();
	HouseDao houseDao = HouseDaoImpl.getInstance();
	
	
	public List<SidoDto> getSido() {
		return sidoDao.getSido();
	}

	@Override
	public List<GugunDto> getGugun(String sido_code) {
		return gugunDao.getGugun(sido_code);
	}

	@Override
	public List<DongDto> getDong(String gugun_code) {
		return dongDao.getDong(gugun_code);
	}

	@Override
	public List<HouseDto> getSearchByDong(String dong_name) {
		return houseDao.getSearchByDong(dong_name);
	}

	@Override
	public List<HouseDto> getSearchByApt(String apt_name) {
		return houseDao.getSearchByApt(apt_name);
	}

}