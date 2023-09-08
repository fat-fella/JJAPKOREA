package kh.lclass.jjapkorea.member.model.dao;

import java.util.Arrays;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kh.lclass.jjapkorea.member.model.vo.BusinessFormVo;
import kh.lclass.jjapkorea.member.model.vo.BusinessVo;
import kh.lclass.jjapkorea.member.model.vo.MemberVo;
import kh.lclass.jjapkorea.member.model.vo.PersonVo;

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

	public int bSignUp(SqlSession session, MemberVo vo) {
		int result = session.insert("member.bSignUp", vo);
		return result;
	}

	public void insert(SqlSession session) {
		/*
		 * public void insert(Connection conn) { String checkQuery =
		 * "SELECT COUNT(*) FROM businessform"; String insertQuery =
		 * "INSERT INTO businessform VALUES (?, ?)"; List<String> list = new
		 * ArrayList<String>(); list.add("대기업");        list.add("대기업 계열사·자회사");
		 * list.add("중소기업(300명이하)"); list.add("중견기업(300명이상)"); list.add("벤처기업");
		 * list.add("외국계(외국 투자기업)"); list.add("외국계(외국 법인기업)"); list.add("국내 공공기관·공기업");
		 * list.add("비영리단체·협회·교육재단"); list.add("외국 기관·비영리기구·단체"); PreparedStatement
		 * checkStmt = null; PreparedStatement insertStmt = null; try { checkStmt =
		 * conn.prepareStatement(checkQuery); ResultSet rs = checkStmt.executeQuery();
		 * if (rs.next() && rs.getInt(1) == 0) { insertStmt =
		 * conn.prepareStatement(insertQuery); for (int i = 0; i < list.size(); i++) {
		 * insertStmt.setInt(1, i + 1); insertStmt.setString(2, list.get(i))
		 * insertStmt.executeUpdate(); } } for (int i = 0; i < list.size(); i++) {
		 * System.out.println(list.get(i)); } } catch (Exception e) {
		 * e.printStackTrace(); } finally { close(checkStmt); close(insertStmt); } }
		 */
		//TODO
		String namespace = "member";
        String checkQuery = namespace + ".check";

        int count = session.selectOne(checkQuery);

        if (count == 0) {
            String insertQuery = namespace + ".insert";
            List<String> list = Arrays.asList(
                "대기업", "대기업 계열사·자회사", "중소기업(300명이하)", "중견기업(300명이상)",
                "벤처기업", "외국계(외국 투자기업)", "외국계(외국 법인기업)", "국내 공공기관·공기업",
                "비영리단체·협회·교육재단", "외국 기관·비영리기구·단체"
            );

            for (int i = 0; i < list.size(); i++) {
                String name = list.get(i);
                session.insert(insertQuery, new BusinessFormVo(i + 1, name));
            }
        }
	}

	public int businessSignup(SqlSession session, BusinessVo vo) {
		int result = session.insert("person.businessSignup", vo);
		return result;
	}

	public int delete(SqlSession session, String mid) {
		int result = session.delete("member.delete", mid);
		return result;
	}

// IndexLogin
	public String indexLogin(SqlSession session, String mid) {
		String result = session.selectOne("member.delete", mid);
		return result;
	}

}
