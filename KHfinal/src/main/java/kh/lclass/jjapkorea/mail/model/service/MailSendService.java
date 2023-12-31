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
			
			
			sbuffer.append("<html><body>");
			
			sbuffer.append("<div>");
			sbuffer.append("<div>");

			sbuffer.append("<img src=\""+"https://res.cloudinary.com/finaljjapkorea/image/upload/v1697709249/JJAPKOREA_LOGO__BG_COLOR_WHITE.png"+"\">");
			
			sbuffer.append("</div>"); //logo img
			
			sbuffer.append("<div style='font-size: 32px;  '>");
			sbuffer.append("<div style='color: #111aff;'>"+mailSendDto.getBizname()+"</div>"+"<span style='color: #000000;'> 채용공고에 <br> 입사지원이 완료되었습니다. </span>");
			sbuffer.append("</div><br><br>"); // title
			
			sbuffer.append("<table width=400 height=200 cellpadding=5 cellspacing=0 border=1 style='border-collapse:collapse'>");
			sbuffer.append("<tr style='vertical-align: middle;'>");
			sbuffer.append(" <td style='font-size: 20px; color: #000000; font-weight: bold; text-align: center;'>"
					+ mailSendDto.getBizname()
					+ "</td>");
			sbuffer.append(" </tr>");
			sbuffer.append(" <tr style='vertical-align: middle;'>");
			sbuffer.append(" <td style='font-size: 16px; color: #000000; height: 50px; text-align: center;'>"
					+ mailSendDto.getRetitle()
					+ "</td>");
			sbuffer.append(" </tr>");
			sbuffer.append(" <tr style='vertical-align: middle; '>");
			sbuffer.append(" <td style='font-size: 17px; background-color: #b8ff00; text-align: center;' >");
			sbuffer.append("<a href='http://localhost:8090/jjapkorea/person/apply/list' style='text-decoration: none; color: black; '"+">지원자 현황 보기</a>"); 
			sbuffer.append(" </td>");
			sbuffer.append(" </tr>");
			sbuffer.append(" </tr>");
			sbuffer.append(" <tr style='vertical-align: middle; '>");
			sbuffer.append(" <td style='font-size: 17px; background-color: #111aff; text-align: center;' >");
			sbuffer.append("<a href='http://localhost:8090/jjapkorea/jobpostinginfo?jid="+mailSendDto.getJid()+"' style='text-decoration: none; color: white; '"+">지원한 채용공고 바로가기</a>"); 
			sbuffer.append(" </td>");
			sbuffer.append(" </tr>");
			sbuffer.append("</table>");
			sbuffer.append("</div>"); // mailSend
			
			sbuffer.append("</body></html>");

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