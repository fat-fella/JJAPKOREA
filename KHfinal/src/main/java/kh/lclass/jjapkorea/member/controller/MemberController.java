package kh.lclass.jjapkorea.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.lclass.jjapkorea.member.model.dto.BusinessDto;
import kh.lclass.jjapkorea.member.model.dto.MemberDto;
import kh.lclass.jjapkorea.member.model.dto.PersonDto;
import kh.lclass.jjapkorea.member.model.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired MemberService memberService;
	
	@GetMapping("/login")
	public String login() throws Exception {
		return "member/login";
	}
	
	@PostMapping("/loginPerson")
	public ModelAndView loginPerson(ModelAndView mv, String mid) throws Exception {
		mv.addObject("loginPerson", memberService.loginPerson(mid));
		mv.setViewName("redirect:/index");
		return mv;
	}
	
	@PostMapping("/loginBusiness")
	public ModelAndView loginBusiness(ModelAndView mv, String mid) throws Exception {
		mv.addObject("loginBusiness", memberService.loginPerson(mid));
		mv.setViewName("redirect:/index");
		return mv;
	}
	
	@GetMapping("/signUpPerson")
	public String signUpPerson() {
		return "member/signUpPerson";
	}
	
	@PostMapping("/signUpPerson")
	public String signUpPerson(Model model, MemberDto memberDto, PersonDto personDto, String mid) throws Exception {
		String viewPage = "redirect:/";
		int signUpMember = memberService.signUpMember(memberDto);
		if(signUpMember < 1) {
			viewPage = "member/signUpPerson";
		} else {
			int signUpPerson = memberService.signUpPerson(personDto);
			if(signUpPerson < 1) {
				int deleteMember = memberService.deleteMember(mid);
				if(deleteMember < 1) {
					viewPage = "comm/errorPage";
				} else {
					viewPage = "redirect:/signUpPerson";
				}
			} else {
				viewPage = "redirect:/login";
			}
		}
		return viewPage;
	}
	
	@GetMapping("/signUpBusiness")
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
	
	@PostMapping("/signUpBusiness")
	public String signUpBusiness(Model model, MemberDto memberDto, BusinessDto businessDto, String mid) throws Exception {
		String viewPage = "redirect:/";
		int signUpMember = memberService.signUpMember(memberDto);
		if(signUpMember < 1) {
			viewPage = "redirect:/signUpBusiness";
		} else {
			int signUpBusiness = memberService.signUpBusiness(businessDto);
			if(signUpBusiness < 1) {
				int deleteMember = memberService.deleteMember(mid);
				if(deleteMember < 1) {
					viewPage = "comm/errorPage";
				} else {
					viewPage = "redirect:/signUpBusiness";
				}
			} else {
				viewPage = "redirect:/login";
			}
		}
		return viewPage;
	}
}
