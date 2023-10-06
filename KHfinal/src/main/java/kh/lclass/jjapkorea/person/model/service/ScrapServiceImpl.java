package kh.lclass.jjapkorea.person.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.lclass.jjapkorea.person.model.dao.ScrapDao;
import kh.lclass.jjapkorea.person.model.dto.ScrapDto;

@Service
public class ScrapServiceImpl implements ScrapService {
	@Autowired
	private ScrapDao scrapDao;
	
	@Override
	public int scrap(ScrapDto scrapDto) throws Exception {
		return scrapDao.scrap(scrapDto);
	}
	
	@Override
	public int scrapCancel(ScrapDto scrapDto) throws Exception {
		return scrapDao.scrapCancle(scrapDto);
	}
	
	@Override
	public List<Map<String, Object>> scrapList(String mid) throws Exception {
		return scrapDao.selectListScrap(mid);
	}
	
	@Override
	public String selectOneScrap(ScrapDto scrapDto) throws Exception{
		return scrapDao.selectOneScrap(scrapDto);
	}
}
