package kh.lclass.jjapkorea.mail.controller;

import java.io.IOException;

import javax.mail.MessagingException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kh.lclass.jjapkorea.mail.model.dto.MailSendDto;
import kh.lclass.jjapkorea.mail.model.service.MailSendService;

@Controller
public class MailSendController {

	private final MailSendService mailService;

	public MailSendController(MailSendService mailService) {
		this.mailService = mailService;
	}

	@GetMapping("/person/testMail")
	public String mailSend() {
		return "index";
	}

	@PostMapping("/person/mail/send")
	public String sendMail(MailSendDto mailDto) throws MessagingException, IOException {
		mailService.noticeMail(mailDto);
		System.out.println("메일 전송 완료");
		return "index";
	}

}