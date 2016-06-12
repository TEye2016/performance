package chzu.performance.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import chzu.performance.entity.Role;
import chzu.performance.mapper.RoleMapper;
import chzu.performance.service.RoleService;
@Service("roleService")
public class RoleServiceImpl implements RoleService{
	@Autowired
	private RoleMapper roleMapper;
	@Override
	public List<Role> findAll() {
		return this.roleMapper.findAll();
	}

}
