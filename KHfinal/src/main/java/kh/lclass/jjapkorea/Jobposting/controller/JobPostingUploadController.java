package kh.lclass.jjapkorea.Jobposting.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.lclass.jjapkorea.Jobposting.model.dto.JobpostingDto;
import kh.lclass.jjapkorea.Jobposting.model.service.JobPostingUploadService;
import kh.lclass.jjapkorea.Jobposting.model.service.JobPostingUploadServiceImpl;
import kh.lclass.jjapkorea.Jobposting.model.service.JobpostingService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@RequestMapping("/jobpostingupload")
@Slf4j
@Controller
public class JobPostingUploadController {

	@Autowired
	private JobPostingUploadService jobPostingUploadService;
	
	@GetMapping("/register")
	public String jobUpload(){
		return "jpost/jpostUpload";
	}
	
	@PostMapping("/register")
	public String jobUpload(JobpostingDto dto) {
		try {
			int result = jobPostingUploadService.insert(dto);
			if(result<1) {
				return "redirect:/register";
			}
			else{
				return "redirect:/list";
			}
		} catch (Exception e){
			e.printStackTrace();
			return "redirect:/register";
			
		}
		
	}
	
	@GetMapping("/info")
	public String jobPostingUploadSubmit(JobpostingDto dto) {
		return "/jpost/jpostInfo";
	}
	

	
	@GetMapping("/list")
	public ModelAndView jobPostingUploadList(ModelAndView mv, String mid) {
		try {
			mv.addObject("jpostlist", jobPostingUploadService.selectList(mid));
			mv.setViewName("jpost/jpostList");
		} catch (Exception e) {
			e.printStackTrace();
			mv.setViewName("jpost/jpostList");
		}
		return mv;
	}
}
