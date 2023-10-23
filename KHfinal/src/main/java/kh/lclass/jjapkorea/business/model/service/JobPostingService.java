package kh.lclass.jjapkorea.business.model.service;

import java.util.List;
import java.util.Map;

import kh.lclass.jjapkorea.business.model.dto.JobPostingDto;
import kh.lclass.jjapkorea.guest.model.dto.BusinessDto;
import kh.lclass.jjapkorea.guest.model.dto.MemberDto;
import kh.lclass.jjapkorea.guest.model.dto.SearchDto;

public interface JobPostingService {
	void signUpMemberAndBusinessAndInsertJobPosting(MemberDto memberDto, BusinessDto businessDto, JobPostingDto jobPostingDto) throws Exception;
	List<Map<String, Object>> getJobPostingsWithBusinessInfo() throws Exception;
	List<Map<String, Object>> getJobPostingsWithBusinessInfoCount() throws Exception;
	void updateCount(String jid) throws Exception;
	List<Map<String, Object>> getJobPostingByKeyword(String keyword) throws Exception;
	List<Map<String, Object>> getJobPostingByKeywords(SearchDto searchDto) throws Exception;
}
