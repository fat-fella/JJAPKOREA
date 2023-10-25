package kh.lclass.jjapkorea.admin.model.service;

import java.util.List;

import kh.lclass.jjapkorea.admin.model.dto.AdminDto;
import kh.lclass.jjapkorea.admin.model.dto.DeclarationDto;
import kh.lclass.jjapkorea.board.model.dto.Criteria;


public interface AdminService {
	List<AdminDto> memberList(Criteria cri);
	List<AdminDto> personList(Criteria cri);
	List<AdminDto> businessList(Criteria cri);
	
	List<AdminDto> suspendedList(Criteria cri);
	List<AdminDto> suspendedPersonList(Criteria cri);
	List<AdminDto> suspendedBusinessList(Criteria cri);
//	List<AdminDto> adminList(Criteria cri);
	String idSearch(String mid);
	void suspendedActive(String mid);
	void suspendedClear(String mid);
	
	int getTotal(Criteria cri);
	int getPersonTotal(Criteria cri);
	int getBusinessTotal(Criteria cri);
	
	int getTotalActive(Criteria cri);
	int getPersonTotalActive(Criteria cri);
	int getBusinessTotalActive(Criteria cri);
	
	int getTotalSuspended(Criteria cri);
	int getPersonTotalSuspended(Criteria cri);
	int getBusinessTotalSuspended(Criteria cri);
	
	List<DeclarationDto> declarationWait(Criteria cri);
	List<DeclarationDto> declarationComplete(Criteria cri);
	
	int getDeclarationWait(Criteria cri);
	int getDeclarationComplete(Criteria cri);
	
	int deleteBoard(int bno);
	
	
	AdminDto adminMypage(String adminId);
	int update(AdminDto vo);
	
//	int getTotalAdmin(Criteria cri);
	
	int reportBoard(DeclarationDto declarationDto) throws Exception;
	List<DeclarationDto> reportsByUser(DeclarationDto declarationDto) throws Exception;
}
