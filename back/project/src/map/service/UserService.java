package map.service;

import map.dto.UserDto;

public interface UserService {
	int userUpdate(UserDto dto);
	int userDelete(String userEmail);
}
