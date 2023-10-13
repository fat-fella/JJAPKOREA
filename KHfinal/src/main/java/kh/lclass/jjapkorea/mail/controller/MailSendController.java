package kh.lclass.jjapkorea.mail.controller;

import java.io.IOException;

import javax.mail.MessagingException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import kh.lclass.jjapkorea.guest.model.dto.PersonDto;
import kh.lclass.jjapkorea.mail.model.service.MailSendService;

@Controller
public class MailSendController {

	private final MailSendService mailService;

	public MailSendController(MailSendService mailService) {
		this.mailService = mailService;
	}

	@GetMapping("/person/noticeMail")
	public String noticeMail(PersonDto selectOnePerson, Model model) throws MessagingException, IOException {
		mailService.noticeMail(selectOnePerson, model);
		return "index";
	}

}