package kh.lclass.jjapkorea.guest.controller;

import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import kh.lclass.jjapkorea.guest.model.service.MemberService;
import kh.lclass.jjapkorea.swp.auth.SNSLogin;
import kh.lclass.jjapkorea.swp.auth.SnsValue;
import kh.lclass.jjapkorea.swp.domain.APISnsMember;
import kh.lclass.jjapkorea.swp.dto.APISnsLoginDTO;
import kh.lclass.jjapkorea.swp.interceptor.APISnsSessionNames;
import kh.lclass.jjapkorea.swp.service.APISnsMemberService;

	   
	@Controller
	public class LoginController{

		@Autowired MemberService memberService;
		
		
		   
//		@GetMapping("/login")
//		public String login() throws Exception {
//			return "member/login";
//	    }
		
		
		@GetMapping({"/login", "/login/"})
		public String login(Model model) throws Exception {
			logger.info("login GET .....");
			
			SNSLogin snsLogin = new SNSLogin(naverSns);
			model.addAttribute("naver_url", snsLogin.getNaverAuthURL());
			
//			SNSLogin googleLogin = new SNSLogin(googleSns);
//			model.addAttribute("google_url", googleLogin.getNaverAuthURL());
			
			/* 구글code 발행을 위한 URL 생성 */
			OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
			String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
			model.addAttribute("google_url", url);
			
			
		    SNSLogin kakaoLogin = new SNSLogin(kakaoSns);
		    model.addAttribute("kakao_url", kakaoLogin.getKakaoAuthURL());
			
			
			return "member/login";
		}
		
		private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
		
	    // 기존 LoginController의 코드
		
//		@Controller
//		@RequestMapping("/login")
//		public class LoginController {
	//	
//			@Autowired
//			MemberService memberService;
//			
		@GetMapping("/admin")
		public String loginAdmin() throws Exception {
			return "member/loginAdmin";
		}
		
		
//		public static class APISnsMemberController {
		
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
		
		@Autowired
		private BCryptPasswordEncoder bCryptPasswordEncoder; // 시큐리티 암호화
		
		
		// API sns login 각각의 소셜 API 콜백 받음
			@GetMapping("/auth/{snsService}/callback")
		public String snsLoginCallback(@PathVariable String snsService,
				Model model, @RequestParam String code, HttpSession session) throws Exception {
			
			SnsValue sns = null;
		    if (StringUtils.equals("naver", snsService))
		        sns = naverSns;
		    else if (StringUtils.equals("google", snsService))
		        sns = googleSns;
		    else if (StringUtils.equals("kakao", snsService))
		        sns = kakaoSns; 
		    System.out.println("▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦ [mj] SNS API LOGIN 분기 진입 ▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦ naverSns: " + naverSns);
		    System.out.println("▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦ [mj] SNS API LOGIN 분기 진입 ▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦ kakaoSns: " + kakaoSns);
		    System.out.println("▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦ [mj] SNS API LOGIN 분기 진입 ▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦ googleSns: " + googleSns);

		    
			// 1. code를 이용해서 access_token 받기
			// 2. access_token을 이용해서 사용자 profile 정보 가져오기
			SNSLogin snsLogin = new SNSLogin(sns);

			
			APISnsMember snsUser = snsLogin.getUserProfile(code); // 1,2번 동시
			System.out.println(" [mj] SNS API LOGIN 분기 진입 ▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦ APISnsMember snsUser [1]: " + snsUser);
			if (snsUser.getEmail() != null) {
				System.out.println(" [mj] [2]: " + snsUser);

				String[] emailParts = snsUser.getEmail().split("@");
				if (emailParts.length > 0) {
		        String mid = emailParts[0];
		        snsUser.setMid(mid);
				System.out.println(" [mj] SNS API LOGIN 분기 진입 ▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦ mid: " + mid);
				
				//api login 최초 비밀번호는 email @ 앞쪽의 id가 최초 비밀번호로 암호회되어서 생성됨
			    String[] emailParts2 = snsUser.getEmail().split("@");
			    if (emailParts.length > 0) {
			        String mpw = emailParts[0];
			        snsUser.setMpw(bCryptPasswordEncoder.encode(mpw)); // mpw를 BCrypt로 해싱
			        System.out.println(" [mj] SNS API LOGIN 분기 진입 ▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦ mpw: " + mpw);
			    }
				

				}
				
				System.out.println("Profile>>" + snsUser);
				// email에서 @ 앞까지만 추출하여 mid로 설정
	
	//			System.out.println("▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦ [mj] SNS API LOGIN 분기 진입 ▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦ snsUser: " + snsUser);
				
			    // 3. DB 해당 유저가 존재하는 체크 (googleid, naverid, kakaoid 컬럼 추가)
				APISnsMember apiSnsMember = service.getBySns(snsUser);
				System.out.println("▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦ [mj] SNS API LOGIN 분기 진입 ▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦ snsUser: " + apiSnsMember);
				if (apiSnsMember == null) {
	//				model.addAttribute("result", "존재하지 않는 사용자입니다. 가입해 주세요.");
					model.addAttribute("snsprofile", snsUser);
					//미존재시 가입페이지로!!
//					return "redirect:/index";
					return "apiSnsLoginResult";
				} else {
					model.addAttribute("result", apiSnsMember.getMid() + "login");
					// 4. 존재시 강제로그인
					session.setAttribute(APISnsSessionNames.LOGIN, apiSnsMember);
					return "redirect:/index";
//					return "redirect:/signup/updatepassword";
				}
			}
			System.out.println(" [mj] [3]: " + snsUser);
//			return "apiSnsLoginResult";
			return "redirect:/login";

			
		}
		
		@GetMapping({"/logout", "/logout/"})
		public String logout(HttpSession session, 
				HttpServletRequest request, HttpServletResponse response) throws Exception {
			logger.info("logout GET .....");
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
			
			return "/login";
		}
		
		@GetMapping({"/loginPost", "/loginPost/"})
		public void loginPost(APISnsLoginDTO dto, Model model, HttpSession session) throws Exception {
			logger.info("loginPost...LoginDTO={}", dto); 
			
			try {
				APISnsMember apiSnsMember = service.login(dto);
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
		@GetMapping({"/logoutAjax", "/logoutAjax/"})
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
		@GetMapping({"/loginAjax", "/loginAjax/"})
		public ResponseEntity<APISnsMember> loginAjax(@RequestBody APISnsLoginDTO dto, HttpSession session,
				HttpServletRequest request, HttpServletResponse response) throws Exception {
			logger.info("loginPost...LoginDTO={}", dto); 
			
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


	
//}