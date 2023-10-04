package kh.lclass.jjapkorea.api;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

import kh.lclass.jjapkorea.business.model.dto.JobPostingDto;
import kh.lclass.jjapkorea.business.model.service.JobPostingService;
import kh.lclass.jjapkorea.guest.model.dto.BusinessDto;
import kh.lclass.jjapkorea.guest.model.dto.MemberDto;

@Component
public class WorknetApi {
	@Autowired
	private JobPostingService jobPostingService;
	
	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;
	
	private List<MemberDto> memberList;
	private List<BusinessDto> businessList;
	private List<JobPostingDto> jobPostingList;
	
    public static void main(String[] args){
    }
    
    public List<JobPostingDto> getJobPostings() {
    	try {
            StringBuilder urlBuilder = new StringBuilder("http://openapi.work.go.kr/opi/opi/opia/wantedApi.do"); /* URL */
            urlBuilder.append("?" + URLEncoder.encode("authKey", "UTF-8") + "=WNLBET6R0WPQK95R8VLU02VR1HJ"); /* Service Key */
            urlBuilder.append("&" + URLEncoder.encode("returnType", "UTF-8") + "=" + URLEncoder.encode("xml", "UTF-8")); /* 결과형식(xml) */
            urlBuilder.append("&" + URLEncoder.encode("callTp", "UTF-8") + "=" + URLEncoder.encode("L", "UTF-8")); /* L(목록), D(상세) */
            urlBuilder.append("&" + URLEncoder.encode("startPage", "UTF-8") + "=" + URLEncoder.encode("3", "UTF-8")); /* 페이지번호 - 수정4!! */
            urlBuilder.append("&" + URLEncoder.encode("display", "UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /* 한 페이지 결과 수 */
            urlBuilder.append("&" + URLEncoder.encode("region", "UTF-8") + "=" + URLEncoder.encode("11000", "UTF-8")); /* 지역-서울 */
            urlBuilder.append("&" + URLEncoder.encode("occupation", "UTF-8") + "=" + URLEncoder.encode("024", "UTF-8")); /* 직종-소프트웨어 */

            URL url = new URL(urlBuilder.toString());
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Content-type", "application/json");
            System.out.println("Response code: " + conn.getResponseCode());

            BufferedReader rd;
            if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
                rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            } else {
                rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
            }

            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = rd.readLine()) != null) {
                sb.append(line);
            }

            rd.close();
            conn.disconnect();

            Document doc = parseXML(sb.toString());
            doc.getDocumentElement().normalize();

            NodeList wantedList = doc.getElementsByTagName("wanted");
            System.out.println("Total items: " + wantedList.getLength());

            memberList = new ArrayList<>();
            businessList = new ArrayList<>();
            jobPostingList = new ArrayList<>();
            
            for (int i = 0; i < wantedList.getLength(); i++) {
            	MemberDto memberDto = new MemberDto();
            	BusinessDto businessDto = new BusinessDto();
                JobPostingDto jobPotingdto = new JobPostingDto();
                Node wanted = wantedList.item(i);
                Element ele = (Element) wanted;
                // 채용 정보
                String jid = UUID.randomUUID().toString();
                jobPotingdto.setJid(jid);
	            // 아이디
                String mid = jid.replace("-", "").substring(0, 20);
                memberDto.setMid(mid);
                // 비밀번호
                String password = "Password1234!";
                memberDto.setMpw(bCryptPasswordEncoder.encode(password));
                // 권한
                memberDto.setMtype("ROLE_BUSINESS");
                businessDto.setMid(mid);
	            jobPotingdto.setMid(mid);
                // 모집분야
                jobPotingdto.setRecruitField(getTextContentByTagName(ele, "jobsCd"));
                // 회사명
                businessDto.setBizname(getTextContentByTagName(ele, "company"));
                jobPotingdto.setBizname(getTextContentByTagName(ele, "company"));
                // 사업자번호
                businessDto.setBrno(getTextContentByTagName(ele, "busino"));
                jobPotingdto.setBrno(getTextContentByTagName(ele, "busino"));
                // 지원자학력
                jobPotingdto.setUserEducation(getTextContentByTagName(ele, "maxEdubg"));
                // 연봉
                jobPotingdto.setSalary(getTextContentByTagName(ele, "sal"));
                // 연봉 최저치
                jobPotingdto.setMinSalary(getTextContentByTagName(ele, "minSal"));
                // 연봉 최대치
                jobPotingdto.setMaxSalary(getTextContentByTagName(ele, "maxSal"));
                // 지원등록기간
                String resistDateStr = getTextContentByTagName(ele, "regDt");
                Date resistDate = parseDateString(resistDateStr);
                if (resistDate != null) {
                    String formattedResistDate = formatDateToString(resistDate);
                    jobPotingdto.setRegistDate(formattedResistDate);
                    LocalDate currentDate = LocalDate.now();
                    LocalDate resistDateLocal = LocalDate.parse(formattedResistDate, DateTimeFormatter.ofPattern("yy-MM-dd"));
                    long daysRemaining = resistDateLocal.toEpochDay() - currentDate.toEpochDay();
                    jobPotingdto.setToday((int)daysRemaining);
                }
                // 지원마감일 - '채용시까지 23-05-28' 에서 띄워쓰기로 분리하지 않고 d-day표기시 분리하기
                String closeDateStr = getTextContentByTagName(ele, "closeDt");
                Date closeDate = parseDateString(closeDateStr);
                if (closeDate != null) {
                    String formattedCloseDate = formatDateToString(closeDate);
                    jobPotingdto.setCloseDate(formattedCloseDate);
                    // D-Day 계산
                    LocalDate currentDate = LocalDate.now();
                    LocalDate closeDateLocal = LocalDate.parse(formattedCloseDate, DateTimeFormatter.ofPattern("yy-MM-dd"));
                    long daysRemaining = closeDateLocal.toEpochDay() - currentDate.toEpochDay();
                    jobPotingdto.setDday((int)daysRemaining);
                }
                // 채용제목
                jobPotingdto.setReTitle(getTextContentByTagName(ele, "title"));
                // 경력
                jobPotingdto.setCareer(getTextContentByTagName(ele, "career"));
                // 근무형태
                jobPotingdto.setWorkType(getTextContentByTagName(ele, "holidayTpNm"));
                // 고용형태
                jobPotingdto.setEmpTypeCode(getTextContentByTagName(ele, "empTp"));
                
                memberList.add(memberDto);
                businessList.add(businessDto);
                jobPostingList.add(jobPotingdto);
            }
            
            for (int i = 0; i < jobPostingList.size(); i++) {
                MemberDto memberDto = memberList.get(i);
                BusinessDto businessDto = businessList.get(i);
                JobPostingDto jobPostingDto = jobPostingList.get(i);

                try {
                    jobPostingService.signUpMemberAndBusinessAndInsertJobPosting(memberDto, businessDto, jobPostingDto);
                } catch (Exception e) {
                	memberList.remove(i);
                    businessList.remove(i);
                    jobPostingList.remove(i);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    	return jobPostingList;
    }

    private static String getTextContentByTagName(Element element, String tagName) {
        String textContent = null;
        NodeList nodeList = element.getElementsByTagName(tagName);
        if (nodeList != null && nodeList.getLength() > 0) {
            nodeList = nodeList.item(0).getChildNodes();
            textContent = nodeList.item(0).getTextContent();
        }
        return textContent;
    }

    private static Document parseXML(String xmlString) throws ParserConfigurationException, IOException, SAXException {
        DocumentBuilderFactory objDocumentBuilderFactory = DocumentBuilderFactory.newInstance();
        DocumentBuilder objDocumentBuilder = objDocumentBuilderFactory.newDocumentBuilder();
        return objDocumentBuilder.parse(new InputSource(new StringReader(xmlString)));
    }
    
    private Date parseDateString(String dateString) {
        // "채용시까지"와 같은 문자열 제거
        String dateWithoutPrefix = dateString.replace("채용시까지 ", "");

        // 날짜 포맷을 지정함. "yy-MM-dd" 형태로 입력된 날짜 문자열을 Date 객체로 파싱함.
        SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");
        Date date = null;
        try {
            date = sdf.parse(dateWithoutPrefix);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return date;
    }
    
    private String formatDateToString(Date date) {
        SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");
        return sdf.format(date);
    }
}
