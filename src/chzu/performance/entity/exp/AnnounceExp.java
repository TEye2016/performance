package chzu.performance.entity.exp;

import chzu.performance.entity.Announce;
/**
 * 任务的扩展类
 * @author ruihui.li
 *
 */
public class AnnounceExp extends Announce {
	private String userName;
	private String name;
	private String url;
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
}
