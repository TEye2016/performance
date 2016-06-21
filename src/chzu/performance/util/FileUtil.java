package chzu.performance.util;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

/**
 * 文件上传下载的封装
 * @author ruihui.li
 *
 */
public class FileUtil {
	public static final String FILEPATH ="E:/apache-tomcat-6.0.16/webapps/performance/" ;
	/**
	 * 多文件的上传
	 * @param files
	 */
	public static String upFile(MultipartFile files){
			//获取原始文件名
			String oldName = files.getOriginalFilename();
			//获取后缀名
			String appendix = oldName.substring(oldName.lastIndexOf("."));
			//新文件名
			String name = UUID.randomUUID().toString()+appendix;
			File file = new File("E:/apache-tomcat-6.0.16/webapps/performance/"+name);
			if(!file.exists()){
				file.mkdir();
			}
			//向磁盘写文件
			try {
				files.transferTo(file);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			return FILEPATH+name;
	}
}
