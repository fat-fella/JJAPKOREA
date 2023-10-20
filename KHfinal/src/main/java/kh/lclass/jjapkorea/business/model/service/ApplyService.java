package kh.lclass.jjapkorea.business.model.service;

import java.util.List;
import java.util.Map;

import kh.lclass.jjapkorea.business.model.dto.ApplyDto;

public interface ApplyService {
	int insertApply(ApplyDto applyDto) throws Exception;
	List<ApplyDto> getApplyById(int resumeId) throws Exception;
	List<ApplyDto> getApplyByJid(String jid) throws Exception;
	Integer getResumeById(String mid) throws Exception;
	int deleteApply(int resumeId) throws Exception;
	String getApplyIdByJidAndResumeId(ApplyDto applyDto) throws Exception;
	List<Map<String, Object>> applyList(String mid) throws Exception;
	Integer applyInfo() throws Exception;
}
