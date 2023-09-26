package kh.lclass.jjapkorea.member.model.service;

import kh.lclass.jjapkorea.member.model.dto.BusinessDto;
import kh.lclass.jjapkorea.member.model.dto.MemberDto;
import kh.lclass.jjapkorea.member.model.dto.PersonDto;

public interface MemberService {
	MemberDto loginPerson(String mid) throws Exception;
	MemberDto loginBusiness(String mid) throws Exception;
	int signUpMember(MemberDto memberDto) throws Exception;
	int signUpPerson(PersonDto personDto) throws Exception;
	int signUpBusiness(BusinessDto businessDto) throws Exception;
	int deleteMember(String mid) throws Exception;
	int checkInsertBusinessForm() throws Exception;
}
