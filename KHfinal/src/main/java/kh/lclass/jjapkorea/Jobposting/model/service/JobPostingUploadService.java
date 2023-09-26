package kh.lclass.jjapkorea.Jobposting.model.service;

import org.springframework.beans.factory.annotation.Autowired;

import kh.lclass.jjapkorea.Jobposting.model.dao.JobPostingUploadDao;
import kh.lclass.jjapkorea.Jobposting.model.dto.JobpostingDto;


public interface JobPostingUploadService {
	int insert(JobpostingDto dto) throws Exception;
}
