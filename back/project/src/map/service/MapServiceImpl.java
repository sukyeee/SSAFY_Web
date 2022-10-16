package map.service;

import java.util.List;

import map.dao.MapDao;
import map.dao.MapDaoImpl;
import map.dto.DealDto;
import map.dto.DongDto;
import map.dto.LocDto;

public class MapServiceImpl implements MapService{
	
	private static MapServiceImpl instance = new MapServiceImpl();
	
	private MapServiceImpl() {}

	public static MapService getInstance() {
		return instance;
	}

	MapDao dao = MapDaoImpl.getInstance();
	
	@Override
	public List<DongDto> mapDongSelect(int gugunCode) {
		return dao.mapDongSelect(gugunCode);
	}

	@Override
	public List<DealDto> mapListSearch(int gugunCode, String dong, String searchWord) {
		return dao.mapListSearch(gugunCode, dong, searchWord);
	}


	@Override
	public List<LocDto> mapLocList(int gugunCode, String dong, String searchWord) {
		return dao.mapLocList(gugunCode, dong, searchWord);
	}
	
	

}
