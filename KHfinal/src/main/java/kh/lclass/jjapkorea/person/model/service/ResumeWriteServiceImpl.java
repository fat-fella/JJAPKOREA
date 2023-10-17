package kh.lclass.jjapkorea.person.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.lclass.jjapkorea.person.model.dao.ResumeWriteDao;
import kh.lclass.jjapkorea.person.model.dto.AwardDto;
import kh.lclass.jjapkorea.person.model.dto.EducationDto;
import kh.lclass.jjapkorea.person.model.dto.ExperienceDto;
import kh.lclass.jjapkorea.person.model.dto.QualificationDto;
import kh.lclass.jjapkorea.person.model.dto.ResumeWriteDto;

@Service
public class ResumeWriteServiceImpl implements ResumeWriteService {
	@Autowired
	private ResumeWriteDao resumeWriteDao;
	
	@Override
	public int insertResume(ResumeWriteDto resumeWriteDto) throws Exception {
        return resumeWriteDao.insertResume(resumeWriteDto);
    }
	
	@Override
	public int insertQualification(QualificationDto qualificationDto) throws Exception {
		return resumeWriteDao.insertQualification(qualificationDto);
    }
	
	@Override
	public int insertEducation(EducationDto educationDto) throws Exception {
		return resumeWriteDao.insertEducation(educationDto);
    }
	
	@Override
	public int insertExperience(ExperienceDto experienceDto) throws Exception {
		return resumeWriteDao.insertExperience(experienceDto);
    }
	
	@Override
	public int insertAward(AwardDto awardDto) throws Exception {
		return resumeWriteDao.insertAward(awardDto);
    }
	
	@Override
	public List<ResumeWriteDto> getResumeById(String mid) throws Exception {
		return resumeWriteDao.getResumeById(mid);
	}
	
	@Override
	public List<Map<String, Object>> getResumeWithQualification(String mid) throws Exception {
        return resumeWriteDao.getResumeWithQualification(mid);
    }
	
	@Override
	public List<Map<String, Object>> getResumeWithEducation(String mid) throws Exception {
        return resumeWriteDao.getResumeWithEducation(mid);
    }
	
	@Override
	public List<Map<String, Object>> getResumeWithExperience(String mid) throws Exception {
		return resumeWriteDao.getResumeWithExperience(mid);
    }
	
	@Override
	public List<Map<String, Object>> getResumeWithAward(String mid) throws Exception {
        return resumeWriteDao.getResumeWithAward(mid);
    }
	
	@Override
	public int updateResume(ResumeWriteDto resumeWriteDto) throws Exception {
		return resumeWriteDao.updateResume(resumeWriteDto);
	}
	
	@Override
	public int updateQualification(QualificationDto qualificationDto) throws Exception {
		return resumeWriteDao.updateQualification(qualificationDto);
	}
	
	@Override
	public int updateEducation(EducationDto educationDto) throws Exception {
		return resumeWriteDao.updateEducation(educationDto);
	}
	
	@Override
	public int updateExperience(ExperienceDto experienceDto) throws Exception {
		return resumeWriteDao.updateExperience(experienceDto);
	}
	
	@Override
	public int updateAward(AwardDto awardDto) throws Exception {
		return resumeWriteDao.updateAward(awardDto);
	}
	
	@Override
	public List<QualificationDto> getQualificationById(int resumeId) throws Exception {
		return resumeWriteDao.getQualificationById(resumeId);
	}
	
	@Override
	public List<EducationDto> getEducationById(int resumeId) throws Exception {
		return resumeWriteDao.getEducationById(resumeId);
	}
	
	@Override
	public List<ExperienceDto> getExperienceById(int resumeId) throws Exception {
		return resumeWriteDao.getExperienceById(resumeId);
	}
	
	@Override
	public List<EducationDto> getAwardById(int resumeId) throws Exception {
		return resumeWriteDao.getAwardById(resumeId);
	}
}
