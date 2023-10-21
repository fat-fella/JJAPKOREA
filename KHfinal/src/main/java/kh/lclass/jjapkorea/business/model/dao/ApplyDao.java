package kh.lclass.jjapkorea.business.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.lclass.jjapkorea.business.model.dto.ApplyDto;
import kh.lclass.jjapkorea.business.model.dto.ApprovalDto;

@Repository
public class ApplyDao {
	@Autowired
	SqlSession sqlSession;
	
	public int insertApply(ApplyDto applyDto) throws Exception {
		return sqlSession.insert("apply.insertApply", applyDto);
	}
	
	public List<ApplyDto> getApplyById(int resumeId) throws Exception {
		return sqlSession.selectList("apply.getApplyById", resumeId);
	}
	
	public List<ApplyDto> getApplyByJid(String jid) throws Exception {
		return sqlSession.selectList("apply.getApplyByJid", jid);
	}
	
	public Integer getResumeById(String mid) throws Exception {
		return sqlSession.selectOne("apply.getResumeById", mid);
	}
	
	public int deleteApply(String jid) throws Exception {
		return sqlSession.delete("apply.deleteApply", jid);
	}
	
	public String getApplyIdByJidAndResumeId(ApplyDto applyDto) throws Exception {
		return sqlSession.selectOne("apply.getApplyIdByJidAndResumeId", applyDto);
	}
	
	public List<Map<String, Object>> applyList(String mid) throws Exception {
		return sqlSession.selectList("apply.applyList", mid);
	}
	
	public Integer applyInfo(String jid) throws Exception {
		return sqlSession.selectOne("apply.applyInfo", jid);
	}
	
	public Integer getTotalItems(String mid) throws Exception {
		return sqlSession.selectOne("apply.getTotalItems", mid);
	}
	
	public Double qualificationAvg(String jid) throws Exception {
		return sqlSession.selectOne("apply.qualificationAvg", jid);
	}
	
	public Double educationAvg(String jid) throws Exception {
		return sqlSession.selectOne("apply.educationAvg", jid);
	}
	
	public Double experienceAvg(String jid) throws Exception {
		return sqlSession.selectOne("apply.experienceAvg", jid);
	}
	
	public List<Map<String, Object>> applyListAll(String jid) throws Exception {
		return sqlSession.selectList("apply.applyListAll", jid);
	}
	
	public Integer jobPostingGetTotalItems(String jid) throws Exception {
		return sqlSession.selectOne("apply.jobPostingGetTotalItems", jid);
	}
	
	public String findMidByResumeId(Integer resumeId) throws Exception {
		return sqlSession.selectOne("apply.findMidByResumeId", resumeId);
	}
	
	public List<Map<String, Object>> findPersonByResumeId(Integer resumeId) throws Exception {
		return sqlSession.selectList("apply.findPersonByResumeId", resumeId);
	}
	
	public String findImageUrl(Integer resumeId) throws Exception {
		return sqlSession.selectOne("apply.findImageUrl", resumeId);
	}
	
	public int insertApproval(ApprovalDto approvalDto) throws Exception {
		return sqlSession.insert("approval.insertApproval", approvalDto);
	}
}
