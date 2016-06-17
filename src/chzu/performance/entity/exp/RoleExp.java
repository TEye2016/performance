package chzu.performance.entity.exp;

import java.util.List;

import chzu.performance.entity.Resources;
import chzu.performance.entity.Role;

/**
 * 角色类的扩展
 * 
 * @author ruihui.li
 * 
 */
public class RoleExp extends Role {
	// resources的主键
	private List<Integer> resids;
	private List<Resources> resources;

	public List<Integer> getResids() {
		return resids;
	}

	public void setResids(List<Integer> resids) {
		this.resids = resids;
	}

	public List<Resources> getResources() {
		return resources;
	}

	public void setResources(List<Resources> resources) {
		this.resources = resources;
	}

}
