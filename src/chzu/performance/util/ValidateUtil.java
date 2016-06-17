package chzu.performance.util;

import java.util.Collection;

/**
 * 校验工具类
 * 
 * @author tomcat
 * 
 */
@SuppressWarnings("rawtypes") 
public class ValidateUtil {
	/**
	 * 校验字符串是否有效
	 * 
	 * @param s
	 * @return
	 */
	public static boolean isValidate(String s) {
		return (s == null || "".equals(s.trim())) ? false : true;
	}
	/**
	 * 判断集合的有效性
	 * @param c
	 * @return
	 */
	public static boolean isValidate(Collection c) {
		return (c == null || c.isEmpty()) ? false : true;
	}
}
