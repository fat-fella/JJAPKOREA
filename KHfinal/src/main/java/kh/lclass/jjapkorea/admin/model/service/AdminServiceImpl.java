package kh.lclass.jjapkorea.admin.model.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.lclass.jjapkorea.admin.model.dao.AdminDao;
import kh.lclass.jjapkorea.admin.model.dto.AdminDto;
import kh.lclass.jjapkorea.admin.model.dto.DeclarationDto;
import kh.lclass.jjapkorea.board.model.dto.Criteria;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class AdminServiceImpl implements AdminService {
	
	private final AdminDao adminDao;
	
	@Override
	public List<AdminDto> memberList(Criteria cri) {
		return adminDao.memberList(cri);
	}
	
	@Override
	public List<AdminDto> personList(Criteria cri) {
		return adminDao.personList(cri);
	}
	
	@Override
	public List<AdminDto> businessList(Criteria cri) {
		return adminDao.businessList(cri);
	}
	
	@Override
	public List<AdminDto> suspendedList(Criteria cri) {
		return adminDao.suspendedList(cri);
	}

	@Override
	public List<AdminDto> suspendedPersonList(Criteria cri) {
		return adminDao.suspendedPersonList(cri);
	}

	@Override
	public List<AdminDto> suspendedBusinessList(Criteria cri) {
		return adminDao.suspendedBusinessList(cri);
	}
	
//	@Override
//	public List<AdminDto> adminList(Criteria cri) {
//		return adminDao.adminList(cri);
//	}

	@Override
	public String idSearch(String mid) {
		return adminDao.idSearch(mid);
	}
	
	@Override
	public void suspendedActive(String mid) {
		adminDao.suspendedActive(mid);
	}
	
	@Override
	public void suspendedClear(String mid) {
		adminDao.suspendedClear(mid);
	}
	
	@Override
	public int getTotal(Criteria cri) {
		return adminDao.getTotal(cri);
	}

	@Override
	public int getPersonTotal(Criteria cri) {
		return adminDao.getPersonTotal(cri);
	}

	@Override
	public int getBusinessTotal(Criteria cri) {
		return adminDao.getBusinessTotal(cri);
	}
	
	@Override
	public int getTotalActive(Criteria cri) {
		return adminDao.getTotalActive(cri);
	}

	@Override
	public int getPersonTotalActive(Criteria cri) {
		return adminDao.getPersonTotalActive(cri);
	}

	@Override
	public int getBusinessTotalActive(Criteria cri) {
		return adminDao.getBusinessTotalActive(cri);
	}
	
	@Override
	public int getTotalSuspended(Criteria cri) {
		return adminDao.getTotalSuspended(cri);
	}

	@Override
	public int getPersonTotalSuspended(Criteria cri) {
		return adminDao.getPersonTotalSuspended(cri);
	}

	@Override
	public int getBusinessTotalSuspended(Criteria cri) {
		return adminDao.getBusinessTotalSuspended(cri);
	}
	
	@Override
	public List<DeclarationDto> declarationWait(Criteria cri) {
		return adminDao.declarationWait(cri);
	}
	
	@Override
	public List<DeclarationDto> declarationComplete(Criteria cri) {
		return adminDao.declarationComplete(cri);
	}
	
	@Override
	public int getDeclarationWait(Criteria cri) {
		return adminDao.getDeclarationWait(cri);
	}
	
	@Override
	public int getDeclarationComplete(Criteria cri) {
		return adminDao.getDeclarationComplete(cri);
	}
	
	@Transactional
	@Override
	public int deleteBoard(int bno) {
		adminDao.deleteBoard(bno);
		adminDao.reportUpdate(bno);
		return 1;
	}
	
	
	@Override
	public AdminDto adminMypage(String adminId) {
		return adminDao.adminMypage(adminId);
	}
	
	@Override
	public int update(AdminDto vo) {
		return adminDao.update(vo);
	}
	
//	@Override
//	public int getTotalAdmin(Criteria cri) {
//		return adminDao.getTotalAdmin(cri);
//	}
	
	@Override
	public int reportBoard(DeclarationDto declarationDto) throws Exception {
		return adminDao.reportBoard(declarationDto);
	}
	
	@Override
	public List<DeclarationDto> reportsByUser(DeclarationDto declarationDto) throws Exception {
		return adminDao.reportsByUser(declarationDto);
	}
}
