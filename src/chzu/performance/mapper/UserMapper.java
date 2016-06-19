package chzu.performance.mapper;

import java.util.List;

import chzu.performance.entity.User;
import chzu.performance.entity.exp.RoleUser;


public interface UserMapper {
	public User querySingleUser(User u );
	public User querySingleUserByName(String username);
	public int count(User u);
	public Integer save(User u);
	public void saveUserRole(RoleUser roleUser);
	public List<User> findAll();
	public List<User> findAllByPage();
	public void deleteUserByIds(List<Integer> ids);
}