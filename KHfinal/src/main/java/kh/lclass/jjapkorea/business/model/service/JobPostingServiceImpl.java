package kh.lclass.jjapkorea.business.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.lclass.jjapkorea.business.model.dao.JobPostingDao;
import kh.lclass.jjapkorea.business.model.dto.JobPostingDto;

@Service
public class JobPostingServiceImpl implements JobPostingService {
	@Autowired
	private JobPostingDao jobPostingDao;
	
	@Override
	public int insertJobPosting(JobPostingDto jobPostingDto) throws Exception{
		return jobPostingDao.insertJobPosting(jobPostingDto);
	}
	
	@Override
	public List<JobPostingDto> selectListJobPosting() throws Exception{
		return jobPostingDao.selectListJobPosting();
	}
}
