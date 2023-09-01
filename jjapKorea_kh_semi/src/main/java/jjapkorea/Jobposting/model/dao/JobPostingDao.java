package jjapkorea.Jobposting.model.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import jjapkorea.Jobposting.model.dto.JobpostingDto;

public class JobPostingDao {
//	public int insert(Connection conn, JobpostingDto vo) {
//		int result = 0;
//		String checkQuery = "SELECT COUNT(*) FROM info";
//		String insertQuery = "insert into info values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
//		PreparedStatement checkStmt = null;
//		PreparedStatement insertStmt = null;
//		try {
//			checkStmt = conn.prepareStatement(checkQuery);
//			insertStmt = conn.prepareStatement(insertQuery);
//			ResultSet rs = checkStmt.executeQuery();
//			if (rs.next() && rs.getString(1) != null) {
//				insertStmt.setString(1, vo.getJid());
//				insertStmt.setString(2, vo.getRecruitField());
//				insertStmt.setString(3, vo.getCompanyName());
//				insertStmt.setString(4, vo.getBusino());
//				insertStmt.setString(5, vo.getUserEducation());
//				insertStmt.setString(6, vo.getSalary());
//				insertStmt.setString(7, vo.getMinSalary());
//				insertStmt.setString(8, vo.getMaxSalary());
//				insertStmt.setString(9, vo.getRegistDate());
//				insertStmt.setString(10, vo.getCloseDate());
//				insertStmt.setString(11, vo.getReTitle());
//				insertStmt.setString(12, vo.getCareer());
//				insertStmt.setString(13, vo.getWorkType());
//				insertStmt.setString(14, vo.getEmpTypeCode());
//				insertStmt.setInt(15, vo.getToday());
//				insertStmt.setInt(16, vo.getDday());
//				result = insertStmt.executeUpdate();
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close(checkStmt);
//			close(insertStmt);
//		}
//		return result;
//	}
	public int insert(SqlSession session, JobpostingDto vo) {
		int result = session.insert("jobposting.insert", vo);
		return result;
	}
	
//	public List<JobpostingDto> list(Connection conn){
//		List<JobpostingDto> result = null;
//		String query = "select * from info";
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		try {
//			pstmt= getConnection().prepareStatement(query);
//			rs = pstmt.executeQuery();
//			result = new ArrayList<JobpostingDto>();	
//			while(rs.next()==true) {
//				JobpostingDto dto = new JobpostingDto();
//				dto.setJid(rs.getString("JID"));
//				dto.setRecruitField(rs.getString("RECRUIT_FIELD"));
//				dto.setCompanyName(rs.getString("COMPANY_NAME"));
//				dto.setBusino(rs.getString("BUSINO"));
//				dto.setUserEducation(rs.getString("USER_EDUCATION"));
//				dto.setSalary(rs.getString("SALARY"));
//				dto.setMinSalary(rs.getString("MIN_SALARY"));
//				dto.setMaxSalary(rs.getString("MAX_SALARY"));
//				dto.setRegistDate(rs.getString("REGIST_DATE"));
//				dto.setCloseDate(rs.getString("CLOSE_DATE"));
//				dto.setReTitle(rs.getString("RE_TITLE"));
//				dto.setCareer(rs.getString("CAREER"));
//				dto.setWorkType(rs.getString("WORK_TYPE"));
//				dto.setEmpTypeCode(rs.getString("EMP_TYPE_CODE"));
//				dto.setToday(rs.getInt("TODAY"));
//				dto.setDday(rs.getInt("DDAY"));
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
	public List<JobpostingDto> list(SqlSession session){
		List<JobpostingDto> result = session.selectList("jobposting.list");
		return result;
	}
}
