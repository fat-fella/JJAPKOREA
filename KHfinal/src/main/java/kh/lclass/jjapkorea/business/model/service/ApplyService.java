package kh.lclass.jjapkorea.business.model.service;

import java.util.List;
import java.util.Map;

import kh.lclass.jjapkorea.business.model.dto.ApplyDto;
import kh.lclass.jjapkorea.business.model.dto.ApprovalDto;

public interface ApplyService {
	int insertApply(ApplyDto applyDto) throws Exception;
	List<ApplyDto> getApplyById(int resumeId) throws Exception;
	List<ApplyDto> getApplyByJid(String jid) throws Exception;
	Integer getResumeById(String mid) throws Exception;
	int deleteApply(String jid) throws Exception;
	String getApplyIdByJidAndResumeId(ApplyDto applyDto) throws Exception;
	List<Map<String, Object>> applyList(String mid) throws Exception;
	Integer applyInfo(String jid) throws Exception;
	Integer getTotalItems(String mid) throws Exception;
	Double qualificationAvg(String jid) throws Exception;
	Double educationAvg(String jid) throws Exception;
	Double experienceAvg(String jid) throws Exception;
	List<Map<String, Object>> applyListAll(String jid) throws Exception;
	Integer jobPostingGetTotalItems(String jid) throws Exception;
	String findMidByResumeId(Integer resumeId) throws Exception;
	List<Map<String, Object>> findPersonByResumeId(Integer resumeId) throws Exception;
	String findImageUrl(Integer resumeId) throws Exception;
	int insertApproval(ApprovalDto approvalDto) throws Exception;
}
