package kh.lclass.jjapkorea.Jobposting.model.service;

import kh.lclass.jjapkorea.Jobposting.model.dto.JobpostingDto;


public interface JobPostingUploadService {	
	public String insert(JobpostingDto dto) throws Exception;
}
//@Service
//public class JobPostingUploadService {
//	@Autowired
//	private JobPostingUploadDao jobpostinguploadDao;
//	
//	@Transactional
//	public String insert(JobpostingDto dto) throws Exception{
//		JobpostingDto retrunDto = jobpostinguploadDao.insert(dto);
//		String result = retrunDto.getJid();
//		return result;
//	}
