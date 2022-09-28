package home.service;

import java.util.List;

import home.dao.CodeDaoImpl;
import home.dto.CodeDto;

public class CodeServiceImpl implements CodeService {
	
	private static CodeServiceImpl instance = new CodeServiceImpl();
	
	private CodeServiceImpl() {};
	
	public static CodeServiceImpl getInstance() {
		return instance;
	}

	
	
	CodeDaoImpl codeDaoImpl = CodeDaoImpl.getInstance();
	
	@Override
	public List<CodeDto> getCodeList() {
		return codeDaoImpl.getCodeList();
	}



}