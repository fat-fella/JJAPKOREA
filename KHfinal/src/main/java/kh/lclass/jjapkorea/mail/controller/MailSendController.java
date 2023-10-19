package kh.lclass.jjapkorea.mail.controller;

import java.io.IOException;

import javax.mail.MessagingException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.lclass.jjapkorea.business.model.dto.JobPostingDto;
import kh.lclass.jjapkorea.guest.model.dto.PersonDto;
import kh.lclass.jjapkorea.mail.model.dto.MailSendDto;
import kh.lclass.jjapkorea.mail.model.service.MailSendService;

@Controller
public class MailSendController {

	private final MailSendService mailService;

	// ajax로 Controller가 실행되면 Service로 이동
	public MailSendController(MailSendService mailService) {
		this.mailService = mailService;
	}

	// Service에서 사용되는 값을 받아옴
	@RequestMapping(value = "/person/noticeMail", method = RequestMethod.POST, produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String noticeMail(PersonDto selectOnePerson, @RequestBody MailSendDto mailSendDto,
			JobPostingDto jobPostingDto, Model model) throws MessagingException, IOException {
		selectOnePerson = (PersonDto) model.getAttribute("selectOnePerson");
		// 현재 채용공고 페이지의 회사명 받아오기
		mailService.sendMail(selectOnePerson, mailSendDto, jobPostingDto);
		return "index";
	}

}