package jjapkorea.scrap.model.service;
import static jjapkorea.common.jdbc.JdbcTemplate.*;
import java.sql.Connection;
import java.util.List;

import jjapkorea.scrap.model.dao.ScrapDao;
import jjapkorea.scrap.model.dto.ScrapDto;

public class ScrapService {
	private ScrapDao dao = new ScrapDao();
	public List<ScrapDto> scrapList(){
		List<ScrapDto> result = null;
		Connection conn = getConnection();
		result = dao.scrapList(conn);
		close(conn);
		return result;
	}
}
