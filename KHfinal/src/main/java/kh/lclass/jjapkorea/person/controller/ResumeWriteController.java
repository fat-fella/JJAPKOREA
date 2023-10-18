package kh.lclass.jjapkorea.person.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kh.lclass.jjapkorea.person.model.dto.AwardDto;
import kh.lclass.jjapkorea.person.model.dto.EducationDto;
import kh.lclass.jjapkorea.person.model.dto.ExperienceDto;
import kh.lclass.jjapkorea.person.model.dto.QualificationDto;
import kh.lclass.jjapkorea.person.model.dto.ResumeWriteDto;
import kh.lclass.jjapkorea.person.model.service.ResumeWriteService;

@Controller
public class ResumeWriteController {
	@Autowired
	ResumeWriteService resumeWriteService;

	@GetMapping("/person/resume/write")
	public String resumeMgr(Model model) throws Exception {
		String mid = (String) model.getAttribute("mid");
		// 이력서 데이터 확인
		List<ResumeWriteDto> resumeList = resumeWriteService.getResumeById(mid);
		model.addAttribute("resumeList", resumeList);
		List<Map<String, Object>> getResumeWithQualification = resumeWriteService.getResumeWithQualification(mid);
		model.addAttribute("getResumeWithQualification", getResumeWithQualification);
		List<Map<String, Object>> getResumeWithEducation = resumeWriteService.getResumeWithEducation(mid);
		model.addAttribute("getResumeWithEducation", getResumeWithEducation);
		List<Map<String, Object>> getResumeWithExperience = resumeWriteService.getResumeWithExperience(mid);
		model.addAttribute("getResumeWithExperience", getResumeWithExperience);
		List<Map<String, Object>> getResumeWithAward = resumeWriteService.getResumeWithAward(mid);
		model.addAttribute("getResumeWithAward", getResumeWithAward);
		return "resume/resumeWrite";
	}
	
	@PostMapping("/person/resume/write")
	public String resumeMgr(Model model, ResumeWriteDto resumeWriteDto,
	                        @RequestParam List<String> qualificationName,
	                        @RequestParam List<String> qualificationDate,
	                        @RequestParam List<String> qualificationAuthority,
	                        @RequestParam List<String> educationPeriod,
	                        @RequestParam List<String> schoolName,
	                        @RequestParam List<String> major,
	                        @RequestParam List<String> workPeriod,
	                        @RequestParam List<String> workPlace,
	                        @RequestParam List<String> workDetails,
	                        @RequestParam List<String> awardName,
	                        @RequestParam List<String> awardingAuthority,
	                        @RequestParam List<String> awardDate) throws Exception {
		String mid = (String) model.getAttribute("mid");

		// 이력서 정보 추가 또는 업데이트
		List<ResumeWriteDto> resumeWriteDtos = resumeWriteService.getResumeById(mid);

		if (!resumeWriteDtos.isEmpty()) {
			// 이미 있는 경우: 업데이트
			int resumeId = resumeWriteDtos.get(0).getResumeId();
	        resumeWriteService.updateResume(resumeWriteDto);
	        
	        // 자격증 업데이트
	        resumeWriteService.deleteQualification(resumeId);
		    for (int i = 1; i < qualificationName.size(); i++) {
		        QualificationDto qualificationDto = new QualificationDto();
		        qualificationDto.setResumeId(resumeId);
		        qualificationDto.setQualificationName(qualificationName.get(i));
		        qualificationDto.setQualificationDate(qualificationDate.get(i));
		        qualificationDto.setQualificationAuthority(qualificationAuthority.get(i));
		        resumeWriteService.insertQualification(qualificationDto);
		    }

		    // 학력 업데이트
		    resumeWriteService.deleteEducation(resumeId);
		    for (int i = 1; i < educationPeriod.size(); i++) {
		        EducationDto educationDto = new EducationDto();
		        educationDto.setResumeId(resumeId);
		        educationDto.setEducationPeriod(educationPeriod.get(i));
		        educationDto.setSchoolName(schoolName.get(i));
		        educationDto.setMajor(major.get(i));
		        resumeWriteService.insertEducation(educationDto);
		    }

		    // 경력 업데이트
		    resumeWriteService.deleteExperience(resumeId);
		    for (int i = 1; i < workPeriod.size(); i++) {
		        ExperienceDto experienceDto = new ExperienceDto();
		        experienceDto.setResumeId(resumeId);
		        experienceDto.setWorkPeriod(workPeriod.get(i));
		        experienceDto.setWorkPlace(workPlace.get(i));
		        experienceDto.setWorkDetails(workDetails.get(i));
		        resumeWriteService.insertExperience(experienceDto);
		    }

		    // 수상내역 업데이트
		    resumeWriteService.deleteAward(resumeId);
		    for (int i = 1; i < awardName.size(); i++) {
		        AwardDto awardDto = new AwardDto();
		        awardDto.setResumeId(resumeId);
		        awardDto.setAwardName(awardName.get(i));
		        awardDto.setAwardingAuthority(awardingAuthority.get(i));
		        awardDto.setAwardDate(awardDate.get(i));
		        resumeWriteService.insertAward(awardDto);
		    }
	    } else {
	        // 없는 경우: 추가
	        resumeWriteDto.setMid(mid);
	        resumeWriteService.insertResume(resumeWriteDto);
	        // 자격증 추가
		    for (int i = 1; i < qualificationName.size(); i++) {
		        QualificationDto qualificationDto = new QualificationDto();
		        qualificationDto.setResumeId(resumeWriteDto.getResumeId());
		        qualificationDto.setQualificationName(qualificationName.get(i));
		        qualificationDto.setQualificationDate(qualificationDate.get(i));
		        qualificationDto.setQualificationAuthority(qualificationAuthority.get(i));
		        resumeWriteService.insertQualification(qualificationDto);
		    }
		    // 학력 추가
		    for (int i = 1; i < educationPeriod.size(); i++) {
		        EducationDto educationDto = new EducationDto();
		        educationDto.setResumeId(resumeWriteDto.getResumeId());
		        educationDto.setEducationPeriod(educationPeriod.get(i));
		        educationDto.setSchoolName(schoolName.get(i));
		        educationDto.setMajor(major.get(i));
		        resumeWriteService.insertEducation(educationDto);
		    }

		    // 경력 추가
		    for (int i = 1; i < workPeriod.size(); i++) {
		        ExperienceDto experienceDto = new ExperienceDto();
		        experienceDto.setResumeId(resumeWriteDto.getResumeId());
		        experienceDto.setWorkPeriod(workPeriod.get(i));
		        experienceDto.setWorkPlace(workPlace.get(i));
		        experienceDto.setWorkDetails(workDetails.get(i));
		        resumeWriteService.insertExperience(experienceDto);
		    }

		    // 수상내역 추가
		    for (int i = 1; i < awardName.size(); i++) {
		        AwardDto awardDto = new AwardDto();
		        awardDto.setResumeId(resumeWriteDto.getResumeId());
		        awardDto.setAwardName(awardName.get(i));
		        awardDto.setAwardingAuthority(awardingAuthority.get(i));
		        awardDto.setAwardDate(awardDate.get(i));
		        resumeWriteService.insertAward(awardDto);
		    }
	    }
	    
	    return "redirect:/person/resume/write";
	}
}