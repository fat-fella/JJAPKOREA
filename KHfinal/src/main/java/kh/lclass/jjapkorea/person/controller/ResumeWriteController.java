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
		    resumeWriteService.updateResume(resumeWriteDto);
		    int resumeId = resumeWriteDtos.get(0).getResumeId(); // 모든 자격증이 동일한 이력서 ID를 가지고 있는 것으로 가정
		    List<QualificationDto> existingQualifications = resumeWriteService.getQualificationById(resumeId);

		    // 데이터베이스에서 사용자의 자격증 데이터 가져오기
		    for (int i = 1; i < qualificationName.size(); i++) {
		        String name = qualificationName.get(i);
		        String date = qualificationDate.get(i);
		        String authority = qualificationAuthority.get(i);

		        // 클라이언트 데이터와 데이터베이스 데이터를 비교하여 존재 여부 확인
		        boolean existsInDatabase = false;
		        QualificationDto qualificationToUpdate = null;

		        for (QualificationDto existingQualification : existingQualifications) {
		            if (existingQualification.getQualificationName().equals(name) &&
		                existingQualification.getQualificationDate().equals(date) &&
		                existingQualification.getQualificationAuthority().equals(authority)) {
		                existsInDatabase = true;
		                qualificationToUpdate = existingQualification; // 기존 데이터 업데이트를 위해 객체 설정
		                break;
		            }
		        }

		        if (existsInDatabase) {
		            // 이미 데이터베이스에 있는 경우: 업데이트
		            // 해당 데이터를 업데이트
		            qualificationToUpdate.setQualificationName(name);
		            qualificationToUpdate.setQualificationDate(date);
		            qualificationToUpdate.setQualificationAuthority(authority);
		            resumeWriteService.updateQualification(qualificationToUpdate);
		        } else {
		            // 데이터베이스에 없는 경우: 인서트
		            // 새로운 데이터를 데이터베이스에 추가
		            QualificationDto newQualification = new QualificationDto();
		            newQualification.setResumeId(resumeId);
		            newQualification.setQualificationName(name);
		            newQualification.setQualificationDate(date);
		            newQualification.setQualificationAuthority(authority);
		            resumeWriteService.insertQualification(newQualification);
		        }
		    }

		    // 데이터베이스에는 있지만 클라이언트로부터 받은 데이터에는 없는 데이터 삭제 (딜리트)
		    for (QualificationDto existingQualification : existingQualifications) {
		        boolean foundInClientData = false;

		        for (int i = 1; i < qualificationName.size(); i++) {
		            String name = qualificationName.get(i);
		            String date = qualificationDate.get(i);
		            String authority = qualificationAuthority.get(i);

		            if (existingQualification.getQualificationName().equals(name) &&
		                existingQualification.getQualificationDate().equals(date) &&
		                existingQualification.getQualificationAuthority().equals(authority)) {
		                foundInClientData = true;
		                break;
		            }
		        }

		        if (!foundInClientData) {
		            // 데이터베이스에는 있지만 클라이언트 데이터에는 없는 경우: 딜리트
		            resumeWriteService.deleteQualification(existingQualification.getQualificationId());
		        }
		    }

		    // 학력 업데이트
		    for (int i = 1; i < educationPeriod.size(); i++) {
		        EducationDto educationDto = new EducationDto();
		        educationDto.setResumeId(resumeWriteDto.getResumeId());
		        educationDto.setEducationPeriod(educationPeriod.get(i));
		        educationDto.setSchoolName(schoolName.get(i));
		        educationDto.setMajor(major.get(i));
		        resumeWriteService.updateEducation(educationDto);
		    }

		    // 경력 업데이트
		    for (int i = 1; i < workPeriod.size(); i++) {
		        ExperienceDto experienceDto = new ExperienceDto();
		        experienceDto.setResumeId(resumeWriteDto.getResumeId());
		        experienceDto.setWorkPeriod(workPeriod.get(i));
		        experienceDto.setWorkPlace(workPlace.get(i));
		        experienceDto.setWorkDetails(workDetails.get(i));
		        resumeWriteService.updateExperience(experienceDto);
		    }

		    // 수상내역 업데이트
		    for (int i = 1; i < awardName.size(); i++) {
		        AwardDto awardDto = new AwardDto();
		        awardDto.setResumeId(resumeWriteDto.getResumeId());
		        awardDto.setAwardName(awardName.get(i));
		        awardDto.setAwardingAuthority(awardingAuthority.get(i));
		        awardDto.setAwardDate(awardDate.get(i));
		        resumeWriteService.updateAward(awardDto);
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