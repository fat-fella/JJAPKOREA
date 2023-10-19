package kh.lclass.jjapkorea.business.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.lclass.jjapkorea.business.model.dao.ApplyDao;
import kh.lclass.jjapkorea.business.model.dto.ApplyDto;

@Service
public class ApplyServiceImpl implements ApplyService {
	@Autowired
	ApplyDao applyDao;
	
	@Override
	public int insertApply(ApplyDto applyDto) throws Exception {
		return applyDao.insertApply(applyDto);
	}
	
	@Override
	public List<ApplyDto> getApplyById(int resumeId) throws Exception {
		return applyDao.getApplyById(resumeId);
	}
	
	@Override
	public List<ApplyDto> getApplyByJid(String jid) throws Exception {
		return applyDao.getApplyByJid(jid);
	}
	
	@Override
	public Integer getResumeById(String mid) throws Exception {
		return applyDao.getResumeById(mid);
	}
	
	@Override
	public int deleteApply(int resumeId) throws Exception {
		return applyDao.deleteApply(resumeId);
	}
}
