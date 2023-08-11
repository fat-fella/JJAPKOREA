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
		String query = "select * from SCRAP where mid=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt= getConnection().prepareStatement(query);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			result = new ArrayList<ScrapDto>();	
			while(rs.next()==true) {
				ScrapDto dto = new ScrapDto();
				dto.setJid(rs.getInt("jid"));
				dto.setMid(rs.getString("mid"));
				dto.setRecruitField(rs.getString("recruit_field"));
				dto.setCompanyName(rs.getString("company_name"));
				dto.setBusiNo(rs.getString("busino"));
				dto.setUserEducation(rs.getString("user_education"));
				dto.setSalary(rs.getString("salary"));
				dto.setMinSalary(rs.getString("min_salary"));
				dto.setMaxSalary(rs.getString("max_salary"));
				dto.setRegistDate(rs.getString("regist_date"));
				dto.setCloseDate(rs.getString("close_date"));
				dto.setReTitle(rs.getString("re_title"));
				dto.setCareer(rs.getString("career"));
				dto.setWorkType(rs.getString("work_type"));
				dto.setEmpTypeCode(rs.getString("emp_type_code"));
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
		String query = "insert into scrap values (seq_uno.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getRecruitField());
			pstmt.setString(3, vo.getCompanyName());
			pstmt.setString(4, vo.getBusiNo());
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
