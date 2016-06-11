package chzu.performance.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import chzu.performance.entity.Resources;
import chzu.performance.service.ResourcesService;

/**
 * 资源管理相关的控制器
 * @author tomcat
 *
 */
@Controller
@RequestMapping("/resources")
public class ResourcesController {
	@Autowired
	private ResourcesService resourcesService;
	@RequestMapping("/add")
	public ModelAndView add(){
		ModelAndView modelAndView = new ModelAndView();
		List<Resources> parent = this.resourcesService.getParentRsources();
		modelAndView.addObject("parent", parent);
		modelAndView.setViewName("resources/addresc");
		return modelAndView;
	}
	@RequestMapping("/save")
	public String save(Resources r){
		this.resourcesService.saveResources(r);
		return "redirect:/resources/findAll.action";
	}
	@RequestMapping("/findAll")
	public ModelAndView findAll(){
		ModelAndView m = new ModelAndView("resources/list");
		List<Resources> resources = this.resourcesService.findAll();
		m.addObject("resources", resources);
		return m;
	}
	
}
