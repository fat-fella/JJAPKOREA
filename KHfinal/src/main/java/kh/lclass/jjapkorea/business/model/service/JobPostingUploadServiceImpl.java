package kh.lclass.jjapkorea.business.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import kh.lclass.jjapkorea.business.model.dao.JobPostingUploadDao;
import kh.lclass.jjapkorea.business.model.dto.JobPostingDto;
import kh.lclass.jjapkorea.business.model.dto.JobPostingCategoryDto;

@Service
@Transactional
@EnableTransactionManagement
public class JobPostingUploadServiceImpl implements JobPostingUploadService{
	@Autowired
	private JobPostingUploadDao jobpostinguploadDao;
	
	@Override
	public int insert(JobPostingDto dto) throws Exception{
		return jobpostinguploadDao.insert(dto);
	}
	
	public List<JobPostingDto> selectList(String mid) throws Exception{
		return jobpostinguploadDao.selectList(mid);
		
	}
	
	public List<JobPostingCategoryDto> selectFirst(String selectedOption) throws Exception{
		return jobpostinguploadDao.selectFirst(selectedOption);
	}
	public List<JobPostingCategoryDto> selectSecond(String selectedOption) throws Exception{
		return jobpostinguploadDao.selectSecond(selectedOption);
	}
	public List<JobPostingCategoryDto> selectThird(String selectedOption) throws Exception{
		return jobpostinguploadDao.selectThird(selectedOption);
	}
	public Map<String, Object> getJobPostingWithInfo(String jid) throws Exception {
		return jobpostinguploadDao.getJobPostingWithInfo(jid);
	}
}
