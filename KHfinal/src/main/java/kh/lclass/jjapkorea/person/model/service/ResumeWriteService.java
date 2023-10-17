package kh.lclass.jjapkorea.person.model.service;

import java.util.List;
import java.util.Map;

import kh.lclass.jjapkorea.person.model.dto.AwardDto;
import kh.lclass.jjapkorea.person.model.dto.EducationDto;
import kh.lclass.jjapkorea.person.model.dto.ExperienceDto;
import kh.lclass.jjapkorea.person.model.dto.QualificationDto;
import kh.lclass.jjapkorea.person.model.dto.ResumeWriteDto;

public interface ResumeWriteService {
	int insertResume(ResumeWriteDto resumeWriteDto) throws Exception;
	int insertQualification(QualificationDto qualificationDto) throws Exception;
	int insertEducation(EducationDto educationDto) throws Exception;
	int insertExperience(ExperienceDto experienceDto) throws Exception;
	int insertAward(AwardDto awardDto) throws Exception;
	List<ResumeWriteDto> getResumeById(String mid) throws Exception;
	List<Map<String, Object>> getResumeWithQualification(String mid) throws Exception;
	List<Map<String, Object>> getResumeWithEducation(String mid) throws Exception;
	List<Map<String, Object>> getResumeWithExperience(String mid) throws Exception;
	List<Map<String, Object>> getResumeWithAward(String mid) throws Exception;
}
