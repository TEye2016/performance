package chzu.performance.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import chzu.performance.entity.Resources;
import chzu.performance.service.ResourcesService;

/**
 * 资源管理相关的控制器
 * 
 * @author tomcat
 * 
 */
@Controller
@RequestMapping("/resources")
public class ResourcesController {
	@Autowired
	private ResourcesService resourcesService;

	@RequestMapping("/add")
	public ModelAndView add() {
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.setViewName("resources/addresc");
		return modelAndView;
	}

	@RequestMapping("/save")
	public String save(Resources r, HttpServletRequest request) {
		this.resourcesService.saveResources(r);
		request.setAttribute("message", "添加成功！");
		return "resources/addresc";
	}

	@RequestMapping("/findAll")
	public @ResponseBody List<Resources> findAll() {
//		Map<String, Object> map = new HashMap<String, Object>();
//		String pagec = request.getParameter("page");
//		String pageSize = request.getParameter("pageSize");
//		String totalPages = request.getParameter("totalPages");
//		String totalRows = request.getParameter("totalRows");
//		PageContext page = new PageHelper(pagec, pageSize, totalPages,
//				totalRows).getPage();
//		HandlerResult rs = resourcesService.findAllByPage();
		List<Resources> data = this.resourcesService.findAll();
		return data;
	}

	@RequestMapping("/delete")
	public String delete(String ids) throws Exception {
		this.resourcesService.deleteByIds(ids);
		return "redirect:findAll.action";
	}
	@RequestMapping("/toFindAll")
	public String toFindAll(){
		return "resources/list";
	}
	@RequestMapping("/edit")
	public ModelAndView edit(Integer id){
		ModelAndView modelAndView = new ModelAndView("resources/edit");
		Resources resources = this.resourcesService.getResourcesById(id);
		modelAndView.addObject("r", resources);
		return modelAndView;
	}
	@RequestMapping("/findParent")
	@ResponseBody
	public List<Resources> findParent(){
		List<Resources> parent = this.resourcesService.getParentRsources();
		return parent;
	}
}
