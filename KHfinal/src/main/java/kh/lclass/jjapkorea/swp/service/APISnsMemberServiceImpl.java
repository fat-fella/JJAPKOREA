package kh.lclass.jjapkorea.swp.service;

import java.util.Date;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kh.lclass.jjapkorea.swp.domain.APISnsMember;
import kh.lclass.jjapkorea.swp.dto.APISnsLoginDTO;
import kh.lclass.jjapkorea.swp.persistence.APISnsUserDAO;

@Service
public class APISnsMemberServiceImpl implements APISnsMemberService {
	
	@Inject
	private APISnsUserDAO dao;

	@Override
	public APISnsMember login(APISnsLoginDTO dto) throws Exception {
		return dao.login(dto);
	}

	@Override
	public void keepLogin(String apimid, String sessionId, Date expire) {
		dao.keepLogin(apimid, sessionId, expire);
	}

	@Override
	public APISnsMember checkLoginBefore(String loginCookie) {
		return dao.checkLoginBefore(loginCookie);
	}

	@Override
	public APISnsMember getBySns(APISnsMember snsUser) {
		return dao.getBySns(snsUser);
	}

	@Override
	public APISnsMember psignup(APISnsLoginDTO dto) throws Exception {
		return dao.login(dto);
	}
	
}