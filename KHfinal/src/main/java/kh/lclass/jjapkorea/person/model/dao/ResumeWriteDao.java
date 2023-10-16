package kh.lclass.jjapkorea.person.model.dao;

import java.util.List;

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
}
