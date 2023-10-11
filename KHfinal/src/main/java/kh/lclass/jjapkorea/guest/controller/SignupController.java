package kh.lclass.jjapkorea.guest.controller;

import java.security.SecureRandom;
import java.util.HashMap;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.lclass.jjapkorea.api.AligoSMSExample;
import kh.lclass.jjapkorea.guest.model.dto.BusinessDto;
import kh.lclass.jjapkorea.guest.model.dto.MemberDto;
import kh.lclass.jjapkorea.guest.model.dto.PersonDto;
import kh.lclass.jjapkorea.guest.model.service.MemberService;

@Controller
@RequestMapping("/signup")
public class SignupController {
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	private String storedVerificationCode;
	
	@GetMapping("/person")
	public String signUpPerson() {
		return "member/signupPerson";
	}
	
	public SignupController() throws Exception {
	    storedVerificationCode = generateVerificationCode(); // 가상의 저장된 인증 번호
	}
	
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
