package kh.lclass.jjapkorea.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kh.lclass.jjapkorea.admin.model.dto.AdminDto;
import kh.lclass.jjapkorea.admin.model.service.AdminService;
import kh.lclass.jjapkorea.board.model.dto.Criteria;
import kh.lclass.jjapkorea.board.model.dto.PageMakerDto;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping("/admin")
public class AdminController {
	
	// 로그 수집 기능
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	private final AdminService service;
	
	@GetMapping("/index")
	public ModelAndView adminIndex(ModelAndView mv) {
		mv.setViewName("/admin/index");
		return mv;
	}
	
	@GetMapping("/personList")
	public ModelAndView personList(ModelAndView mv, Criteria cri) {
		logger.info("personListGET");
		logger.info("cri : " + cri);
		
		mv.addObject("personList", service.personList(cri));
		int total = service.getPersonTotalActive(cri);
		PageMakerDto pageMake = new PageMakerDto(cri, total);
		
		mv.addObject("pageMaker", pageMake);
		mv.setViewName("admin/personList");
		return mv;
	}
	
	@GetMapping("/businessList")
	public ModelAndView businessList(ModelAndView mv, Criteria cri) {
		logger.info("businessListGET");
		logger.info("cri : " + cri);
		
		mv.addObject("businessList", service.businessList(cri));
		int total = service.getBusinessTotalActive(cri);
		PageMakerDto pageMake = new PageMakerDto(cri, total);
		
		mv.addObject("pageMaker", pageMake);
		mv.setViewName("admin/businessList");
		return mv;
	}
	
	@GetMapping("/suspendedPersonList")
	public ModelAndView suspendedPersonList(ModelAndView mv, Criteria cri) {
		logger.info("suspendedPersonListGET");
		logger.info("cri : " + cri);
		
		mv.addObject("personList", service.suspendedPersonList(cri));
		int total = service.getPersonTotalSuspended(cri);
		PageMakerDto pageMake = new PageMakerDto(cri, total);
		
		mv.addObject("pageMaker", pageMake);
		mv.setViewName("admin/suspendedPersonList");
		return mv;
	}
	
	@GetMapping("/suspendedBusinessList")
	public ModelAndView suspendedBusinessList(ModelAndView mv, Criteria cri) {
		logger.info("suspendedBusinessListGET");
		logger.info("cri : " + cri);
		
		mv.addObject("businessList", service.suspendedBusinessList(cri));
		int total = service.getBusinessTotalSuspended(cri);
		PageMakerDto pageMake = new PageMakerDto(cri, total);
		
		mv.addObject("pageMaker", pageMake);
		mv.setViewName("admin/suspendedBusinessList");
		return mv;
	}
	
	@GetMapping("/declarationWait")
	public ModelAndView declarationWait(ModelAndView mv, Criteria cri) {
		logger.info("declarationWaitGET");
		logger.info("cri : " + cri);
		
		mv.addObject("declarationWait", service.declarationWait(cri));
		int total = service.getDeclarationWait(cri);
		PageMakerDto pageMake = new PageMakerDto(cri, total);
		
		mv.addObject("pageMaker", pageMake);
		mv.setViewName("admin/declarationWait");
		return mv;
	}
	
	@GetMapping("/declarationComplete")
	public ModelAndView declarationComplete(ModelAndView mv, Criteria cri) {
		logger.info("declarationWaitGET");
		logger.info("cri : " + cri);
		
		mv.addObject("declarationComplete", service.declarationComplete(cri));
		int total = service.getDeclarationComplete(cri);
		PageMakerDto pageMake = new PageMakerDto(cri, total);
		
		mv.addObject("pageMaker", pageMake);
		mv.setViewName("admin/declarationComplete");
		return mv;
	}
	
	@PostMapping("/suspended/active")
	public ModelAndView suspendedActive(ModelAndView mv, @RequestParam("mid") String mid) {
		service.suspendedActive(mid);
		String result = service.idSearch(mid);
		if(result.equals("ROLE_PERSON")) {			
			mv.setViewName("admin/personList");
		} else if (result.equals("ROLE_BUSINESS")) {
			mv.setViewName("admin/businessList");
		}
		return mv;
	}
	
	@PostMapping("/suspended/clear")
	public ModelAndView suspendedClear(ModelAndView mv, @RequestParam String mid) {
		service.suspendedClear(mid);
		String result = service.idSearch(mid);
		if(result.equals("ROLE_PERSON")) {			
			mv.setViewName("admin/suspendedPersonList");
		} else if (result.equals("ROLE_BUSINESS")) {
			mv.setViewName("admin/suspendedBusinessList");
		}
		return mv;
	}
	
//	@GetMapping("/adminlist")
//	public ModelAndView adminList(ModelAndView mv, Criteria cri) {
//		logger.info("boardListGET");
//		logger.info("cri : " + cri);
//		
//		mv.addObject("memberlist", service.adminList(cri));
//		int total = service.getTotalAdmin(cri);
//		PageMakerDto pageMake = new PageMakerDto(cri, total);
//		
//		mv.addObject("pageMaker", pageMake);
//		mv.setViewName("admin/adminlist");
//		return mv;
//	}
	
	// Admin 용 마이페이지
	@GetMapping("/mypage")
	public ModelAndView adminMypage(ModelAndView mv) {
		String adminId = "admin";
		mv.addObject("adminMypage", service.adminMypage(adminId));
		mv.setViewName("admin/mypage");
		return mv;
	}
	
	// 마이페이지에서 정보 변경 후 저장버튼을 누르면 정보 업데이트
	@PostMapping("/update")
	public String updateMember(@RequestBody AdminDto vo) {
		service.update(vo);
		return "redirect:/admin/mypage";
	}
	
//	@GetMapping("/mypage/pwdChange")
//	public ModelAndView pwdChange(ModelAndView mv) {
//		mv.setViewName("admin/pwdChange");
//		return mv;
//	}
	
//	@PostMapping("/mypage/pwdChange")
//	public ModelAndView pwdChangeDo(@RequestParam String password, @RequestParam String password2, @RequestParam String password3, BindingResult bindingResult, ModelAndView mv) {
//		if(bindingResult.hasErrors()) {
//			mv.setViewName("admin/pwdChange");
//			return mv;
//        }
//		
//		if(!password2.equals(password3)) {
//            bindingResult.rejectValue("password3", "passwordInCorrect", "변경할 2개의 비밀번호가 일치하지 않습니다.");
//            mv.setViewName("admin/pwdChange");
//    		return mv;
//        }
//		
//		memberService.pwdChange(password2);
//		mv.setViewName("admin/mypage");
//		return mv;
//	}
}