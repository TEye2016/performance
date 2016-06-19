package chzu.performance.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import chzu.performance.entity.Resources;
import chzu.performance.entity.Role;
import chzu.performance.entity.exp.ResourcesRole;
import chzu.performance.service.ResourcesService;
import chzu.performance.service.RoleService;
import chzu.performance.util.HandlerResult;
import chzu.performance.util.PageContext;
import chzu.performance.util.PageHelper;

@Controller
@RequestMapping("/role")
public class RoleController {
	@Autowired
	private RoleService roleService;
	@Autowired ResourcesService resourcesService;
	@RequestMapping("/add")
	public ModelAndView add() {
		ModelAndView m = new ModelAndView("role/add");
		List<Resources> resources = resourcesService.findAll();
		m.addObject("resources",resources);
		return m;
	}
	@RequestMapping("/toFindAll")
	public String toFindAll(){
		return "role/list";
	}
	/**
	 * 
	 * @param page 当前页
	 * @param pageSize 每页显示数
	 * @param totalPages 共多少页
	 * @param totalRows 共多少条数据
	 * @return
	 */
	@RequestMapping("/findAll")
	@ResponseBody
	public List<Role> findAll(){
		List<Role> roles = this.roleService.findAll();
		return roles;
	}
	@RequestMapping("/save")
	@ResponseBody
	public String save(Role role,String rescid){
		this.roleService.saveRole(role, rescid);
		return "sucess";
	}

}
