package mapper;

import model.Users;

public interface UsersMapper {

	public Users selectByUsername(Users user);

	public Users selectById(Users user);

	public void updatepassword(Users user);
}