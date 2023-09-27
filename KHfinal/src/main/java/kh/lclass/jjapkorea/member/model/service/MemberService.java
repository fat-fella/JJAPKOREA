package kh.lclass.jjapkorea.member.model.service;

import kh.lclass.jjapkorea.member.model.dto.BusinessDto;
import kh.lclass.jjapkorea.member.model.dto.MemberDto;
import kh.lclass.jjapkorea.member.model.dto.PersonDto;

public interface MemberService {
	MemberDto loginPerson(String mid) throws Exception;
	MemberDto loginBusiness(String mid) throws Exception;
	void signUpMemberPerson(MemberDto memberDto, PersonDto personDto) throws Exception;
	void signUpMemberBusiness(MemberDto memberDto, BusinessDto businessDto) throws Exception;
	int checkInsertBusinessForm() throws Exception;
}
