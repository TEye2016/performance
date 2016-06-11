package chzu.performance.mapper;

import chzu.performance.entity.User;


public interface UserMapper {
	public User querySingleUser(User u );
	public User querySingleUserByName(String username);
	public int count(User u);
	public void save(User u);
}