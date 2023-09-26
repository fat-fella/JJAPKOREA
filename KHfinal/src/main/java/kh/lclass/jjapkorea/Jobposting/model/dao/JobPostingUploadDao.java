package kh.lclass.jjapkorea.Jobposting.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.lclass.jjapkorea.Jobposting.model.dto.JobpostingDto;

@Repository("jobPostinguploadDao")
public class JobPostingUploadDao {
	@Autowired
	private SqlSession sqlSession;
	
	public int insert(JobpostingDto dto) throws Exception{
		int result = sqlSession.insert("jobPostingUpload.insert", dto);
		return result;
	}
	
	
	
	
}
