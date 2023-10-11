package kh.lclass.jjapkorea.business.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.lclass.jjapkorea.business.model.dto.JobPostingDto;

@Repository
public class JobPostingDao {
	@Autowired
	private SqlSession sqlSession;
	
	public int insertJobPosting(JobPostingDto jobPostingDto) throws Exception{
		return sqlSession.insert("jobPosting.insertJobPosting", jobPostingDto);
	}
	
	public List<Map<String, Object>> getJobPostingsWithBusinessInfo() throws Exception {
        return sqlSession.selectList("jobPosting.getJobPostingsWithBusinessInfo");
    }

}
