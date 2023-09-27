package kh.lclass.jjapkorea.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.lclass.jjapkorea.member.model.dao.MemberDao;
import kh.lclass.jjapkorea.member.model.dto.BusinessDto;
import kh.lclass.jjapkorea.member.model.dto.MemberDto;
import kh.lclass.jjapkorea.member.model.dto.PersonDto;

@Service
@Transactional
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDao memberDao;
	
	@Override
	public MemberDto loginPerson(String mid, String mpw) throws Exception {
		return memberDao.loginPerson(mid, mpw);
	}
	
	@Override
	public MemberDto loginBusiness(String mid, String mpw) throws Exception {
		return memberDao.loginBusiness(mid, mpw);
	}
	
	@Override
	public void signUpMemberPerson(MemberDto memberDto, PersonDto personDto) throws Exception {
		memberDao.signUpMember(memberDto);
		memberDao.signUpPerson(personDto);
	}
	
	@Override
	public void signUpMemberBusiness(MemberDto memberDto, BusinessDto businessDto) throws Exception {
		memberDao.signUpMember(memberDto);
		memberDao.signUpBusiness(businessDto);
	}
	
	@Override
	public int checkInsertBusinessForm() throws Exception {
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