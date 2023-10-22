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
	@Override
	public List<JobPostingDto> selectList(String mid) throws Exception{
		return jobpostinguploadDao.selectList(mid);
		
	}
	@Override
	public List<JobPostingCategoryDto> selectFirst(String selectedOption) throws Exception{
		return jobpostinguploadDao.selectFirst(selectedOption);
	}
	@Override
	public List<JobPostingCategoryDto> selectSecond(String selectedOption) throws Exception{
		return jobpostinguploadDao.selectSecond(selectedOption);
	}
	@Override
	public List<JobPostingCategoryDto> selectThird(String selectedOption) throws Exception{
		return jobpostinguploadDao.selectThird(selectedOption);
	}
	@Override
	public Map<String, Object> getJobPostingWithInfo(String jid) throws Exception {
		return jobpostinguploadDao.getJobPostingWithInfo(jid);
	}
	@Override
	public int jobPostingDelete(String jid) throws Exception {
		return jobpostinguploadDao.jobPostingDelete(jid);
	}
	@Override
	public int jobPostingUpdate(JobPostingDto dto) throws Exception{
		return jobpostinguploadDao.jobPostingUpdate(dto);
	}
	
	@Override
	public List<Map<String, Object>> selectListMap(String mid) throws Exception{
		return jobpostinguploadDao.selectListMap(mid);
	}
}
