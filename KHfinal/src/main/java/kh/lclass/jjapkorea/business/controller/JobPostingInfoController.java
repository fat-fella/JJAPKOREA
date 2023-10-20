package kh.lclass.jjapkorea.business.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.lclass.jjapkorea.business.model.dto.ApplyDto;
import kh.lclass.jjapkorea.business.model.service.ApplyService;
import kh.lclass.jjapkorea.business.model.service.JobPostingUploadService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;



@RequiredArgsConstructor
@Slf4j
@Controller
public class JobPostingInfoController {
	
	@Autowired
	 private JobPostingUploadService jobPostingUploadServiceImpl;
	
	@Autowired
	private ApplyService applyServiceImlp;
	
	@GetMapping("/jobpostinginfo")
	public ModelAndView jobPostingInfo(String jid, ModelAndView mv, RedirectAttributes rttr, Model model) throws Exception {
		Map<String, Object> jobPostingInfo = jobPostingUploadServiceImpl.getJobPostingWithInfo(jid);

			if (jobPostingInfo != null) {
				mv.addObject("jobPosting" ,jobPostingInfo);
				mv.setViewName("jpost/jpostInfo");
			} else {
				rttr.addFlashAttribute("alertMsg", "지금은 삭제된 공고입니다.");
				mv.setViewName("redirect:/index");
			}
			String mid = (String) model.getAttribute("mid");
			Integer resumeId = applyServiceImlp.getResumeById(mid);
			mv.addObject("resumeId", resumeId);
			ApplyDto applyDto = new ApplyDto();
			applyDto.setJid(jid);
			applyDto.setResumeId(resumeId);
			mv.addObject("applyId", applyServiceImlp.getApplyIdByJidAndResumeId(applyDto));
			return mv;
		} 
	
	@ExceptionHandler(Exception.class)
	public String jobPostingExceptionHanlder(Exception e, RedirectAttributes rttr) {
		e.printStackTrace();
		
		ModelAndView mv = new ModelAndView();
		rttr.addFlashAttribute("alertMsg", e.getMessage()+"오류가 발생했습니다 다시 시도해주세요.");
		
		return "redirect:/index";
	}
}




//@Controller
//public class JobPostingInfoController {
//	
//	@Autowired
//	JobPostingUploadService jobPostingUploadService;
//	
//	@GetMapping("/jobpostinginfo")
//	@ResponseBody
//	public ResponseEntity<String> jobPostingInfo(@RequestBody String jid) throws Exception {
//		JobPostingDto dto = new JobPostingDto();
//		jid= dto.getJid();
//		List<Map<String, Object>> jobPostingInfo = jobPostingUploadService.getJobPostingWithInfo(jid);
////		mv.addObject("jobPostingInfo" ,jobPostingInfo);
////		mv.setViewName("jpost/jpostInfo");
////		return mv;
//		try {
//			
//		if (jobPostingInfo == null) {
//			return ResponseEntity.ok("null");
//		}else {
//			return ResponseEntity.ok("success");
//			
//		}
//		} catch( Exception e){
//			e.printStackTrace();
//			return ResponseEntity.ok("error");
//
//		} 
//	}
//
//	
//}










//@Controller
//public class JobPostingInfoController {
//	
//	@Autowired
//	JobPostingUploadService jobPostingUploadService;
//	
//	@GetMapping("/jobpostinginfo")
//	@ResponseBody
//	public ResponseEntity<String> jobPostingInfo(@RequestBody String jid) throws Exception {
//		JobPostingDto dto = new JobPostingDto();
//		jid= dto.getJid();
//		List<Map<String, Object>> jobPostingInfo = jobPostingUploadService.getJobPostingWithInfo(jid);
////		mv.addObject("jobPostingInfo" ,jobPostingInfo);
////		mv.setViewName("jpost/jpostInfo");
////		return mv;
//		try {
//			
//		if (jobPostingInfo == null) {
//			return ResponseEntity.ok("null");
//		}else {
//			return ResponseEntity.ok("success");
//			
//		}
//		} catch( Exception e){
//			e.printStackTrace();
//			return ResponseEntity.ok("error");
//
//		} 
//	}
//
//	
//}