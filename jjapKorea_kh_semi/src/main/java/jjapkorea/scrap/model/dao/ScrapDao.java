package jjapkorea.scrap.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import static jjapkorea.common.jdbc.JdbcTemplate.*;

import jjapkorea.scrap.model.dto.ScrapDto;

public class ScrapDao {
	public List<ScrapDto> scrapList(Connection conn, String mid){
		List<ScrapDto> result = null;
		String query = "select * from scrap join info using (jid) where mid=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt= getConnection().prepareStatement(query);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			result = new ArrayList<ScrapDto>();	
			while(rs.next()==true) {
				ScrapDto dto = new ScrapDto();
				dto.setMid(rs.getString("mid"));
				dto.setJid(rs.getString("jid"));
				
				result.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	public int scrap(Connection conn, ScrapDto vo) {
		int result = 0;
		String query = "insert into scrap values (?,?)";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getJid());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public int scrapCancle(Connection conn, ScrapDto vo) {
		int result = 0;
		String query = "delete from scrap where jid = ?";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, vo.getJid());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
}
