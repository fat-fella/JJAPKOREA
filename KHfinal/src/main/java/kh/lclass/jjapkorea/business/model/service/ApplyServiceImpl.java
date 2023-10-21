package kh.lclass.jjapkorea.business.model.service;

import java.util.List;
import java.util.Map;

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
	public int deleteApply(String jid) throws Exception {
		return applyDao.deleteApply(jid);
	}
	
	@Override
	public String getApplyIdByJidAndResumeId(ApplyDto applyDto) throws Exception {
		return applyDao.getApplyIdByJidAndResumeId(applyDto);
	}
	
	@Override
	public List<Map<String, Object>> applyList(String mid) throws Exception {
		return applyDao.applyList(mid);
	}
	
	@Override
	public Integer applyInfo(String jid) throws Exception {
		return applyDao.applyInfo(jid);
	}
	
	@Override
	public Integer getTotalItems(String mid) throws Exception {
		return applyDao.getTotalItems(mid);
	}
	
	@Override
	public Double qualificationAvg(String jid) throws Exception {
		return applyDao.qualificationAvg(jid);
	}
	
	@Override
	public Double educationAvg(String jid) throws Exception {
		return applyDao.educationAvg(jid);
	}
	
	@Override
	public Double experienceAvg(String jid) throws Exception {
		return applyDao.experienceAvg(jid);
	}
}
