package kh.lclass.jjapkorea.business.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kh.lclass.jjapkorea.business.model.dto.ApplyDto;
import kh.lclass.jjapkorea.business.model.service.ApplyService;
import kh.lclass.jjapkorea.person.model.dto.Pagination;
import kh.lclass.jjapkorea.person.model.service.ResumeWriteService;

@Controller
@RequestMapping("/business/apply")
public class JobPostingApplyController {
	@Autowired
	ApplyService applyServiceImpl;

	@Autowired
	ResumeWriteService resumeWriteServiceImpl;

	@GetMapping("/list")
	public String JobPostingApplyList(Model model, String jid,
			@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "itemsPerPage", defaultValue = "5") int itemsPerPage) throws Exception {
		List<Map<String, Object>> applyListAll = applyServiceImpl.applyListAll(jid);
		model.addAttribute("applyListAll", applyListAll);

		// 전체 데이터의 총 수를 구한 뒤, 페이징 정보를 생성
		int totalItems = applyServiceImpl.jobPostingGetTotalItems(jid);
		Pagination pagination = new Pagination(totalItems, page, itemsPerPage);
		model.addAttribute("pagination", pagination);

		return "jpost/jpostApplyList";
	}

	@GetMapping("/info")
	public String JobPostingApplyList(Model model, Integer resumeId, String jid) throws Exception {
		String mid = applyServiceImpl.findMidByResumeId(resumeId);
		
		model.addAttribute("jid", jid);

		// 이력서 데이터 확인
		List<Map<String, Object>> findPersonByResumeId = applyServiceImpl.findPersonByResumeId(resumeId);
		model.addAttribute("findPersonByResumeId", findPersonByResumeId);
		String findImageUrl = applyServiceImpl.findImageUrl(resumeId);
		if(findImageUrl != null) {
			model.addAttribute("findImageUrl", findImageUrl);
		}
		List<Map<String, Object>> getResumeWithQualification = resumeWriteServiceImpl.getResumeWithQualification(mid);
		model.addAttribute("getResumeWithQualification", getResumeWithQualification);
		List<Map<String, Object>> getResumeWithEducation = resumeWriteServiceImpl.getResumeWithEducation(mid);
		model.addAttribute("getResumeWithEducation", getResumeWithEducation);
		List<Map<String, Object>> getResumeWithExperience = resumeWriteServiceImpl.getResumeWithExperience(mid);
		model.addAttribute("getResumeWithExperience", getResumeWithExperience);
		List<Map<String, Object>> getResumeWithAward = resumeWriteServiceImpl.getResumeWithAward(mid);
		model.addAttribute("getResumeWithAward", getResumeWithAward);
		
		return "jpost/jpostApplyInfo";
	}
	
	@PostMapping("/info")
	public ResponseEntity<String> JobPostingApplyList(Model model, Integer resumeId, String jid, String passOrFail) throws Exception {
		try {
			ApplyDto applyDto = new ApplyDto();
			applyDto.setResumeId(resumeId);
			applyDto.setJid(jid);
	        if ("합격".equals(passOrFail)) {
	            // 합격일 경우의 처리
	        	String applyId = applyServiceImpl.getApplyIdByJidAndResumeId(applyDto);
	        	
	            return ResponseEntity.ok("pass");
	        } else if ("불합격".equals(passOrFail)) {
	            // 불합격일 경우의 처리
	            return ResponseEntity.ok("fail");
	        } else {
	        	return ResponseEntity.ok("오류");
	        }
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("error");
		}
	}
}
