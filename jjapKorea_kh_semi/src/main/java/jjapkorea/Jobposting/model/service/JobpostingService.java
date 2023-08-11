package jjapkorea.Jobposting.model.service;

import static jjapkorea.common.jdbc.JdbcTemplate.close;
import static jjapkorea.common.jdbc.JdbcTemplate.getConnection;

import java.sql.Connection;

import jjapkorea.Jobposting.model.dao.JobPostingDao;
import jjapkorea.Jobposting.model.dto.JobpostingDto;

public class JobpostingService {
	private JobPostingDao dao = new JobPostingDao();
	
	public int insert(JobpostingDto vo) {
		int result = 0;
		Connection conn = getConnection();
		result = dao.insert(conn, vo);
		close(conn);
		return result;
	}
}
