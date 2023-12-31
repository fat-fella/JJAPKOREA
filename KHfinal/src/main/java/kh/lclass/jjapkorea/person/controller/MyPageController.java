package kh.lclass.jjapkorea.person.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.lclass.jjapkorea.guest.model.dto.MemberDto;
import kh.lclass.jjapkorea.guest.model.dto.PersonDto;
import kh.lclass.jjapkorea.guest.model.service.MemberService;
import kh.lclass.jjapkorea.person.model.dto.ResumeWriteDto;
import kh.lclass.jjapkorea.person.model.dto.ScrapDto;
import kh.lclass.jjapkorea.person.model.service.MyPageService;
import kh.lclass.jjapkorea.person.model.service.ResumeWriteService;
import kh.lclass.jjapkorea.person.model.service.ScrapService;

@Controller
@RequestMapping("/person")
public class MyPageController {
	@Autowired
	private MemberService memberService;

	@Autowired
	private ScrapService scrapService;
	
	@Autowired
	ResumeWriteService resumeWriteService;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	private MyPageService myPageService;

	@GetMapping("/myPage")
	public String myPage(Model model) throws Exception {
		String mid = (String) model.getAttribute("mid");
		List<Map<String, Object>> scrapList = scrapService.getJobPostingsWithScrapBusinessInfo(mid);
		
		//String workPlace = (String) model.getAttribute("workPlace");
		String workPlace = myPageService.getByWorkplace(mid);
//		Date workPeriod = myPageService.getByWorkperiod(mid);
		String workDetails = myPageService.getByWorkdetails(mid);
//		String workPname = myPageService.findAccountByPname(mid);
		
		
	    System.out.println("[mj] 여기 들어오나요? workPlace : " + workPlace);
		/* System.out.println("[mj] 여기 들어오나요? workPeriod : " + workPeriod); */
	    System.out.println("[mj] 여기 들어오나요? workDetails : " + workDetails);
//	    System.out.println("[mj] 여기 들어오나요? workPname : " + workPname);
//	    System.out.println("[mj] 여기 들어오나요? mid : " + mid);

	    model.addAttribute("workPlace", workPlace);
		/* model.addAttribute("workPeriod", workPeriod); */
	    model.addAttribute("workDetails", workDetails);
//	    model.addAttribute("workPname", workPname);
		model.addAttribute("scrapList", scrapList);
		
		List<ResumeWriteDto> resumeList = resumeWriteService.getResumeById(mid);
		model.addAttribute("resumeList", resumeList);
		return "member/myPage";
	}

	@RequestMapping(value = "/myPage", method = RequestMethod.POST, produces = "application/text; charset=UTF-8")
	@ResponseBody
	public ResponseEntity<String> scrap(Model model, @RequestBody ScrapDto scrapDto) throws Exception {
		if (scrapDto != null && scrapDto.getIsScrapAction() != null) {
			int scrap;
			try {
				boolean isScrapAction = Boolean.parseBoolean(scrapDto.getIsScrapAction());
				if (isScrapAction) {
					scrap = scrapService.scrap(scrapDto); // 스크랩 요청 처리
				} else {
					scrap = scrapService.scrapCancel(scrapDto); // 스크랩 해제 요청 처리
				}
				if (scrap < 1) {
					return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("클라이언트 오류");
				} else {
					if (isScrapAction) {
						return ResponseEntity.ok("스크랩 성공");
					} else {
						return ResponseEntity.ok("스크랩 해제 성공");
					}
				}
			} catch (Exception e) {
				return ResponseEntity.ok("서버 오류");
			}
		} else {
			String mid = (String) model.getAttribute("mid");
			try {
				memberService.cancelMemberAndPerson(mid);
				return ResponseEntity.ok("success"); // 성공 시 200 OK 응답 반환
			} catch (Exception e) {
				e.printStackTrace();
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("error"); // 실패 시 500 Internal
																								// Server Error 응답 반환
			}
		}
	}

	@GetMapping("/infoModifyPerson")
	public String infoModifyPerson(HttpSession session) throws Exception {
	    String workPlace = (String) session.getAttribute("workplace");
		return "member/infoModifyPerson";
	}

	@PostMapping("/infoModifyPerson")
	public String infoModifyPerson(MemberDto memberDto, PersonDto personDto, RedirectAttributes redirectAttr)
			throws Exception {
		String viewPage = "redirect:/";
		try {
			memberDto.setMpw(bCryptPasswordEncoder.encode(memberDto.getMpw()));
			memberService.infoModifyMemberAndPerson(memberDto, personDto);
			redirectAttr.addFlashAttribute("message", "회원 정보 수정 성공");
			viewPage = "redirect:/person/myPage";
		} catch (Exception e) {
			redirectAttr.addFlashAttribute("message", "회원 정보 수정 실패");
			viewPage = "redirect:/person/infoModifyPerson";
		}
		return viewPage;
	}
}
