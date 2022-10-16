package map.dao;

import map.dto.UserDto;

public interface UserDao {
	
	int userUpdate(UserDto dto);
	int userDelete(String userEmail);
}
