package board.dao;

import board.dto.UserDto;

public interface UserDao {
	int userRegister(UserDto userDto);
}
