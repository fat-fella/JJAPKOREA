package kh.lclass.jjapkorea.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.lclass.jjapkorea.member.model.dao.MemberDao;
import kh.lclass.jjapkorea.member.model.dto.BusinessDto;
import kh.lclass.jjapkorea.member.model.dto.MemberDto;
import kh.lclass.jjapkorea.member.model.dto.PersonDto;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDao memberDao;
	
	@Override
	public MemberDto loginPerson(String mid) {
		return memberDao.loginPerson(mid);
	}
	
	@Override
	public MemberDto loginBusiness(String mid) {
		return memberDao.loginBusiness(mid);
	}
	
	@Override
	public int signUpMember(MemberDto memberDto) {
		return memberDao.signUpMember(memberDto);
	}
	
	@Override
	public int signUpPerson(PersonDto personDto) {
		return memberDao.signUpPerson(personDto);
	}
	
	@Override
	public int signUpBusiness(BusinessDto businessDto) {
		return memberDao.signUpBusiness(businessDto);
	}
	
	@Override
	public int deleteMember(String mid) {
		return memberDao.deleteMember(mid);
	}
	
	@Override
	public int checkInsertBusinessForm() {
		return memberDao.checkInsertBusinessForm();
	}
	
//	public String indexLogin(String mid) {
//		String result = null;
//		SqlSession session = MybatisTemplate.getSqlSession();
//		result = dao.indexLogin(session, mid);
//		session.close();
//		return result;
//	}
}