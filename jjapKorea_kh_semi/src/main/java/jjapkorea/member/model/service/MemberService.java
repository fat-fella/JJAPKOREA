package jjapkorea.member.model.service;

import static jjapkorea.common.jdbc.JdbcTemplate.close;
import static jjapkorea.common.jdbc.JdbcTemplate.commit;
import static jjapkorea.common.jdbc.JdbcTemplate.getConnection;
import static jjapkorea.common.jdbc.JdbcTemplate.rollback;
import static jjapkorea.common.jdbc.JdbcTemplate.setAutoCommit;

import java.sql.Connection;
import java.util.List;

import jjapkorea.member.model.dao.MemberDao;
import jjapkorea.member.model.vo.BusinessVo;
import jjapkorea.member.model.vo.MemberVo;
import jjapkorea.member.model.vo.PersonVo;

public class MemberService {
	private MemberDao dao = new MemberDao();
	
	// login 
	public String login(String mid) {
		String result = null;
		Connection conn = getConnection();
		result = dao.login(conn, mid);
		close(conn);
		return result;
	}
	//businesslogin
	public String businessLogin(String mid) {
		String result = null;
		Connection conn = getConnection();
		result = dao.businessLogin(conn, mid);
		close(conn);
		return result;
	}
	//개인 회원가입 
	public int pSignup(MemberVo vo) {
		int result = 0;
		Connection conn = getConnection();
		result = dao.pSignup(conn, vo);
		close(conn);
		return result;
	}
	public int personSignup(PersonVo vo) {
		int result = 0;
		Connection conn = getConnection();
		result = dao.personSignup(conn, vo);
		close(conn);
		return result;
	}
	//기업 회원가입 

	public int bSignUp(MemberVo vo) {
		int result = 0;
		Connection conn = getConnection();
		result = dao.bSignUp(conn, vo);
		close(conn);
		return result;
	}
	public int businessSignUp(BusinessVo vo) {
		int result = 0;
		Connection conn = getConnection();
		result = dao.businessSignUp(conn, vo);
		close(conn);
		return result;
	}
	public int delete(String mid) {
		int result = 0;
		Connection conn = getConnection();
		result = dao.delete(conn, mid);
		close(conn);
		return result;
	}
	public void insert() {
		Connection conn = getConnection();
		dao.insert(conn);
		close(conn);
	}
}