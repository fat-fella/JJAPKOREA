package kh.lclass.jjapkorea.Jobposting.model.service;


import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kh.lclass.jjapkorea.Jobposting.model.dao.JobPostingDao;
import kh.lclass.jjapkorea.Jobposting.model.dto.JobpostingDto;
import kh.lclass.jjapkorea.common.MybatisTemplate;

public class JobpostingService {
	private JobPostingDao dao = new JobPostingDao();
	
	public int insert(JobpostingDto vo) {
		int result = 0;
		SqlSession session = MybatisTemplate.getSqlSession();
		result = dao.insert(session, vo);
		if(result>0) {
			session.commit();
		} else {
			session.rollback();
		}
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
