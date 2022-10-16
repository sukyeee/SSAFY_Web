package map.dao;

import java.util.List;

import map.dto.CodeDto;

public interface CodeDao {
	List<CodeDto> getCodeList(String code);

}
