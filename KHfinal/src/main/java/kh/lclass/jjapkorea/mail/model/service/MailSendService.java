package kh.lclass.jjapkorea.mail.model.service;

import java.io.IOException;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import kh.lclass.jjapkorea.guest.model.dto.PersonDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class MailSendService {

	private final JavaMailSender emailSender;

	public String noticeMail(PersonDto selectOnePerson, Model model) throws MessagingException, IOException {

		// 기타 설정들을 담당할 MimeMesageHelper 객체를 생성
		// 생성자의 매개값으로 MimeMessage 객체, bool, 문자 인코딩 설정
		// bool 타입에서 true 매개값을 전달하면 MultiPart(이미지, 오디오도 같이) 형식의 메세지 전달 가능
		// 값을 전달하지 않으면 단순 텍스트만 사용
		try {
			MimeMessage message = emailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");

			helper.setFrom("jjapkorea@naver.com"); // 발신자 주소
			helper.setSubject("jjapkorea mail title test"); // 메일 제목 설정

			helper.setText("jjapkorea mail content test", true);
			// 메일 내용 설정
			// true를 해야 html 형식으로 전송

			selectOnePerson = (PersonDto) model.getAttribute("selectOnePerson");
			String pemail = selectOnePerson.getPemail();

			// 수신자 전송
			helper.setTo(pemail);
			emailSender.send(message);
			log.info("mail notice send complete.");

		} catch (MessagingException e) {
			e.printStackTrace();
		}
		return "index";
	}

}