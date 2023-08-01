package jjapkorea.member.model.dao;

import static jjapkorea.common.jdbc.JdbcTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jjapkorea.member.model.vo.MemberVo;

public class MemberDao {
	// 추가
		// login : 성공 :1, 실패시:0  --> 암호화 적용 힘든 방식
		public int login(Connection conn, MemberVo vo) {
			System.out.println("[Member Dao login] vo:" + vo);

			int result = 0;
			String query="select count(*) cnt from member where mid=? and mpw=?";
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, vo.getMid());
				pstmt.setString(2, vo.getMpw());
				rs = pstmt.executeQuery();
				if(rs.next()) {
					//result = rs.getInt(1);
					result = rs.getInt("cnt");
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			System.out.println("[Member Dao login] return:" + result);
			return result;
		}
		// login : mpwd를 return 함. id 존재하지 않으면 return null
		public String login(Connection conn, String mid) {
			System.out.println("[Member Dao login] mid:" + mid);

			String result = null;
			String query="select mpw from member where mid=?";
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, mid);
				rs = pstmt.executeQuery();
				if(rs.next()) {
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
