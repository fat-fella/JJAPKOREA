package kh.lclass.jjapkorea.person.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ResumeMgrDao {

	@Autowired
	private SqlSession sqlSession;

	public List<Map<String, Object>> getResumeMgrWithPerson() throws Exception {
		return sqlSession.selectList("resumeMgr.getResumeMgrWithPerson");
		
	}
}
