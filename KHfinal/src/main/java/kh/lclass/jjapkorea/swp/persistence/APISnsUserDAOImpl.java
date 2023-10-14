package kh.lclass.jjapkorea.swp.persistence;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import kh.lclass.jjapkorea.swp.domain.APISnsMember;
import kh.lclass.jjapkorea.swp.dto.APISnsLoginDTO;
import kh.lclass.jjapkorea.swp.dto.APISnsSignUpDTO;
import kh.lclass.jjapkorea.swp.interceptor.APISnsSessionNames;


@Repository
public class APISnsUserDAOImpl implements APISnsUserDAO {

	@Autowired
	private HttpSession httpSession; 
	
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
	private static final String SIGNUP_SNS = NS + ".signupSns";
	@Override
	public APISnsMember login(APISnsLoginDTO dto) throws Exception {
		return session.selectOne(LOGIN, dto);
	}
	
	@Override // login과 signup 똥일하게 소셜서비스 아이콘 버튼을 누르면 회원가입이 안되어있을시 자동으로 회원가입진행됨 
	public APISnsMember signup(APISnsSignUpDTO dto) throws Exception {
		return session.selectOne(LOGIN, dto);
	}


	// SNSAPI 로그인 유지하는 작업 수행
    // sqlSession을 사용하여 데이터베이스 업데이트 작업을 수행
	@Override
	public void keepLogin(String mid, String sessionId, Date expire) {
		System.out.println(" [mj] SNSAPI 로그인 유지하는 작업 수행 [1] mid : " +  mid);
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("mid", mid);  // 
		paramMap.put("sessionkey", sessionId);
		paramMap.put("sessionlimit", expire);
		session.update(KEEP_LOGIN, paramMap);
	}

	@Override
	public APISnsMember checkLoginBefore(String loginCookie) {
		System.out.println(" [mj] [2] : loginCookie ");
		return session.selectOne(CHECK_LOGIN_BEFORE, loginCookie);
	}

	@Override
	@Transactional
	public APISnsMember getBySns(APISnsMember snsUser) {
		System.out.println(" [mj] [3] : sns 검증 완료 ");
		System.out.println(snsUser);  
		APISnsMember result  =  null;
		
	    if (StringUtils.isNotEmpty(snsUser.getNaverid())) {
	    	result = session.selectOne(GET_BY_SNS_NAVER, snsUser.getNaverid());
	    	
	        if(result == null) {
	        	session.insert(SIGNUP_SNS, snsUser);
	        	System.out.println("[API SNS LOGIN] Naverid 짭 테이블에 저장함. DB 확인요망");
	        	   // 중복된 경우 강제로 로그인하고 세션에 사용자 정보 설정
	            httpSession.setAttribute(APISnsSessionNames.LOGIN, snsUser);
	        }
	        return session.selectOne(GET_BY_SNS_NAVER, snsUser.getNaverid());

	        
	    } else if (StringUtils.isNotEmpty(snsUser.getGoogleid())) {
	    	result = session.selectOne(GET_BY_SNS_GOOGLE, snsUser.getGoogleid());

	    	  if(result == null) {
		        	session.insert(SIGNUP_SNS, snsUser);
		        	System.out.println("[API SNS LOGIN] Googleid짭 테이블에 저장함. DB 확인요망");
		        	   // 중복된 경우 강제로 로그인하고 세션에 사용자 정보 설정
		            httpSession.setAttribute(APISnsSessionNames.LOGIN, snsUser);
		        }
	    	  
	        return session.selectOne(GET_BY_SNS_GOOGLE, snsUser.getGoogleid());
	        
	    } else if (StringUtils.isNotEmpty(snsUser.getKakaoid())) {
	    	result = session.selectOne(GET_BY_SNS_KAKAO, snsUser.getKakaoid());

	    	
	    	  if(result == null) {
		        	session.insert(SIGNUP_SNS, snsUser);
		        	System.out.println("[API SNS LOGIN] Kakaoid짭 테이블에 저장함. DB 확인요망");
		        	   // 중복된 경우 강제로 로그인하고 세션에 사용자 정보 설정
		            httpSession.setAttribute(APISnsSessionNames.LOGIN, snsUser);
		        }
	        return session.selectOne(GET_BY_SNS_KAKAO, snsUser.getKakaoid());

	        
	    }
	    
	    return null;
	}

}