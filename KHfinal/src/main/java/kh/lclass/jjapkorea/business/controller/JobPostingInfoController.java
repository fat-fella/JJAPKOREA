package kh.lclass.jjapkorea.business.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kh.lclass.jjapkorea.business.model.dto.JobPostingDto;
import kh.lclass.jjapkorea.business.model.service.JobPostingUploadService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;



@RequiredArgsConstructor
@Slf4j
@Controller
public class JobPostingInfoController {
	
	@Autowired
	JobPostingUploadService jobPostingUploadService;
	
	@GetMapping("/jobpostinginfo")
	public ResponseEntity<String> jobPostingInfo(@RequestParam String jid) throws Exception {
		JobPostingDto dto = new JobPostingDto();
		jid= dto.getJid();
		List<Map<String, Object>> jobPostingInfo = jobPostingUploadService.getJobPostingWithInfo(jid);
//		mv.addObject("jobPostingInfo" ,jobPostingInfo);
//		mv.setViewName("jpost/jpostInfo");
//		return mv;
		try {
			
		if (jobPostingInfo == null) {
			return ResponseEntity.ok("null");
		}else {
			return ResponseEntity.ok("success");
			
		}
		} catch( Exception e){
			e.printStackTrace();
			return ResponseEntity.ok("error");

		} 
	}

	
}
