package kh.lclass.jjapkorea.business.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.lclass.jjapkorea.business.model.dto.JobPostingDto;
import kh.lclass.jjapkorea.guest.model.dto.SearchDto;

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
	public List<Map<String, Object>> getJobPostingsWithBusinessInfoCount() throws Exception {
		return sqlSession.selectList("jobPosting.getJobPostingsWithBusinessInfoCount");
	}
	
	public void updateCount(String jid) throws Exception{
		sqlSession.update("jobPosting.updateCount", jid);
	}

	public List<Map<String, Object>> getJobPostingByKeyword(String keyword) throws Exception {
		return sqlSession.selectList("search.getJobPostingByKeyword", keyword);
	}
	
	public List<Map<String, Object>> getJobPostingByKeywords(SearchDto searchDto) throws Exception {
		return sqlSession.selectList("search.getJobPostingByKeywords", searchDto);
	}
}
