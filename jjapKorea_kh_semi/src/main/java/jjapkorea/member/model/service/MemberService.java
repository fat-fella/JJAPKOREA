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
	
//	public List<MemberVo> selectList(){
//		List<MemberVo> result = null;
//		Connection conn = getConnection();
//		result = dao.selectList(conn);
//		close(conn);
//		return result;
//	}
//	// 한 행 읽기 - PK로where조건
//	public MemberVo selectOne(int bno){
//		MemberVo result = null;
//		Connection conn = getConnection();
//		result = dao.selectOne(conn, bno);
//		close(conn);
//		return result;
//	}
//	// 한 행 삽입 - Member 자료형을 받아와야 함.
//	public int insert(MemberVo dto){
//		int result = 0;
//		Connection conn = getConnection();
//		result = dao.insert(conn, dto);
//		close(conn);
//		return result;
//	}
//	// 한 행 수정 - Member 또는 경우에 따라서 특정 컬럼값만 받아오기도 함.
//	public int update(MemberVo dto){
//		int result = 0;
//		Connection conn = getConnection();
//		result = dao.update(conn, dto);
//		close(conn);
//		return result;
//	}
//	// 한 행 삭제 - 주로 PK로 where조건
//	public int delete(int bno){
//		int result = 0;
//		Connection conn = getConnection();
//		result = dao.delete(conn, bno);
//		close(conn);
//		return result;
//	}
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
	
	
	
	
	
}