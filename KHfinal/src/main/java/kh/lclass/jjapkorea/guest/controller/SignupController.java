package kh.lclass.jjapkorea.guest.controller;

import java.security.SecureRandom;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import kh.lclass.jjapkorea.api.AligoSMSExample;
import kh.lclass.jjapkorea.guest.model.dto.BusinessDto;
import kh.lclass.jjapkorea.guest.model.dto.MemberDto;
import kh.lclass.jjapkorea.guest.model.dto.PersonDto;
import kh.lclass.jjapkorea.guest.model.service.MemberService;
import kh.lclass.jjapkorea.swp.auth.SNSLogin;
import kh.lclass.jjapkorea.swp.auth.SnsValue;
import kh.lclass.jjapkorea.swp.domain.APISnsMember;
import kh.lclass.jjapkorea.swp.dto.APISnsLoginDTO;
import kh.lclass.jjapkorea.swp.dto.APISnsSignUpDTO;
import kh.lclass.jjapkorea.swp.interceptor.APISnsSessionNames;
import kh.lclass.jjapkorea.swp.service.APISnsMemberService;

@Controller
@RequestMapping("/signup")
public class SignupController {
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
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
	
	private String storedVerificationCode;
	
	private static final Logger logger = LoggerFactory.getLogger(SignupController.class);

	
	// API SNS 가입	

	
	@GetMapping({"/person", "/person/"})
	public String signUpPerson(Model model) throws Exception {
		logger.info("signUpPerson GET .....");

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
			
		
		
		return "member/signupPerson";
		
	}
	
	public SignupController() throws Exception {
	    storedVerificationCode = generateVerificationCode(); // 가상의 저장된 인증 번호
	}
	
	
		
