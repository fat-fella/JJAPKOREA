<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="resources/favicon.ico">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/member/css/jobkh_findid.css">
<!-- jQuery 스크립트 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body id="secMbr" class="mbrSubCC mbrSubSchID">

	<div id="skipNavigation">
		<p>
			<a href="#container">메뉴 건너뛰기</a>
		</p>
	</div>
	<hr>

	<!--// Header area(아이디찾기, 비밀번호 찾기, 고객상담) -->
	<div id="header">
		<div class="gnbWrap gnbWrap_mSearch">

			<div class="globalBar globalBarSub" id="globalBar">
				<div class="innerBar">
					<ul class="func">

						<!--li class="app">
				<button type="button" id="devAppDownOpen" style="float:left;"><span>앱 다운로드</span></button>
				<span class="gnbBarDeco" style="line-height:18px;"><span>2.000만 돌파</span></span>
				<button type="button" id="devOver1000Open" class="gnbBarDeco"><img src="/img/common/gnb/eappdown_deco.gif" alt="1,000만 돌파"></button>
			</li-->
						<li class="last"><span class="sns"> <!-- <a href="http://cafe.naver.com/goodlab/" target="_blank"><img src="/img/main/footer_srv_mn_4.gif" width="12" height="12" alt="좋은일 연구소"></a>
					<a href="http://www.jobkorea.co.kr/service_jk/Notice_Read.asp?page=1&B_No=12929&Search_Word" target="_blank"><img src="/img/main/footer_srv_mn_5.gif" width="12" height="12" alt="잡코리아 카카오스토리"></a> -->
								<a href="https://www.facebook.com/jobkorea" target="_blank">
									<img src="/img/main/footer_srv_mn_3.gif" width="12" height="12"
										alt="잡코리아 페이스북">
								</a> <!-- <span class="gnbBarDeco"><span><button type="button" id="devOver11Open">팬 32만명 돌파!</button></span></span> -->
								<span class="gnbBarDeco"><span><button
											type="button" id="devOver11Open">팬 32만명 돌파!</button></span></span> <!-- button type="button" id="devOver11Open" class="gnbBarDeco" style="display:inline;"><img src="/img/common/gnb/fb_deco.gif" alt="팬12만명 돌파"></button -->
						</span> <!-- <span style="position:relative; left:3px; top:-3px;"><img src="/images/banner/2013_smart_app_award.png" alt="앱어워드 취업정보분야 대상"></span> -->

							<!--// 앱 다운로드 레이어 -->
							<div class="layerTpl_1 layerApps" id="devAppDown"
								style="display: none">
								<div class="layInner">
									<p class="title">
										<em>모바일도 역시 <strong>잡코리아!!</strong> 스마트폰에 앱을 설치하세요.
										</em>
									</p>
									<div class="down">
										<p class="detail">
											PC앞에 앉기 어렵다면?<br> 스마트폰에 <strong>잡코리아 앱</strong>을 다운받으세요.
											<img class="qrCode" src="/img/common/gnb/qr_jkapp.gif"
												width="78" height="91"
												alt="QR 코드 - 잡코리아 앱 다운로드 페이지(http://m.jobkorea.co.kr/event/jobkorea)로 이동하기">
										</p>

										<form name="GnbForm" method="post">
											<fieldset>
												<legend>앱 다운로드 URL을 받으실 휴대폰 번호 입력</legend>
												<p>
													<select name="Mobile1" title="휴대폰 사업자 번호">
														<option value="010">010</option>
														<option value="011">011</option>
														<option value="016">016</option>
														<option value="017">017</option>
														<option value="018">018</option>
														<option value="019">019</option>
														<option value="0130">0130</option>
														<option value="0502">0502</option>
														<option value="0505">0505</option>
													</select> -
													<input type="text" name="Mobile2"
														onblur="chklen(this.form,name,4);Number_Only(this.form,name);"
														class="ipText" title="휴대폰 번호 앞자리" maxlength="4">
													-
													<input type="text" name="Mobile3"
														onblur="chklen(this.form,name,4);Number_Only(this.form,name);"
														class="ipText" title="휴대폰 번호 뒷자리" maxlength="4">
													<a href="http://www.jobkorea.co.kr/"
														onclick="javascript:sendData(this.form,1,0);return false;">
														<img class="ipImage" src="/img/common/gnb/btn_send.gif"
															alt="잡코리아 앱 다운로드 URL 보내기">
													</a>
												</p>
												<div class="bxPolicy">
													<input name="agree" id="lb_agree" type="checkbox">
													<label for="lb_agree">SMS 전송을 위한 개인정보이용동의</label>
													<dl>
														<dt>개인정보 수집 및 이용안내</dt>
														<dd>
															앱 다운로드 URL 전송을 위해 휴대폰 번호를 수집합니다.<br>휴대폰 번호는 다운로드 URL
															전송 후 즉시 파기하며, 이에 동의하지<br>않을 경우 다운로드 URL 전송이 불가합니다.
														</dd>
													</dl>
												</div>
											</fieldset>
										</form>
									</div>

									<ul class="apps">
										<li class="appsJK"><a
												href="http://mobile.jobkorea.co.kr/application/m_app_jobkorea.asp"
												target="_blank">
												취업정보가 가득~<br>모바일 취업 포털!<br> <strong>잡코리아</strong>
											</a></li>
										<!--
							<li class="appsJob"><a href="http://mobile.jobkorea.co.kr/application/m_app_recruitment.asp" target="_blank">인사담당자 필수 앱!<br>새로워진 채용관리앱<br> <strong>잡코리아 Yo!cruit</strong></a></li>
							-->
										<li class="appsJKU"><a
												href="http://www.jobkorea.co.kr/learning/" target="_blank">
												오직 나만을 위한 <br>맞춤 학습!<br> <strong>잡코리아
													스마트러닝</strong>
											</a></li>
										<li class="appsBoss"><a
												href="http://mobile.jobkorea.co.kr/application/m_app_dontellboss.asp"
												target="_blank">
												우량기업 이직비법<br> 이 앱안에 있소이다<br> <strong>돈텔보스</strong>
											</a></li>
										<li class="appsFJ"><a
												href="https://www.jobkorea.co.kr/Starter/application/M_app_fastjob.asp">
												빠른 대기업<br> 공채일정 알리미<br> <strong>겁나 빠른 공채</strong>
											</a></li>
										<!-- <li class="appsSM"><a href="http://mobile.jobkorea.co.kr/application/m_app_gi.asp" target="_blank">내 조건에 꼭 맞는<br> 채용정보만 쏙!<br> <strong>스마트매치</strong></a></li> -->
										<!-- li class="appsJobfair"><a href="http://mobile.jobkorea.co.kr/application/m_app_explain.asp" target="_blank">채용설명회 동영상<br> 최다 확보!<br> <strong>한큐!채용설명회</strong></a></li -->
										<!-- <li class="appsSalary"><a href="http://mobile.jobkorea.co.kr/application/m_app_salary.asp" target="_blank">연봉정보 궁금해?<br> 무료확인 가능!<br> <strong>연봉통계</strong></a></li>-->


									</ul>
								</div>
								<p class="layAction">
									<a
										href="https://www.jobkorea.co.kr/Service_JK/Notice_Read.asp?page=1&amp;B_No=13540&amp;Search_Word="
										target="_blank">2015 스마트앱 어워드 취업정보분야 대상</a>
									<a
										href="http://mobile.jobkorea.co.kr/application/m_app_jobkorea.asp"
										target="_blank">서비스 보기</a>
								</p>
								<button type="button" class="btnClose">
									<span>레이어 닫기</span>
								</button>
							</div> <!--// 1,000만 돌파 레이어(2014.05.26 추가)  -->
							<div class="layerTpl_1 layerAppsEvent" id="devOver1000"
								style="display: none">
								<p>
									<a href="http://mobile.jobkorea.co.kr/" target="_blank">
										<img
											src="//img.jobkorea.co.kr/Images/bbs_notice/2015/05/18/1500man pop.jpg"
											width="472" height="553"
											alt="잡코리아, 알바몬 앱’s 업계 최초 2,900만 다운로드 돌파! 알바생, 사장님, 취준생, 경력 구직자, 인사담당자 여러분! 2,900만의 선택에 감사드립니다. 모바일도 역시 잡코리아, 알바몬 입니다. 잡코리아&amp;알바몬 앱’s 안내 >">
									</a>
								</p>
								<button type="button" class="btnClose">
									<span>레이어 닫기</span>
								</button>
							</div> <!--// 잡코리아 페이스북 좋은일 연구소 레이어(2014.05.26 추가) -->
							<div class="layerTpl_1 layerFacebook" id="devOver11"
								style="display: none">
								<div class="layInner">
									<p>
										<img src="/img/common/gnb/fb_tit.gif" alt="잡코리아 페이스북">
									</p>
									<!-- <p class="txt1">아직 우리 친구 아닌가요?<br><strong>32만명</strong>의 팬이 만들어준 잡코리아 페이스북과 함께해요.</p> -->
									<p class="txt1">
										아직 우리 친구 아닌가요?<br> <strong>32만명</strong>의 팬이 만들어준 잡코리아
										페이스북과 함께해요.
									</p>
								</div>
								<div class="action">
									<p>
										좋은 정보는 나누고, 지친 마음은 힐링하는<br> <strong class="imp">잡코리아
											페이스북</strong>
									</p>
									<!-- <iframe src="//www.facebook.com/plugins/like.php?href=http%3A%2F%2Fwww.facebook.com%2Fjobkorea&amp;width&amp;layout=button&amp;action=like&amp;show_faces=true&amp;share=false&amp;height=25" scrolling="no" frameborder="0" allowTransparency="true" class="btnfb1" title="페이스북 좋아요"></iframe> -->
									<!-- <span class="btnfb2"><a href="http://www.facebook.com/jobkorea" target="_blank"><img src="/img/common/gnb/btn_fb1.gif" alt="둘러보기"></a></span> -->
									<p style="margin-top: 10px;">
										<a href="https://www.facebook.com/jobkorea" title="새창 열림"
											target="_blank">
											<img src="/img/common/gnb/btn_like.gif" alt="잡코리아 페이스북">
										</a>
									</p>
								</div>
								<div class="btm">
									<!-- <p class="allcount">페이스북 인사이트 2017.05.30 기준<br>팬 수 (전체 좋아요 수) <em>326,316</em></p> -->
									<p class="allcount">
										페이스북 인사이트 2017.05.30 기준<br>팬 수 (전체 좋아요 수) <em
											style="color: #5badfe;">32만명 돌파!</em>
									</p>
									<p class="award">
										<img src="/img/common/gnb/txt2_fb.gif"
											alt="정보통신 소통 우수기업 2013년 잡코리아 AA등급 선정">
									</p>
								</div>
								<button type="button" class="btnClose">
									<span>레이어 닫기</span>
								</button>
							</div></li>
						<!-- <li class="last highlight"><a href="http://m.jobkorea.co.kr/Link/?No=163" target="_blank"><span class="text"><img src="/img/common/gnb/ico_gnb_banner.gif" alt=""> 겁나빠른공채 앱 다운로드</span></a></li> -->
					</ul>

					<ul class="lnb">

						<li class="mn highlight"><a
								href="https://www.jobkorea.co.kr/Login/Login_TOT.asp?re_url=%2Flogin%2Fsearch%2Fsearch%5Fid%2Easp%3Foem%5Fno%3D1">로그인</a></li>

						<li class="mn"><a
								href="http://www.jobkorea.co.kr/Text/Promise.asp">회원가입</a></li>


						<li class="mn more devMore">
							<button type="button" id="#lnbMoreLink">
								<span>서비스 안내</span>
							</button>
							<div class="layer layer_4 devLayer">
								<ul class="link">
									<li><strong><a
												href="http://www.jobkorea.co.kr/Service_JK/GI/Option">기업
												서비스 안내</a></strong></li>
									<li><em><a
												href="http://www.jobkorea.co.kr/Service_JK/GG_Faq_Option.asp">개인
												서비스 안내</a></em></li>
									<li><a
											href="http://www.jobkorea.co.kr/service/headhunting/platinum">서치펌
											서비스 안내</a></li>
									<li><a
											href="http://company.jobkorea.co.kr/Service/default.asp#mobile"
											target="_blank">모바일 서비스 안내</a></li>
								</ul>
							</div>
						</li>

						<li class="mn"><a
								href="http://www.jobkorea.co.kr/Customer_C/CC_Main.asp">고객센터</a></li>


						<li class="mn"><a
								href="http://www.jobkorea.co.kr/event/main/home.asp">이벤트</a></li>
						<li class="mn mobile"><a class="external"
								href="http://company.jobkorea.co.kr/Service/default.asp#mobile"
								target="_blank">모바일</a></li>

						<li class="mn more devMore last"><a href="#lnbMoreLink">더보기</a>

							<div class="layer layer_3 devLayer" id="lnbMoreLink">
								<ul class="link">
									<li><em><a
												href="http://www.jobkorea.co.kr/recruit/joblist?menucode=local&amp;localorder=1">채용정보</a></em></li>
									<li><a
											href="http://www.jobkorea.co.kr/List_GG/GG_Main.asp">인재정보</a></li>
									<li><em><a href="http://www.jobkorea.co.kr/starter/">신입공채</a></em></li>
									<li><a
											href="http://www.jobkorea.co.kr/Salary_New/Main.asp"
											target="_blank">
											연봉정보 <img src="/img/common/gnb/ico_external.gif" alt="새창">
										</a></li>
									<li><a href="http://www.jobkorea.co.kr/headhunting/home">
											헤드헌팅 <img src="/img/common/gnb/ico_external.gif" alt="새창">
										</a></li>
									<li><a href="http://jobkorea.albamon.com" target="_blank">
											알바몬 <img src="/img/common/gnb/ico_external.gif" alt="새창">
										</a></li>
									<li><a href="http://bizmon.jobkorea.co.kr/Text/Main.asp"
											target="_blank">
											자료실 <img src="/img/common/gnb/ico_external.gif" alt="새창">
										</a></li>
									<li class="full first"><a
											href="http://www.jobkorea.co.kr/Theme/Main" target="_blank">
											테마별 전문채용관 <img src="/img/common/gnb/ico_external.gif"
												alt="새창">
										</a></li>
									<!--<li class="full"><a href="http://hanq.jobkorea.co.kr/pool/" target="_blank">한큐! 취업종결 서비스 <img src="/img/common/gnb/ico_external.gif" alt="새창"></a></li>-->
									<li class="full"><a
											href="https://www.jobkorea.co.kr/service/user/tool/spellcheck"
											target="_blank">
											성공! 취업툴 <img src="/img/common/gnb/ico_external.gif" alt="새창">
										</a></li>
									<!--<li class="full"><em><a href="/learning/" target="_blank">잡코리아 스마트러닝 <img src="/img/common/gnb/ico_external.gif" alt="새창"></a></em></li>-->
									<li class="full"><a
											href="http://assessment.jobkorea.co.kr/Oras/Introduction"
											target="_blank">
											채용대행 솔루션 ORAS <img src="/img/common/gnb/ico_external.gif"
												alt="새창">
										</a></li>
									<li class="full last"><a
											href="http://assessment.jobkorea.co.kr/" target="_blank">
											인적성검사 <img src="/img/common/gnb/ico_external.gif" alt="새창">
										</a></li>
								</ul>
								<span class="bg lt"></span> <span class="bg rt"></span> <span
									class="bg lb"></span> <span class="bg rb"></span>
							</div></li>

					</ul>
				</div>
			</div>

			<div id="gnb">

				<h1>
					<a class="logo" href="https://www.jobkorea.co.kr">
						<img alt="잡코리아"
							src="//i.jobkorea.kr/content/images/2023/common/gnb/h_logo.png">
					</a>
					<span class="bar"> <span class="title"> <img
							src="/img/member/h_cc_schid.gif" alt="아이디 찾기">
					</span>
					</span>
				</h1>

				<div class="secNav">
					<ol>
						<li class="mn1"><a
								href="http://www.jobkorea.co.kr/Login/Search/Search_ID.asp?OEM_No=1">
								<span></span>아이디 찾기
							</a></li>
						<li class="mn2"><a
								href="http://www.jobkorea.co.kr/Login/Search/search_pwd.asp?OEM_No=1">
								<span></span>비밀번호 찾기
							</a></li>
						<!-- <li class="mn3"><a href="/Customer_C/ETC/CC_Inquiry.asp?OEM_No=1"><span></span>고객상담</a></li>
					<li class="mn4 end"><a href="https://talk.naver.com/ct/wcb8l5" target="_blank" title="새창"><span></span>톡톡상담</a></li> -->
					</ol>
				</div>
			</div>

		</div>
	</div>
	<hr>

	<div id="wrap">

		<!--// Contents Area -->
		<div id="container">
			<div id="content">
				<h1 class="skip">아이디찾기</h1>
				<div class="mbrSec mbrSch mbrSchID">
					<h2 class="mbrHeading2">
						<img src="/img/member/title/mbr_h_reg_gg.gif" alt="회원정보 입력">
					</h2>
					<div class="mbrTplDesc">
						<p>회원구분별로 가입 시 입력한 본인정보를 입력해 주세요.</p>
					</div>
					<form name="pageForm" method="post"
						action="/Login/Search/Search_ID_Ok.asp"
						onsubmit="return form_send();return false;">
						<input type="hidden" id="foreigner" name="foreigner" value="1">
						<input type="hidden" id="CHK_Name" name="CHK_Name" value="PN">
						<input type="hidden" id="C_Ident" name="C_Ident">
						<input type="hidden" id="PhoneType" name="PhoneType" value="1">
						<input type="hidden" id="DB_Name" name="DB_Name" value="GG">
						<input type="hidden" id="OEM_No" name="OEM_No" value="1">
						<input type="hidden" id="nSite_Code" name="nSite_Code" value="JK">
						<input type="hidden" id="Certifytype" name="Certifytype" value="2">
						<input type="hidden" name="CertifytySvc" id="CertifytySvc"
							value="2">
						<input type="hidden" id="IdentPass_Type" name="IdentPass_Type"
							value="5">

						<!--// 이메일 인증 -->
						<div class="mbrCertifyData mbrCertifyDataGG">
							<fieldset>
								<legend>개인회원-이메일인증 입력폼</legend>
								<div class="mbrTplBox">
									<h3>
										<img src="/img/member/title/mbr_h_sub_gg.gif" alt="개인회원">
									</h3>
									<ul class="mbrTplData1">
										<li id="devName"><label for="lb_name" class="title">이름</label>
											<input type="text" name="lb_name" id="lb_name" maxlength="12"
												style="ime-mode: active; width: 308px;" class="ipText"></li>
										<li id="devEmailForm" style="display: none;"><label
											for="lb_email_head" class="title">이메일 주소</label> <input
												type="text" name="lb_email_head" id="lb_email_head"
												maxlength="30" style="width: 80px;" class="ipText">
											<span class="delimiter">@</span> <input type="text"
												name="lb_email_detail" id="lb_email_detail" maxlength="20"
												style="width: 80px;" class="ipText" title="e-메일 서비스 입력"
												onkeyup="Gmail_Check();"> <select title="e-메일 사업자"
											name="lb_email_select" id="lb_email_select"
											class="ipSelect ipSelect_1"
											onchange="mail_input(); Gmail_Check();">
												<option value="">선택하세요</option>
												<option value="naver.com">naver.com</option>
												<option value="hanmail.net">hanmail.net</option>
												<option value="nate.com">nate.com</option>
												<option value="daum.net">daum.net</option>
												<option value="gmail.com">gmail.com</option>
												<option value="dreamwiz.com">dreamwiz.com</option>
												<option value="etc">직접입력</option>
										</select></li>
										<li style="" id="devMobileForm"><label for="lb_mobile1"
											class="title">휴대폰 번호</label> <select title="휴대폰 국번"
											name="lb_mobile1" id="lb_mobile1" style="width: 94px;"
											class="ipSelect">
												<option value="010">010</option>
												<option value="011">011</option>
												<option value="016">016</option>
												<option value="017">017</option>
												<option value="018">018</option>
												<option value="019">019</option>
										</select> <span class="delimiter">-</span> <input type="text"
												name="lb_mobile2" id="lb_mobile2" value="" maxlength="4"
												title="휴대폰 앞자리" style="width: 94px;" class="ipText">
											<span class="delimiter">-</span> <input type="text"
												name="lb_mobile3" id="lb_mobile3" value="" maxlength="4"
												title="휴대폰 뒷자리" style="width: 94px;" class="ipText">
										</li>
										<!--**********ID/PW 찾기부분 '외국인' 기능 제거**********-->
										<!--// 외국인 인증 -->
										<!--<li id="devForeignForm" style="display:none;"><label for="userNo1" class="title">외국인등록번호</label>
								<input type="text" title="외국인등록번호 앞자리" value="" maxlength="6" name="userNo1" id="userNo1" style="width:146px;" class="ipText" onKeyUp="javascript:lengthCheck( this );"> <span class="delimiter">-</span> 
								<input type="password" title="외국인등록번호 뒷자리" value="" maxlength="7" name="userNo2" id="userNo2" style="width:146px;" class="ipText">
								<p class="check"><input id="Foreign_Agree" name="Foreign_Agree" type="checkbox"> <label for="Foreign_Agree">외국인등록번호 처리에 동의합니다.</label></p>
							</li>-->
										<!--**********ID/PW 찾기부분 '외국인' 기능 제거**********-->
									</ul>

								</div>
							</fieldset>
						</div>

					</form>
				</div>
				<p class="mbrBtnFunc">
					<span class="mbrBtn mbrBtnSearch_4"><button type="button"
							onclick="goCertifyCheck();return false;">
							<span>아이디찾기</span>
						</button></span>
				</p>

				<hr>
				<!--// 고객센터 문의 -->
				<div class="mbrSec mbrHelpInfo">
					<h2 class="skip">고객센터문의</h2>

					<!--// 아이디 찾기 경우 -->
					<p class="info">- 위 방법으로 아이디를 확인하기 힘드신 경우, 고객센터로 문의해 주세요.</p>

					<div class="helpInfoDesc">
						<dl class="tel">
							<dt>
								<span></span>전화문의
							</dt>
							<dd>Tel: 1588-9350 FaX: 02-565-9351</dd>
							<dd>평일 09:00~19:00, 토 09:00~15:00 일/공휴일 휴무</dd>
						</dl>
						<dl class="email">
							<dt>
								<span></span>메일문의
							</dt>
							<dd>
								<a href="mailto:helpdesk@jobkorea.co.kr">helpdesk@jobkorea.co.kr</a>
							</dd>
							<dd class="odd">
								<a
									href="http://www.jobkorea.co.kr/Customer_C/ETC/CC_inquiry.asp?OEM_No=1">문의·신고</a>
							</dd>
						</dl>
					</div>
				</div>
				<hr>

			</div>
		</div>
		<hr>
	</div>
	<!--// Footer Area -->

	<div id="footer" class="footer footer--short">
		<div class="footer__wrap">
			<div class="footer__advertisement clear"></div>
			<!--공지사항-->
			<div class="footer__notice">
				<h3 class="blind">공지사항</h3>
				<dl class="footer__notice-wrap clear">
					<dt class="footer__notice-title">
						<a href="http://www.jobkorea.co.kr/service_jk/notice_list.asp">공지사항</a>
					</dt>
					<dd class="footer__notice-text" id="SubFooterNoticeList_1"
						style="display: none;">
						<a
							href="http://www.jobkorea.co.kr/Service_JK/notice_read.asp?B_No=14391">
							<div class="ellipsis">잡코리아 개인정보처리방침 개정 안내</div>
							<em class="tahoma">22.01.04</em>
						</a>
					</dd>
					<dd class="footer__notice-text" id="SubFooterNoticeList_2"
						style="display: none;">
						<a
							href="http://www.jobkorea.co.kr/Service_JK/notice_read.asp?B_No=14390">
							<div class="ellipsis">[이벤트] 1월 앱 출석체크 이벤트 OPEN!</div>
							<em class="tahoma">22.01.03</em>
						</a>
					</dd>
					<dd class="footer__notice-text" id="SubFooterNoticeList_3"
						style="display: none;">
						<a
							href="http://www.jobkorea.co.kr/Service_JK/notice_read.asp?B_No=14389">
							<div class="ellipsis">보이스피싱 피해 확산 방지를 위한 안내</div>
							<em class="tahoma">22.01.03</em>
						</a>
					</dd>
					<dd class="footer__notice-text" id="SubFooterNoticeList_4" style="">
						<a
							href="http://www.jobkorea.co.kr/Service_JK/notice_read.asp?B_No=14388">
							<div class="ellipsis">[사전공지]서치펌 문자서비스 종료 후 이용기간 안내</div>
							<em class="tahoma">21.12.30</em>
						</a>
					</dd>
					<dd class="footer__notice-text" id="SubFooterNoticeList_5"
						style="display: none;">
						<a
							href="http://www.jobkorea.co.kr/Service_JK/notice_read.asp?B_No=14387">
							<div class="ellipsis">12월 잡코리아x알바몬 설문이벤트</div>
							<em class="tahoma">21.12.30</em>
						</a>
					</dd>
				</dl>
				<ul class="list-service">
					<li><a href="http://www.jobkorea.co.kr/starter/onair"
							target="_blank">잡코리아 TV</a></li>
					<li><a href="http://www.jobkorea.co.kr/theme/main"
							target="_blank">전문채용관</a></li>
					<li><a href="http://www.jobkorea.co.kr/super/main"
							target="_blank">슈퍼기업관</a></li>
					<li><a href="http://www.jobkorea.co.kr/corp/offer/list"
							target="_blank">헤드헌팅 의뢰</a></li>
					<li><a
							href="http://www.jobkorea.co.kr/service/company/learning"
							target="_blank">기업러닝</a></li>
					<li><a href="http://www.jobkorea.co.kr/university/promotion"
							target="_blank">대학 서비스</a></li>
				</ul>
				<span class="footer__notice_service"><a
						href="http://www.jobkorea.co.kr/service_jk/site_map.asp">더보기</a></span>
			</div>

			<!--공지사항//-->

			<div class="footer__service">
				<h3 class="blind">잡코리아 서비스 링크</h3>
				<ul>
					<li><a href="http://company.jobkorea.co.kr/" target="_blank">회사소개</a></li>
					<li><a href="http://www.jobkorea.co.kr/brand/" target="_blank">브랜드
							스토리</a></li>
					<li><a
							href="http://www.jobkorea.co.kr/service_jk/provision/provision_gg.asp"
							target="_blank">이용약관</a></li>
					<li><a href="http://www.jobkorea.co.kr/service_jk/privacy.asp"
							target="_blank">
							<strong>개인정보처리방침</strong>
						</a></li>
					<li><a href="http://company.jobkorea.co.kr/network/api.asp"
							target="_blank">Open API</a></li>
					<li><a href="http://www.jobkorea.co.kr/service/company/ad"
							target="_blank">광고문의</a></li>
					<li><a
							href="http://company.jobkorea.co.kr/network/default.asp#Partners"
							target="_blank">제휴문의</a></li>
					<li><a href="http://www.jobkorea.co.kr/help/faq/user"
							target="_blank">고객센터</a></li>
				</ul>
			</div>

			<div class="footer__help">
				<h3 class="blind">고객센터</h3>
				<dl class="footer__help-wrap footer__help-wrap--working-hour">
					<dt class="footer__help-title">고객센터</dt>
					<dd class="footer__help-text">
						<span>1588-9350</span>
					</dd>
					<dd class="footer__help-text">
						(평일 <span>09:00 ~ 19:00</span> 토요일 <span>09:00 ~ 15:00</span>)
					</dd>
				</dl>
				<dl class="footer__help-wrap footer__help-wrap--fax">
					<dt class="footer__help-title">
						<span>FAX</span>
					</dt>
					<dd class="footer__help-text">
						<span>02-565-9351</span>
					</dd>
				</dl>
				<dl class="footer__help-wrap footer__help-wrap--email">
					<dt class="footer__help-title">
						<span>Email</span>
					</dt>
					<dd class="footer__help-text">
						<a href="mailto:helpdesk@jobkorea.co.kr" class="footer__help-link">helpdesk@jobkorea.co.kr</a>
					</dd>
				</dl>
				<dl class="footer__help-wrap footer__help-wrap--consult">
					<dd>
						<a href=# target="_blank" title="새창" class="footer__help-link">
							<span class="footer__help--icon"></span> <span
								class="footer__help--text">톡톡상담</span>
						</a>
					</dd>
				</dl>

				<ul class="footer__sns">
					<li class="footer__sns-item"><a
							href="https://blog.naver.com/jobkorea1" target="_blank"
							title="블로그" class="footer__sns-item--blog">
							<span class="skip">블로그</span>
						</a></li>
					<li class="footer__sns-item"><a
							href="https://m.post.naver.com/my.nhn?memberNo=9028903"
							target="_blank" title="포스트" class="footer__sns-item--post">
							<span class="skip">포스트</span>
						</a></li>
					<li class="footer__sns-item"><a
							href="https://www.facebook.com/jobkorea" target="_blank"
							title="페이스북" class="footer__sns-item--facebook">
							<span class="skip">페이스북</span>
						</a></li>
					<li class="footer__sns-item"><a
							href="https://www.instagram.com/jobkorea_albamon/"
							target="_blank" title="인스타그램" class="footer__sns-item--instagram">
							<span class="skip">인스타그램</span>
						</a></li>
					<li class="footer__sns-item"><a
							href="https://www.youtube.com/channel/UCOrdY3p46GJh_CYacfwYieg"
							target="_blank" title="유튜브" class="footer__sns-item--youtube">
							<span class="skip">유튜브</span>
						</a></li>
				</ul>
			</div>

			<p class="copyright">
				ⓒ <strong><a href="http://company.jobkorea.co.kr/"
						target="_blank">JOBKOREA</a></strong> LLC. All rights reserved.
			</p>

		</div>
	</div>

	<div id="criteo-tags-div" style="display: none;"></div>
	<img
		src="https://sync.taboola.com/sg/rtbhouse-network/1/rtb-h?taboola_hm=nXJ1XuLf0qcnlkhdfZPD"
		width="1" height="1" scrolling="no" frameborder="0"
		style="display: none">
	<iframe width="1" height="1" scrolling="no" frameborder="0"
		style="display: none"
		src="https://asia.creativecdn.com/fledge-igmembership?ntk=hN-6tjVwxrGlISH_Suy47jrPefyWbxiq2K5F09kxnn_9B7J4nqsoqa5BAE7_SrmNcOhyserfK06oIDIj0wuVEQ"></iframe>
	<iframe width="1" height="1" scrolling="no" frameborder="0"
		style="display: none"
		src="https://asia.creativecdn.com/topics-membership?ntk=IBdCUifHOsQ4JfSptcCwIMBSAM5PC_v7OEJJRS3BqglRC_OigdiL_S1OCJ0Hax-gIbSsYNCnRadsCLnPprTw6Q"></iframe>
	<iframe height="0" width="0" title="Criteo DIS iframe"
		style="display: none;"></iframe>
</body>
</html>