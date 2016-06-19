package chzu.performance.entity.exp;

import chzu.performance.entity.Announce;
/**
 * 任务的扩展类
 * @author ruihui.li
 *
 */
public class AnnounceExp extends Announce {
	private String userName;

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
}
