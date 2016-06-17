package chzu.performance.mapper;

import java.util.List;

import chzu.performance.entity.User;


public interface UserMapper {
	public User querySingleUser(User u );
	public User querySingleUserByName(String username);
	public int count(User u);
	public void save(User u);
	public List<User> findAll();
	public List<User> findAllByPage();
}