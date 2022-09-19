package board.dao;

import board.dto.UserDto;

public interface RegisterDao {
	public UserDto login(String userEmail);
}
