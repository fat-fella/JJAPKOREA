package kh.lclass.jjapkorea.mail.model.service;

import java.io.IOException;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import kh.lclass.jjapkorea.business.model.dto.JobPostingDto;
import kh.lclass.jjapkorea.guest.model.dto.PersonDto;
import kh.lclass.jjapkorea.mail.model.dto.MailSendDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class MailSendService {

	private final JavaMailSender emailSender;

	public String sendMail(PersonDto selectOnePerson, MailSendDto mailSendDto, JobPostingDto jobPostingDto) throws MessagingException, IOException {
	
		// 기타 설정들을 담당할 MimeMesageHelper 객체를 생성
		// 생성자의 매개값으로 MimeMessage 객체, bool, 문자 인코딩 설정
		// bool 타입에서 true 매개값을 전달하면 MultiPart(이미지, 오디오도 같이) 형식의 메세지 전달 가능
		// 값을 전달하지 않으면 단순 텍스트만 사용
		try {
			MimeMessage message = emailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");

			
			// 로그인된 사용자 이메일 받아오기
			String pemail = selectOnePerson.getPemail(); 
			
					
			helper.setFrom("jjapkorea@naver.com"); // 발신자 주소
			helper.setSubject("[지원완료] " + mailSendDto.getBizname() + ", 유사한 공고도 확인하세요."); // 메일 제목 설정

			
			StringBuffer sbuffer = new StringBuffer();
			
			sbuffer.append("<style>"
					+ ".mailSend {"
					+ "bgcolor: 'ededed';"
					+ "width: 100%;"
					+ "height: 100%;"
					+ "}"
					+ " "
					+ "td {font-size: 9pt;}"
					+ "</style>");
			
			sbuffer.append("<div class='mailSend'>");
			sbuffer.append("<div>");
			sbuffer.append("<img src='resources/images/JJAPkorea_logo(불투명흰색).png'/>");
			
			sbuffer.append("<div>");
			sbuffer.append(mailSendDto.getBizname()+" 채용공고에 <br> 입사지원이 완료되었습니다.");
			sbuffer.append("</div>");
			
			sbuffer.append("<table cellpadding=5 cellspacing=0 border=1 style='border-collapse:collapse' boardcolor='888888'>");
			sbuffer.append(" <tr>");
			sbuffer.append(" <td align=center bgcolor='ECECEC' width=140>"
					+ mailSendDto.getBizname()
					+ "</td>");
			sbuffer.append(" </tr>");
			
			sbuffer.append(" <tr>");
			sbuffer.append(" <td width=170>"
					+ mailSendDto.getRetitle()
					+ "</td>");
			sbuffer.append(" </tr>");
			sbuffer.append("</table>");
			sbuffer.append("</div>");
			
			sbuffer.append("<div id='jpostInfo'>");
			sbuffer.append("<form action='http://localhost:8090/jjapkorea/jobpostinginfo?jid=mailSendDto.getJid()' method='post'>");
			sbuffer.append("<br><br>");
			sbuffer.append("<button type='button'>지원자 현황 보기</button>");
			sbuffer.append("</form>");
			sbuffer.append("</div>");
			
			
//			helper.setText("jjapkorea mail content test", true); 메일 전송 확인 후 주석 처리 함
			helper.setText(sbuffer.toString(), true);
			// 메일 내용 설정
			// true를 해야 html 형식으로 전송


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