package kh.lclass.jjapkorea.guest.controller;

import java.security.SecureRandom;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.lclass.jjapkorea.api.AligoSMSExample;
import kh.lclass.jjapkorea.guest.model.dto.MemberDto;
import kh.lclass.jjapkorea.guest.model.dto.PersonDto;
import kh.lclass.jjapkorea.guest.model.service.MemberService;

@Controller
public class FindIdAndPasswordController {
	@Autowired
	MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@RequestMapping(value = "/findId", method = RequestMethod.GET)
	public String findId() {
		return "member/findId";
	}
	
	@RequestMapping(value = "/findId", method = RequestMethod.POST)
	public String findId(@RequestParam String pphone, PersonDto personDto, RedirectAttributes redirectAttr) throws Exception {
		String viewPage = "redirect:/findId";
		String findAccountByNameAndPhone = memberService.findAccountByNameAndPhone(personDto);
		if(findAccountByNameAndPhone != null) {
			String cleanedPhoneNumber = pphone.replaceAll("-", "");
	        boolean success = sendVerificationCodeLogicId(findAccountByNameAndPhone, cleanedPhoneNumber);
	        if (success) {
	        	redirectAttr.addFlashAttribute("message", "인증 번호가 전송되었습니다.");
	        } else {
	        	redirectAttr.addFlashAttribute("message", "인증 번호 전송에 실패했습니다.");
	        }
		} else {
			redirectAttr.addFlashAttribute("message", "존재하지 않는 이름과 휴대폰 번호입니다.");
		}
		return viewPage;
	}
	
	private boolean sendVerificationCodeLogicId(String mid, String phoneNumber) throws Exception {
        String message = "아이디는 " + "[" + mid + "]입니다.";
	    AligoSMSExample.sendSms(message, "", phoneNumber, "");
	    return true; // 전송 성공
	}
	
	@RequestMapping(value = "/findPassword", method = RequestMethod.GET)
	public String findPassword() {
		return "member/findPassword";
	}
	
	@RequestMapping(value = "/findPassword", method = RequestMethod.POST)
	public String findPassword(@RequestParam String mid, @RequestParam String pphone, MemberDto memberDto, PersonDto personDto, RedirectAttributes redirectAttr) throws Exception {
		String viewPage = "redirect:/findPassword";
		PersonDto findAccountByIdAndPhone = memberService.findAccountByIdAndPhone(personDto);
		if(findAccountByIdAndPhone != null) {
			String cleanedPhoneNumber = pphone.replaceAll("-", "");
	        boolean success = sendVerificationCodeLogicPassword(mid, cleanedPhoneNumber, memberDto);
	        if (success) {
	        	redirectAttr.addFlashAttribute("message", "인증 번호가 전송되었습니다.");
	        } else {
	        	redirectAttr.addFlashAttribute("message", "인증 번호 전송에 실패했습니다.");
	        }
		} else {
			redirectAttr.addFlashAttribute("message", "존재하지 않는 아이디와 휴대폰 번호입니다.");
		}
		return viewPage;
	}
	
	private boolean sendVerificationCodeLogicPassword(String mid, String phoneNumber, MemberDto memberDto) throws Exception {
		String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        StringBuilder randomString = new StringBuilder();
        SecureRandom random = new SecureRandom();
        for (int i = 0; i < 6; i++) {
            int index = random.nextInt(characters.length());
            randomString.append(characters.charAt(index));
        }
        memberDto.setMid(mid);
        memberDto.setMpw(bCryptPasswordEncoder.encode(randomString.toString()));
        memberService.infoModifyMember(memberDto);
        String message = "임시 비밀번호는 " + "[" + randomString.toString() + "]입니다.";
	    AligoSMSExample.sendSms(message, "", phoneNumber, randomString.toString());
	    return true; // 전송 성공
	}
}
