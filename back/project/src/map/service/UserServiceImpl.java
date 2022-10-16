package map.service;

import map.dao.UserDao;
import map.dao.UserDaoImpl;
import map.dto.UserDto;

public class UserServiceImpl implements UserService {
	
	public static UserServiceImpl instance = new UserServiceImpl();
	private UserServiceImpl() {};
	public static UserServiceImpl getInstance() {
		return instance;
	}
	
	UserDao dao = UserDaoImpl.getInstance();
	@Override
	public int userUpdate(UserDto dto) {
		// TODO Auto-generated method stub
		return dao.userUpdate(dto);
	}

	@Override
	public int userDelete(String userEmail) {
		// TODO Auto-generated method stub
		return dao.userDelete(userEmail);
	}

}
