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
	List<Map<String, Object>> topTwoInfoByDDay() throws Exception;
	List<Map<String, Object>> getNextTwoInfoByDDay() throws Exception;
	List<Map<String, Object>> getNextTwoInfoByDDay2() throws Exception;
	List<Map<String, Object>> getNextTwoInfoByDDay3() throws Exception;
	List<Map<String, Object>> getNextTwoInfoByDDay4() throws Exception;
	List<Map<String, Object>> getNextTwoInfoByDDay5() throws Exception;
	List<Map<String, Object>> topTwoInfoByLikehit() throws Exception;
	List<Map<String, Object>> getNextTwoInfoByLikehit() throws Exception;
	List<Map<String, Object>> getNextTwoInfoByLikehit2() throws Exception;
	List<Map<String, Object>> getNextTwoInfoByLikehit3() throws Exception;
	List<Map<String, Object>> getNextTwoInfoByLikehit4() throws Exception;
	List<Map<String, Object>> getNextTwoInfoByLikehit5() throws Exception;
	List<Map<String, Object>> mostScrappedJob() throws Exception;
	List<Map<String, Object>> mostClickedJob() throws Exception;
	List<Map<String, Object>> highestSalaryJob() throws Exception;
}
