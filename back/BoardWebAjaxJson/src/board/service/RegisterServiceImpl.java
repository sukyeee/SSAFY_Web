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
		boolean alreadyUserExist = registerDao.register(userName, userEmail, userPassword);
	
		// 이미 존재하는  이메일 있으면 실패!
		System.out.println("userDto" + userDto);
		System.out.println("register" + alreadyUserExist);
		
		if( userDto == null || userDto != null && userDto.getUserEmail().equals(userEmail) ) { // 이미 있는 이메일이면 true
			return true;
		} else {
			return false;
		}
	}
	
	


}
