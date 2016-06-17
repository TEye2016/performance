package chzu.performance.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import chzu.performance.entity.User;
import chzu.performance.entity.exp.RoleUser;
import chzu.performance.mapper.UserMapper;
import chzu.performance.service.UserService;
import chzu.performance.util.ValidateUtil;
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
	@Override
	public void saveUser(User u, String rids) {
		 this.userMapper.save(u);
		 Integer userid =u.getUserid();
		 if (ValidateUtil.isValidate(rids)) {
			String[] ids = rids.split(",");
			for (String string : ids) {
				Integer roleid = Integer.valueOf(string);
				RoleUser roleUser = new RoleUser();
				roleUser.setRoleid(roleid);
				roleUser.setUserid(userid);
				this.userMapper.saveUserRole(roleUser);
			}
		}
	}


}
