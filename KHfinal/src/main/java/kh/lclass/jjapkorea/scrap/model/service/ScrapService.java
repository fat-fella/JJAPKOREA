package kh.lclass.jjapkorea.scrap.model.service;


import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kh.lclass.jjapkorea.Jobposting.model.dto.JobpostingDto;
import kh.lclass.jjapkorea.Jobposting.model.service.JobpostingService;
import kh.lclass.jjapkorea.common.MybatisTemplate;
import kh.lclass.jjapkorea.scrap.model.dao.ScrapDao;
import kh.lclass.jjapkorea.scrap.model.dto.ScrapDto;

public class ScrapService {
	private ScrapDao dao = new ScrapDao();
	
//	public int scrap(ScrapDto vo) {
//		int result = 0;
//		Connection conn = getConnection();
//		result = dao.scrap(conn, vo);
//		close(conn);
//		return result;
//	}
	public int scrap(ScrapDto vo) {
		int result = 0;
		SqlSession session = MybatisTemplate.getSqlSession();
		result = dao.scrap(session, vo);
		session.close();
		return result;
	}
	
//	public List<ScrapDto> scrapList(String mid){
//		List<ScrapDto> result = null;
//		Connection conn = getConnection();
//		result = dao.scrapList(conn, mid);
//		// 사용자가 스크랩한 채용 정보에 해당하는 JobpostingDto 객체들을 가져와서 ScrapDto에 추가
//		JobpostingService service = new JobpostingService();
//	    for (ScrapDto scrapDto : result) {
//	        List<JobpostingDto> jobPostingList = service.list();
//	        List<JobpostingDto> matchedJobPostingList = new ArrayList<>();
//	        for (JobpostingDto jobPostingDto : jobPostingList) {
//	            if (scrapDto.getJid().equals(jobPostingDto.getJid())) {
//	            	matchedJobPostingList.add(jobPostingDto);
//	            }
//	        }
//	        scrapDto.setJobPostingList(matchedJobPostingList);
//	    }
//		close(conn);
//		return result;
//	}
	public List<ScrapDto> scrapList(String mid){
		List<ScrapDto> result = null;
		SqlSession session = MybatisTemplate.getSqlSession();
		result = dao.scrapList(session, mid);
		// 사용자가 스크랩한 채용 정보에 해당하는 JobpostingDto 객체들을 가져와서 ScrapDto에 추가
		JobpostingService service = new JobpostingService();
		for (ScrapDto scrapDto : result) {
			List<JobpostingDto> jobPostingList = service.list();
			List<JobpostingDto> matchedJobPostingList = new ArrayList<>();
			for (JobpostingDto jobPostingDto : jobPostingList) {
				if (scrapDto.getJid().equals(jobPostingDto.getJid())) {
					matchedJobPostingList.add(jobPostingDto);
				}
			}
			scrapDto.setJobPostingList(matchedJobPostingList);
		}
		session.close();
		return result;
	}
	
//	public int scrapCancle(ScrapDto vo) {
//		int result = 0;
//		Connection conn = getConnection();
//		result = dao.scrapCancle(conn, vo);
//		close(conn);
//		return result;
//	}
	public int scrapCancle(ScrapDto vo) {
		int result = 0;
		SqlSession session = MybatisTemplate.getSqlSession();
		result = dao.scrapCancle(session, vo);
		session.close();
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
