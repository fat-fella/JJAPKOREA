package kh.lclass.jjapkorea.business.model.service;

import java.util.List;

import kh.lclass.jjapkorea.business.model.dto.JobPostingDto;

public interface JobPostingService {
	int insertJobPosting(JobPostingDto jobPostingDto) throws Exception;
	List<JobPostingDto> selectListJobPosting() throws Exception;
}
