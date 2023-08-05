package jjapkorea.member.model.dao;

import static jjapkorea.common.jdbc.JdbcTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jjapkorea.member.model.vo.BusinessVo;
import jjapkorea.member.model.vo.MemberVo;
import jjapkorea.member.model.vo.PersonVo;

public class MemberDao {
	// login : mpwd를 return 함. id 존재하지 않으면 return null
	public String login(Connection conn, String mid) {
		System.out.println("[Member Dao login] mid:" + mid);

		String result = null;
		String query = "select mpw from member where mid=? and mtype=1";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getString("mpw");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println("[Member Dao login] return:" + result);
		return result;
	}

	// 기업회원로그인
	public String businessLogin(Connection conn, String mid) {
		System.out.println("[Business Dao login] mid:" + mid);

		String result = null;
		String query = "select mpw from member where mid=? and mtype=2";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getString("mpw");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println("[Business Dao login] return:" + result);
		return result;
	}
	
	// 개인 회원가입
	public int pSignup(Connection conn, MemberVo vo) {
		int result = 0;
		String query = "insert into member values (?,?,1)";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getMpw());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public int personSignup(Connection conn, PersonVo pvo) {
		int result = 0;
		String query = "insert into person values (?,?,?,?)";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, pvo.getMid());
			pstmt.setString(2, pvo.getPname());
			pstmt.setString(3, pvo.getPemail());
			pstmt.setString(4, pvo.getPphone());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	//기업 회원가입
	public int bSignUp(Connection conn, MemberVo vo) {
		int result = 0;
		String query = "insert into member values (?,?,2)";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,vo.getMid());
			pstmt.setString(2, vo.getMpw());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public int businessSignUp ( Connection conn, BusinessVo vo) {
		int result = 0;
		String query = "insert into business values (?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getBform());
			pstmt.setString(3, vo.getBrno());
			pstmt.setString(4, vo.getBizname());
			pstmt.setString(5, vo.getBaddress());
			pstmt.setString(6, vo.getBname());
			pstmt.setString(7, vo.getBtel());
			pstmt.setString(8, vo.getBemail());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
}
