package kh.lclass.jjapkorea.business.model.service;

import java.util.List;
import java.util.Map;

import kh.lclass.jjapkorea.business.model.dto.JobPostingDto;
import kh.lclass.jjapkorea.business.model.dto.JobPostingCategoryDto;


public interface JobPostingUploadService {
	int insert(JobPostingDto dto) throws Exception;
	public List<JobPostingDto> selectList(String mid) throws Exception;
	List<JobPostingCategoryDto> selectFirst(String selectedOption) throws Exception;
	public List<JobPostingCategoryDto> selectSecond(String selectedOption) throws Exception;
	public List<JobPostingCategoryDto> selectThird(String selectedOption) throws Exception;
	public Map<String, Object> getJobPostingWithInfo(String jid) throws Exception;
	public int jobPostingDelete(String jid) throws Exception;
	public int jobPostingUpdate(JobPostingDto dto) throws Exception;
}

