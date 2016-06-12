package chzu.performance.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import chzu.performance.entity.Resources;
import chzu.performance.entity.Role;
import chzu.performance.service.ResourcesService;
import chzu.performance.service.RoleService;
import chzu.performance.util.HandlerResult;

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
	@RequestMapping("/findAll")
	public ModelAndView findAll(){
		List<Role> roles = this.roleService.findAll();
		ModelAndView modelAndView = new ModelAndView("role/list");
		modelAndView.addObject("roles", roles);
		return modelAndView;
	}

}
