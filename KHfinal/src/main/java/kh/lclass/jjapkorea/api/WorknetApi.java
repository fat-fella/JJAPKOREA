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
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
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

@PropertySource("classpath:properties/jjap.properties")
@Component
public class WorknetApi {
	@Autowired
	private JobPostingService jobPostingService;
	
	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;
	
	private List<MemberDto> memberList;
	private List<BusinessDto> businessList;
	private List<JobPostingDto> jobPostingList;
	
	private List<MemberDto> membersToRemove;
	private List<BusinessDto> businessesToRemove;
	private List<JobPostingDto> jobPostingsToRemove;
	@Value("${authkey}")
	private String authkey;
	
    public static void main(String[] args){
    }
    
    public void getJobPostings() {
    	try {
            StringBuilder urlBuilder = new StringBuilder("http://openapi.work.go.kr/opi/opi/opia/wantedApi.do"); /* URL */
            urlBuilder.append("?" + URLEncoder.encode("authKey", "UTF-8") + authkey); /* Service Key */
            urlBuilder.append("&" + URLEncoder.encode("returnType", "UTF-8") + "=" + URLEncoder.encode("xml", "UTF-8")); /* 결과형식(xml) */
            urlBuilder.append("&" + URLEncoder.encode("callTp", "UTF-8") + "=" + URLEncoder.encode("L", "UTF-8")); /* L(목록), D(상세) */
            urlBuilder.append("&" + URLEncoder.encode("startPage", "UTF-8") + "=" + URLEncoder.encode("3", "UTF-8")); /* 페이지번호 */
            urlBuilder.append("&" + URLEncoder.encode("display", "UTF-8") + "=" + URLEncoder.encode("20", "UTF-8")); /* 한 페이지 결과 수 */
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
            
            membersToRemove = new ArrayList<>();
            businessesToRemove = new ArrayList<>();
            jobPostingsToRemove = new ArrayList<>();
            
            for (int i = 0; i < wantedList.getLength(); i++) {
            	MemberDto memberDto = new MemberDto();
            	BusinessDto businessDto = new BusinessDto();
                JobPostingDto jobPostingDto = new JobPostingDto();
                Node wanted = wantedList.item(i);
                Element ele = (Element) wanted;
                // 채용 정보
                String jid = UUID.randomUUID().toString();
                jobPostingDto.setJid(jid);
	            // 아이디
                String mid = jid.replace("-", "").substring(0, 20);
                memberDto.setMid(mid);
                // 비밀번호
                String mpw = "Password1234!";
                memberDto.setMpw(bCryptPasswordEncoder.encode(mpw));
                // 권한
                memberDto.setMtype("ROLE_BUSINESS");
                businessDto.setMid(mid);
	            jobPostingDto.setMid(mid);
                // 모집분야
                jobPostingDto.setRecruitField(getTextContentByTagName(ele, "jobsCd"));
                // 회사명
                businessDto.setBizname(getTextContentByTagName(ele, "company"));
                // 사업자번호
                businessDto.setBrno(getTextContentByTagName(ele, "busino"));
                // 기업 형태
                businessDto.setBform("3");
                // 지원자학력
                jobPostingDto.setUserEducation(getTextContentByTagName(ele, "maxEdubg"));
                // 연봉
                jobPostingDto.setSalary(getTextContentByTagName(ele, "sal"));
                // 연봉 최저치
                jobPostingDto.setMinSalary(getTextContentByTagName(ele, "minSal"));
                // 연봉 최대치
                jobPostingDto.setMaxSalary(getTextContentByTagName(ele, "maxSal"));
                // 지원등록기간
                String resistDateStr = getTextContentByTagName(ele, "regDt");
                Date resistDate = parseDateString(resistDateStr);
                if (resistDate != null) {
                    String formattedResistDate = formatDateToString(resistDate);
                    jobPostingDto.setRegistDate(formattedResistDate);
                    LocalDate currentDate = LocalDate.now();
                    LocalDate resistDateLocal = LocalDate.parse(formattedResistDate, DateTimeFormatter.ofPattern("yy-MM-dd"));
                    long daysRemaining = resistDateLocal.toEpochDay() - currentDate.toEpochDay();
                    jobPostingDto.setToday((int)daysRemaining);
                }
                // 지원마감일 - '채용시까지 23-05-28' 에서 띄워쓰기로 분리하지 않고 d-day표기시 분리하기
                String closeDateStr = getTextContentByTagName(ele, "closeDt");
                Date closeDate = parseDateString(closeDateStr);
                if (closeDate != null) {
                    String formattedCloseDate = formatDateToString(closeDate);
                    jobPostingDto.setCloseDate(formattedCloseDate);
                    // D-Day 계산
                    LocalDate currentDate = LocalDate.now();
                    LocalDate closeDateLocal = LocalDate.parse(formattedCloseDate, DateTimeFormatter.ofPattern("yy-MM-dd"));
                    long daysRemaining = closeDateLocal.toEpochDay() - currentDate.toEpochDay();
                    jobPostingDto.setDday((int)daysRemaining);
                }
                // 채용제목
                jobPostingDto.setReTitle(getTextContentByTagName(ele, "title"));
                // 경력
                jobPostingDto.setCareer(getTextContentByTagName(ele, "career"));
                // 근무형태
                jobPostingDto.setWorkType(getTextContentByTagName(ele, "holidayTpNm"));
                // 고용형태
                jobPostingDto.setEmpTypeCode(getTextContentByTagName(ele, "empTp"));
                
                memberList.add(memberDto);
                businessList.add(businessDto);
                jobPostingList.add(jobPostingDto);
                
                
                
                
                
                
                //기업 로고 저장
				String[] imagePaths = {
						"https://res.cloudinary.com/jjapkorea/image/upload/v1697611598/logoimg/companylogo10_hhd8nv.png",
						"https://res.cloudinary.com/jjapkorea/image/upload/v1697611598/logoimg/companylogo06_yz0lgy.png",
						"https://res.cloudinary.com/jjapkorea/image/upload/v1697611598/logoimg/companylogo07_r4nrro.png",
						"https://res.cloudinary.com/jjapkorea/image/upload/v1697611598/logoimg/companylogo08_gaxybw.png",
						"https://res.cloudinary.com/jjapkorea/image/upload/v1697611598/logoimg/companylogo05_vmclx2.png",
						"https://res.cloudinary.com/jjapkorea/image/upload/v1697611598/logoimg/companylogo03_egxmm1.png",
						"https://res.cloudinary.com/jjapkorea/image/upload/v1697611598/logoimg/companylogo09_i7ey5l.png",
						"https://res.cloudinary.com/jjapkorea/image/upload/v1697611598/logoimg/companylogo04_rzwpue.png",
						"https://res.cloudinary.com/jjapkorea/image/upload/v1697611598/logoimg/companylogo02_e4sfta.png",
						"https://res.cloudinary.com/jjapkorea/image/upload/v1697697668/logoimg/companylogo41_mqe3zo.gif",
						"https://res.cloudinary.com/jjapkorea/image/upload/v1697697668/logoimg/companylogo40_leamhd.gif",
						"https://res.cloudinary.com/jjapkorea/image/upload/v1697697668/logoimg/companylogo42_xgodhw.png",
						"https://res.cloudinary.com/jjapkorea/image/upload/v1697697667/logoimg/companylogo32_qt69yk.gif",
						"https://res.cloudinary.com/jjapkorea/image/upload/v1697697668/logoimg/companylogo38_sijklj.png",
						"https://res.cloudinary.com/jjapkorea/image/upload/v1697697667/logoimg/companylogo37_egvgxl.png",
						"https://res.cloudinary.com/jjapkorea/image/upload/v1697697667/logoimg/companylogo33_ge7owj.png",
						"https://res.cloudinary.com/jjapkorea/image/upload/v1697697667/logoimg/companylogo30_b0hv2i.png",
						"https://res.cloudinary.com/jjapkorea/image/upload/v1697697667/logoimg/companylogo36_mpwzpn.gif",
						"https://res.cloudinary.com/jjapkorea/image/upload/v1697697667/logoimg/companylogo29_y7ow0r.png",
						"https://res.cloudinary.com/jjapkorea/image/upload/v1697697667/logoimg/companylogo34_a38cqe.gif",
						"https://res.cloudinary.com/jjapkorea/image/upload/v1697697667/logoimg/companylogo31_ihrl5p.png",
						"https://res.cloudinary.com/jjapkorea/image/upload/v1697697667/logoimg/companylogo27_jkuzyi.png",
						
				};

				
				// 랜덤으로 인덱스 생성
				int randomIndex = (int) (Math.random() * imagePaths.length);

				// 랜덤 이미지의 경로
				String randomImagePath = imagePaths[randomIndex];
                businessDto.setLogoImg(randomImagePath);
                
                
                
                
            }
            
            for (int i = 0; i < jobPostingList.size(); i++) {
                MemberDto memberDto = memberList.get(i);
                BusinessDto businessDto = businessList.get(i);
                JobPostingDto jobPostingDto = jobPostingList.get(i);

                try {
                    jobPostingService.signUpMemberAndBusinessAndInsertJobPosting(memberDto, businessDto, jobPostingDto);
                } catch (Exception e) {
                	// 제약 조건 위반 예외가 발생한 경우, 삭제할 요소를 리스트에 추가
                    membersToRemove.add(memberDto);
                    businessesToRemove.add(businessDto);
                    jobPostingsToRemove.add(jobPostingDto);
                }
            }
            // 루프가 종료된 후, 일괄적으로 요소를 제거
            memberList.removeAll(membersToRemove);
            businessList.removeAll(businessesToRemove);
            jobPostingList.removeAll(jobPostingsToRemove);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static String getTextContentByTagName(Element element, String tagName) {
//        System.out.println("!!!!"+tagName);
         String textContent = null;
         NodeList nodeList = element.getElementsByTagName(tagName);
         if (nodeList != null && nodeList.getLength() > 0) {
             nodeList = nodeList.item(0).getChildNodes();
             if (nodeList != null && nodeList.getLength() > 0) {
                textContent = nodeList.item(0).getTextContent();
             }
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
