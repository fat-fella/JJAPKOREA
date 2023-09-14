package kh.lclass.jjapkorea.Jobposting.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.lclass.jjapkorea.Jobposting.model.dao.JobPostingUploadDao;
import kh.lclass.jjapkorea.Jobposting.model.dto.JobpostingDto;

@Service
public class JobPostingUploadService {
	@Autowired
	private JobPostingUploadDao jobpostinguploadDao;
	
	@Transactional
	public String insert(JobpostingDto dto) throws Exception{
		JobpostingDto retrunDto = jobpostinguploadDao.insert(dto);
		String result = retrunDto.getJid();
		return result;
	}
}
