package kh.lclass.jjapkorea.guest.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.lclass.jjapkorea.guest.model.dao.MemberDao;
import kh.lclass.jjapkorea.guest.model.dto.BusinessDto;
import kh.lclass.jjapkorea.guest.model.dto.MemberDto;
import kh.lclass.jjapkorea.guest.model.dto.PersonDto;

@Service
@Transactional
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDao memberDao;
	
	@Override
	public void signUpMemberAndPerson(MemberDto memberDto, PersonDto personDto) throws Exception {
		memberDao.signUpMember(memberDto);
		memberDao.signUpPerson(personDto);
	}
	
	@Override
	public void signUpMemberAndBusiness(MemberDto memberDto, BusinessDto businessDto) throws Exception {
		memberDao.signUpMember(memberDto);
		memberDao.signUpBusiness(businessDto);
	}
	
	@Override
	public int checkAndInsertBusinessForm() throws Exception {
		return memberDao.checkAndInsertBusinessForm();
	}
	
	@Override
	public PersonDto selectOnePerson(String mid) throws Exception {
		return memberDao.selectOnePerson(mid);
	}
	
	@Override
	public void infoModifyMemberAndPerson(MemberDto memberDto, PersonDto personDto) throws Exception {
		memberDao.infoModifyMember(memberDto);
		memberDao.infoModifyPerson(personDto);
	}
	
	@Override
	public int infoModifyMember(MemberDto memberDto) throws Exception {
		return memberDao.infoModifyMember(memberDto);
	}
	
	@Override
	public void cancelMemberAndPerson(String mid) throws Exception {
		memberDao.cancelPerson(mid);
		memberDao.cancelMember(mid);
	}
	
	@Override
	public void cancelMemberAndBusiness(String mid) throws Exception {
		memberDao.cancelBusiness(mid);
		memberDao.cancelMember(mid);
	}
	
	@Override
	public String findAccountByNameAndPhone(PersonDto personDto) throws Exception {
		return memberDao.findAccountByNameAndPhone(personDto);
	}
	
	@Override
	public PersonDto findAccountByIdAndPhone(PersonDto personDto) throws Exception {
		return memberDao.findAccountByIdAndPhone(personDto);
	}
}
