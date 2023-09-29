package kh.lclass.jjapkorea.Jobposting.model.service;

import java.util.List;
import kh.lclass.jjapkorea.Jobposting.model.dto.JobpostingDto;


public interface JobPostingUploadService {
	int insert(JobpostingDto dto) throws Exception;
	public List<JobpostingDto> selectList(String mid) throws Exception;
}

