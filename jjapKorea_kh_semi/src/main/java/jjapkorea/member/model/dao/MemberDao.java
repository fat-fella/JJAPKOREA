package jjapkorea.member.model.dao;


import org.apache.ibatis.session.SqlSession;

import jjapkorea.member.model.vo.BusinessVo;
import jjapkorea.member.model.vo.MemberVo;
import jjapkorea.member.model.vo.PersonVo;

public class MemberDao {
	public String login(SqlSession session, String mid) {
		String result = session.selectOne("member.login");
		return result;
	}
	// 기업회원로그인
	public String businessLogin(SqlSession session, String mid) {
		String result = session.selectOne("member.businessLogin");
		return result;
	}	
	// 개인 회원가입
	public int pSignup(SqlSession session, MemberVo vo) {
		int result = session.insert("member.pSignup", vo);
		return result;
	}
	public int personSignup(SqlSession session, PersonVo vo) {
		int result = session.insert("person.personSignup", vo);
		return result;
	}
	public int bSignUp(SqlSession session, MemberVo vo){
		int result = session.insert("member.bSignUp", vo);
		return result;
	}
	public int insert(SqlSession session) {
		//TODO
		int result = 0;
		return result;
	}
	public int businessSignUp(SqlSession session, BusinessVo vo) {
		int result = session.insert("business.businessSignUp", vo);
		return result;
	}
	public int delete(SqlSession session, String mid) {
		int result = session.delete("member.delete", mid);
		return result;
	}	
	
// IndexLogin
	public String indexLogin(SqlSession session, String mid) {
		String result = session.selectOne("member.delete" ,mid);
		return result;
	}
	
}
