package kh.lclass.jjapkorea.guest.model.service;

import java.util.List;
import java.util.Map;

import kh.lclass.jjapkorea.guest.model.dto.BusinessDto;
import kh.lclass.jjapkorea.guest.model.dto.MemberDto;
import kh.lclass.jjapkorea.guest.model.dto.PersonDto;

public interface MemberService {
	void signUpMemberAndPerson(MemberDto memberDto, PersonDto personDto) throws Exception;
	void signUpMemberAndBusiness(MemberDto memberDto, BusinessDto businessDto) throws Exception;
	int checkAndInsertBusinessForm() throws Exception;
	PersonDto selectOnePerson(String mid) throws Exception;
	void infoModifyMemberAndPerson(MemberDto memberDto, PersonDto personDto) throws Exception;
	int infoModifyMember(MemberDto memberDto) throws Exception;
	void cancelMemberAndPerson(String mid) throws Exception;
	void cancelMemberAndBusiness(String mid) throws Exception;
	String findAccountByNameAndPhone(PersonDto personDto) throws Exception;
	PersonDto findAccountByIdAndPhone(PersonDto personDto) throws Exception;
	List<Map<String, Object>> getBusinessWithBusinessform() throws Exception;
	Map<String, Object> getBusinessWithBusinessformByMid(String mid) throws Exception;
}
