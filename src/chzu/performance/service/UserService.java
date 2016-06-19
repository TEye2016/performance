package chzu.performance.service;

import java.util.List;

import chzu.performance.entity.User;

public interface UserService {
	public User querySingleUser(User u )throws Exception;
	public User querySingleUserByName(String username)throws Exception;
	public List<User> findAll();
	public void saveUser(User u,String rids);
	public void deleteUserByIds(String ids);
}
