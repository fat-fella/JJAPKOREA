package kh.lclass.jjapkorea.person.model.service;


import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.lclass.jjapkorea.business.model.dto.JobPostingDto;
import kh.lclass.jjapkorea.business.model.service.JobPostingService;
import kh.lclass.jjapkorea.person.model.dao.ScrapDao;
import kh.lclass.jjapkorea.person.model.dto.ScrapDto;

@Service
public class ScrapService {
	//private ScrapDao dao = new ScrapDao();
	@Autowired
	private ScrapDao scrapDao;
	
	@Autowired
	private JobPostingService jobpostingService;
	
//	public int scrap(ScrapDto vo) {
//		int result = 0;
//		Connection conn = getConnection();
//		result = dao.scrap(conn, vo);
//		close(conn);
//		return result;
//	}
	
//	public int scrap(ScrapDto vo) {
//		int result = 0;
//		SqlSession session = MybatisTemplate.getSqlSession();
//		result = dao.scrap(session, vo);
//		if(result>0) {
//			session.commit();
//		} else {
//			session.rollback();
//		}
//		session.close();
//		return result;
//	}
	
	@Transactional
	public int scrap(ScrapDto vo) throws Exception{
		return scrapDao.scrap(vo);
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
	
//	public List<ScrapDto> scrapList(String mid){
//		List<ScrapDto> result = null;
//		SqlSession session = MybatisTemplate.getSqlSession();
//		result = dao.scrapList(session, mid);
//		// 사용자가 스크랩한 채용 정보에 해당하는 JobpostingDto 객체들을 가져와서 ScrapDto에 추가
//		JobpostingService service = new JobpostingService();
//		for (ScrapDto scrapDto : result) {
//			List<JobpostingDto> jobPostingList = service.list();
//			List<JobpostingDto> matchedJobPostingList = new ArrayList<>();
//			for (JobpostingDto jobPostingDto : jobPostingList) {
//				if (scrapDto.getJid().equals(jobPostingDto.getJid())) {
//					matchedJobPostingList.add(jobPostingDto);
//				}
//			}
//			scrapDto.setJobPostingList(matchedJobPostingList);
//		}
//		session.close();
//		return result;
//	}
	
	public List<ScrapDto> scrapList(String mid) throws Exception{
		List<ScrapDto> result = scrapDao.scrapList(mid);
		for (ScrapDto scrapDto : result) {
			List<JobPostingDto> jobPostingList = jobpostingService.listJobPosting();
			List<JobPostingDto> matchedJobPostingList = new ArrayList<>();
			for (JobPostingDto jobPostingDto : jobPostingList) {
				if (scrapDto.getJid().equals(jobPostingDto.getJid())) {
					matchedJobPostingList.add(jobPostingDto);
				}
			}
			scrapDto.setJobPostingList(matchedJobPostingList);
		}
		return result;
	}
	
//	public int scrapCancle(ScrapDto vo) {
//		int result = 0;
//		Connection conn = getConnection();
//		result = dao.scrapCancle(conn, vo);
//		close(conn);
//		return result;
//	}
	
//	public int scrapCancle(ScrapDto vo) {
//		int result = 0;
//		SqlSession session = MybatisTemplate.getSqlSession();
//		result = dao.scrapCancle(session, vo);
//		if(result>0) {
//			session.commit();
//		} else {
//			session.rollback();
//		}
//		session.close();
//		return result;
//	}
	
	@Transactional
	public int scrapCancel(ScrapDto vo) throws Exception{
		return scrapDao.scrapCancle(vo);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
