package kh.lclass.jjapkorea.business.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kh.lclass.jjapkorea.business.model.dto.JobPostingCategoryDto;
import kh.lclass.jjapkorea.business.model.dto.JobPostingDto;
import kh.lclass.jjapkorea.business.model.service.JobPostingUploadService;
import kh.lclass.jjapkorea.business.model.service.JobPostingUploadServiceImpl;
import kh.lclass.jjapkorea.business.model.service.JobPostingService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@RequestMapping("/jobpostingupload")
@Slf4j
@Controller
public class JobPostingUploadController {

	@Autowired
	private JobPostingUploadService jobPostingUploadService;
	
//	@GetMapping("/register")
//	public String jobUpload(){
//		return "jpost/jpostUpload";
//	}
	@GetMapping("/register")
	public ModelAndView jobUpload(ModelAndView mv, Model model, String firstRecruitField) throws Exception {
		model.addAttribute("jlist", jobPostingUploadService.selectFirst(firstRecruitField));
		mv.setViewName("jpost/jpostUpload");
		
		return mv;
	}
//	@PostMapping("/getSecondRecruitField")
//	public ModelAndView getSecondRecruitFields(ModelAndView mv, Model model, @RequestParam String selectedOption) throws Exception{
//		mv.addObject("selectFirst", jobPostingUploadService.selectFirst(selectedOption));
//		mv.setViewName("redirect:/jobpostingupload/register");
//		return mv;
//	}

    @PostMapping("/getSecondRecruitField")
    @ResponseBody
    public List<JobPostingCategoryDto> getSecondRecruitFields(@RequestParam String selectedOption) throws Exception {
 
    	return jobPostingUploadService.selectFirst(selectedOption);
    }
    @PostMapping("/getThirdRecruitField")
    @ResponseBody
    public List<JobPostingCategoryDto> getThirdRecruitFields(@RequestParam String selectedOption) throws Exception {
 
    	return jobPostingUploadService.selectSecond(selectedOption);
    }
	
	
	
//	@GetMapping("/getSecondRecruitField")
//	@ResponseBody
//	public String getSecondRecruitField(@RequestParam("firstRecruitField") String firstRecruitField) {
//		String secondRecruitFieldOptions ="";
//		return secondRecruitFieldOptions;
//	}
//	
	@PostMapping("/register")
	public String jobUpload(JobPostingDto dto) {
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
	public String jobPostingUploadSubmit(JobPostingDto dto) {
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
