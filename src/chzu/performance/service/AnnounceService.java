package chzu.performance.service;

import java.util.List;

import chzu.performance.entity.Announce;
import chzu.performance.entity.AnnounceAppendix;
import chzu.performance.entity.exp.AnnounceExp;

public interface AnnounceService {
	public List<AnnounceExp> findAll();
	/**
	 * 保存新的任务，同时返回刚保存任务的主键
	 * @param announceExp
	 * @return
	 */
	public void save(AnnounceExp announceExp,AnnounceAppendix announceAppendix);
}
