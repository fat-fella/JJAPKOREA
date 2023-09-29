package kh.lclass.jjapkorea.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.lclass.jjapkorea.member.model.service.MemberService;

@Controller
@RequestMapping("/login")
public class LoginController {
	@Autowired MemberService memberService;
	
	@GetMapping("/")
	public String login() throws Exception {
		return "member/login";
	}
	
//	@PostMapping("/admin")
//	public ResponseEntity<String> loginAdmin(MemberDto memberDto, HttpServletRequest request, RedirectAttributes redirectAttr) throws Exception {
//		HttpSession session = request.getSession();
//		MemberDto loginAdmin = memberService.loginAdmin(memberDto);
//		if(loginAdmin != null) {
//			session.setAttribute("loginAdmin", loginAdmin);
//			return ResponseEntity.ok("/jjapkorea/index");
//		} else {
//			return ResponseEntity.badRequest().body("로그인 실패");
//		}
//	}
//	
//	@PostMapping("/person")
//	public ResponseEntity<String> loginPerson(MemberDto memberDto, HttpServletRequest request, RedirectAttributes redirectAttr) throws Exception {
//		HttpSession session = request.getSession();
//		MemberDto loginPerson = memberService.loginPerson(memberDto);
//		if(loginPerson != null) {
//			session.setAttribute("loginPerson", loginPerson);
//			return ResponseEntity.ok("/jjapkorea/index");
//		} else {
//			return ResponseEntity.badRequest().body("로그인 실패");
//		}
//	}
//	
//	@PostMapping("/business")
//	public ResponseEntity<String> loginBusiness(MemberDto memberDto, HttpServletRequest request) throws Exception {
//		HttpSession session = request.getSession();
//		MemberDto loginBusiness = memberService.loginBusiness(memberDto);
//		if(loginBusiness != null) {
//			session.setAttribute("loginBusiness", loginBusiness);
//			return ResponseEntity.ok("/jjapkorea/index");
//		} else {
//			return ResponseEntity.badRequest().body("로그인 실패");
//		}
//	}
}
