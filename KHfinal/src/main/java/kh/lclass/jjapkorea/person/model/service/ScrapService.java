package kh.lclass.jjapkorea.person.model.service;

import java.util.List;
import java.util.Map;

import kh.lclass.jjapkorea.person.model.dto.ScrapDto;

public interface ScrapService {
	int scrap(ScrapDto scrapDto) throws Exception;
	int scrapCancel(ScrapDto vo) throws Exception;
	boolean isScrapped(String mid, String jid) throws Exception;
	List<Map<String, Object>> scrapList(String mid) throws Exception;
}
