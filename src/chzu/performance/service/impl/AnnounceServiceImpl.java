package chzu.performance.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import chzu.performance.entity.Announce;
import chzu.performance.entity.exp.AnnounceExp;
import chzu.performance.mapper.AnnounceMapper;
import chzu.performance.service.AnnounceService;
@Service("announceService")
public class AnnounceServiceImpl implements AnnounceService {
	@Autowired
	private AnnounceMapper announceMapper;
	@Override
	public List<Announce> findAll() {
		return announceMapper.findAll();
	}

	@Override
	public Integer save(AnnounceExp announceExp) {
		return this.announceMapper.save(announceExp);
	}

}
