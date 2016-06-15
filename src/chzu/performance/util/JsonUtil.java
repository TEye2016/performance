package chzu.performance.util;

import javax.servlet.http.HttpServletRequest;

import com.alibaba.fastjson.JSON;

/**
 * 用于转换json数据格式
 * @author liruihui
 *
 */
public class JsonUtil {
	/**
	 * 将数据以json的形式存放到HttpServletRequest中
	 * @param request
	 * @param key
	 * @param data
	 */
	public  static HttpServletRequest  requestJson(HttpServletRequest request,String key ,Object data ){
		String json = JSON.toJSONString(data);
		request.setAttribute(key, json);
		return request;
	}
}
