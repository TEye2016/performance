package chzu.performance.service;

import java.util.List;

import chzu.performance.entity.Role;
import chzu.performance.entity.exp.ResourcesRole;
import chzu.performance.util.HandlerResult;

public interface RoleService {
	public List<Role> findAll();
	public HandlerResult findAllByPage();
	public void saveRole(Role role,String rs);
}
