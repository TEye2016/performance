package chzu.performance.util;

import java.security.MessageDigest;
/**
 * md5加密用户密码的工具类
 * @author ruihui.li
 *
 */
public class Md5Util {
	/**
	 * md5加密
	 * @param s
	 * @return
	 */
	public static String md5(String s){
		StringBuffer buffer = new StringBuffer();
		char[] chars = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A',
				'B', 'C', 'D', 'E', 'F' };
		byte[] bytes = s.getBytes();
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			byte[] targ = md.digest(bytes);
			for (byte b : targ) {
				buffer.append(chars[(b >> 4) & 0x0F]);
				buffer.append(chars[b & 0x0F]);
			}
			return buffer.toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
