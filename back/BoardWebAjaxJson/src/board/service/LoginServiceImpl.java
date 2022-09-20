package board.service;

import board.dao.LoginDao;
import board.dao.LoginDaoImpl;
import board.dto.UserDto;

// SingleTon
public class LoginServiceImpl implements LoginService{

	private static LoginServiceImpl instance = new LoginServiceImpl();
	private LoginServiceImpl() {}
	
	public static LoginServiceImpl getInstance() {
		return instance;
	}
	
	
	@Override
	public UserDto login(String userEmail, String userPassword) {

		LoginDao loginDao = LoginDaoImpl.getInstance(); // local
		UserDto userDto = loginDao.login(userEmail);
		
		if( userDto != null && userDto.getUserPassword().equals(userPassword)) {
			return userDto;
		} else {
			return null;
		}
	}

}
