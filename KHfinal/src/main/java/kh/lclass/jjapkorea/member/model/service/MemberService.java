package kh.lclass.jjapkorea.member.model.service;


import org.apache.ibatis.session.SqlSession;

import kh.lclass.jjapkorea.common.MybatisTemplate;
import kh.lclass.jjapkorea.member.model.dao.MemberDao;
import kh.lclass.jjapkorea.member.model.vo.BusinessVo;
import kh.lclass.jjapkorea.member.model.vo.MemberVo;
import kh.lclass.jjapkorea.member.model.vo.PersonVo;

public class MemberService {
	private MemberDao dao = new MemberDao();

// login 
	public String login(String mid) {
		String result = null;
		SqlSession session = MybatisTemplate.getSqlSession();
		result = dao.login(session, mid);
		session.close();
		return result;
	}
//businesslogin
	public String businessLogin(String mid) {
		String result = null;
		SqlSession session = MybatisTemplate.getSqlSession();
		result = dao.businessLogin(session, mid);
		session.close();
		return result;
	}
//개인 회원가입 
	public int pSignup(MemberVo vo) {
		int result = 0;
		SqlSession session = MybatisTemplate.getSqlSession();
		result = dao.pSignup(session, vo);
		if(result>0) {
			session.commit();
		} else {
			session.rollback();
		}
		session.close();
		return result;
	}
	public int personSignup(PersonVo vo) {
		int result = 0;
		SqlSession session = MybatisTemplate.getSqlSession();
		result = dao.personSignup(session, vo);
		if(result>0) {
			session.commit();
		} else {
			session.rollback();
		}
		session.close();
		return result;
	}
//기업 회원가입 
	public int bSignUp(MemberVo vo) {
		int result = 0;
		SqlSession session = MybatisTemplate.getSqlSession();
		result = dao.bSignUp(session, vo);
		if(result>0) {
			session.commit();
		} else {
			session.rollback();
		}
		session.close();
		return result;
	}
	public int businessSignup(BusinessVo vo) {
		int result = 0;
		SqlSession session = MybatisTemplate.getSqlSession();
		result = dao.businessSignup(session, vo);
		if(result>0) {
			session.commit();
		} else {
			session.rollback();
		}
		session.close();
		return result;
	}
	public int delete(String mid) {
		int result = 0;
		SqlSession session = MybatisTemplate.getSqlSession();
		result = dao.delete(session, mid);
		if(result>0) {
			session.commit();
		} else {
			session.rollback();
		}
		session.close();
		return result;
	}
	public void insert() {
		SqlSession session = MybatisTemplate.getSqlSession();
		dao.insert(session);
		session.commit();
		session.close();
	}
	public String indexLogin(String mid) {
		String result = null;
		SqlSession session = MybatisTemplate.getSqlSession();
		result = dao.indexLogin(session, mid);
		session.close();
		return result;
	}	
}