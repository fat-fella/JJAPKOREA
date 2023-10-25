package kh.lclass.jjapkorea.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kh.lclass.jjapkorea.admin.model.dto.AdminDto;
import kh.lclass.jjapkorea.admin.model.dto.DeclarationDto;
import kh.lclass.jjapkorea.board.model.dto.Criteria;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class AdminDao {
	
	private final SqlSession sqlSession;
	
	public List<AdminDto> memberList(Criteria cri) {
		return sqlSession.selectList("admin.memberList", cri);
	}

	public List<AdminDto> personList(Criteria cri) {
		return sqlSession.selectList("admin.personList", cri);
	}
	
	public List<AdminDto> businessList(Criteria cri) {
		return sqlSession.selectList("admin.businessList", cri);
	}
	
	public List<AdminDto> suspendedList(Criteria cri) {
		return sqlSession.selectList("admin.suspendedList", cri);
	}

	public List<AdminDto> suspendedPersonList(Criteria cri) {
		return sqlSession.selectList("admin.suspendedPersonList", cri);
	}

	public List<AdminDto> suspendedBusinessList(Criteria cri) {
		return sqlSession.selectList("admin.suspendedBusinessList", cri);
	}
	
	public List<DeclarationDto> declarationWait(Criteria cri) {
		return sqlSession.selectList("admin.declarationWait", cri);
	}
	
	
	
	
	public List<DeclarationDto> declarationComplete(Criteria cri) {
		return sqlSession.selectList("admin.declarationComplete", cri);
	}
	
//	public List<AdminDto> adminList(Criteria cri) {
//		return sqlSession.selectList("admin.adminList", cri);
//	}
	
	public String idSearch(String mid) {
		return sqlSession.selectOne("admin.idSearch", mid);
	}
	
	public void suspendedActive(String mid) {
		sqlSession.update("admin.suspendedActive", mid);
	}
	
	public void suspendedClear(String mid) {
		sqlSession.update("admin.suspendedClear", mid);
	}
	
	// 전체 멤버 리스트
	public int getTotal(Criteria cri) {
		return sqlSession.selectOne("admin.getTotal", cri);
	}
	
	public int getPersonTotal(Criteria cri) {
		return sqlSession.selectOne("admin.getPersonTotal", cri);
	}
	
	public int getBusinessTotal(Criteria cri) {
		return sqlSession.selectOne("admin.getBusinessTotal", cri);
	}
	
	// 활성화된 멤버 리스트
	public int getTotalActive(Criteria cri) {
		return sqlSession.selectOne("admin.getTotalActive", cri);
	}
	
	public int getPersonTotalActive(Criteria cri) {
		return sqlSession.selectOne("admin.getPersonTotalActive", cri);
	}
	
	public int getBusinessTotalActive(Criteria cri) {
		return sqlSession.selectOne("admin.getBusinessTotalActive", cri);
	}
	
	// 정지된 멤버 리스트
	public int getTotalSuspended(Criteria cri) {
		return sqlSession.selectOne("admin.getTotalSuspended", cri);
	}
	
	public int getPersonTotalSuspended(Criteria cri) {
		return sqlSession.selectOne("admin.getPersonTotalSuspended", cri);
	}
	
	public int getBusinessTotalSuspended(Criteria cri) {
		return sqlSession.selectOne("admin.getBusinessTotalSuspended", cri);
	}
	
	public int getDeclarationWait(Criteria cri) {
		return sqlSession.selectOne("admin.getDeclarationWait", cri);
	}
	
	public int deleteBoard(int rno) {
		return sqlSession.delete("admin.deleteBoard", rno);
	}
	public int reportUpdate(int rno) {
		return sqlSession.update("admin.reportUpdate", rno);
	}
	
	public int getDeclarationComplete(Criteria cri) {
		return sqlSession.selectOne("admin.getDeclarationComplete", cri);
	}
	
	public AdminDto adminMypage(String adminId) {
		return sqlSession.selectOne("admin.adminMypage", adminId);
	}
	
	// 관리자 리스트
//	public int getTotalAdmin(Criteria cri) {
//		return sqlSession.selectOne("admin.getTotalAdmin", cri);
//	}
	
	public AdminDto selectOne(String adminId) {
		return sqlSession.selectOne("admin.selectOne", adminId);
	}
	public int insert(AdminDto vo) {
		return sqlSession.insert("admin.insert", vo);
	}
	public int update(AdminDto vo) {
		return sqlSession.update("admin.update", vo);
	}
	public int delete(String adminId) {
		return sqlSession.delete("admin.delete", adminId);
	}
	
	public int reportBoard(DeclarationDto declarationDto) throws Exception {
		return sqlSession.insert("declaration.reportBoard", declarationDto);
	}
	
	public List<DeclarationDto> reportsByUser(DeclarationDto declarationDto) throws Exception {
		return sqlSession.selectList("declaration.reportsByUser", declarationDto);
	}
 }
