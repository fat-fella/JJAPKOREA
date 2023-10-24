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
	
	public List<Map<String, Object>> topTwoInfoByDDay() throws Exception {
		return sqlSession.selectList("jobPosting.topTwoInfoByDDay");
	}
	
	public List<Map<String, Object>> getNextTwoInfoByDDay() throws Exception {
		return sqlSession.selectList("jobPosting.getNextTwoInfoByDDay");
	}
	
	public List<Map<String, Object>> getNextTwoInfoByDDay2() throws Exception {
		return sqlSession.selectList("jobPosting.getNextTwoInfoByDDay2");
	}
	
	public List<Map<String, Object>> getNextTwoInfoByDDay3() throws Exception {
		return sqlSession.selectList("jobPosting.getNextTwoInfoByDDay3");
	}
	
	public List<Map<String, Object>> getNextTwoInfoByDDay4() throws Exception {
		return sqlSession.selectList("jobPosting.getNextTwoInfoByDDay4");
	}
	
	public List<Map<String, Object>> getNextTwoInfoByDDay5() throws Exception {
		return sqlSession.selectList("jobPosting.getNextTwoInfoByDDay5");
	}
	
	public List<Map<String, Object>> topTwoInfoByLikehit() throws Exception {
		return sqlSession.selectList("jobPosting.topTwoInfoByLikehit");
	}
	
	public List<Map<String, Object>> getNextTwoInfoByLikehit() throws Exception {
		return sqlSession.selectList("jobPosting.getNextTwoInfoByLikehit");
	}
	
	public List<Map<String, Object>> getNextTwoInfoByLikehit2() throws Exception {
		return sqlSession.selectList("jobPosting.getNextTwoInfoByLikehit2");
	}
	
	public List<Map<String, Object>> getNextTwoInfoByLikehit3() throws Exception {
		return sqlSession.selectList("jobPosting.getNextTwoInfoByLikehit3");
	}
	
	public List<Map<String, Object>> getNextTwoInfoByLikehit4() throws Exception {
		return sqlSession.selectList("jobPosting.getNextTwoInfoByLikehit4");
	}
	
	public List<Map<String, Object>> getNextTwoInfoByLikehit5() throws Exception {
		return sqlSession.selectList("jobPosting.getNextTwoInfoByLikehit5");
	}
	
	public List<Map<String, Object>> mostScrappedJob() throws Exception {
		return sqlSession.selectList("jobPosting.mostScrappedJob");
	}
	
	public List<Map<String, Object>> mostClickedJob() throws Exception {
		return sqlSession.selectList("jobPosting.mostClickedJob");
	}
	
	public List<Map<String, Object>> highestSalaryJob() throws Exception {
		return sqlSession.selectList("jobPosting.highestSalaryJob");
	}
}
