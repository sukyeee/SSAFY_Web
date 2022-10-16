package map.service;

import map.dao.RegistDao;
import map.dao.RegistDaoImpl;
import map.dto.UserDto;

public class RegistServiceImpl implements RegistService{
	
	private static RegistServiceImpl instance = new RegistServiceImpl();
	
	private RegistServiceImpl() {}
	
	public static RegistServiceImpl getInstance() {
		return instance;
	}
	
	RegistDao registDao = RegistDaoImpl.getInstance();
	
	public int userRegister(UserDto userDto) {
		// TODO Auto-generated method stub
		return registDao.userRegister(userDto);
	}
}
