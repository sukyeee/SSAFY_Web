package board.service;

import board.dao.LoginDao;
import board.dao.LoginDaoImpl;
import board.dto.UserDto;

// SingleTon
public class RegisterServiceImpl implements LoginService{

	private static RegisterServiceImpl instance = new RegisterServiceImpl();
	private RegisterServiceImpl() {}
	
	public static RegisterServiceImpl getInstance() {
		return instance;
	}
	
	
	@Override
	public UserDto login(String userEmail, String userPassword) {

		LoginDao loginDao = LoginDaoImpl.getInstance();
		UserDto userDto = loginDao.login(userEmail);
		
		if( userDto != null && userDto.getUserPassword().equals(userPassword)) {
			return userDto;
		} else {
			return null;
		}
	}

}
