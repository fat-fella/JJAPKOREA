package kh.lclass.jjapkorea.member.model.dao;

import java.util.Arrays;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.lclass.jjapkorea.member.model.dto.BusinessDto;
import kh.lclass.jjapkorea.member.model.dto.BusinessFormDto;
import kh.lclass.jjapkorea.member.model.dto.MemberDto;
import kh.lclass.jjapkorea.member.model.dto.PersonDto;

@Repository
public class MemberDao {
	@Autowired
	private SqlSession sqlSession;
	
	public MemberDto loginPerson(String mid) {
		return sqlSession.selectOne("member.loginPerson", mid);
	}
	
	public MemberDto loginBusiness(String mid) {
		return sqlSession.selectOne("member.loginBusiness", mid);
	}
	
	public int signUpMember(MemberDto memberDto) {
		return sqlSession.insert("member.signUpMember", memberDto);
	}
	
	public int signUpPerson(PersonDto personDto) {
		return sqlSession.insert("person.signUpPerson", personDto);
	}
	
	public int signUpBusiness(BusinessDto businessDto) {
		return sqlSession.insert("business.signUpBusiness", businessDto);
	}
	
	public int deleteMember(String mid) {
		return sqlSession.delete("member.deleteMember", mid);
	}

	public int checkInsertBusinessForm() {
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

//	public String indexLogin(SqlSession session, String mid) {
//		String result = null;
//		try {
//			result = session.selectOne("person.indexLogin", mid);
//		} catch(Exception e) {
//			e.printStackTrace();
//		}
//		return result;
//	}
}
