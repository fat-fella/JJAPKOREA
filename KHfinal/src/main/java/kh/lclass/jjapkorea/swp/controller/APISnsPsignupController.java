package kh.lclass.jjapkorea.swp.controller;

import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import kh.lclass.jjapkorea.swp.auth.SNSLogin;
import kh.lclass.jjapkorea.swp.auth.SnsValue;
import kh.lclass.jjapkorea.swp.domain.APISnsMember;
import kh.lclass.jjapkorea.swp.dto.APISnsLoginDTO;
import kh.lclass.jjapkorea.swp.interceptor.APISnsSessionNames;
import kh.lclass.jjapkorea.swp.service.APISnsMemberService;


@Controller
public class APISnsPsignupController {

	private static final Logger logger = LoggerFactory.getLogger(APISnsPsignupController.class);
	
	@Inject
	private APISnsMemberService service;
	
	@Inject
	private SnsValue naverSns;
	
	@Inject
	private SnsValue googleSns;
	
	@Inject
	private SnsValue kakaoSns;
	
	@Inject
	private GoogleConnectionFactory googleConnectionFactory;
	
	@Inject
	private OAuth2Parameters googleOAuth2Parameters;
	

	
	// API sns 가입 각각의 소셜 API 콜백 받음
	@RequestMapping(value = "/auth/psignup/{snsService}/callback", 
			method = { RequestMethod.GET, RequestMethod.POST})
	public String snsLoginCallback(@PathVariable String snsService,
			Model model, @RequestParam String code, HttpSession session) throws Exception {
		
		logger.info("snsLoginCallback: service={}", snsService);
		SnsValue sns = null;
	    if (StringUtils.equals("naver", snsService))
	        sns = naverSns;
	    else if (StringUtils.equals("google", snsService))
	        sns = googleSns;
	    else if (StringUtils.equals("kakao", snsService))
	        sns = kakaoSns; 
	    
		// 1. code를 이용해서 access_token 받기
		// 2. access_token을 이용해서 사용자 profile 정보 가져오기
		SNSLogin snsLogin = new SNSLogin(sns);
		
		APISnsMember snsMember = snsLogin.getUserProfile(code); // 1,2번 동시
		System.out.println("Profile>>" + snsMember);
		
	    // 3. DB 해당 유저가 존재하는 체크 (googleid, naverid, kakaoid 컬럼 추가)
		APISnsMember apiSnsMember = service.getBySns(snsMember);
		if (apiSnsMember == null) {
			model.addAttribute("result", "존재하지 않는 사용자입니다. 가입해 주세요.");
			
			//미존재시 가입페이지로!!
			
		} else {
			model.addAttribute("result", apiSnsMember.getMname() + "님 반갑습니다.");
			
			// 4. 존재시 강제로그인
			session.setAttribute(APISnsSessionNames.LOGIN, apiSnsMember);
		}
		
		
		return "apiSnsLoginResult";
	}
	
	@RequestMapping(value = "/psignuplogout", method = RequestMethod.GET)
	public String logout(HttpSession session, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("psignup logout GET .....");
		logger.debug("TTTTTTTTTTT My Own Code");
		logger.info("Master Edited!!");
		session.removeAttribute(APISnsSessionNames.LOGIN);
		session.invalidate();
		
		Cookie loginCookie = WebUtils.getCookie(request, APISnsSessionNames.LOGIN);
		if (loginCookie != null) {
			loginCookie.setPath("/");
			loginCookie.setMaxAge(0);
			
			response.addCookie(loginCookie);
			
			APISnsMember apiSnsMember = (APISnsMember)session.getAttribute(APISnsSessionNames.LOGIN);
			service.keepLogin(apiSnsMember.getMid(), session.getId(), new Date());
		}
		
		return "/psignup";
	}
	
	@RequestMapping(value = "/psignup", method = RequestMethod.GET)
	public String login(Model model) throws Exception {
		logger.info("login GET .....");
		
		SNSLogin snsLogin = new SNSLogin(naverSns);
		model.addAttribute("naver_url", snsLogin.getNaverAuthURL());
		
//		SNSLogin googleLogin = new SNSLogin(googleSns);
//		model.addAttribute("google_url", googleLogin.getNaverAuthURL());
		
		/* 구글code 발행을 위한 URL 생성 */
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
		model.addAttribute("google_url", url);
		
		
	    SNSLogin kakaoLogin = new SNSLogin(kakaoSns);
	    model.addAttribute("kakao_url", kakaoLogin.getKakaoAuthURL());
		
		
		return "member/psignup";
	}
	
	@RequestMapping(value = "/psignupPost", method = RequestMethod.POST)
	public void psignupPost(APISnsLoginDTO dto, Model model, HttpSession session) throws Exception {
		logger.info("psignupPost...LoginDTO={}", dto); 
		
		try {
			APISnsMember apiSnsMember = service.psignup(dto);
			if (apiSnsMember != null) {
				Date expire = new Date(System.currentTimeMillis() + APISnsSessionNames.EXPIRE * 1000);
				service.keepLogin(apiSnsMember.getMid(), session.getId(), expire);
				model.addAttribute("user", apiSnsMember);
				
			} else {
				model.addAttribute("apiSnsLoginResult", "Login Fail!!");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/psignuplogoutAjax", method=RequestMethod.GET)
	public ResponseEntity<String> logoutAjax(HttpServletRequest request, HttpServletResponse response, 
			HttpSession session) {
		logger.info("Logout Ajax>> " + session.getAttribute("loginUser"));
		session.removeAttribute("loginUser");
		
		APISnsMember apiSnsMember = (APISnsMember)session.getAttribute(APISnsSessionNames.LOGIN);
		if (apiSnsMember != null) {
			session.removeAttribute(APISnsSessionNames.LOGIN);
			session.invalidate();
			
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			if (loginCookie != null) {
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
			}
		}
		
		return new ResponseEntity<>("logouted", HttpStatus.OK);
	}
	
	@ResponseBody
	@RequestMapping(value = "/psignuploginAjax", method = RequestMethod.POST)
	public ResponseEntity<APISnsMember> loginAjax(@RequestBody APISnsLoginDTO dto, HttpSession session,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("psignupPost...LoginDTO={}", dto); 
		
		try {
			APISnsMember apiSnsMember = service.login(dto);
			if (apiSnsMember != null) { // login success
				apiSnsMember.setMpw(null);
				
				session.setAttribute("loginUser", apiSnsMember);
				
				Cookie loginCookie = new Cookie("loginCookie", session.getId());
				loginCookie.setPath("/");
				loginCookie.setMaxAge(7 * 24 * 60 * 60);
				
				response.addCookie(loginCookie);
				
				return new ResponseEntity<>(apiSnsMember, HttpStatus.OK);
				
			} else {
				return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
		}
	}
	
}