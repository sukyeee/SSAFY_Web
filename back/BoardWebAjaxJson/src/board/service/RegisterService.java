package board.service;

import board.dto.UserDto;

public interface RegisterService {
	public UserDto login(String userEmail, String userPassword);
	
	
	
}
