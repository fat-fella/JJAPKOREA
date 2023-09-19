package kh.lclass.jjapkorea.swp.persistence;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kh.lclass.jjapkorea.swp.domain.APISnsMember;
import kh.lclass.jjapkorea.swp.dto.APISnsLoginDTO;


@Repository
public class APISnsUserDAOImpl implements APISnsUserDAO {

	@Inject
	private SqlSession session;
//JPA//JWT
	private static final String NS = "kh.lclass.jjapkorea.swp.persistence.apisnsmember-mapper";
	private static final String LOGIN = NS + ".login";
	private static final String KEEP_LOGIN = NS + ".keepLogin";
	private static final String CHECK_LOGIN_BEFORE = NS + ".checkLoginBefore";
	private static final String GET_BY_SNS_NAVER = NS + ".getBySnsNaver";
	private static final String GET_BY_SNS_GOOGLE = NS + ".getBySnsGoogle";
	private static final String GET_BY_SNS_KAKAO = NS + ".getBySnsKakao";

	@Override
	public APISnsMember login(APISnsLoginDTO dto) throws Exception {
		return session.selectOne(LOGIN, dto);
	}

	@Override
	public void keepLogin(String apimid, String sessionId, Date expire) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("apimid", apimid);
		paramMap.put("sessionkey", sessionId);
		paramMap.put("sessionlimit", expire);
		session.update(KEEP_LOGIN, paramMap);
	}

	@Override
	public APISnsMember checkLoginBefore(String loginCookie) {
		return session.selectOne(CHECK_LOGIN_BEFORE, loginCookie);
	}

	@Override
	public APISnsMember getBySns(APISnsMember snsUser) {
		
	    if (StringUtils.isNotEmpty(snsUser.getNaverid())) {
	        return session.selectOne(GET_BY_SNS_NAVER, snsUser.getNaverid());
	        
	    } else if (StringUtils.isNotEmpty(snsUser.getGoogleid())) {
	        return session.selectOne(GET_BY_SNS_GOOGLE, snsUser.getGoogleid());
	        
	    } else if (StringUtils.isNotEmpty(snsUser.getKakaoid())) {
	        return session.selectOne(GET_BY_SNS_KAKAO, snsUser.getKakaoid());
	        
	    }
	    
	    return null;
	}

}