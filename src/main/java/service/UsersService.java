package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapper.UsersMapper;
import model.Users;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UsersService {
	@Autowired
	private UsersMapper mapper;
	public Users findByUsername(Users user) {
		Users users = mapper.selectByUsername(user);
		return users;

	}
	public Users findById(Users user) {
		Users users = mapper.selectById(user);
		return users;

	}
	@Transactional(isolation= Isolation.READ_COMMITTED,propagation= Propagation.REQUIRED)
	public void modifypassword(Users user){
		mapper.updatepassword(user);
	}
}
