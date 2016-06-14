package chzu.performance.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import chzu.performance.entity.Resources;
import chzu.performance.service.ResourcesService;
import chzu.performance.util.HandlerResult;
import chzu.performance.util.PageContext;

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
		List<Resources> parent = this.resourcesService.getParentRsources();
		modelAndView.addObject("parent", parent);
		modelAndView.setViewName("resources/addresc");
		return modelAndView;
	}

	@RequestMapping("/save")
	public String save(Resources r,HttpServletRequest request) {
		this.resourcesService.saveResources(r);
		request.setAttribute("message", "添加成功！");
		return "resources/addresc";
	}

	@RequestMapping("/findAll")
	public ModelAndView findAll(HttpServletRequest request,
			HttpServletResponse response) {

		// 可以将分页参数获取封装，已达到更好的复用效果。
		// page=2&pageSize=10&totalPages=19&totalRows=188
		String pagec = request.getParameter("page");
		String pageSize = request.getParameter("pageSize");
		String totalPages = request.getParameter("totalPages");
		String totalRows = request.getParameter("totalRows");
		// 方法2：不用进行map传参，用ThreadLocal进行传参,方便没有侵入性
		PageContext page = PageContext.getContext();

		// 请自行验证
		if (null == pagec) {
			page.setCurrentPage(1);
			page.setPageSize(10);
		} else {
			page.setCurrentPage(Integer.parseInt(pagec));
			page.setPageSize(Integer.parseInt(pageSize));
			page.setTotalPages(Integer.parseInt(totalPages));
			page.setTotalRows(Integer.parseInt(totalRows));
		}
		page.setPagination(true);
		HandlerResult rs = resourcesService.findAllByPage();
		ModelAndView mv = new ModelAndView("resources/list");
		mv.addObject("resources", rs.getResultObj());
		mv.addObject("page", page);
		return mv;
	}
	@RequestMapping("/delete")
	public String delete(String ids) throws Exception{
		this.resourcesService.deleteByIds(ids);
		return "redirect:findAll.action";
	}
}
