package kh.lclass.jjapkorea.business.model.dao;

import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.lclass.jjapkorea.business.model.dto.JobPostingDto;
import kh.lclass.jjapkorea.business.model.dto.JobPostingCategoryDto;

@Repository("jobPostinguploadDao")
public class JobPostingUploadDao {
	@Autowired
	private SqlSession sqlSession;
	
	public int insert(JobPostingDto dto) throws Exception{
		int result = sqlSession.insert("jobpostingUpload.insert", dto);
		return result;
	}
	
	public List<JobPostingDto> selectList(String mid) throws Exception{
		return sqlSession.selectList("jobpostingUpload.selectList", mid);
	}
	
	public List<JobPostingCategoryDto> selectFirst(String selectedOption) throws Exception{
		return sqlSession.selectList("jobpostingUpload.selectFirst", selectedOption);
	}
	
	public List<JobPostingCategoryDto> selectSecond(String selectedOption) throws Exception{
		return sqlSession.selectList("jobpostingUpload.selectSecond", selectedOption);
	}
	
	public List<JobPostingCategoryDto> selectThird(String selectedOption) throws Exception{
		return sqlSession.selectList("jobpostingUpload.selectThird", selectedOption);
	}
	public Map<String, Object> getJobPostingWithInfo(String jid) throws Exception {
        return sqlSession.selectOne("jobpostingUpload.getJobPostingWithInfo", jid);
	}
	public int jobPostingDelete(String jid) throws Exception {
		return sqlSession.delete("jobpostingUpload.jobPostingDelete",jid);
		
	}
	public int jobPostingUpdate(String jid) throws Exception{
		return sqlSession.update("jobpostingUpload.jobPostingUpdate", jid);
	}
	
	
	
}
