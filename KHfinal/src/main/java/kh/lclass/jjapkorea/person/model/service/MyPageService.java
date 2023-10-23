package kh.lclass.jjapkorea.person.model.service;

import java.util.Date;

import kh.lclass.jjapkorea.person.model.dto.ExperienceDto;

public interface MyPageService {
	
	public String getByWorkplace(String mid);
//	public Date getByWorkperiod(String mid);
	public String getByWorkdetails(String mid);
//	public String findAccountByPname(String mid);
	
}
