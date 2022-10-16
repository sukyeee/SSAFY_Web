package map.service;

import map.dto.UserDto;

public interface LoginService {

	UserDto login(String userEmail, String userPassword);
}
