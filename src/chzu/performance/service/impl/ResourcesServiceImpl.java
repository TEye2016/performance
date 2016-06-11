package chzu.performance.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import chzu.performance.entity.Resources;
import chzu.performance.mapper.ResourcesMapper;
import chzu.performance.service.ResourcesService;
@Service("resourcesService")
public class ResourcesServiceImpl implements ResourcesService {
	@Autowired
	private ResourcesMapper resourcesMapper;
	@Override
	public List<Resources> findAll() {
		return this.resourcesMapper.findAll();
	}

	@Override
	public List<Resources> getUserResources(String userId) {
		return this.resourcesMapper.getUserResources(userId);
	}

	@Override
	public List<Resources> getRoleResources(String roleId) {
		return this.resourcesMapper.getRoleResources(roleId);
	}

	@Override
	public List<Resources> getResourcesByUserName(String username) {
		return this.resourcesMapper.getResourcesByUserName(username);
	}

	@Override
	public List<Resources> getParentRsources() {
		return this.resourcesMapper.getParentRsources();
	}

	@Override
	public void saveResources(Resources r) {
		this.resourcesMapper.saveResources(r);
	}

}
