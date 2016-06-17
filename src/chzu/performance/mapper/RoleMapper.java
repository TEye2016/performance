package chzu.performance.mapper;

import java.util.List;

import chzu.performance.entity.Resources;
import chzu.performance.entity.Role;
import chzu.performance.entity.exp.ResourcesRole;
import chzu.performance.entity.exp.RoleExp;


public interface RoleMapper {
	public List<Role> findAll();
	public List<Role> findAllByPage();
	public int saveRole(Role roleExp);
	public void saveRoleResources(ResourcesRole r);
}