package kh.lclass.jjapkorea.business.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.lclass.jjapkorea.business.model.dao.JobPostingDao;
import kh.lclass.jjapkorea.business.model.dto.JobPostingDto;
import kh.lclass.jjapkorea.guest.model.dao.MemberDao;
import kh.lclass.jjapkorea.guest.model.dto.BusinessDto;
import kh.lclass.jjapkorea.guest.model.dto.MemberDto;
import kh.lclass.jjapkorea.guest.model.dto.SearchDto;

@Service
@Transactional
public class JobPostingServiceImpl implements JobPostingService {
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private JobPostingDao jobPostingDao;
	
	@Override
	public void signUpMemberAndBusinessAndInsertJobPosting(MemberDto memberDto, BusinessDto businessDto, JobPostingDto jobPostingDto) throws Exception {
		memberDao.signUpMember(memberDto);
		memberDao.signUpBusiness(businessDto);
		jobPostingDao.insertJobPosting(jobPostingDto);
	}
	
	@Override
    public List<Map<String, Object>> getJobPostingsWithBusinessInfo() throws Exception {
        return jobPostingDao.getJobPostingsWithBusinessInfo();
    }
	@Override
	public List<Map<String, Object>> getJobPostingsWithBusinessInfoCount() throws Exception {
		return jobPostingDao.getJobPostingsWithBusinessInfoCount();
	}

	@Override 
	public void updateCount(String jid) throws Exception{
		jobPostingDao.updateCount(jid);
	}
	
	@Override
	public List<Map<String, Object>> getJobPostingByKeyword(String keyword) throws Exception {
		return jobPostingDao.getJobPostingByKeyword(keyword);
	}
	
	@Override
	public List<Map<String, Object>> getJobPostingByKeywords(SearchDto searchDto) throws Exception {
		return jobPostingDao.getJobPostingByKeywords(searchDto);
	}
	
	@Override
	public List<Map<String, Object>> topTwoInfoByDDay() throws Exception {
		return jobPostingDao.topTwoInfoByDDay();
	}
	
	@Override
	public List<Map<String, Object>> getNextTwoInfoByDDay() throws Exception {
		return jobPostingDao.getNextTwoInfoByDDay();
	}
	
	@Override
	public List<Map<String, Object>> getNextTwoInfoByDDay2() throws Exception {
		return jobPostingDao.getNextTwoInfoByDDay2();
	}
	
	@Override
	public List<Map<String, Object>> getNextTwoInfoByDDay3() throws Exception {
		return jobPostingDao.getNextTwoInfoByDDay3();
	}
	
	@Override
	public List<Map<String, Object>> getNextTwoInfoByDDay4() throws Exception {
		return jobPostingDao.getNextTwoInfoByDDay4();
	}
	
	@Override
	public List<Map<String, Object>> getNextTwoInfoByDDay5() throws Exception {
		return jobPostingDao.getNextTwoInfoByDDay5();
	}
	
	@Override
	public List<Map<String, Object>> topTwoInfoByLikehit() throws Exception {
		return jobPostingDao.topTwoInfoByLikehit();
	}
	
	@Override
	public List<Map<String, Object>> getNextTwoInfoByLikehit() throws Exception {
		return jobPostingDao.getNextTwoInfoByLikehit();
	}
	
	@Override
	public List<Map<String, Object>> getNextTwoInfoByLikehit2() throws Exception {
		return jobPostingDao.getNextTwoInfoByLikehit2();
	}
	
	@Override
	public List<Map<String, Object>> getNextTwoInfoByLikehit3() throws Exception {
		return jobPostingDao.getNextTwoInfoByLikehit3();
	}
	
	@Override
	public List<Map<String, Object>> getNextTwoInfoByLikehit4() throws Exception {
		return jobPostingDao.getNextTwoInfoByLikehit4();
	}
	
	@Override
	public List<Map<String, Object>> getNextTwoInfoByLikehit5() throws Exception {
		return jobPostingDao.getNextTwoInfoByLikehit5();
	}
}
