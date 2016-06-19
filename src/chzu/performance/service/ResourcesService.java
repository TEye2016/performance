package chzu.performance.service;

import java.util.List;

import chzu.performance.entity.Resources;
import chzu.performance.util.HandlerResult;
/**
 * 资源操作相关
 * @author tomcat
 *
 */
public interface ResourcesService {
	public HandlerResult findAllByPage();
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
	/**
	 * 保存资源
	 * @param r
	 */
	public void saveResources(Resources r);
	public void deleteByIds(String ids)throws Exception;
	public Resources getResourcesById(Integer id);
}
