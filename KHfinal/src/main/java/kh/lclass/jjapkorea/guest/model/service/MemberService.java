package kh.lclass.jjapkorea.guest.model.service;

import kh.lclass.jjapkorea.guest.model.dto.BusinessDto;
import kh.lclass.jjapkorea.guest.model.dto.MemberDto;
import kh.lclass.jjapkorea.guest.model.dto.PersonDto;

public interface MemberService {
	MemberDto loginAdmin(MemberDto memberDto) throws Exception;
	MemberDto loginPerson(MemberDto memberDto) throws Exception;
	MemberDto loginBusiness(MemberDto memberDto) throws Exception;
	void signUpMemberAndPerson(MemberDto memberDto, PersonDto personDto) throws Exception;
	void signUpMemberAndBusiness(MemberDto memberDto, BusinessDto businessDto) throws Exception;
	int checkAndInsertBusinessForm() throws Exception;
	String selectOnePerson(String mid) throws Exception;
}
