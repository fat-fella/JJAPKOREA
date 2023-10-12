package kh.lclass.jjapkorea.person.model.service;

import java.util.List;
import java.util.Map;

import kh.lclass.jjapkorea.guest.model.dto.MemberDto;
import kh.lclass.jjapkorea.person.model.dto.ResumeMgrDto;

public interface ResumeMgrService {
	void signUpMemberAndInsertResumeWrite(MemberDto memberDto, ResumeMgrDto resumeMgrDto) throws Exception;
	List<Map<String, Object>> getResumeMgrWithPerson() throws Exception;
}
