package jjapkorea.member.model.dao;

import static jjapkorea.common.jdbc.JdbcTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
	public int personSignup(Connection conn, PersonVo vo) {
		int result = 0;
		String query = "insert into person values (?,?,?,?)";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getPname());
			pstmt.setString(3, vo.getPemail());
			pstmt.setString(4, vo.getPphone());
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
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getMpw());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public void insert(Connection conn) {
		String checkQuery = "SELECT COUNT(*) FROM businessform";
		String insertQuery = "INSERT INTO businessform VALUES (?, ?)";
		List<String> list = new ArrayList<String>();
		if(list.size() == 0) {
			list.add("대기업");
		    list.add("대기업 계열사·자회사");
		    list.add("중소기업(300명이하)");
		    list.add("중견기업(300명이상)");
		    list.add("벤처기업");
		    list.add("외국계(외국 투자기업)");
		    list.add("외국계(외국 법인기업)");
		    list.add("국내 공공기관·공기업");
		    list.add("비영리단체·협회·교육재단");
		    list.add("외국 기관·비영리기구·단체");
		}
		PreparedStatement checkStmt = null;
	    PreparedStatement insertStmt = null;
		try {
	        checkStmt = conn.prepareStatement(checkQuery);
	        ResultSet rs = checkStmt.executeQuery();
	        if (rs.next() && rs.getInt(1) == 0) {
	            insertStmt = conn.prepareStatement(insertQuery);
	            for (int i = 0; i < list.size(); i++) {
	                insertStmt.setInt(1, i + 1);
	                insertStmt.setString(2, list.get(i));
	                insertStmt.executeUpdate();
	            }
	        }
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(checkStmt);
			close(insertStmt);
		}
	}
	public int businessSignUp ( Connection conn, BusinessVo vo) {
		int result = 0;
		String query = "insert into business (mid,bform,brno,bizname,brep_name,baddress,bname,btel,bemail) values (?,?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getBform());
			pstmt.setString(3, vo.getBrno());
			pstmt.setString(4, vo.getBizname());
			pstmt.setString(5, vo.getBrepName());
			pstmt.setString(6, vo.getBaddress());
			pstmt.setString(7, vo.getBname());
			pstmt.setString(8, vo.getBtel());
			pstmt.setString(9, vo.getBemail());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public int delete(Connection conn, String mid) {
		int result = 0;
		String query = "delete from member where mid = ?";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, mid);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
}
