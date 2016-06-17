package chzu.performance.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import chzu.performance.entity.Role;
import chzu.performance.entity.exp.ResourcesRole;
import chzu.performance.mapper.RoleMapper;
import chzu.performance.service.RoleService;
import chzu.performance.util.HandlerResult;
import chzu.performance.util.ValidateUtil;
@Service("roleService")
public class RoleServiceImpl implements RoleService{
	@Autowired
	private RoleMapper roleMapper;
	@Override
	public List<Role> findAll() {
		return this.roleMapper.findAll();
	}
	@Override
	public HandlerResult findAllByPage() {
		HandlerResult handlerResult = new HandlerResult();
		handlerResult.setResultObj(this.roleMapper.findAllByPage());
		return handlerResult;
	}
	/**
	 * rs中只包含rescid，即资源id
	 * 保存role的同时维护角色和资源之间的关联关系
	 */
	public void saveRole(Role role, String rs) {
		this.roleMapper.saveRole(role);
		int roleid = role.getId();
		if(ValidateUtil.isValidate(rs)){
			String[] rescid = rs.split(",");
			for (String string : rescid) {
				Integer id = Integer.valueOf(string);
				ResourcesRole res = new ResourcesRole();
				res.setRescid(id);
				res.setRoleid(roleid);
				this.roleMapper.saveRoleResources(res);
			}
			}
		}

}
