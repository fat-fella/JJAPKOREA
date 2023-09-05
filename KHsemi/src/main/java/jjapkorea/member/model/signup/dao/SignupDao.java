package jjapkorea.member.model.signup.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import jjapkorea.member.model.vo.MemberVo;

public class SignupDao {
	public List<MemberVo> memberSignUp(Connection conn, String setMid, String setMpw){
		List<MemberVo> result = null;
		String query = "insert into member values ('?','?','1')";
		
		Statement stmt = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try {
			pstmt = conn.prepareStatement(query);
			
			
			pstmt.setString(1, setMid);
			pstmt.setString(2, setMpw);
			
			
			rs = pstmt.executeQuery();
			
			result= new ArrayList<MemberVo>();

			MemberVo vo = new MemberVo();
			vo.setMid(setMid);
			vo.setMpw(setMpw);
			vo.setMtype(1);
			
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs!=null)
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			if(pstmt!=null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		
		
		return result;
		
	}
}
