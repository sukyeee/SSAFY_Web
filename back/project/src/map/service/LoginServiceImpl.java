package map.service;

import map.dao.LoginDao;
import map.dao.LoginDaoImpl;
import map.dto.UserDto;

public class LoginServiceImpl implements LoginService {

	private static LoginServiceImpl instance = new LoginServiceImpl();
	private LoginServiceImpl() {}
	public static LoginServiceImpl getInstance() {
		return instance;
	}
	
	@Override
	public UserDto login(String userEmail, String userPassword) {
		
		LoginDao loginDao = LoginDaoImpl.getInstance();
		UserDto userDto = loginDao.login(userEmail);
		
		if (userDto != null && userDto.getUserPassword().equals(userPassword)) {
			return userDto;
		} else {
			return null;			
		}
	}

}
