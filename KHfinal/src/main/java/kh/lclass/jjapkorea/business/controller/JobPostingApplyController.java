package kh.lclass.jjapkorea.business.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kh.lclass.jjapkorea.business.model.service.ApplyService;
import kh.lclass.jjapkorea.person.model.dto.Pagination;
import kh.lclass.jjapkorea.person.model.dto.ResumeWriteDto;
import kh.lclass.jjapkorea.person.model.service.ResumeWriteService;

@Controller
@RequestMapping("/business/apply")
public class JobPostingApplyController {
	@Autowired
	ApplyService applyServiceImpl;
	
	@Autowired
	ResumeWriteService resumeWriteServiceImpl;
	
	@GetMapping("/list")
	public String JobPostingApplyList(Model model, String jid, @RequestParam(name = "page", defaultValue = "1") int page,
            @RequestParam(name = "itemsPerPage", defaultValue = "5") int itemsPerPage) throws Exception {
		List<Map<String, Object>> applyListAll = applyServiceImpl.applyListAll(jid);
		model.addAttribute("applyListAll", applyListAll);
		
		// 전체 데이터의 총 수를 구한 뒤, 페이징 정보를 생성
	    int totalItems = applyServiceImpl.jobPostingGetTotalItems(jid);
	    Pagination pagination = new Pagination(totalItems, page, itemsPerPage);
	    model.addAttribute("pagination", pagination);
	    
	    String mid = (String) model.getAttribute("mid");
		// 이력서 데이터 확인
		List<ResumeWriteDto> resumeList = resumeWriteServiceImpl.getResumeById(mid);
		model.addAttribute("resumeList", resumeList);
		List<Map<String, Object>> getResumeWithQualification = resumeWriteServiceImpl.getResumeWithQualification(mid);
		model.addAttribute("getResumeWithQualification", getResumeWithQualification);
		List<Map<String, Object>> getResumeWithEducation = resumeWriteServiceImpl.getResumeWithEducation(mid);
		model.addAttribute("getResumeWithEducation", getResumeWithEducation);
		List<Map<String, Object>> getResumeWithExperience = resumeWriteServiceImpl.getResumeWithExperience(mid);
		model.addAttribute("getResumeWithExperience", getResumeWithExperience);
		List<Map<String, Object>> getResumeWithAward = resumeWriteServiceImpl.getResumeWithAward(mid);
		model.addAttribute("getResumeWithAward", getResumeWithAward);
	    
	    return "jpost/jpostApplyList";
	}
	
	@PostMapping("/list")
	public String JobPostingApplyList(Model model, String resumeId) throws Exception {
	    return "jpost/jpostApplyList";
	}
}
