package map.service;

import java.util.List;

import map.dao.CodeDao;
import map.dao.CodeDaoImpl;
import map.dto.CodeDto;

public class CodeServiceImpl implements CodeService{
	
	private static CodeServiceImpl instance = new CodeServiceImpl();
	private CodeServiceImpl() {}
	public static CodeServiceImpl getInstance() {
		return instance;
	}
	
	CodeDao dao = CodeDaoImpl.getInstance();
	
	@Override
	public List<CodeDto> getCodeList(String code) {
		return dao.getCodeList(code);
	}

}
