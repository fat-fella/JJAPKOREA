package kh.lclass.jjapkorea.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String loginPerson(String mid, String mpw, HttpServletRequest request, RedirectAttributes redirectAttr) throws Exception {
		String viewPage;
		HttpSession session = request.getSession();
		MemberDto loginPerson = memberService.loginPerson(mid, mpw);
		if(loginPerson != null) {
			viewPage = "redirect:/index";
			session.setAttribute("loginPerson", loginPerson);
		} else {
			viewPage = "redirect:/member/login";
			redirectAttr.addFlashAttribute("error", "로그인 실패");
		}
		return viewPage;
	}
	
	@PostMapping("/loginBusiness")
	public String loginBusiness(String mid, String mpw, HttpServletRequest request) throws Exception {
		String viewPage;
		HttpSession session = request.getSession();
		MemberDto loginBusiness = memberService.loginBusiness(mid, mpw);
		if(loginBusiness != null) {
			viewPage = "redirect:/index";
			session.setAttribute("loginBusiness", loginBusiness);
		} else {
			viewPage = "redirect:/member/login";
		}
		return viewPage;
	}
	
	@GetMapping("/signUpPerson")
	public String signUpPerson() {
		return "member/signUpPerson";
	}
	
	@PostMapping("/signUpPerson")
	public String signUpPerson(Model model, MemberDto memberDto, PersonDto personDto, String mid) throws Exception {
		String viewPage = "redirect:/";
		try {
			memberService.signUpMemberPerson(memberDto, personDto);
			viewPage = "redirect:/member/login";
		} catch (Exception e) {
			viewPage = "redirect:/member/signUpPerson";
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
		try {
			memberService.signUpMemberBusiness(memberDto, businessDto);
			viewPage = "redirect:/member/login";
		} catch (Exception e) {
			e.printStackTrace();
			viewPage = "redirect:/member/signUpBusiness";
		}
		return viewPage;
	}
}
