package chzu.performance.mapper;

import java.util.List;

import chzu.performance.entity.Resources;


public interface RoleMapper {
	public List<Resources> getResourcesByUserName(String userid);
}