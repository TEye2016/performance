package chzu.performance.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import chzu.performance.entity.Resources;
import chzu.performance.entity.Role;
import chzu.performance.entity.User;
import chzu.performance.service.ResourcesService;
import chzu.performance.service.RoleService;
import chzu.performance.service.UserService;

/**
 * 用户有关的控制
 * 
 * @author tomcat 包括登陆
 */
@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private ResourcesService resourcesService;
	@Autowired
	private AuthenticationManager myAuthenticationManager;
	@Autowired
	private RoleService roleService;
	@RequestMapping(value = "/login", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String login(User u,HttpServletRequest request) throws Exception {
		User user = this.userService.querySingleUser(u);
		if (user == null) {
			request.setAttribute("error", "用户或密码不正确！");
		    return "login";
		}
		Authentication authentication = myAuthenticationManager
				.authenticate(new UsernamePasswordAuthenticationToken(u.getUsername(),u.getUserpassword()));
		SecurityContext securityContext = SecurityContextHolder.getContext();
		securityContext.setAuthentication(authentication);
		List<Resources> resources = resourcesService.getResourcesByUserName(u.getUsername());
		request.setAttribute("resources", resources);
		HttpSession session = request.getSession(true);  
	    session.setAttribute("SPRING_SECURITY_CONTEXT", securityContext);  
	    // 当验证都通过后，把用户信息放在session里
		request.getSession().setAttribute("userSession", user);
		return "main";
	}
	@RequestMapping("/main")
	public String main(){
		return "welcome";
	}
	@RequestMapping("/loginOut")
	public String loginOut(HttpServletRequest request){
		request.getSession().invalidate();
		return "login";
	}
	@RequestMapping("/tofindAll")
	public String tofindAll(){
		return "user/list";
	}
	@RequestMapping("/findAll")
	@ResponseBody
	public List<User> findAll(){
		List<User> users = this.userService.findAll();
		return users;
	}
	@RequestMapping("/add")
	public ModelAndView add(){
		ModelAndView modelAndView = new ModelAndView("user/add");
		List<Role> roles = this.roleService.findAll();
		modelAndView.addObject("roles", roles);
		return modelAndView;
	}
}
