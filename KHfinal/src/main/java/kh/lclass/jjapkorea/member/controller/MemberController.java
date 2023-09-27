package kh.lclass.jjapkorea.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
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
	public ResponseEntity<String> loginPerson(MemberDto memberDto, HttpServletRequest request, RedirectAttributes redirectAttr) throws Exception {
		HttpSession session = request.getSession();
		MemberDto loginPerson = memberService.loginPerson(memberDto);
		if(loginPerson != null) {
			session.setAttribute("loginPerson", loginPerson);
			return ResponseEntity.ok("/jjapkorea/index");
		} else {
			return ResponseEntity.badRequest().body("로그인 실패");
		}
	}
	
	@PostMapping("/loginBusiness")
	public ResponseEntity<String> loginBusiness(MemberDto memberDto, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		MemberDto loginBusiness = memberService.loginBusiness(memberDto);
		if(loginBusiness != null) {
			session.setAttribute("loginBusiness", loginBusiness);
			return ResponseEntity.ok("/jjapkorea/index");
		} else {
			return ResponseEntity.badRequest().body("로그인 실패");
		}
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
