package jjapkorea.scrap.model.service;

import static jjapkorea.common.jdbc.JdbcTemplate.*;

import java.sql.Connection;
import java.util.List;

import jjapkorea.scrap.model.dao.ScrapDao;
import jjapkorea.scrap.model.dto.ScrapDto;

public class ScrapService {
	private ScrapDao dao = new ScrapDao();
	
	public int scrap(ScrapDto vo) {
		int result = 0;
		Connection conn = getConnection();
		result = dao.scrap(conn, vo);
		close(conn);
		return result;
	}
	
	public List<ScrapDto> scrapList(String mid){
		List<ScrapDto> result = null;
		Connection conn = getConnection();
		result = dao.scrapList(conn, mid);
		close(conn);
		return result;
	}
}
