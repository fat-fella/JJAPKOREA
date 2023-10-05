package kh.lclass.jjapkorea.business.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.lclass.jjapkorea.api.WorknetApi;
import kh.lclass.jjapkorea.business.model.dao.JobPostingDao;
import kh.lclass.jjapkorea.business.model.dto.JobPostingDto;
import kh.lclass.jjapkorea.guest.model.dao.MemberDao;
import kh.lclass.jjapkorea.guest.model.dto.BusinessDto;
import kh.lclass.jjapkorea.guest.model.dto.MemberDto;

@Service
@Transactional
public class JobPostingServiceImpl implements JobPostingService {
	@Autowired
	private WorknetApi worknetApi;
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private JobPostingDao jobPostingDao;
	
	@Override
	@Scheduled(cron = "0 0 0 * * ?") // 매일 자정에 실행되도록 설정
    public void dailyJob() throws Exception {
        worknetApi.getJobPostings();
    }
	
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
}