		// API sns login 각각의 소셜 API 콜백 받음
			@GetMapping("/auth/{snsService}/callback")
		public String snsSignUpCallback(@PathVariable String snsService,
				Model model, @RequestParam String code, HttpSession session) throws Exception {
			
			SnsValue sns = null;
		    if (StringUtils.equals("naver", snsService))
		        sns = naverSns;
		    else if (StringUtils.equals("google", snsService))
		        sns = googleSns;
		    else if (StringUtils.equals("kakao", snsService))
		        sns = kakaoSns; 
		    System.out.println("▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦ [mj] SNS API  snsSign 분기 진입 ▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦ naverSns: " + naverSns);
		    System.out.println("▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦ [mj] SNS API  snsSign snsSign 분기 진입 ▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦ kakaoSns: " + kakaoSns);
		    System.out.println("▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦ [mj] SNS API  snsSign 분기 진입 ▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦ googleSns: " + googleSns);

		    
			// 1. code를 이용해서 access_token 받기
			// 2. access_token을 이용해서 사용자 profile 정보 가져오기
		    SNSLogin snsLogin = new SNSLogin(sns);

			
			APISnsMember snsUser = snsLogin.getUserProfile(code); // 1,2번 동시
			System.out.println(" [mj] SNS API snsSignUp 분기 진입 ▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦ APISnsMember snsUser [1]: " + snsUser);
			if (snsUser.getEmail() != null) {
				System.out.println(" [mj] [2]: " + snsUser);

				String[] emailParts = snsUser.getEmail().split("@");
				if (emailParts.length > 0) {
		        String mid = emailParts[0];
		        snsUser.setMid(mid);
				System.out.println(" [mj] SNS API snsSignUp 분기 진입 ▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦ mid: " + mid);
				
				//api login 최초 비밀번호는 email @ 앞쪽의 id가 최초 비밀번호로 암호회되어서 생성됨
			    String[] emailParts2 = snsUser.getEmail().split("@");
			    if (emailParts.length > 0) {
			        String mpw = emailParts[0];
			        snsUser.setMpw(bCryptPasswordEncoder.encode(mpw)); // mpw를 BCrypt로 해싱
			        System.out.println(" [mj] SNS API snsSignUp 분기 진입 ▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦ mpw: " + mpw);
			    }
				

				}
				
				System.out.println("Profile>>" + snsUser);
				// email에서 @ 앞까지만 추출하여 mid로 설정
	
			    // 3. DB 해당 유저가 존재하는 체크 (googleid, naverid, kakaoid 컬럼 추가)
				APISnsMember apiSnsMember = service.getBySns(snsUser);
				System.out.println("▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦ [mj] SNS API LOGIN 분기 진입 ▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦ snsUser: " + apiSnsMember);
				if (apiSnsMember == null) {
	//				model.addAttribute("result", "존재하지 않는 사용자입니다. 가입해 주세요.");
					model.addAttribute("snsprofile", snsUser);
					//미존재시 가입페이지로!!
					return "redirect:/index";
				} else {
					model.addAttribute("result", apiSnsMember.getMid() + "snsSignUp");
					// 4. 존재시 강제로그인
					session.setAttribute(APISnsSessionNames.LOGIN, apiSnsMember);
					return "redirect:/index";
				}
			}
			System.out.println(" [mj]snsSignUp [3]: " + snsUser);
			return "redirect:/index";

			
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
		
		@GetMapping({"/snsSignUpPost", "/snsSignUpPost/"})
		public void loginPost(APISnsSignUpDTO dto, Model model, HttpSession session) throws Exception {
			logger.info("snsSignUpPost...snsSignUpDTO={}", dto); 
			
			try {
				APISnsMember apiSnsMember = service.signup(dto);
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
		public ResponseEntity<APISnsMember> loginAjax(@RequestBody APISnsSignUpDTO dto, HttpSession session,
				HttpServletRequest request, HttpServletResponse response) throws Exception {
			logger.info("loginPost...LoginDTO={}", dto); 
			
			try {
				APISnsMember apiSnsMember = service.signup(dto);
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
		


	
	
	
		// API SNS 가입 끝

	
	
	@PostMapping("/person")
	public String signUpPerson(@Valid MemberDto memberDto, @Valid PersonDto personDto, RedirectAttributes redirectAttr) throws Exception {
		String viewPage = "redirect:/";
		try {
			memberDto.setMpw(bCryptPasswordEncoder.encode(memberDto.getMpw()));
			memberService.signUpMemberAndPerson(memberDto, personDto);
			redirectAttr.addFlashAttribute("message", "회원 가입 성공");
			viewPage = "redirect:/login";
		} catch (Exception e) {
			redirectAttr.addFlashAttribute("message", "회원 가입 실패");
			viewPage = "redirect:/signup/person";
		}
		return viewPage;
	}
	
	@PostMapping("/sendVerificationCode")
    public ResponseEntity<Map<String, Object>> sendVerificationCode(@RequestParam String name, @RequestParam String phoneNumber) throws Exception {
        // 인증 번호를 생성하고 휴대폰 번호로 전송 로직 구현
        // 전송 성공/실패 여부에 따라 success와 message를 설정하여 응답
        Map<String, Object> response = new HashMap<>();
        String cleanedPhoneNumber = phoneNumber.replaceAll("-", "");
        boolean success = sendVerificationCodeLogic(name, cleanedPhoneNumber);
        response.put("success", success);
        if (success) {
            response.put("message", "인증 번호가 전송되었습니다.");
        } else {
            response.put("message", "인증 번호 전송에 실패했습니다.");
        }
        return ResponseEntity.ok(response);
    }
	
	@PostMapping("/checkVerificationCode")
    public ResponseEntity<Map<String, Object>> checkVerificationCode(@RequestParam String verificationCode) throws Exception {
        // 입력된 인증 번호와 저장된 인증 번호를 비교하는 로직 구현
        // 일치 여부에 따라 success와 message를 설정하여 응답
        Map<String, Object> response = new HashMap<>();
        boolean success = checkVerificationCodeLogic(verificationCode);
        response.put("success", success);
        if (success) {
            response.put("message", "인증 번호가 확인되었습니다.");
        } else {
            response.put("message", "인증 번호가 일치하지 않습니다.");
        }
        return ResponseEntity.ok(response);
    }
	
	// 랜덤한 4자리 인증 번호 생성 메서드
	private String generateVerificationCode() throws Exception {
	    SecureRandom secureRandom = new SecureRandom();
	    StringBuilder verificationCode = new StringBuilder();
	    for (int i = 0; i < 4; i++) {
	        int digit = secureRandom.nextInt(10);
	        verificationCode.append(digit);
	    }
	    return verificationCode.toString();
	}
	
	// 인증 번호 전송 로직
	private boolean sendVerificationCodeLogic(String name, String phoneNumber) throws Exception {
	    String verificationCode = storedVerificationCode;
	    String message = "인증번호 " + "[" + verificationCode + "]를 입력하세요.";
	    AligoSMSExample.sendSms(message, name, phoneNumber, verificationCode);
	    return true; // 전송 성공
	}

	// 인증 번호 확인 로직
	private boolean checkVerificationCodeLogic(String verificationCode) throws Exception {
	    // 저장된 인증 번호와 클라이언트에서 입력한 인증 번호 비교
	    return verificationCode.equals(storedVerificationCode);
	}
	
	@GetMapping("/business")
	public String checkInsertBusinessForm() throws Exception {
		String viewPage;
		int checkInsertBusinessForm = memberService.checkAndInsertBusinessForm();
		if(checkInsertBusinessForm < 1) {
			viewPage = "comm/errorPage";
		} else {
			viewPage = "member/signupBusiness";
		}
		return viewPage;
	}
	
	@PostMapping("/business")
	public String signUpBusiness(@Valid MemberDto memberDto, BusinessDto businessDto, RedirectAttributes redirectAttr) throws Exception {
		String viewPage = "redirect:/";
		try {
			memberDto.setMpw(bCryptPasswordEncoder.encode(memberDto.getMpw()));
			memberService.signUpMemberAndBusiness(memberDto, businessDto);
			redirectAttr.addFlashAttribute("message", "회원 가입 성공");
			viewPage = "redirect:/login";
		} catch (Exception e) {
			redirectAttr.addFlashAttribute("message", "회원 가입 실패");
			viewPage = "redirect:/signup/business";
		}
		return viewPage;
	}
}
