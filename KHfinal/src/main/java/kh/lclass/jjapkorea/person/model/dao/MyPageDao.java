package kh.lclass.jjapkorea.person.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kh.lclass.jjapkorea.board.model.dto.BoardDto;
import kh.lclass.jjapkorea.person.model.dto.ExperienceDto;

public interface MyPageDao {
	
	String getByWorkperiod(String mid);


	
	
}