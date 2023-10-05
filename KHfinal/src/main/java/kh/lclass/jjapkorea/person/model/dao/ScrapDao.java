package kh.lclass.jjapkorea.person.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.lclass.jjapkorea.person.model.dto.ScrapDto;

@Repository
public class ScrapDao {
	@Autowired
	private SqlSession sqlSession;
	
	public int scrap(ScrapDto scrapDto) throws Exception{
		return sqlSession.insert("scrap.scrap", scrapDto);
	}

	public int scrapCancle(ScrapDto scrapDto) throws Exception{
		return sqlSession.delete("scrap.scrapCancle", scrapDto);
	}
	
	public List<Map<String, Object>> selectListScrap(String mid) throws Exception{
		return sqlSession.selectList("scrap.selectListScrap");
	}
}
