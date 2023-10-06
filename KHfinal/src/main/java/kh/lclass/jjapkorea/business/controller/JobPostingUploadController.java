package kh.lclass.jjapkorea.business.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kh.lclass.jjapkorea.business.model.dto.JobPostingCategoryDto;
import kh.lclass.jjapkorea.business.model.dto.JobPostingDto;
import kh.lclass.jjapkorea.business.model.service.JobPostingUploadService;
import kh.lclass.jjapkorea.business.model.service.JobPostingUploadServiceImpl;
import kh.lclass.jjapkorea.business.model.service.JobPostingService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@RequestMapping("/business")
@Slf4j
@Controller
public class JobPostingUploadController {

	@Autowired
	private JobPostingUploadService jobPostingUploadService;

	@GetMapping("/jobpostingupload/register")
	public ModelAndView jobUpload(ModelAndView mv, Model model, String firstRecruitField) throws Exception {
		mv.setViewName("jpost/jpostUpload");
		
		return mv;
	}

    @PostMapping("/jobpostingupload/getSecondRecruitField")
    @ResponseBody
    public List<JobPostingCategoryDto> getSecondRecruitFields(@RequestParam String selectedOption) throws Exception {
 
    	return jobPostingUploadService.selectFirst(selectedOption);
    }
    @PostMapping("/jobpostingupload/getThirdRecruitField")
    @ResponseBody
    public List<JobPostingCategoryDto> getThirdRecruitFields(@RequestParam String selectedOption) throws Exception {
 
    	return jobPostingUploadService.selectSecond(selectedOption);
    }
    @PostMapping("/jobpostingupload/getFourthRecruitField")
    @ResponseBody
    public List<JobPostingCategoryDto> getFourthRecruitFields(@RequestParam String selectedOption) throws Exception {
    	
    	return jobPostingUploadService.selectThird(selectedOption);
    }
	
	
	

	@PostMapping("/jobpostingupload/register")
	public String jobUpload(JobPostingDto dto) {
		String jid =UUID.randomUUID().toString();
		dto.setJid(jid);
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String mid = authentication.getName();
        dto.setMid(mid);
		try {
			int result = jobPostingUploadService.insert(dto);
			if(result<1) {
				return "redirect:/business/jobpostingupload/register";
			}
			else{
				return "redirect:/business/jobpostingupload/list";
			}
		} catch (Exception e){
			e.printStackTrace();
			return "redirect:/business/jobpostingupload/register";
			
		}
		
	}
	
	@PostMapping("/image/upload")
	public ModelAndView image(MultipartHttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		MultipartFile uploadFile = request.getFile("upload");
		String originalFileName = uploadFile.getOriginalFilename();
		String ext = originalFileName.substring(originalFileName.indexOf("."));
		String newFileName = UUID.randomUUID() + ext;
		String realPath = request.getServletContext().getRealPath("/");
		String savePath = realPath + "upload/" + newFileName;
		String uploadPath = "./upload/" + newFileName; 
		File file = new File(savePath);
		uploadFile.transferTo(file);
		mv.addObject("uploaded", true); // 업로드 완료
		mv.addObject("url", uploadPath); // 업로드 파일의 경로
		return mv;
	}
	
	
	
	@GetMapping("/jobpostingupload/info")
	public String jobPostingUploadSubmit(JobPostingDto dto) {
		return "/jpost/jpostInfo";
	}
	

	
	@GetMapping("/jobpostingupload/list")
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
