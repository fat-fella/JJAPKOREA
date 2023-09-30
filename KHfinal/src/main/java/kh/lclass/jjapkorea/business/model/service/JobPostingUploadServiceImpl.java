package kh.lclass.jjapkorea.business.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.lclass.jjapkorea.business.model.dao.JobPostingUploadDao;
import kh.lclass.jjapkorea.business.model.dto.JobpostingDto;

@Service
public class JobPostingUploadServiceImpl implements JobPostingUploadService{
	@Autowired
	private JobPostingUploadDao jobpostinguploadDao;
	
	@Override
	@Transactional
	public int insert(JobpostingDto dto) throws Exception{
		return jobpostinguploadDao.insert(dto);
	}
	
	public List<JobpostingDto> selectList(String mid) throws Exception{
		return jobpostinguploadDao.selectList(mid);
		
	}
}
