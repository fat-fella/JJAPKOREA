package kh.lclass.jjapkorea.guest.model.dao;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.lclass.jjapkorea.guest.model.dto.BusinessDto;
import kh.lclass.jjapkorea.guest.model.dto.BusinessFormDto;
import kh.lclass.jjapkorea.guest.model.dto.MemberDto;
import kh.lclass.jjapkorea.guest.model.dto.PersonDto;

@Repository
public class MemberDao {
	@Autowired
	private SqlSession sqlSession;
	
	public int signUpMember(MemberDto memberDto) throws Exception {
		return sqlSession.insert("member.signUpMember", memberDto);
	}
	
	public int signUpPerson(PersonDto personDto) throws Exception {
		return sqlSession.insert("person.signUpPerson", personDto);
	}
	
	public int signUpBusiness(BusinessDto businessDto) throws Exception {
		return sqlSession.insert("business.signUpBusiness", businessDto);
	}
	
	public int checkAndInsertBusinessForm() throws Exception {
		String namespace = "businessForm";
        String checkQuery = namespace + ".checkBusinessForm";
        int count = sqlSession.selectOne(checkQuery);
        if (count == 0) {
            String insertQuery = namespace + ".insertBusinessForm";
            List<String> list = Arrays.asList(
                "대기업", "대기업 계열사·자회사", "중소기업(300명이하)", "중견기업(300명이상)",
                "벤처기업", "외국계(외국 투자기업)", "외국계(외국 법인기업)", "국내 공공기관·공기업",
                "비영리단체·협회·교육재단", "외국 기관·비영리기구·단체"
            );
            for (int i = 0; i < list.size(); i++) {
                String name = list.get(i);
                sqlSession.insert(insertQuery, new BusinessFormDto(i + 1, name));
            }
            return list.size();
        } else {
        	return count;
        }
	}

	public PersonDto selectOnePerson(String mid) throws Exception {
		return sqlSession.selectOne("person.selectOnePerson", mid);
	}
	
	public int infoModifyMember(MemberDto memberDto) throws Exception {
		return sqlSession.update("member.infoModifyMember", memberDto);
	}
	
	public int infoModifyPerson(PersonDto personDto) throws Exception {
		return sqlSession.update("person.infoModifyPerson", personDto);
	}
	
	public int cancelMember(String mid) throws Exception {
		return sqlSession.delete("member.cancelMember", mid);
	}
	
	public int cancelPerson(String mid) throws Exception {
		return sqlSession.delete("person.cancelPerson", mid);
	}
	
	public int cancelBusiness(String mid) throws Exception {
		return sqlSession.delete("business.cancelBusiness", mid);
	}
	
	public String findAccountByNameAndPhone(PersonDto personDto) throws Exception {
		return sqlSession.selectOne("person.findAccountByNameAndPhone", personDto);
	}
	
	public PersonDto findAccountByIdAndPhone(PersonDto personDto) throws Exception {
		return sqlSession.selectOne("person.findAccountByIdAndPhone", personDto);
	}
	
	public List<Map<String, Object>> getBusinessWithBusinessform() throws Exception {
		return sqlSession.selectList("business.getBusinessWithBusinessform");
	}
	
	public Map<String, Object> getBusinessWithBusinessformByMid(String mid) throws Exception {
		return sqlSession.selectOne("business.getBusinessWithBusinessformByMid", mid);
	}
}
