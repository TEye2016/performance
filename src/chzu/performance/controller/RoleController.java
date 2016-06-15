package chzu.performance.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import chzu.performance.entity.Resources;
import chzu.performance.entity.Role;
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
	@RequestMapping("/tofindAll")
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
	public Map<String, Object> findAll(String page,String pageSize,String totalPages,String totalRows ){
		Map<String, Object> map = new HashMap<String, Object>();
		PageHelper pageHelper = new PageHelper(page, pageSize, totalPages, totalRows);
		map.put("page", pageHelper.getPage());
		HandlerResult handlerResult = this.roleService.findAllByPage();
		map.put("role", handlerResult.getResultObj());
		return map;
	}

}
