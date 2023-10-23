package kh.lclass.jjapkorea.person.model.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kh.lclass.jjapkorea.person.model.dao.MyPageDao;
import kh.lclass.jjapkorea.person.model.dto.ExperienceDto;

@Service
public class MyPageServiceImpl implements MyPageService{
	
	@Inject
	private MyPageDao dao;
	

	@Override
	public String getByWorkplace(String mid) {
		return dao.getByWorkplace(mid);
	}


//	@Override
//	public Date getByWorkperiod(String mid) {
//	    String dateString = dao.getByWorkperiod(mid); // 날짜를 String 형태로 받아옴
//	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); // 날짜 형식 지정
//	    try {
//	        return dateFormat.parse(dateString); // String을 Date로 파싱하여 반환
//	    } catch (ParseException e) {
//	        // 파싱 에러 발생 시 예외 처리
//	        e.printStackTrace();
//	        return null;
//	    }
//	}


	@Override
	public String getByWorkdetails(String mid) {
		return dao.getByWorkdetails(mid);
	}


//	@Override
//	public String findAccountByPname(String mid) {
//		return dao.findAccountByPname(mid);
//	}
//
//	
	
	
	

	
}
