package home.service;

import java.util.List;

import home.dto.DongDto;
import home.dto.GugunDto;
import home.dto.HouseDto;
import home.dto.SidoDto;

public interface HouseService {
	public List<SidoDto> getSido();

	public List<GugunDto> getGugun(String sido_code);

	public List<DongDto> getDong(String gugun_code);

	public List<HouseDto> getSearchByDong(String dong_name);

	public List<HouseDto> getSearchByApt(String apt_name);
}