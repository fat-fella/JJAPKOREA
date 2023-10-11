package kh.lclass.jjapkorea.mail.controller;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MailSendController {
	@Autowired
	private JavaMailSender mailSender;
	
	@GetMapping("testmailsend")
	public String testMail() {
		
		// 기타 설정들을 담당할 MimeMesageHelper 객체를 생성 
		// 생성자의 매개값으로 MimeMessage 객체, bool, 문자 인코딩 설정 
		// bool 타입에서 true 매개값을 전달하면 MultiPart(이미지, 오디오도 같이) 형식의 메세지 전달 가능 
			// 값을 전달하지 않으면 단순 텍스트만 사용 
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");

			helper.setFrom("jjapkorea@naver.com");
			helper.setTo("netps0201@gmail.com");
			helper.setSubject("sb mail title test");
			
			helper.setText("sb mail content test", true);
			// true를 해야 html 형식으로 전송 
			
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
//		SimpleMailMessage msg = new SimpleMailMessage();
//		msg.setTo("ej.kh.kim@gmail.com");
//		msg.setSubject("test sb mail");
//		msg.setText("sodyd sb mail");
//		mailSender.send(msg);
		return "index";
	}
}