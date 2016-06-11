package chzu.performance.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/role")
public class RoleController {
	@RequestMapping("/add")
	public ModelAndView add() {
		ModelAndView m = new ModelAndView("role/add");
		return m;
	}

}
