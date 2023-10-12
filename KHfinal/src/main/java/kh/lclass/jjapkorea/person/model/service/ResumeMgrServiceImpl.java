package kh.lclass.jjapkorea.person.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.lclass.jjapkorea.guest.model.dao.MemberDao;
import kh.lclass.jjapkorea.guest.model.dto.MemberDto;
import kh.lclass.jjapkorea.person.model.dao.ResumeMgrDao;
import kh.lclass.jjapkorea.person.model.dto.ResumeMgrDto;

@Service
@Transactional
public class ResumeMgrServiceImpl implements ResumeMgrService {
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private ResumeMgrDao resumeMgrDao;

	@Override
	public void signUpMemberAndInsertResumeWrite(MemberDto memberDto, ResumeMgrDto resumeMgrDto) throws Exception {
		memberDao.signUpMember(memberDto);
		
	}

	@Override
	public List<Map<String, Object>> getResumeMgrWithPerson() throws Exception {
		return resumeMgrDao.getResumeMgrWithPerson();
	}

}
