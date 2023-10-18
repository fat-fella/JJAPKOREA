package kh.lclass.jjapkorea.person.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.lclass.jjapkorea.person.model.dto.AwardDto;
import kh.lclass.jjapkorea.person.model.dto.EducationDto;
import kh.lclass.jjapkorea.person.model.dto.ExperienceDto;
import kh.lclass.jjapkorea.person.model.dto.QualificationDto;
import kh.lclass.jjapkorea.person.model.dto.ResumeWriteDto;

@Repository
public class ResumeWriteDao {
	@Autowired
	private SqlSession sqlSession;
	
	public int insertResume(ResumeWriteDto resumeWriteDto) throws Exception {
        return sqlSession.insert("resume.insertResume", resumeWriteDto);
    }
	
	public int insertQualification(QualificationDto qualificationDto) throws Exception {
		return sqlSession.insert("qualification.insertQualification", qualificationDto);
    }
	
	public int insertEducation(EducationDto educationDto) throws Exception {
		return sqlSession.insert("education.insertEducation", educationDto);
    }
	
	public int insertExperience(ExperienceDto experienceDto) throws Exception {
		return sqlSession.insert("experience.insertExperience", experienceDto);
    }
	
	public int insertAward(AwardDto awardDto) throws Exception {
		return sqlSession.insert("award.insertAward", awardDto);
    }
	
	public List<ResumeWriteDto> getResumeById(String mid) throws Exception {
		return sqlSession.selectList("resume.getResumeById", mid);
	}
	
	public List<Map<String, Object>> getResumeWithQualification(String mid) throws Exception {
        return sqlSession.selectList("resume.getResumeWithQualification", mid);
    }
	
	public List<Map<String, Object>> getResumeWithEducation(String mid) throws Exception {
        return sqlSession.selectList("resume.getResumeWithEducation", mid);
    }
	
	public List<Map<String, Object>> getResumeWithExperience(String mid) throws Exception {
        return sqlSession.selectList("resume.getResumeWithExperience", mid);
    }
	
	public List<Map<String, Object>> getResumeWithAward(String mid) throws Exception {
        return sqlSession.selectList("resume.getResumeWithAward", mid);
    }
	
	public int updateResume(ResumeWriteDto resumeWriteDto) throws Exception {
		return sqlSession.update("resume.updateResume", resumeWriteDto);
	}
	
	public int updateQualification(QualificationDto qualificationDto) throws Exception {
		return sqlSession.update("qualification.updateQualification", qualificationDto);
	}
	
	public int updateEducation(EducationDto educationDto) throws Exception {
		return sqlSession.update("education.updateEducation", educationDto);
	}
	
	public int updateExperience(ExperienceDto experienceDto) throws Exception {
		return sqlSession.update("experience.updateExperience", experienceDto);
	}
	
	public int updateAward(AwardDto awardDto) throws Exception {
		return sqlSession.update("award.updateAward", awardDto);
	}
	
	public List<QualificationDto> getQualificationById(int resumeId) throws Exception {
		return sqlSession.selectList("qualification.getQualificationById", resumeId);
	}
	
	public List<EducationDto> getEducationById(int resumeId) throws Exception {
		return sqlSession.selectList("education.getEducationById", resumeId);
	}
	
	public List<ExperienceDto> getExperienceById(int resumeId) throws Exception {
		return sqlSession.selectList("experience.getExperienceById", resumeId);
	}
	
	public List<AwardDto> getAwardById(int resumeId) throws Exception {
		return sqlSession.selectList("award.getAwardById", resumeId);
	}
	
	public int deleteQualification(int resumeId) throws Exception {
		return sqlSession.delete("qualification.deleteQualification", resumeId);
	}
	
	public int deleteEducation(int educationId) throws Exception {
		return sqlSession.delete("education.deleteEducation", educationId);
	}
	
	public int deleteExperience(int experienceId) throws Exception {
		return sqlSession.delete("experience.deleteExperience", experienceId);
	}
	
	public int deleteAward(int awardId) throws Exception {
		return sqlSession.delete("award.deleteAward", awardId);
	}
}
