package map.service;

import java.util.List;

import map.dto.CodeDto;

public interface CodeService {
	List<CodeDto> getCodeList(String code);
}
