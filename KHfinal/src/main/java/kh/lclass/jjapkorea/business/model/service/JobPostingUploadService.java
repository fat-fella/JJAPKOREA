package kh.lclass.jjapkorea.business.model.service;

import java.util.List;
import kh.lclass.jjapkorea.business.model.dto.JobpostingDto;


public interface JobPostingUploadService {
	int insert(JobpostingDto dto) throws Exception;
	public List<JobpostingDto> selectList(String mid) throws Exception;
}

