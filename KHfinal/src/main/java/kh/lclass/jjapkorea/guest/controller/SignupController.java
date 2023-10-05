package kh.lclass.jjapkorea.guest.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.lclass.jjapkorea.guest.model.dto.BusinessDto;
import kh.lclass.jjapkorea.guest.model.dto.MemberDto;
import kh.lclass.jjapkorea.guest.model.dto.PersonDto;
import kh.lclass.jjapkorea.guest.model.service.MemberService;

@Controller
@RequestMapping("/signup")
public class SignupController {
	@Autowired
	MemberService memberService;
	
	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@GetMapping("/person")
	public String signUpPerson() {
		return "member/signupPerson";
	}
	
	@PostMapping("/person")
	public String signUpPerson(@Valid MemberDto memberDto, @Valid PersonDto personDto) throws Exception {
		String viewPage = "redirect:/";
		try {
			memberDto.setMpw(bCryptPasswordEncoder.encode(memberDto.getMpw()));
			memberService.signUpMemberAndPerson(memberDto, personDto);
			viewPage = "redirect:/login";
		} catch (Exception e) {
			viewPage = "redirect:/signup/person";
		}
		return viewPage;
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
	public String signUpBusiness(@Valid MemberDto memberDto, @Valid BusinessDto businessDto) throws Exception {
		String viewPage = "redirect:/";
		try {
			memberDto.setMpw(bCryptPasswordEncoder.encode(memberDto.getMpw()));
			memberService.signUpMemberAndBusiness(memberDto, businessDto);
			viewPage = "redirect:/login";
		} catch (Exception e) {
			viewPage = "redirect:/signup/business";
		}
		return viewPage;
	}
}
