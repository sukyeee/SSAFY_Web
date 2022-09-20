package board.service;

import board.dao.LoginDao;
import board.dao.LoginDaoImpl;
import board.dao.RegisterDao;
import board.dao.RegisterDaoImpl;
import board.dto.UserDto;

// SingleTon
public class RegisterServiceImpl implements RegisterService{

	private static RegisterServiceImpl instance = new RegisterServiceImpl();
	private RegisterServiceImpl() {}
	
	public static RegisterServiceImpl getInstance() {
		return instance;
	}

	@Override
	public boolean register(String userName, String userEmail, String userPassword) {
	
		LoginDao loginDao = LoginDaoImpl.getInstance();
		UserDto userDto = loginDao.login(userEmail);
		
		RegisterDao registerDao = RegisterDaoImpl.getInstance();
		boolean ret = registerDao.register(userName, userEmail, userPassword);
		// ret이 true이면 Insert 성공
		
		// 이미 존재하는  이메일 있으면 실패!
		if( userDto != null && userDto.getUserEmail().equals(userEmail) ) { // 이미 있는 이메일이면 true
			// 이미 이메일 존재함, 실패
			return true; 
		} else {
			// 성공
			return false;
		}
	}
	

}
