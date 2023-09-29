package kh.lclass.jjapkorea.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.lclass.jjapkorea.member.model.dto.BusinessDto;
import kh.lclass.jjapkorea.member.model.dto.MemberDto;
import kh.lclass.jjapkorea.member.model.dto.PersonDto;
import kh.lclass.jjapkorea.member.model.service.MemberService;

@Controller
@RequestMapping("/signUp")
public class SignUpController {
	@Autowired MemberService memberService;
	
	@GetMapping("/person")
	public String signUpPerson() {
		return "member/signUpPerson";
	}
	
	@PostMapping("/person")
	public String signUpPerson(Model model, MemberDto memberDto, PersonDto personDto) throws Exception {
		String viewPage = "redirect:/";
		try {
			memberService.signUpMemberPerson(memberDto, personDto);
			viewPage = "redirect:/login/";
		} catch (Exception e) {
			viewPage = "redirect:/signUp/person";
		}
		return viewPage;
	}
	
	@GetMapping("/business")
	public String checkInsertBusinessForm() throws Exception {
		String viewPage;
		int checkInsertBusinessForm = memberService.checkInsertBusinessForm();
		if(checkInsertBusinessForm < 1) {
			viewPage = "comm/errorPage";
		} else {
			viewPage = "member/signUpBusiness";
		}
		return viewPage;
	}
	
	@PostMapping("/business")
	public String signUpBusiness(Model model, MemberDto memberDto, BusinessDto businessDto) throws Exception {
		String viewPage = "redirect:/";
		try {
			memberService.signUpMemberBusiness(memberDto, businessDto);
			viewPage = "redirect:/login/";
		} catch (Exception e) {
			e.printStackTrace();
			viewPage = "redirect:/signUp/business";
		}
		return viewPage;
	}
}
