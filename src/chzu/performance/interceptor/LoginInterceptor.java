package chzu.performance.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import chzu.performance.util.Md5Util;
/**
 * 登录拦截器
 * @author ruihui.li
 *
 */
public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		// TODO Auto-generated method stub

	}
	/**
	 * 在控制器执行前执行的方法
	 */
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object arg2) throws Exception {
		if(request.getRequestURI().indexOf("login.action")>=0){
			return true;
		}else {
			if(request.getSession().getAttribute("userSession") != null) return true;
			else {
				request.getRequestDispatcher("/login.jsp").forward(request, response);
				return false;
			}
		}
	}

}
