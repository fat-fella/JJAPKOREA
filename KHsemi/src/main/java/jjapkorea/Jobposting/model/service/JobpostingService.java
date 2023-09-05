package jjapkorea.Jobposting.model.service;


import java.util.List;

import org.apache.ibatis.session.SqlSession;

import jjapkorea.Jobposting.model.dao.JobPostingDao;
import jjapkorea.Jobposting.model.dto.JobpostingDto;
import jjapkorea.common.MybatisTemplate;

public class JobpostingService {
	private JobPostingDao dao = new JobPostingDao();
	
	public int insert(JobpostingDto vo) {
		int result = 0;
		SqlSession session = MybatisTemplate.getSqlSession();
		result = dao.insert(session, vo);
		session.close();
		return result;
	}
	public List<JobpostingDto> list(){
		List<JobpostingDto> result = null;
		SqlSession session = MybatisTemplate.getSqlSession();
		result = dao.list(session);
		session.close();
		return result;
	}
}
