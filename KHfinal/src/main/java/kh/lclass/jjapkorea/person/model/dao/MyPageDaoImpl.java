package kh.lclass.jjapkorea.person.model.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.lclass.jjapkorea.person.model.dto.ExperienceDto;

@Repository
public class MyPageDaoImpl implements MyPageDao {
	@Inject
	private SqlSession session;

	private static final String EXPE = "experience";
	private static final String GET_BY_WORK_PLACE = EXPE + ".getByWorkplace";

	
	@Override
	public String getByWorkplace (String mid) {
		System.out.println(" [mj]  경력확인 [1] mid : " +  mid);
		return session.selectOne(GET_BY_WORK_PLACE, mid);
	}


	
}
