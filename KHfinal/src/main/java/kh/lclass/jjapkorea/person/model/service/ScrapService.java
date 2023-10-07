package kh.lclass.jjapkorea.person.model.service;

import java.util.List;
import java.util.Map;

import kh.lclass.jjapkorea.person.model.dto.ScrapDto;

public interface ScrapService {
	int scrap(ScrapDto scrapDto) throws Exception;
	int scrapCancel(ScrapDto scrapDto) throws Exception;
	List<Map<String, Object>> getJobPostingsWithScrapBusinessInfo(String mid) throws Exception;
	List<ScrapDto> selectListScrap(String mid) throws Exception;
}
