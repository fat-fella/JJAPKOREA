package kh.lclass.jjapkorea.member.model.service;

import kh.lclass.jjapkorea.member.model.dto.BusinessDto;
import kh.lclass.jjapkorea.member.model.dto.MemberDto;
import kh.lclass.jjapkorea.member.model.dto.PersonDto;

public interface MemberService {
	MemberDto loginAdmin(MemberDto memberDto) throws Exception;
	MemberDto loginPerson(MemberDto memberDto) throws Exception;
	MemberDto loginBusiness(MemberDto memberDto) throws Exception;
	void signUpMemberAndPerson(MemberDto memberDto, PersonDto personDto) throws Exception;
	void signUpMemberAndBusiness(MemberDto memberDto, BusinessDto businessDto) throws Exception;
	int checkAndInsertBusinessForm() throws Exception;
}
