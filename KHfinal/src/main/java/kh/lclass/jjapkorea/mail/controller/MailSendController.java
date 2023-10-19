package kh.lclass.jjapkorea.mail.controller;

import java.io.IOException;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.lclass.jjapkorea.business.model.dto.ApplyDto;
import kh.lclass.jjapkorea.business.model.dto.JobPostingDto;
import kh.lclass.jjapkorea.business.model.service.ApplyService;
import kh.lclass.jjapkorea.guest.model.dto.PersonDto;
import kh.lclass.jjapkorea.mail.model.dto.MailSendDto;
import kh.lclass.jjapkorea.mail.model.dto.YourRequestBodyClass;
import kh.lclass.jjapkorea.mail.model.service.MailSendService;

@Controller
public class MailSendController {
	@Autowired
	private ApplyService applyServiceImlp;

	private final MailSendService mailService;

	// ajax로 Controller가 실행되면 Service로 이동
	public MailSendController(MailSendService mailService) {
		this.mailService = mailService;
	}

	// Service에서 사용되는 값을 받아옴
	@RequestMapping(value = "/person/noticeMail", method = RequestMethod.POST, produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String noticeMail(PersonDto selectOnePerson, @RequestBody YourRequestBodyClass requestBody,
			MailSendDto mailSendDto, ApplyDto applyDto, JobPostingDto jobPostingDto, Model model,
			HttpServletResponse response) throws MessagingException, IOException {
		// requestBody 객체를 사용하여 JSON 데이터의 필드에 접근
		String jid = requestBody.getJid();
		String mid = requestBody.getMid();
		String bizname = requestBody.getBizname();
		String retitle = requestBody.getRetitle();
		Integer resumeId = requestBody.getResumeId();

		mailSendDto.setJid(jid);
		mailSendDto.setMid(mid);
		mailSendDto.setBizname(bizname);
		mailSendDto.setRetitle(retitle);

		applyDto.setJid(jid);
		applyDto.setResumeId(resumeId);
		
		selectOnePerson = (PersonDto) model.getAttribute("selectOnePerson");
		// 현재 채용공고 페이지의 회사명 받아오기
		mailService.sendMail(selectOnePerson, mailSendDto, jobPostingDto);
		try {
			applyServiceImlp.insertApply(applyDto);
			String applyId = applyServiceImlp.getApplyIdByJidAndResumeId(applyDto);
		} catch (Exception e) {
			e.printStackTrace();
			String errorMessage = e.getMessage(); // 예외 메시지 가져오기
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); // 서버 오류 응답 코드 설정
			response.getWriter().write(errorMessage); // 에러 메시지를 응답으로 전송
		}
		return "index";
	}

}