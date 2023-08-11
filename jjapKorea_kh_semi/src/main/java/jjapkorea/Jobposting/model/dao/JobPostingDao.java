package jjapkorea.Jobposting.model.dao;

import static jjapkorea.common.jdbc.JdbcTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jjapkorea.Jobposting.model.dto.JobpostingDto;

public class JobPostingDao {
	public int insert(Connection conn, JobpostingDto vo) {
		int result = 0;
		String query = "insert into info values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, vo.getJid());
			pstmt.setString(2, vo.getRecruitField());
			pstmt.setString(3, vo.getCompanyName());
			pstmt.setString(4, vo.getBusino());
			pstmt.setString(5, vo.getUserEducation());
			pstmt.setString(6, vo.getSalary());
			pstmt.setString(7, vo.getMinSalary());
			pstmt.setString(8, vo.getMaxSalary());
			pstmt.setString(9, vo.getRegistDate());
			pstmt.setString(10, vo.getCloseDate());
			pstmt.setString(11, vo.getReTitle());
			pstmt.setString(12, vo.getCareer());
			pstmt.setString(13, vo.getWorkType());
			pstmt.setString(14, vo.getEmpTypeCode());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
}
