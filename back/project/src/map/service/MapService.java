package map.service;

import java.util.List;

import map.dto.DealDto;
import map.dto.DongDto;
import map.dto.LocDto;

public interface MapService {

	List<DongDto> mapDongSelect(int gugunCode);
	List<DealDto> mapListSearch(int gugunCode, String dong, String searchWord);
	List<LocDto> mapLocList(int gugunCode, String dong, String searchWord);
}
