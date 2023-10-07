<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입 | KH</title>
<link rel="icon" href="resources/favicon.ico">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/member/css/jobkh_psignup.css">
</head>
<jsp:include page="/WEB-INF/view/msg/msg.jsp"></jsp:include>
<body class="jkJoin" style="">
	<div id="wrap">

		<div id="header">
			<h1>
				<a href="index">
					<img
						src="https://i.jobkorea.kr/content/images/member/gnb/h_logo_jobkorea.png"
						alt="JOBKOREA x albamon">
				</a>
			</h1>
			<div class="joinTop">
				<h2>
					<span class="slogun_1">JOBKOREA x albamon</span>
				</h2>
			</div>

			<h3 class="skip">글로벌 메뉴</h3>
			<ul class="gnb f_clear">
				<li><a href="../index">홈</a></li>
				<li><a href="/help/">고객센터</a></li>
			</ul>

			<h3 class="skip">회원 형태별 가입</h3>
			<ul class="snb f_clear">
				<li class="person on" ><a href="person" style="width: 640px;">개인회원</a></li>
			</ul>
		</div>


		<input type="hidden" id="hdnEduId" value="">
		<div id="container" class="mbrRegist">
			<h3 class="skip">개인회원 가입 정보</h3>
			<fieldset>
				<legend>개인회원 가입</legend>
				<form action="person" id="frm" method="post" name="frm">
				
				<!--	API SNS Login   -->
				
					<!-- 소셜 로그인 -->
					<div class="row_group row_group_social">
						<h4>소셜로 간편하게 로그인하세요</h4>
					</div>
					<div class="row_group mbr_info">
						<h4>회원가입하고 다양한 혜택을 누리세요!</h4>
						<p class="subTx">
							<strong>*</strong> 필수 입력 정보입니다.
						</p>
						<input type="hidden" id="mtype" name="mtype" value="ROLE_PERSON">
						<div class="row mbr_name">
							<div class="col_1">
								<label for="M_Name" class="mbr_name">
									이름(실명)<i class="icon required" aria-hidden="hidde">*</i>
								</label>
							</div>
							

							<div class="col_2">
								<input type="text" id="M_Name" name="pname"
									class="mbr_name devReadOnly dev-name" maxlength="12">
								<div class="notice_msg" id="notice_msg_name"></div>
							</div>
							
							
 						<!-- 비밀번호란 노출 되지 않음 -->
						<div style="display: none;">
						<div class="row mbr_id">
							<div class="col_1">
								<label for="idcheck">
									ID<i class="icon required" aria-hidden="hidde">*</i>
								</label>
							</div>
							</div>
							
							<div class="col_2" >
								<input type="text" id="idcheck" name="mid" maxlength="16"
									class="dev-id" value="${snsprofile.email}"
									style="ime-mode: disabled;">
								<div class="notice_msg" id="notice_msg_id"></div>
							</div>
							<div class="row mbr_passwd">
								<div class="col_1">
									<label for="M_Pwd"> 비밀번호(8~16자의 영문, 숫자, 특수기호)<i
										class="icon required" aria-hidden="hidden">*</i>
									</label>
								</div>
							</div>
					
					
							<div class="col_2">
								<input type="password" id="M_Pwd" name="mpw"
									class="dev-password" value="${snsprofile.id} maxlength="16" style="ime-mode: disabled;">
								<button type="button" class="btnHelp" title="안전한 비밀번호 작성법">?</button>
								<div class="lyHelp">
									<dl>
										<dt>안전한 비밀번호 작성법</dt>
										<dd>
											<ol>
												<li>8~16자의 영문 대소문, 숫자, 특수기호만 사용가능 (공백입력 불가)</li>
												<li>3자 이상 연속 영문/숫자 조합은 사용불가 (AAA. 111)</li>
												<li>아이디, 반복되는 영문/숫자 조합은 사용불가 (1234, ABCD)</li>
												<li>키보드의 연속 패턴은 사용하지 마세요. (ASDF)</li>
												<li>비밀번호는 주기적으로 변경하여 안전하게 관리하기</li>
											</ol>
										</dd>
									</dl>
								</div>
								<div class="notice_msg" id="notice_msg_pwd"></div>
								</div>
							</div>
						</div>
						<!-- SNS 이메일 노출 되지 않음 -->
						<div style="display: none;">
						<div class="row mbr_email">
							<!-- <p class="emailTxt">개인 맞춤 채용정보/정기 뉴스레터/이벤트 메일이 발송됩니다.</p>  -->
							<div class="col_1">
								<label for="M_Email" class="mbr_email_id">
									이메일<i class="icon required" aria-hidden="hidde">*</i>
								</label>
							</div>
							<div class="col_2">
								<input type="text" id="M_Email" name="pemail"
									class="mbr_email_id dev-mail" value="${snsprofile.email}" size="8" maxlength="30">
								<div class="notice_msg" id="notice_msg_mail"></div>
								<input type="hidden" id="Email_ID" name="Email_ID">
								<input type="hidden" id="Email_Addr" name="Email_Addr">
							</div>
						</div>
						</div>
						<div class="row mbr_phone">
							<div class="col_1">
								<!-- <label for="M_Phone">
									휴대폰번호<i class="icon required" aria-hidden="hidde">*</i>
								</label>
							</div>
							<div class="col_2">
								<input type="text" id="M_Phone" name="pphone" size="4"
									maxlength="13" class="dev-phone">
								<button type="button" class="button buttonSendCertification"
									id="btnSendCert">
									<span>인증번호 전송</span>
								</button>
								<div class="notice_msg" id="notice_msg_phone"></div>
								<input type="hidden" id="M_Phone1" name="M_Phone1">
								<input type="hidden" id="M_Phone2" name="M_Phone2">
								<input type="hidden" id="M_Phone3" name="M_Phone3">
							</div>
						</div>
						<div class="row authentication_check">
							<div class="col_1">
								<label for="Certify_Num" class="authentication_number">
									인증번호 입력<i class="icon required" aria-hidden="hidde">*</i>
								</label>
							</div>
							<div class="col_2">
								<input type="hidden" name="lb_certifytype" value="2">
								<input type="text" id="Certify_Num" name="Certify_Num"
									class="authentication_number" maxlength="6">
								<div>
									<button type="button" class="btnConfirm" id="btnCheckCert">
										<span>확인</span>
									</button>
									<button type="button" class="btnSend" id="btnReSendCert">
										<span>재전송</span>
									</button>
								</div> -->

								<div class="notice_msg" id="notice_msg_certify"></div>
							</div>

						</div>
					</div>
					<h4 class="skip">약관 동의</h4>
					<div class="row_group line_all policy">
						<div class="row policy_check_all">
							<input type="checkbox" id="lb_chk_all" class="mbrCheckOff">
							<label for="lb_chk_all" class="chk_all">
								<span class="txt">필수동의 항목 및 개인정보 수집 및 이용 동의(선택), 광고성 정보
									수신<br>(선택)에 모두 동의합니다.
								</span>
							</label>
						</div>
						<div class="row policy_check_service required">
							<input type="checkbox" id="lb_chk_age" name="Y15_Older_Agree"
								class="mbrCheckOn" value="1">
							<label for="lb_chk_age" class="chk_age">
								<strong>[필수]</strong> 만 15세 이상입니다
							</label>
						</div>
						<div class="row policy_check_service required">
							<input type="checkbox" id="lb_chk_service" name="Service_Agree"
								class="mbrCheckOn" value="1">
							<label for="lb_chk_service" class="chk_service">
								<strong>[필수]</strong> 이용약관 동의
								<a href="#DevPolicyService" class="mbrBtnPolicy">내용보기</a>
							</label>
							<div id="DevPolicyService" class="policyTplBox">
								<div class="pvsSec pvsCntTp">
									<ol>
										<li>
											<dl>
												<dt>
													<a name="gg01" id="gg01"></a>
													<strong>제 1 조 (목적) </strong>
												</dt>
												<dd>본 약관은 잡코리아(이하 "회사")가 운영하는 "서비스"를 이용함에 있어 "회사"와 회원간의
													이용 조건 및 제반 절차, 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 한다.</dd>
											</dl>
										</li>
										<li>
											<dl>
												<dt>
													<a name="gg02" id="gg02"></a>
													<strong>제 2 조 (용어의 정의) </strong>
												</dt>
												<dd>
													<p>이 약관에서 사용하는 용어의 정의는 아래와 같다.</p>
													<ol>
														<li>① "사이트"라 함은 회사가 서비스를 "회원"에게 제공하기 위하여 컴퓨터 등
															정보통신설비를 이용하여 설정한 가상의 영업장 또는 회사가 운영하는 웹사이트, 모바일웹, 앱 등의
															서비스를 제공하는 모든 매체를 통칭하며, 통합된 하나의 회원 계정(아이디 및 비밀번호)을 이용하여
															서비스를 제공받을 수 있는 아래의 사이트를 말한다.
															<ul>
																<li>- www.jobkorea.co.kr</li>
																<li>- www.albamon.com</li>
																<li>- m.jobkorea.co.kr</li>
																<li>- m.albamon.com</li>
																<li>- learning.jobkorea.co.kr</li>
															</ul>
														</li>
														<li>② "서비스"라 함은 회사가 운영하는 사이트를 통해 개인이 구직, 교육 등의 목적으로
															등록하는 자료를 DB화하여 각각의 목적에 맞게 분류 가공, 집계하여 정보를 제공하는 서비스와 사이트에서
															제공하는 모든 부대 서비스를 말한다.</li>
														<li>③ "회원"이라 함은 "회사"가 제공하는 서비스를 이용하거나 이용하려는 자로, 페이스북
															등 외부 서비스 연동을 통해 "회사"와 이용계약을 체결한자 또는 체결하려는 자를 포함하며, 아이디와
															비밀번호의 설정 등 회원가입 절차를 거쳐 회원가입확인 이메일 등을 통해 회사로부터 회원으로 인정받은
															"개인회원"을 말한다.</li>
														<li>④ "아이디"라 함은 회원가입 시 회원의 식별과 회원의 서비스 이용을 위하여 "회원"이
															선정하고 "회사"가 부여하는 문자와 숫자의 조합을 말한다.</li>
														<li>⑤ "비밀번호"라 함은 위 제4항에 따라 회원이 회원가입시 아이디를 설정하면서 아이디를
															부여받은 자와 동일인임을 확인하고 "회원"의 권익을 보호하기 위하여 "회원"이 선정한 문자와 숫자의
															조합을 말한다.</li>
														<li>⑥ "비회원"이라 함은 회원가입 절차를 거치지 않고 "회사"가 제공하는 서비스를
															이용하거나 하려는 자를 말한다.</li>
													</ol>
												</dd>
											</dl>
										</li>
										<li>
											<dl>
												<dt>
													<a name="gg03" id="gg03"></a>
													<strong>제 3 조 (약관의 명시와 개정) </strong>
												</dt>
												<dd>
													<ol>
														<li>① "회사"는 이 약관의 내용과 상호, 영업소 소재지, 대표자의 성명, 사업자등록번호,
															연락처 등을 "회원"이 알 수 있도록 초기 화면에 게시하거나 기타의 방법으로 "회원"에게 공지해야
															한다.</li>
														<li>② "회사"는 약관의 규제에 관한 법률, 전기통신기본법, 전기통신사업법, 정보통신망
															이용촉진 및 정보보호 등에 관한 법률 등 관련법을 위반하지 않는 범위에서 이 약관을 개정할 수 있다.</li>
														<li>③ "회사"가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 그
															개정약관의 적용일자 7일 전부터 적용일자 전일까지 공지한다. 단 "회원"의 권리, 의무에 중대한 영향을
															주는 변경의 경우에는 적용일자 30일 전부터 공지하도록 한다.</li>
														<li>④ "회원"은 변경된 약관에 대해 거부할 권리가 있다. "회원"은 변경된 약관이 공지된
															지 15일 이내에 거부의사를 표명할 수 있다. "회원"이 거부하는 경우 본 서비스 제공자인 "회사"는
															15일의 기간을 정하여 "회원"에게 사전 통지 후 당해 "회원"과의 계약을 해지할 수 있다. 만약,
															"회원"이 거부의사를 표시하지 않거나, 전항에 따라 시행일 이후에 "서비스"를 이용하는 경우에는 동의한
															것으로 간주한다.</li>
													</ol>
												</dd>
											</dl>
										</li>
										<li>
											<dl>
												<dt>
													<a name="gg04" id="gg04"></a>
													<strong>제 4 조 (약관의 해석) </strong>
												</dt>
												<dd>
													<ol>
														<li>① 이 약관에서 규정하지 않은 사항에 관해서는 약관의 규제에 관한 법률, 전기통신기본법,
															전기통신사업법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 등의 관계법령에 따른다.</li>
														<li>② 각 사이트 및 서비스 이용약관이 있는 경우에는 서비스 이용약관이 우선한다.</li>
														<li>③ "회원"이 "회사"와 개별 계약을 체결하여 서비스를 이용하는 경우에는 개별 계약이
															우선한다.</li>
													</ol>
												</dd>
											</dl>
										</li>
										<li>
											<dl>
												<dt>
													<a name="gg05" id="gg05"></a>
													<strong>제 5 조 (이용계약의 성립) </strong>
												</dt>
												<dd>
													<ol>
														<li>① "회사"의 서비스 이용계약(이하 "이용계약")은 서비스를 이용하고자 하는 자가 본
															약관과 개인정보처리방침을 읽고 "동의" 또는 "확인" 버튼을 누른 경우 본 약관에 동의한 것으로
															간주한다.</li>
														<li>② 제1항 신청에 있어 "회사"는 "회원"의 종류에 따라 전문기관을 통한 실명확인 및
															본인인증을 요청할 수 있으며, "회원"은 본인인증에 필요한 이름, 생년월일, 연락처 등을 제공하여야
															한다.</li>
														<li>③ "회원"이 이용신청(회원가입 신청) 작성 후에 "회사"가 웹상의 안내 및 전자메일로
															"회원"에게 통지함으로써 이용계약이 성립된다.</li>
														<li>④ 페이스북 등 외부 서비스와의 연동을 통해 이용계약을 신청할 경우, 본 약관과
															개인정보처리방침, 서비스 제공을 위해 "회사"가 "회원"의 외부 서비스 계정 정보 접근 및 활용에
															"동의" 또는 "확인" 버튼을 누르면 "회사"가 웹상의 안내 및 전자메일로 "회원"에게 통지함으로써
															이용계약이 성립된다.</li>
													</ol>
												</dd>
											</dl>
										</li>
										<li>
											<dl>
												<dt>
													<a name="gg06" id="gg06"></a>
													<strong>제 6 조 (이용신청의 승낙과 제한) </strong>
												</dt>
												<dd>
													<ol>
														<li>① "회사"는 전조의 규정에 의한 이용신청 고객에 대하여 업무수행상 또는 기술상 지장이
															없는 경우에는 원칙적으로 접수순서에 따라 서비스 이용을 승낙한다.</li>
														<li>② "회사"는 아래사항에 해당하는 경우에 대해서는 서비스 이용신청을 승낙하지 아니한다.
															<ol>
																<li>1. 실명이 아니거나 타인의 명의를 이용하여 신청한 경우</li>
																<li>2. 이용계약 신청서의 내용을 허위로 기재하거나 "회사"가 제시하는 내용을 기재하지
																	않은 경우</li>
																<li>3. 만 15세 미만의 아동이 신청한 경우. 다만, 만 13세 이상 만 15세 미만의
																	아동으로서 노동부장관 발급의 취직인허증이 있는 경우에는 그러하지 아니한다.</li>
																<li>4. 이용자의 귀책사유로 인하여 승인이 불가능하거나 기타 규정한 제반 사항을 위반하여
																	신청하는 경우</li>
															</ol>
														</li>
														<li>③ "회사"는 아래사항에 해당하는 경우에는 그 신청에 대하여 승낙제한 사유가 해소될
															때까지 승낙을 유보할 수 있다.
															<ol>
																<li>1. "회사"가 설비의 여유가 없는 경우</li>
																<li>2. "회사"의 기술상 지장이 있는 경우</li>
																<li>3. 기타 "회사"의 귀책사유로 이용승낙이 곤란한 경우</li>
															</ol>
														</li>
													</ol>
												</dd>
											</dl>
										</li>
										<li>
											<dl>
												<dt>
													<a name="gg07" id="gg07"></a>
													<strong>제 7 조 (서비스의 내용) </strong>
												</dt>
												<dd>
													<ol>
														<li>① "회사"는 제2조 2항의 서비스를 제공할 수 있으며 그 내용은 다음 각 호와 같다.
															<ol>
																<li>1. 이력서 등록 및 인재정보 게재 서비스</li>
																<li>2. 온라인 입사지원 서비스</li>
																<li>3. 헤드헌팅/아웃소싱 서비스</li>
																<li>4. 구인/구직과 관련된 제반 서비스</li>
																<li>5. 기업리뷰 등록과 조회 서비스</li>
																<li>6. 기업정보 조회와 관련된 제반 서비스</li>
																<li>7. 교육과 관련된 제반 서비스</li>
																<li>8. 이용자간의 교류와 소통에 관련한 서비스</li>
																<li>9. 자료거래에 관련한 서비스</li>
																<li>10. 기타"회사"가 추가 개발, 편집, 재구성하거나 제휴계약 등을 통해 “회원”에게
																	제공하는 일체의 서비스</li>
															</ol>
														</li>
														<li>② "회사"는 필요한 경우 서비스의 내용을 추가 또는 변경할 수 있다. 단, 이 경우
															"회사"는 추가 또는 변경내용을 "회원"에게 공지해야 한다.</li>
													</ol>
												</dd>
											</dl>
										</li>
										<li>
											<dl>
												<dt>
													<a name="gg08" id="gg08"></a>
													<strong>제 8 조 (회원, 이력서 및 게시물 등의 정보) </strong>
												</dt>
												<dd>
													<ol>
														<li>① "회원"의 이력서는 개인이 회원가입 또는 이력서 작성 및 수정시 희망한 형태로 등록
															및 제공된다.</li>
														<li>② "회사"는 "회원"이 이력서의 인재정보 등록/미등록 지정, 이력서상의 연락처 제공
															여부를 자유롭게 선택할 수 있도록 하여야 한다.</li>
														<li>③ "회사"는 "회원"이 이력서의 인재정보 등록 및 제공을 희망했을 경우, 기업회원,
															서치펌회원의 이력서 열람 및 각종 포지션 제안에 동의한 것으로 간주하며 "회사"는 기업회원,
															서치펌회원에게 유료로 이력서 열람 서비스를 제공할 수 있다. 다만, 연락처 각 항목이 비공개로 지정된
															경우 해당 항목별 연락처를 노출할 수 없다.</li>
														<li>④ "회사"는 안정적인 서비스를 제공하기 위해 테스트 및 모니터링 용도로 "사이트"
															운영자가 이력서 및 게시물 등의 정보를 열람하도록 할 수 있다.</li>
														<li>⑤ "회사"는 "회원"의 선택에 의하여 등록 및 제공되는 이력서 및 게시물 등의 정보를
															기준으로 구직활동에 보다 유익한 서비스를 제공하기 위하여 이를 개발, 편집, 재구성한 통계 자료로 활용
															할 수 있다.</li>
													</ol>
												</dd>
											</dl>
										</li>
										<li>
											<dl>
												<dt>
													<a name="gg9" id="gg9"></a>
													<strong>제 9 조 (제휴를 통한 서비스) </strong>
												</dt>
												<dd>
													<ol>
														<li>① "회사"는 제휴 관계를 체결한 여타 인터넷 웹 사이트 및 채용박람회 또는 신문, 잡지
															등의 오프라인 매체를 통해 사이트에 등록한 "회원"의 이력서 정보가 열람될 수 있도록 서비스를 제공할
															수 있다. 단, 제휴 서비스를 통해 노출되는 이력서의 연락처 정보는 “회원”이 이력서 등록 시 선택한
															연락처 공개 여부에 따라 제공된다.</li>
														<li>② "회사"는 제휴를 통해 타 사이트 및 매체에 등록될 수 있음을 고지해야 하며, 제휴
															사이트 목록을 사이트내에서 상시 열람할 수 있도록 해야 한다. 단, 등록의 형태가 "회사"가 직접
															구축하지 않고, 제휴사가 xml 또는 api 형태로 "회사"로부터 제공 받아 구축한 매체 목록은 본
															약관외 별도의 제휴리스트에서 열람할 수 있도록 한다.</li>
														<li>③ "회사"는 "회원"이 공개를 요청한 이력서에 한해 제휴를 맺은 타 사이트에 이력서
															정보를 제공한다. (본 약관 시행일 현재에는 제휴를 통한 타 사이트 및 매체는 없다.)</li>
														<li>④ 본 조 제 3항 제휴를 통한 사이트의 변동사항 발생 시 공지사항을 통해 고지 후 진행
															한다.</li>
													</ol>
												</dd>
											</dl>
										</li>
										<li>
											<dl>
												<dt>
													<a name="gg10" id="gg10"></a>
													<strong>제 10 조 (서비스의 요금) </strong>
												</dt>
												<dd>
													<ol>
														<li>① "회원" 가입과 이력서 등록은 무료이다. 다만 기업회원 또는 사이트에 방문한
															기업체에게 자신의 이력서 정보를 보다 효과적으로 노출시키기 위한 유료서비스 및 인성, 적성 검사 등
															회원 가입 목적 외 기타 서비스를 이용하기 위한 별도의 서비스는 유료로 제공될 수 있다.</li>
														<li>② "회사"는 유료서비스를 제공할 경우 사이트에 요금에 대해서 공지를 하여야 한다.</li>
														<li>③ "회사"는 유료서비스 이용금액을 서비스의 종류 및 기간에 따라 "회사"가 예고 없이
															변경할 수 있다. 다만, 변경 이전에 적용 또는 계약한 금액은 소급하여 적용하지 아니한다.</li>
													</ol>
												</dd>
											</dl>

										</li>
										<li>
											<dl>
												<dt>
													<a name="gg11" id="gg11"></a>
													<strong>제 11 조 (서비스 요금의 환불)</strong>
												</dt>
												<dd>
													<ol>
														<li>① "회사"는 다음 각 호에 해당하는 경우 이용요금을 환불한다. 단, 각 당사자의
															귀책사유에 따라 환불 조건이 달라질 수 있다.
															<ol>
																<li>1. 유료서비스 이용이 개시되지 않은 경우</li>
																<li>2. 네트워크 또는 시스템 장애로 서비스 이용이 불가능한 경우</li>
																<li>3. 유료서비스 신청 후 “회원”의 사정에 의해 서비스가 취소될 경우</li>
															</ol>
														</li>
														<li>② "회사"가 본 약관 제19조에 따라 가입해지/서비스중지/자료삭제를 취한 경우,
															“회사”는 “회원”에게 이용요금을 환불하지 않으며, 별도로 “회원”에게 손해배상을 청구할 수 있다.</li>
														<li>③ 이용료를 환불받고자 하는 회원은 고객센터로 환불을 요청해야 한다.</li>
														<li>④ "회사"는 환불 요건에 부합하는 것으로 판단될 경우, 각 서비스 환불 안내에 따라
															유료이용 계약 당시 상품의 정가 기준으로 서비스 제공된 기간에 해당하는 요금을 차감한 잔액을 환불한다.</li>
													</ol>
												</dd>
											</dl>
										</li>
										<li>
											<dl>
												<dt>
													<a name="gg12" id="gg12"></a>
													<strong>제 12 조 (서비스 이용시간) </strong>
												</dt>
												<dd>
													<ol>
														<li>① "회사"는 특별한 사유가 없는 한 연중무휴, 1일 24시간 서비스를 제공한다. 다만,
															"회사"는 서비스의 종류나 성질에 따라 제공하는 서비스 중 일부에 대해서는 별도로 이용시간을 정할 수
															있으며, 이 경우 "회사"는 그 이용시간을 사전에 "회원"에게 공지 또는 통지하여야 한다.</li>
														<li>② "회사"는 자료의 가공과 갱신을 위한 시스템 작업시간, 장애해결을 위한 보수작업
															시간, 정기 PM작업, 시스템 교체작업, 회선 장애 등이 발생한 경우 일시적으로 서비스를 중단할 수
															있으며 계획된 작업의 경우 공지란에 서비스 중단 시간과 작업 내용을 알려야 한다. 다만, "회사"가
															사전에 통지할 수 없는 부득이한 사유가 있는 경우 사후에 통지할 수 있다.</li>
													</ol>
												</dd>
											</dl>
										</li>
										<li>
											<dl>
												<dt>
													<a name="gg13" id="gg13"></a>
													<strong>제 13 조 (서비스 제공의 중지) </strong>
												</dt>
												<dd>
													<ol>
														<li>① "회사"는 다음 각 호에 해당하는 경우 서비스의 제공을 중지할 수 있다.
															<ol>
																<li>1. 설비의 보수 등 "회사"의 필요에 의해 사전에 "회원"들에게 통지한 경우</li>
																<li>2. 기간통신사업자가 전기통신서비스 제공을 중지하는 경우</li>
																<li>3. 기타 불가항력적인 사유에 의해 서비스 제공이 객관적으로 불가능한 경우</li>
															</ol>
														</li>
														<li>② 전항의 경우, "회사"는 기간의 정함이 있는 유료서비스 이용자들에게는 그 이용기간을
															연장하거나 환불 등의 방법으로 손실을 보상하여야 한다.</li>
													</ol>
												</dd>
											</dl>
										</li>
										<li>
											<dl>
												<dt>
													<a name="gg14" id="gg14"></a>
													<strong>제 14 조 (정보의 제공 및 광고의 게재) </strong>
												</dt>
												<dd>
													<ol>
														<li>① "회사"는 "회원"에게 서비스 이용에 필요가 있다고 인정되거나 서비스 개선 및
															회원대상의 서비스 소개 등의 목적으로 하는 각종 정보에 대해서 전자우편이나 서신우편을 이용한 방법으로
															제공할 수 있다.</li>
														<li>② "회사"는 제공하는 서비스와 관련되는 정보 또는 광고를 서비스 화면, 홈페이지,
															전자우편 등에 게재할 수 있으며, 광고가 게재된 전자우편을 수신한 "회원"은 수신거절을 "회사"에게 할
															수 있다.</li>
														<li>③ "회사"는 서비스상에 게재되어 있거나 본 서비스를 통한 광고주의 판촉활동에 "회원"이
															참여하거나 교신 또는 거래를 함으로써 발생하는 모든 손실과 손해에 대해 책임을 지지 않는다.</li>
														<li>④ 본 서비스의 "회원"은 서비스 이용 시 노출되는 광고게재에 대해 동의 하는 것으로
															간주한다.</li>
													</ol>
												</dd>
											</dl>
										</li>
										<li>
											<dl>
												<dt>
													<a name="gg15" id="gg15"></a>
													<strong>제 15 조 (자료내용의 책임과 "회사"의 정보 수정 권한) </strong>
												</dt>
												<dd>
													<ol>
														<li>① 자료내용은 "회원"이 등록한 개인정보 및 이력서와 사이트에 게시한 게시물을 말한다.</li>
														<li>② "회원"은 자료 내용 및 게시물을 사실에 근거하여 성실하게 작성해야 하며, 만일
															자료의 내용이 사실이 아니거나 부정확하게 작성되어 발생하는 모든 책임은 "회원"에게 있다. "회사"는
															"회원"이 작성한 게시물 등의 정확성 및 진실성을 보증하지 아니하며, 게시물에 대한 일체의 책임을
															부담하지 아니한다.</li>
														<li>③ 모든 자료내용의 관리와 작성은 "회원" 본인이 하는 것이 원칙이나 사정상 위탁 또는
															대행관리를 하더라도 자료내용의 책임은 "회원"에게 있으며 "회원"은 주기적으로 자신의 자료를 확인하여
															항상 정확하게 관리가 되도록 노력해야 한다.</li>
														<li>④ "회사"는 "회원"이 등록한 자료 내용에 오자, 탈자 또는 사회적 통념에 어긋나는
															문구와 내용이 있을 경우 이를 언제든지 수정할 수 있다.</li>
														<li>⑤ "회원"이 등록한 자료으로 인해 타인(또는 타법인)으로부터 허위사실 및 명예훼손
															등으로 삭제 요청이 접수된 경우 "회사"는 "회원"에게 사전 통지 없이 본 자료를 삭제할 수 있으며
															삭제 후 메일 등의 방법으로 통지할 수 있다.</li>
													</ol>
												</dd>
											</dl>
										</li>
										<li>
											<dl>
												<dt>
													<a name="gg16" id="gg16"></a>
													<strong>제 16 조 (자료 내용의 활용 및 취급) </strong>
												</dt>
												<dd>
													<ol>
														<li>① "회원"이 선택하거나 입력한 정보는 취업 및 관련 동향의 통계 자료로 구성, 활용될
															수 있으며 그 자료는 매체를 통한 언론 배포 또는 제휴사에게 제공될 수 있다. 단, 개인을 식별할 수
															있는 형태가 아니어야 한다.</li>
														<li>② 제8조 제3항에 따라 "사이트"에서 정당한 절차를 거쳐 기업회원, 서치펌회원이 열람한
															"회원"의 이력서 정보는 해당 기업의 인사자료이며 이에 대한 관리 권한은 해당 기업의 정책에 의한다.</li>
														<li>③ "회사"는 "사이트"의 온라인 입사지원 시스템을 통해 지원한 "회원"의 이력서 열람
															여부 및 기업회원이 제공한 채용정보에 입사지원한 구직자들의 각종 통계데이터를 "회원"에게 제공할 수
															있다.</li>
													</ol>
												</dd>
											</dl>
										</li>
										<li>
											<dl>
												<dt>
													<a name="gg17" id="gg17"></a>
													<strong>제 17 조 ("회사"의 의무) </strong>
												</dt>
												<dd>
													<ol>
														<li>① "회사"는 본 약관에서 정한 바에 따라 계속적, 안정적으로 서비스를 제공할 수 있도록
															최선의 노력을 다해야 한다.</li>
														<li>② "회사"는 서비스와 관련한 "회원"의 불만사항이 접수되는 경우 이를 즉시 처리하여야
															하며, 즉시 처리가 곤란한 경우에는 그 사유와 처리일정을 서비스 화면 또는 기타 방법을 통해 동
															"회원"에게 통지하여야 한다.</li>
														<li>③ "회사"는 유료 결제와 관련한 결제 사항 정보를 1년 이상 보존한다. 다만 회원
															자격이 없는 회원은 예외로 한다.</li>
														<li>④ 천재지변 등 예측하지 못한 일이 발생하거나 시스템의 장애가 발생하여 서비스가 중단될
															경우 이에 대한 손해에 대해서는 "회사"가 책임을 지지 않는다. 다만 자료의 복구나 정상적인 서비스
															지원이 되도록 최선을 다할 의무를 진다.</li>
														<li>⑤ "회원"의 자료를 본 서비스 이외의 목적으로 제3자에게 제공하거나 열람시킬 경우
															반드시 "회원"의 동의를 얻어야 한다.</li>
													</ol>
												</dd>
											</dl>
										</li>
										<li>
											<dl>
												<dt>
													<a name="gg18" id="gg18"></a>
													<strong>제 18 조 ("회원"의 의무) </strong>
												</dt>
												<dd>
													<ol>
														<li>① "회원"은 관계법령과 본 약관의 규정 및 기타 "회사"가 통지하는 사항을 준수하여야
															하며, 기타 "회사"의 업무에 방해되는 행위를 해서는 안 된다.</li>
														<li>② "회원"이 신청한 유료서비스는 등록 또는 신청과 동시에 "회사"와 채권, 채무 관계가
															발생하며, "회원"은 이에 대한 요금을 지정한 기일 내에 납부하여야 한다.</li>
														<li>③ "회원"이 결제 수단으로 신용카드를 사용할 경우 비밀번호 등 정보 유실 방지는
															"회원" 스스로 관리해야 한다. 단, "사이트"의 결함에 따른 정보유실의 발생에 대한 책임은 "회원"의
															의무에 해당하지 아니한다.</li>
														<li>④ "회원"은 서비스를 이용하여 얻은 정보를 "회사"의 사전동의 없이 복사, 복제,
															번역, 출판, 방송 기타의 방법으로 사용하거나 이를 타인에게 제공할 수 없다.</li>
														<li>⑤ "회원"은 본 서비스를 건전한 취업 및 경력관리 이외의 목적으로 사용해서는 안되며
															이용 중 다음 각 호의 행위를 해서는 안 된다.
															<ol>
																<li>1. 다른 회원의 아이디를 부정 사용하는 행위</li>
																<li>2. 범죄행위를 목적으로 하거나 기타 범죄행위와 관련된 행위</li>
																<li>3. 타인의 명예를 훼손하거나 모욕하는 행위</li>
																<li>4. 타인의 지적재산권 등의 권리를 침해하는 행위</li>
																<li>5. 해킹행위 또는 바이러스의 유포 행위</li>
																<li>6. 타인의 의사에 반하여 광고성 정보 등 일정한 내용을 계속적으로 전송하는 행위</li>
																<li>7. 서비스의 안정적인 운영에 지장을 주거나 줄 우려가 있다고 판단되는 행위</li>
																<li>8. 사이트의 정보 및 서비스를 이용한 영리 행위</li>
																<li>9. 그밖에 선량한 풍속, 기타 사회질서를 해하거나 관계법령에 위반하는 행위</li>
															</ol>
														</li>
													</ol>
												</dd>
											</dl>
										</li>
										<li>
											<dl>
												<dt>
													<a name="gg19" id="gg19"></a>
													<strong>제 19 조 ("회원"의 가입해지/서비스중지/자료삭제) </strong>
												</dt>
												<dd>
													<ol>
														<li>① "회원"은 언제든지 회원탈퇴 또는 이력서 등록을 해지하기 위해 고객센터 또는 회원탈퇴
															메뉴 등을 통하여 이용계약 해지 신청을 할 수 있으며, "회사"는 관련법 등이 정하는 바에 따라 이를
															처리한다.</li>
														<li>② 다음의 사항에 해당하는 경우 "회사"는 사전 동의없이 가입해지나 서비스 중지, 이력서
															삭제 조치를 취할 수 있다.
															<ol>
																<li>1. 회원의 의무를 성실하게 이행하지 않았을 때</li>
																<li>2. 규정한 유료서비스 이용 요금을 납부하지 않았을 때</li>
																<li>3. 본 서비스 목적에 맞지 않는 분야에 정보를 활용하여 사회적 물의가 발생한 때</li>
																<li>4. 회원이 등록한 정보의 내용이 사실과 다르거나 조작되었을 때</li>
																<li>5. 본 서비스와 관련하여 회사 또는 제3자의 명예를 훼손하였을 때</li>
																<li>6. 기타 위 각호에 준하는 사유가 발생하였을 때</li>
															</ol>
														</li>
														<li>③ "회원"이 유료서비스를 이용하는 중 "회사"의 책임에 의해 정상적인 서비스가 제공되지
															않을 경우 "회원"은 본 서비스의 해지를 요청할 수 있으며 "회사"는 기간의 정함이 있는 유료서비스의
															경우에는 해지일까지 이용일수를 1일 기준금액으로 계산하여 이용금액을 공제 후 환급하고, 이용건수의
															정함이 있는 유료서비스의 경우에는 기 사용분을 1건 기준금액으로 계산하여 이용금액을 공제후 환급한다.
														</li>
														<li>④ "회사"는 회원 가입이 해지된 경우에는 개인정보처리방침 중, 04.개인정보의 보유 및
															이용기간 규정에 따른다.</li>
														<li>⑤ 개인정보보호를 위하여 "회원"이 선택한 개인정보 보유기간(1년, 3년, 회원탈퇴시)
															동안 "사이트"를 이용하지 않은 경우, "아이디"를 "휴면계정"으로 분리하여 해당 계정의 이용을 중지할
															수 있다. 이 경우 "회사"는 "휴면계정 처리 예정일"로부터 30일 이전에 해당사실을 전자메일, 서면,
															SMS 중 하나의 방법으로 사전통지하며 "회원"이 직접 본인확인을 거쳐, 다시 "사이트" 이용
															의사표시를 한 경우에는 "사이트" 이용이 가능하다. "휴면계정"으로 분리 보관된 개인정보는 5년간 보관
															후 지체없이 파기한다.</li>
													</ol>
												</dd>
											</dl>
										</li>
										<li>
											<dl>
												<dt>
													<a name="gg20" id="gg20"></a>
													<strong>제 20 조 (손해배상) </strong>
												</dt>
												<dd>
													<ol>
														<li>① "회사"가 이 약관의 규정을 위반한 행위로 "회원"에게 손해를 입히거나 기타
															"회사"가 제공하는 모든 서비스와 관련하여 "회사"의 책임 있는 사유로 인해 이용자에게 손해가 발생한
															경우 "회사"는 그 손해를 배상하여야 한다.</li>
														<li>② "회사"는 책임 있는 사유로 제공한 정보가 사실과 달라 "회원"이 손해를 입었을
															경우에 "회사"는 그 손해를 배상하여야 한다.</li>
														<li>③ "회원"이 이 약관의 규정을 위반한 행위로 "회사" 및 제3자에게 손해를 입히거나
															"회원"의 책임 있는 사유에 의해 "회사" 및 제3자에게 손해를 입힌 경우에는 "회원"은 그 손해를
															배상하여야 한다.</li>
														<li>④ 타 회원(개인회원, 기업회원, 서치펌회원 모두 포함)의 귀책사유로 "회원"의 손해가
															발생한 경우 "회사"는 이에 대한 배상 책임이 없다.</li>
													</ol>
												</dd>
											</dl>
										</li>
										<li>
											<dl>
												<dt>
													<a name="gg21" id="gg21"></a>
													<strong>제 21 조 (양도 금지) </strong>
												</dt>
												<dd>
													<p>“회원”의 서비스 받을 권리는 제3자에게 양도, 대여, 증여 등으로 사용할 수 없다.</p>
												</dd>
											</dl>
										</li>
										<li>
											<dl>
												<dt>
													<a name="gg22" id="gg22"></a>
													<strong>제 22 조 (이용요금 오류의 조정) </strong>
												</dt>
												<dd>
													<p>"회사"는 이용요금과 관련하여 오류가 있는 경우에 "회원"의 요청, 또는 "회사"의 사전
														통지에 의하여 다음에 해당하는 조치를 취한다.</p>
													<ol>
														<li>1. 과다납입한 요금에 대하여는 그 금액을 반환한다. 다만, "회원"이 동의할 경우 다음
															달에 청구할 요금에서 해당 금액만큼을 감하여 청구한다.</li>
														<li>2. 요금을 반환받아야 할 "회원"이 요금체납이 있는 경우에는 반환해야 할 요금에서 이를
															우선 공제하고 반환한다.</li>
														<li>3. "회사"는 과소청구액에 대해서는 익월에 합산청구한다.</li>
													</ol>
												</dd>
											</dl>
										</li>
										<li>
											<dl>
												<dt>
													<a name="gg23" id="gg23"></a>
													<strong>제 23 조 ("회원"의 개인정보보호) </strong>
												</dt>
												<dd>"회사"는 "회원"의 개인정보보호를 위하여 노력해야 한다. "회원"의 개인정보보호에 관해서는
													정보통신망이용촉진 및 정보보호 등에 관한 법률, 개인정보보호법에 따르고, "사이트"에 "개인정보처리방침"을
													고지한다.</dd>
											</dl>
										</li>
										<li>
											<dl>
												<dt>
													<a name="gg24" id="gg24"></a>
													<strong>제 24 조 (신용정보의 제공 활용 동의) </strong>
												</dt>
												<dd>
													<ol>
														<li>① "회사"가 회원가입과 관련하여 취득한 "회원"의 개인신용정보를 타인에게 제공하거나
															활용하고자 할 때에는 신용정보의 이용 및 보호에 관한 법률 제23조의 규정에 따라 사전에 그 사유 및
															해당기관 또는 업체명 등을 밝히고 해당 "회원"의 동의를 얻어야 한다.</li>
														<li>② 본 서비스와 관련하여 "회사"가 "회원"으로부터 신용정보의 이용 및 보호에 관한
															법률에 따라 타인에게 제공 활용에 동의를 얻은 경우 "회원"은 "회사"가 신용정보 사업자 또는 신용정보
															집중기관에 정보를 제공하여 "회원"의 신용을 판단하기 위한 자료로 활용하거나, 공공기관에서 정책자료로
															활용되도록 정보를 제공하는 데 동의한 것으로 간주한다.</li>
													</ol>
												</dd>
											</dl>
										</li>
										<li>
											<dl class="nobg">
												<dt>
													<a name="gg25" id="gg25"></a>
													<strong>제 25 조 (분쟁의 해결) </strong>
												</dt>
												<dd>
													<ol>
														<li>① "회사"와 "회원"은 서비스와 관련하여 발생한 분쟁을 원만하게 해결하기 위하여 필요한
															모든 노력을 하여야 한다.</li>
														<li>② 전항의 노력에도 불구하고, 동 분쟁에 관한 소송은 "회사"의 주소지 관할법원으로
															한다.</li>
													</ol>
												</dd>
											</dl>
										</li>
										<li class="etc">
											<dl class="nobg">
												<dt>
													<strong>부칙</strong>
												</dt>
												<dd>
													<ul>
														<li>- 이 약관은 2022년 4월 27일부터 시행한다.</li>
													</ul>
												</dd>
											</dl>
										</li>
									</ol>
								</div>
							</div>
						</div>
						<div class="row policy_check_privacy required">
							<input type="checkbox" id="lb_chk_privacy" name="Priacy_Agree"
								class="mbrCheckOn" value="1">
							<label for="lb_chk_privacy" class="chk_privacy">
								<strong>[필수]</strong> 개인정보 수집 및 이용 동의
								<a href="#DevPolicyPrivacy" class="mbrBtnPolicy">내용보기</a>
							</label>
							<div id="DevPolicyPrivacy" class="policyTplBox">
								<div class="pvsSec pvsCntTp">
									<!-- 7.0 변경 -->
									<p>
										잡코리아 및 알바몬 서비스 이용을 위해 아래와 같이 개인정보를 수집 및 이용합니다. <br> 동의를
										거부할 권리가 있으며, 동의 거부 시 잡코리아 및 알바몬 회원서비스 이용이 불가합니다.
									</p>

									<table class="policy-table">
										<colgroup>
											<col width="33%">
											<col width="33%">
											<col width="*">
										</colgroup>
										<thead>
											<tr>
												<th>목적</th>
												<th>항목</th>
												<th>보유 및 이용기간</th>
											</tr>
										</thead>
										<tbody>
										</tbody>
										<tbody>
											<tr>
												<td>본인여부 확인, 각종 맞춤형 서비스 제공, 서비스 개선 및 신규 서비스 개발을 위한 통계
													활용, 계약이행 및 약관변경 등의 고지를 위한 연락, 본인의사확인 및 민원 등의 고객불만처리</td>
												<td>이름, 아이디, 비밀번호, 휴대폰번호, 이메일</td>
												<td rowspan="2" style="text-decoration: underline;">회원
													탈퇴 시 즉시 파기</td>
											</tr>
										</tbody>

									</table>
									<!-- //7.0 변경 -->
								</div>
							</div>
						</div>
						<div class="row policy_check_privacyOptional optional">
							<input type="checkbox" id="lb_chk_privacyOptional"
								name="PriacyOptional_Agree" class="mbrCheckOn" value="1">
							<label for="lb_chk_privacyOptional" class="chk_privacyOptional">
								[선택] 개인정보 수집 및 이용 동의
								<a href="#DevPolicyPrivacyOptional" class="mbrBtnPolicy">내용보기</a>
							</label>
							<div id="DevPolicyPrivacyOptional" class="policyTplBox">
								<div class="pvsSec pvsTpList">
									<h2 class="pvsHeading2">
										<strong> 1. 수집 이용 목적 </strong>
									</h2>
									<p class="depth_01">
										<font style="text-decoration: underline; font-size: 14px;">상품•서비스
											영업, 홍보, 마케팅, 쿠폰 발송을 목적으로 활용</font>
									</p>
									<h2 class="pvsHeading2">
										<strong>2. 수집하는 개인정보 항목</strong>
									</h2>
									<p class="depth_01">전화번호, 이메일, 서비스 이용 기록</p>
									<h2 class="pvsHeading2">
										<strong>3. 개인정보 보유 및 이용기간</strong>
									</h2>
									<p class="depth_01">
										<font style="text-decoration: underline; font-size: 14px;">회원탈퇴
											시 즉시 파기</font>
									</p>
									<h2 class="pvsHeading2">
										<strong>4. 수신동의 거부 및 철회방법 안내</strong>
									</h2>
									<p class="depth_01">본 동의는 거부하실 수 있습니다. 다만 거부 시 동의를 통해 제공
										가능한 각종 혜택, 이벤트 안내를 받아보실 수 없습니다. 더 이상 상품•서비스 영업, 홍보, 마케팅, 쿠폰
										발송을 원하시지 않는 경우 회원정보수정 페이지에서 수신여부를 변경하실 수 있습니다.</p>
								</div>
							</div>
						</div>
						<div class="row check_email optional">
							<input type="checkbox" id="lb_chk_email" name="Event_Agree_Stat"
								class="mbrCheckOn" value="1">
							<label for="lb_chk_email" class="chk_privacy">
								[선택] 광고성 정보 이메일 수신 동의
								<a href="#DevPolicyEMail" class="mbrBtnPolicy">내용보기</a>
							</label>
							<div id="DevPolicyEMail" class="policyTplBox">
								<div class="pvsSec pvsTpList">
									<h2 class="pvsHeading2">
										<strong>1. 수집 및 이용 목적</strong>
									</h2>
									<p class="depth_01">회원이 수집 및 이용에 동의한 개인정보를 활용하여, 이메일을 통해
										회원에게 유용한 혜택, 이벤트, 광고 정보를 전송할 수 있습니다.</p>

									<h2 class="pvsHeading2">
										<strong>2. 수집하는 개인정보 항목</strong>
									</h2>
									<p class="depth_01">필수 동의사항에서 개인정보 수집 및 이용에 동의한 항목</p>

									<h2 class="pvsHeading2">
										<strong>3. 보유 및 이용기간 </strong>
									</h2>
									<p class="depth_01">
										회원탈퇴를 요청하거나 개인정보의 수집 및 이용에 대한 동의를 철회하는 경우, 수집 및 이용목적이 달성되거나
										이용기간이 종료한 경우 개인정보를 지체 없이 파기합니다.<br> 단, 상법 등 관계법령의 규정에 의하여
										보존할 필요가 있는 경우 법령에서 규정한 보존기간 동안 거래내역과 최소한의 기본정보를 보유합니다.
									</p>
									<h2 class="pvsHeading2">
										<strong>4. 수신동의 거부 및 철회방법 안내 </strong>
									</h2>
									<p class="depth_01">
										본 동의는 거부하실 수 있습니다. 다만 거부 시 동의를 통해 제공 가능한 각종 혜택, 이벤트 안내를 받아보실 수
										없습니다. <br> 본 수신동의를 철회하고자 할 경우에는 메일링/문자메시지 설정 페이지에서 수신여부를
										변경하실 수 있습니다.
									</p>
								</div>
							</div>
						</div>
						<div class="row check_sms optional">
							<input type="checkbox" id="lb_chk_sms" name="SMS_Agree_Stat"
								class="mbrCheckOn" value="1">
							<label for="lb_chk_sms" class="chk_privacy">
								[선택] 광고성 정보 SMS 수신 동의
								<a href="#DevPolicySMS" class="mbrBtnPolicy">내용보기</a>
							</label>
							<div id="DevPolicySMS" class="policyTplBox">
								<div class="pvsSec pvsTpList">
									<h2 class="pvsHeading2">
										<strong>1. 수집 및 이용 목적</strong>
									</h2>
									<p class="depth_01">회원이 수집 및 이용에 동의한 개인정보를 활용하여, SMS/MMS 등
										다양한 전자적 전송매체를 통해 회원에게 유용한 혜택, 이벤트, 광고 정보를 전송할 수 있습니다.</p>

									<h2 class="pvsHeading2">
										<strong>2. 수집하는 개인정보 항목</strong>
									</h2>
									<p class="depth_01">필수 동의사항에서 개인정보 수집 및 이용에 동의한 항목</p>

									<h2 class="pvsHeading2">
										<strong>3. 보유 및 이용기간 </strong>
									</h2>
									<p class="depth_01">
										회원탈퇴를 요청하거나 개인정보의 수집 및 이용에 대한 동의를 철회하는 경우, 수집 및 이용목적이 달성되거나
										이용기간이 종료한 경우 개인정보를 지체 없이 파기합니다.<br> 단, 상법 등 관계법령의 규정에 의하여
										보존할 필요가 있는 경우 법령에서 규정한 보존기간 동안 거래내역과 최소한의 기본정보를 보유합니다.
									</p>

									<h2 class="pvsHeading2">
										<strong>4. 수신동의 거부 및 철회방법 안내 </strong>
									</h2>
									<p class="depth_01">
										본 동의는 거부하실 수 있습니다. 다만 거부 시 동의를 통해 제공 가능한 각종 혜택, 이벤트 안내를 받아보실 수
										없습니다.<br> 본 수신동의를 철회하고자 할 경우에는 메일링/문자메시지 설정 페이지에서 수신여부를
										변경하실 수 있습니다.
									</p>
								</div>
							</div>
						</div>
					</div>
					<!-- 개인정보 유효기간 선택 -->
					<div class="row_group mbr_validity">
						<div class="header">
							<h4 class="header">
								개인정보 유효기간 선택 <i class="icon required" aria-hidden="false">*</i>
							</h4>
							<button type="button" class="button buttonHelp"
								aria-haspopup="true">도움말</button>
							<div class="popup hidden" aria-hidden="true"
								style="left: 187.586px; top: 57.75px;">
								<div class="popupHeader">개인정보 유효기간</div>
								<div class="popupBody">
									가입하신 ID로 선택하신 기간 동안 사이트에 로그인 등<br>활동을 하지 않을 경우, 해당 개인정보를
									별도 분리 저장하게 됩니다.
								</div>
							</div>
						</div>
						<div class="list">
							<div class="item">
								<input type="radio" name="Validity" id="validity_leave"
									class="skip" value="0" onclick="tooltipClose();">
								<label for="validity_leave" onclick="tooltipClose();">회원탈퇴시</label>
								<div class="tooltip-dormant-account">
									<button type="button" class="button-tooltip-close">
										<span class="tooltip-close-text">닫기</span>
									</button>
									<p class="tooltip-text">
										탈퇴 전까지 <strong>휴면 전환 걱정 NO</strong><br>잡코리아 평생회원이 되어보세요!
									</p>
								</div>
							</div>
							<div class="item">
								<input type="radio" name="Validity" id="validity_year1"
									class="skip " value="1">
								<label for="validity_year1">1년</label>
							</div>
							<div class="item">
								<input type="radio" name="Validity" id="validity_year3"
									class="skip" value="3">
								<label for="validity_year3">3년</label>
							</div>
						</div>
					</div>
					<script type="text/javascript">
						$(document).on(
								"click",
								".button-tooltip-close",
								function() {
									$(this).parent(".tooltip-dormant-account")
											.hide();
								});

						function tooltipClose() {
							$(".tooltip-dormant-account").hide();
						}
					</script>
					
					<!-- 회원 가입 버튼 -->
					<div class="row_group line_none regist_complete"
						style="position: relative;">
						<div class="row">
							<button type="submit" class="mbrBtnRegist">
								<span>가입하기</span>
							</button>
						</div>
					</div>
				</form>
			</fieldset>
			
			<!-- familysite -->
			<div class="familysite">
				<h3 class="skip">Family site</h3>
				<p class="text">잡코리아 ID하나로 알바몬 서비스도 이용가능합니다.</p>
				<ul class="f_clear">
					<li class="albamon"><a href="https://www.albamon.com"
							target="_blank" title="albamon - 아르바이트 전문">albamon - 아르바이트 전문</a></li>
				</ul>
			</div>

		</div>
		<script type="text/javascript">
			!(function($) {
				if (join) {
					join.common.init();
					join.account.init();
					join.account.only_gg();
				}
			}(jQuery));
		</script>
		<div id="footer">
			<p id="copyright">
				<img
					src="https://i.jobkorea.kr/content/images/common/footer/copyright-join.png?220106"
					alt="© JOBKOREA LLC. All rights reserved." usemap="#copyright">
			</p>
			<map name="copyright">
				<area shape="rect" coords="10,0,80,19"
					href="https://www.jobkorea.co.kr" target="_blank" alt="잡코리아">
			</map>
		</div>
	</div>




	<div
		style="position: absolute; left: -5000px; overflow: hidden; display: none;">






		<!-- Google Tag Manager (noscript) -->
		<noscript>
			<iframe src="https://www.googletagmanager.com/ns.html?id=GTM-WL56D3L"
				height="0" width="0" style="display: none; visibility: hidden"></iframe>
		</noscript>
		<!-- End Google Tag Manager (noscript) -->

		<!-- End Adobe Marketing Cloud Tag Management code -->
	</div>
	<div
		style="position: absolute; left: -5000px; overflow: hidden; display: none;">


		<script>
			/* usage */
			(function($) {
				$(window)
						.load(
								function() {
									(function(i, s, o, g, r, a, m) {
										i['GoogleAnalyticsObject'] = r;
										i[r] = i[r]
												|| function() {
													(i[r].q = i[r].q || [])
															.push(arguments)
												}, i[r].l = 1 * new Date();
										a = s.createElement(o), m = s
												.getElementsByTagName(o)[0];
										a.async = 1;
										a.src = g;
										m.parentNode.insertBefore(a, m)
									})
											(
													window,
													document,
													'script',
													'https://www.google-analytics.com/analytics.js',
													'ga');

									ga('create', 'UA-75522609-1',
											'jobkorea.co.kr', {
												'allowLinker' : true,
												'name' : 'trackerOne2'
											});
									ga('require', 'linker');
									ga('linker:autoLink', [ 'jobbusan.co.kr' ]);
									ga('trackerOne2.send', 'pageview');

								});
			})(jQuery);
		</script>
		<script type="text/javascript">
		<!--
			function loadScriptFn(url, callback) {
				var scriptEle = document.createElement('script');
				scriptEle.type = 'text/javascript';
				var loaded = false;
				scriptEle.onreadystatechange = function() {
					// 서버에서 읽어올 경우 loaded, 캐쉬에서 가져올 경우 complete 이기에 둘 모두 처리
					if (this.readyState == 'loaded'
							|| this.readyState == 'complete') {
						if (loaded)
							return;
						loaded = true;
						callback();
					}
				}
				scriptEle.onload = function() {
					callback();
				};
				scriptEle.src = url;
				document.getElementsByTagName('head')[0].appendChild(scriptEle);
			}
		//-->
		</script>
	</div>
	<script type="text/javascript">
		var DS_UID_Value = ''
		var DSID_Value = ''
		if (window._dslog) {
			if (DS_UID_Value != "" && DSID_Value != "") {
				window._dslog.setDSID(DSID_Value);
			} else {
				window._dslog.setUID(DS_UID_Value);
			}
			window._dslog.dispatch();
		} else {
			var dslog_tag = document.getElementById('dslog_tag');
			if (dslog_tag != null && dslog_tag != undefined) {
				dslog_tag.onload = dslog_tag.onreadystatechange = function() {
					dslog_tag.onload = dslog_tag.onreadystatechange = null;
					window._dslog.setUIDCookie('');
					window._dslog.dispatch()
				}
			}
		}
	</script>


	<!-- Facebook Pixel Code -->
	<script>
		(function($) {
			$(window)
					.load(
							function() {
								!function(f, b, e, v, n, t, s) {
									if (f.fbq)
										return;
									n = f.fbq = function() {
										n.callMethod ? n.callMethod.apply(n,
												arguments) : n.queue
												.push(arguments)
									};
									if (!f._fbq)
										f._fbq = n;
									n.push = n;
									n.loaded = !0;
									n.version = '2.0';
									n.queue = [];
									t = b.createElement(e);
									t.async = !0;
									t.src = v;
									s = b.getElementsByTagName(e)[0];
									s.parentNode.insertBefore(t, s)
								}
										(window, document, 'script',
												'https://connect.facebook.net/en_US/fbevents.js');
								fbq('set', 'autoConfig', 'false',
										'1166416616740867');
								fbq('init', '1166416616740867'); // Insert your pixel ID here.
								fbq('track', 'PageView');
								fbq('track', 'Search');
							});
		})(jQuery);
	</script>
	<noscript>
		<img height="1" width="1" style="display: none"
			src="https://www.facebook.com/tr?id=1166416616740867&ev=PageView&noscript=1" />
	</noscript>
	<!-- DO NOT MODIFY -->
	<!-- End Facebook Pixel Code -->
	<!-- 공통 호출 하단 스크립트 : 모든페이지 하단 설치 -->
	<!-- PlayD TERA Log Script v1.2 -->
	<script>
		window.onload = function() {
			var _nSA = (function(_g, _s, _p, _d, _i, _h) {
				if (_i.wgc != _g) {
					_i.wgc = _g;
					_i.wrd = (new Date().getTime());
					var _sc = _d.createElement('script');
					_sc.src = _p + '//sas.nsm-corp.com/' + _s + 'gc=' + _g
							+ '&rd=' + _i.wrd;
					var _sm = _d.getElementsByTagName('script')[0];
					_sm.parentNode.insertBefore(_sc, _sm);
				}
				return _i;
			})('TR10148105490', 'sa-w.js?', location.protocol, document,
					window._nSA || {}, location.hostname);
		}
	</script>
	<!-- LogAnalytics Script Install -->



	<script type="text/javascript">
		"use strict"
		var kakaoPixelTag = {
			key : "397545586629917514",
			url : "//t1.daumcdn.net/adfit/static/kp.js",
			load : function() {
				var self = this;

				self.method().lazyload(self.method().loadPixel);
			},
			method : function() {
				var self = this;
				return {
					lazyload : function(callback) {
						var scriptEle = document.createElement('script');
						scriptEle.type = 'text/javascript';
						var loaded = false;
						scriptEle.onreadystatechange = function() {
							// 서버에서 읽어올 경우 loaded, 캐쉬에서 가져올 경우 complete 이기에 둘 모두 처리
							if (this.readyState == 'loaded'
									|| this.readyState == 'complete') {
								if (loaded)
									return;
								loaded = true;
								if (typeof callback === 'function') {
									callback();
								}
							}
						}
						scriptEle.onload = function() {
							if (typeof callback === 'function') {
								callback();
							}
						};
						scriptEle.src = self.url;
						document.getElementsByTagName('head')[0]
								.appendChild(scriptEle);
					},
					loadPixel : function() {
						self.method().pageView();
					},
					check : function() {
						if (typeof kakaoPixel === 'undefined') {
							console.log("kakaoPixel is not defined")
							return false;
						} else {
							return true;
						}
					},
					pageView : function() {
						if (self.method().check()) {
							self.method().console('pageView');
							kakaoPixel(self.key).pageView();
						}
					},
					completeRegistration : function() {
						if (self.method().check()) {
							self.method().console('completeRegistration');
							kakaoPixel(self.key).completeRegistration();
						}
					},
					participation : function() {
						if (self.method().check()) {
							self.method().console('participation');
							kakaoPixel(self.key).participation();
						}
					},
					purchase : function() {
						if (self.method().check()) {
							self.method().console('purchase');
							kakaoPixel(self.key).purchase();
						}
					},
					addToWishList : function() {
						if (self.method().check()) {
							self.method().console('addToWishList');
							kakaoPixel(self.key).addToWishList();
						}
					},
					addToCart : function() {
						if (self.method().check()) {
							self.method().console('addToCart');
							kakaoPixel(self.key).addToCart();
						}
					},
					console : function(eventStr) {
						//console.log('%c KakaoPixel %c load %c ' + eventStr, 'background: #4C5667;font-size: 12px;color: #FFF;padding: 6px;', 'background: #3474E8;font-size: 12px;color: #FFF;padding: 6px;', 'background: #027a00;font-size: 12px;color: #FFF;padding: 6px;');
					}
				}
			}
		};

		if (window.addEventListener) {
			window.addEventListener('load', function() {
				if (kakaoPixelTag !== 'undefined') {
					kakaoPixelTag.load();
				}
			});
		}
	</script>



	<script>
		var jkcriteoEvt = {
			el : $(document),
			Criteo_Event : 'viewPage',
			CriteoMail : '',
			gno : '',
			gnolist : [],
			isload : false,
			load : function() {
				var self = this;
				if (self.isload) {
					self.event();
				} else {
					self.method().lazyloadScriptFn(
							'//dynamic.criteo.com/js/ld/ld.js?a=87221',
							function() {
								self.isload = true;
								self.event();
							});
				}
			},

			event : function() {
				var self = this;
				//console.log(self.Criteo_Event);
				if (self.Criteo_Event == "viewHome") {
					self.method().viewhome();
				} else if (self.Criteo_Event == "trackTransaction") {
					self.method().trackTransaction();
				} else if (self.Criteo_Event == "viewList") {
					self.method().criteo_viewlist();

				} else if (self.Criteo_Event == "viewPage") {
					self.method().viewPage();
				} else if (self.Criteo_Event == "viewItem") {
					self.method().viewItem();
				}
			},
			method : function() {
				var self = this;

				return {

					lazyloadScriptFn : function(url, callback) {
						var scriptEle = document.createElement('script');
						scriptEle.type = 'text/javascript';
						var loaded = false;
						scriptEle.onreadystatechange = function() {
							// 서버에서 읽어올 경우 loaded, 캐쉬에서 가져올 경우 complete 이기에 둘 모두 처리
							if (this.readyState == 'loaded'
									|| this.readyState == 'complete') {
								if (loaded)
									return;
								loaded = true;
								callback();
							}
						}
						scriptEle.onload = function() {
							callback();
						};
						scriptEle.src = url;
						document.getElementsByTagName('head')[0]
								.appendChild(scriptEle);
					},

					joblistevt : function(className) {
						if (self.el.find(className).length == 0) {
							return;
						}
						var _len = self.el.find(className).length < 3 ? self.el
								.find(className).length : 3;
						self.gnolist = self.el.find(className).slice(0, _len)
								.map(function() {
									return $(this).data('gno');
								}).get();
						self.method().criteo_viewlist(self.Criteo_Event);
					},

					criteo_viewlist : function(pagetype) {
						window.criteo_q = window.criteo_q || [];
						if (self.gnolist.length > 0) {
							//console.log("%c criteo %c viewList " + self.gnolist + " gnoCount : " + self.gnolist.length, "background:orange; color: #FFF;font-size: 12px; padding:6px;", "background:green; color: #FFF;font-size: 12px; padding:6px;");
							window.criteo_q.push({
								event : "setAccount",
								account : 87221
							}, {
								event : "setSiteType",
								type : "d"
							}, {
								event : "viewList",
								item : self.gnolist
							});
							self.gnolist = [];
						}
					},

					viewhome : function() {
						//console.log("%c criteo %c load Event = viewhome", "background:orange; color: #FFF;font-size: 12px; padding:6px;", "background:green; color: #FFF;font-size: 12px; padding:6px;");
						window.criteo_q = window.criteo_q || [];
						window.criteo_q.push({
							event : "setAccount",
							account : 87221
						}, {
							event : "setSiteType",
							type : "d"
						}, {
							event : "viewhome"
						});
					},

					trackTransaction : function() {

						if (self.gno != '') {
							//console.log("%c criteo %c load Event = trackTransaction", "background:orange; color: #FFF;font-size: 12px; padding:6px;", "background:green; color: #FFF;font-size: 12px; padding:6px;");
							window.criteo_q = window.criteo_q || [];
							window.criteo_q.push({
								event : "setAccount",
								account : 87221
							}, {
								event : "setSiteType",
								type : "d"
							}, {
								event : "trackTransaction",
								id : '1690798729',
								deduplication : 1,
								item : [ {
									id : self.gno,
									price : 1,
									quantity : 1
								} ]
							});
							self.gno = '';
						}
					},

					viewPage : function() {
						//console.log("%c criteo %c load Event = viewPage", "background:orange; color: #FFF;font-size: 12px; padding:6px;", "background:green; color: #FFF;font-size: 12px; padding:6px;");
						window.criteo_q = window.criteo_q || [];
						window.criteo_q.push({
							event : "setAccount",
							account : 87221
						}, {
							event : "setSiteType",
							type : "d"
						}, {
							event : "viewPage"
						});
					},

					viewItem : function() {
						//console.log("%c criteo %c load Event = viewItem", "background:orange; color: #FFF;font-size: 12px; padding:6px;", "background:green; color: #FFF;font-size: 12px; padding:6px;");
						if (self.gno != "") {
							//console.log("%c criteo %c viewList " + self.gno, "background:orange; color: #FFF;font-size: 12px; padding:6px;", "background:green; color: #FFF;font-size: 12px; padding:6px;");
							window.criteo_q = window.criteo_q || [];
							window.criteo_q.push({
								event : "setAccount",
								account : 87221
							}, {
								event : "setSiteType",
								type : "d"
							}, {
								event : "viewItem",
								item : self.gno
							});
							self.gno = ''
						}
					}

				}
			}
		}
		if (window.addEventListener) {
			window.addEventListener('load', function() {
				if (typeof jkcriteoEvt !== 'undefined') {
					jkcriteoEvt.load();
				}
			});
		}
		var criteo_viewlist = function(criteo_gnos, pagetype) {
			//console.log("%c criteo %c load Event = viewlist 2", "background:orange; color: #FFF;font-size: 12px; padding:6px;", "background:green; color: #FFF;font-size: 12px; padding:6px;");
			//console.log("criteo_viewlist : " + criteo_gnos + "/" + pagetype);
			window.criteo_q = window.criteo_q || [];
			window.criteo_q.push({
				event : "setAccount",
				account : 87221
			}, {
				event : "setSiteType",
				type : "d"
			}, {
				event : "viewList",
				item : [ criteo_gnos ]
			});
		}
	</script>






	<img
		src="https://vid.vidoomy.com/dspsync?dspid=RTBH&amp;uid=9UZVpZtzT3kSf5hze2vy"
		width="1" height="1" scrolling="no" frameborder="0"
		style="display: none">
	<iframe width="1" height="1" scrolling="no" frameborder="0"
		style="display: none"
		src="https://fledge-asia.creativecdn.com/fledge-igmembership?ntk=hN-6tjVwxrGlISH_Suy47jrPefyWbxiq2K5F09kxnn8PI_9Ok4iOH78vFLCPaIdNSZt1zDLJGxos7UThVksUIA"></iframe>
	<iframe width="1" height="1" scrolling="no" frameborder="0"
		style="display: none"
		src="https://asia.creativecdn.com/topics-membership?ntk=arc0GS4bdGYjeEaGyETAo3EdfAfRBZydcGSsdGi93n2zlHD8Xi1M9Y3uZ8uD3M9-izek4Ojb76_S53wVmpWlpw"></iframe>
	<div id="criteo-tags-div" style="display: none;"></div>
	<iframe src="https://www.google.com/recaptcha/api2/aframe" width="0"
		height="0" style="display: none;"></iframe>
	<iframe height="0" width="0" title="Criteo DIS iframe"
		style="display: none;"></iframe>
	<script>
		var col_1List = document.getElementsByClassName("col_1");
		document
				.querySelector(".mbrRegist .dev-name")
				.addEventListener(
						"focus",
						function() {
							col_1List[0].style.cssText = "top: 9px";
							document.querySelector(".col_1>.mbr_name").style.cssText = "font-size: 11px";
						})
		document
				.querySelector(".mbrRegist .dev-name")
				.addEventListener(
						"blur",
						function() {
							// 포커스가 해제될 때 원래 스타일로 복구
							col_1List[0].style.cssText = ""; // 빈 문자열로 스타일 초기화
							document.querySelector(".col_1>.mbr_name").style.cssText = ""; // 빈 문자열로 스타일 초기화
						});
		document
				.querySelector(".mbrRegist .dev-id")
				.addEventListener(
						"focus",
						function() {
							col_1List[1].style.cssText = "top: 9px";
							document.querySelector(".mbr_id label").style.cssText = "font-size: 11px";
						})
		document.querySelector(".mbrRegist .dev-id").addEventListener("blur",
				function() {
					// 포커스가 해제될 때 원래 스타일로 복구
					col_1List[1].style.cssText = ""; // 빈 문자열로 스타일 초기화
					document.querySelector(".mbr_id label").style.cssText = ""; // 빈 문자열로 스타일 초기화
				});
		document
				.querySelector(".mbrRegist .dev-password")
				.addEventListener(
						"focus",
						function() {
							col_1List[2].style.cssText = "top: 9px";
							document.querySelector(".mbr_passwd label").style.cssText = "font-size: 11px";
						})
		document
				.querySelector(".mbrRegist .dev-password")
				.addEventListener(
						"blur",
						function() {
							// 포커스가 해제될 때 원래 스타일로 복구
							col_1List[2].style.cssText = ""; // 빈 문자열로 스타일 초기화
							document.querySelector(".mbr_passwd label").style.cssText = ""; // 빈 문자열로 스타일 초기화
						});
		document
				.querySelector(".mbrRegist .dev-mail")
				.addEventListener(
						"focus",
						function() {
							col_1List[3].style.cssText = "top: 9px";
							document.querySelector(".mbr_email label").style.cssText = "font-size: 11px";
						})
		document
				.querySelector(".mbrRegist .dev-mail")
				.addEventListener(
						"blur",
						function() {
							// 포커스가 해제될 때 원래 스타일로 복구
							col_1List[3].style.cssText = ""; // 빈 문자열로 스타일 초기화
							document.querySelector(".mbr_email label").style.cssText = ""; // 빈 문자열로 스타일 초기화
						});
		document
				.querySelector(".mbrRegist .dev-phone")
				.addEventListener(
						"focus",
						function() {
							col_1List[4].style.cssText = "top: 9px";
							document.querySelector(".mbr_phone label").style.cssText = "font-size: 11px";
						})
		document
				.querySelector(".mbrRegist .dev-phone")
				.addEventListener(
						"blur",
						function() {
							// 포커스가 해제될 때 원래 스타일로 복구
							col_1List[4].style.cssText = ""; // 빈 문자열로 스타일 초기화
							document.querySelector(".mbr_phone label").style.cssText = ""; // 빈 문자열로 스타일 초기화
						});
	</script>
</body>
</html>