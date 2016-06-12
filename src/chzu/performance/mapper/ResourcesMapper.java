package chzu.performance.mapper;

import java.util.List;

import chzu.performance.entity.Resources;

public interface ResourcesMapper extends SqlMapper {
	public List<Resources> findAll();

	/**
	 * 根据用户Id获取该用户的权限
	 * 
	 * @param userId
	 *            用户Id
	 * @return
	 */
	public List<Resources> getUserResources(String userId);

	/**
	 * 根据角色Id获取该角色的权限
	 * 
	 * @param roleId
	 *            角色Id
	 * @return
	 */
	public List<Resources> getRoleResources(String roleId);

	/**
	 * 根据用户名获取该用户的权限
	 * 
	 * @param username
	 *            用户名
	 * @return
	 */
	public List<Resources> getResourcesByUserName(String username);
	/**
	 * 获取顶级菜单
	 */
	public List<Resources> getParentRsources();
	public void saveResources(Resources r);
}