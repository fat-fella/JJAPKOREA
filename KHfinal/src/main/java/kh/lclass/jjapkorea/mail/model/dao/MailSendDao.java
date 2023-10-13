package kh.lclass.jjapkorea.mail.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.lclass.jjapkorea.mail.model.dto.MailSendDto;

@Repository
public class MailSendDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public String selectEmail(MailSendDto dto) {
		return sqlSession.selectOne("mailSend.selectEmail", dto);
	}
	
}
