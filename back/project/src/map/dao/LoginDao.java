package map.dao;

import map.dto.UserDto;

public interface LoginDao {
	UserDto login(String userEmail);
}
