package chzu.performance.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import chzu.performance.entity.User;
import chzu.performance.mapper.UserMapper;
import chzu.performance.service.UserService;
@Service("userService")
public class UserServiceImpl implements UserService{
	@Autowired
	private UserMapper userMapper;
	@Override
	public User querySingleUser(User u) throws Exception {
		return userMapper.querySingleUser(u);
	}
	@Override
	public User querySingleUserByName(String username) throws Exception {
		return this.querySingleUserByName(username);
	}
	@Override
	public List<User> findAll() {
		return this.userMapper.findAll();
	}


}
