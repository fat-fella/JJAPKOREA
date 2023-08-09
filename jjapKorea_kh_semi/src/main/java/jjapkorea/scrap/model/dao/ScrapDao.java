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
	public List<ScrapDto> scrapList(Connection conn){
		List<ScrapDto> result = null;
		String query = "select * from SCRAP";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt= conn.prepareStatement(query);
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
	};
}
