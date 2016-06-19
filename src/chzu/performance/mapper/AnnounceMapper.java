package chzu.performance.mapper;

import java.util.List;

import chzu.performance.entity.Announce;
import chzu.performance.entity.exp.AnnounceExp;


public interface AnnounceMapper {
	public List<Announce> findAll();
	public Integer save(AnnounceExp announceExp);
}