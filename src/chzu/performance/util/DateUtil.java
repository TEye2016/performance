package chzu.performance.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 时间与字符串转换工具类
 * @author ruihui.li
 *
 */
public class DateUtil {
	/**
	 * 
	 * @param dateString 时间字符串，格式如2016-06-19
	 * @return
	 * @throws ParseException 
	 */
	public static Date stringToDate(String dateString) throws ParseException{
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
		return dateFormat.parse(dateString);
	}
}
