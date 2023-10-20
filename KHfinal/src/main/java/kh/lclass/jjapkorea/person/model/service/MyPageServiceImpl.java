package kh.lclass.jjapkorea.person.model.service;

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


	
}
