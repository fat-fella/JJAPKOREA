package kh.lclass.jjapkorea.person.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.lclass.jjapkorea.person.model.dto.ScrapDto;

@Repository
public class ScrapDao {
	@Autowired
	private SqlSession sqlSession;
	
//	public List<ScrapDto> scrapList(Connection conn, String mid){
//		List<ScrapDto> result = null;
//		String query = "select * from scrap join info using (jid) where mid=?";
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		try {
//			pstmt= getConnection().prepareStatement(query);
//			pstmt.setString(1, mid);
//			rs = pstmt.executeQuery();
//			result = new ArrayList<ScrapDto>();	
//			while(rs.next()==true) {
//				ScrapDto dto = new ScrapDto();
//				dto.setMid(rs.getString("mid"));
//				dto.setJid(rs.getString("jid"));
//				
//				result.add(dto);
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close(rs);
//			close(pstmt);
//		}
//		return result;
//	}
	
//	public List<ScrapDto> scrapList(SqlSession session, String mid){
//		List<ScrapDto> result = null;
//		try {
//			result = session.selectList("scrap.scrapList" ,mid);
//		} catch(Exception e) {
//			e.printStackTrace();
//		}
//		return result;
//	}
	public List<ScrapDto> scrapList(String mid) throws Exception{
		return sqlSession.selectList("scrap.scrapList" ,mid);
	}

//	public int scrap(Connection conn, ScrapDto vo) {
//		int result = 0;
//		String query = "insert into scrap values (?,?)";
//		PreparedStatement pstmt = null;
//		try {
//			pstmt = conn.prepareStatement(query);
//			pstmt.setString(1, vo.getMid());
//			pstmt.setString(2, vo.getJid());
//			//result = pstmt.executeUpdate();
//			// 중복된 데이터인지 확인
//	        if (!isScrapped(conn, vo.getMid(), vo.getJid())) {
//	            result = pstmt.executeUpdate();
//	        }
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close(pstmt);
//		}
//		return result;
//	}
	
//	public int scrap(SqlSession session, ScrapDto vo) {
//		int result = 0;
//		try {
//			result = session.insert("scrap.insertScrap", vo);
//		} catch(Exception e) {
//			e.printStackTrace();
//		}
//		return result;
//	}
	public int scrap(ScrapDto vo) throws Exception{
		return sqlSession.insert("scrap.insertScrap", vo);
	}
	
//	public int scrapCancle(Connection conn, ScrapDto vo) {
//		int result = 0;
//		String query = "delete from scrap where jid = ?";
//		PreparedStatement pstmt = null;
//		try {
//			pstmt = conn.prepareStatement(query);
//			pstmt.setString(1, vo.getJid());
//			result = pstmt.executeUpdate();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close(pstmt);
//		}
//		return result;
//	}
	
//	public int scrapCancle(SqlSession session, ScrapDto vo) {
//		int result = 0;
//		try {
//			result = session.delete("scrap.scrapCancle", vo);
//		} catch(Exception e) {
//			e.printStackTrace();
//		}
//		return result;
//	}

	public int scrapCancle(ScrapDto vo) throws Exception{
		return sqlSession.delete("scrap.scrapCancle", vo);
	}
	
//	private boolean isScrapped(Connection conn, String mid, String jid) throws SQLException {
//	    String query = "SELECT COUNT(*) FROM scrap WHERE mid = ? AND jid = ?";
//	    PreparedStatement pstmt = null;
//	    ResultSet rs = null;
//	    try {
//	        pstmt = conn.prepareStatement(query);
//	        pstmt.setString(1, mid);
//	        pstmt.setString(2, jid);
//	        rs = pstmt.executeQuery();
//	        if (rs.next()) {
//	            int count = rs.getInt(1);
//	            return count > 0;
//	        }
//	    } finally {
//	        close(rs);
//	        close(pstmt);
//	    }
//	    return false;
//	}
//<--------------- isScrapped --------------->	
//	private boolean isScrapped(SqlSession session, String mid, String jid) throws SQLException {
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("mid", mid);
//		map.put("jid", jid);
//		int count = 0;
//		try {
//			count = session.selectOne("scrap.isScrapped", map);
//		} catch(Exception e) {
//			e.printStackTrace();
//		}
//        return count > 0; // 0이 아니면 true, 0이면 false 반환
//    }
	
	public boolean isScrapped(String mid, String jid) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mid", mid);
		map.put("jid", jid);
		int count = 0;
		count = sqlSession.selectOne("scrap.isScrapped", map);
		return count > 0;
	}
}
