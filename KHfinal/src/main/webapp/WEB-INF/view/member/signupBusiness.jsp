<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<jsp:include page="/WEB-INF/view/msg/msg.jsp"></jsp:include>
<jsp:include page="/WEB-INF/view/msg/message.jsp"></jsp:include>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입 | KH</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/member/css/jobkh_signup.css">
<link rel="icon" href="resources/favicon.ico">
<link rel="SHORTCUT ICON" href="/favicon.ico?202307261400">
<!-- jQuery 스크립트 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- 카카오 API : 주소 검색 -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>

<body>
	<script>
		function searchAddress_daumPostcode() {
		    var addressPopup = new daum.Postcode({
		        oncomplete: function (data) {
		            var baddress = data.sido + " " + data.sigungu + " " + data.bname;
		            document.getElementById("baddress").value = baddress;
		        },
		        onclose: function () {
		            // 팝업이 닫힌 후 스타일을 설정
		            var inputField = document.getElementById("baddress");
		            var parentRow = inputField.closest('.row');
		            if (inputField.value === '') {
		                parentRow.querySelector('.col_1').style.cssText = '';
		                parentRow.querySelector('label').style.cssText = '';
		            } else {
		                parentRow.querySelector('.col_1').style.cssText = 'top: 4px';
		                parentRow.querySelector('label').style.cssText = 'font-size: 11px';
		            }
		        }
		    });
		    addressPopup.open();
		}
	</script>
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
					<span class="slogun_1">JJOBKOREA</span>
				</h2>
			</div>

			<h3 class="skip">글로벌 메뉴</h3>
			<ul class="gnb f_clear">
				<li><a href="../index">홈</a></li>
				<li><a href="/help/">고객센터</a></li>
			</ul>

			<h3 class="skip">회원 형태별 가입</h3>
			<ul class="snb f_clear">
				<li class="person "><a href="person">개인회원</a></li>
				<li class="corp on"><a href="business">기업회원</a></li>
			</ul>
		</div>

		<div id="container" class="mbrRegist">

			<h3 class="skip">기업 회원가입 정보</h3>
			<fieldset>
				<legend>기업 회원가입</legend>
				<form action="business" method="POST" id="form" name="form">
					<!-- 기업 정보 -->
					<div class="row row_group">
						<h4>기업정보</h4>
						<div class="headingGuide">
							<i>*</i>필수정보
						</div>

						<!-- 기업회원 탭 메뉴 -->

						<div class="tabs tabsGiCateogry" role="tablist">
							<a href="signup/business"
								class="tab tabGi active">기업회원</a>
							<a href="#" class="tab tabGi ">서치펌회원</a>
						</div>

						<div class="row mbr_name mbr_co_type">
							<input type="hidden" id="mtype" name="mtype" value="ROLE_BUSINESS">
							<div class="col_1">
								<label class="mbr_name" for="Corp_Type">기업형태 <i
									class="icon required" aria-hidden="hidde">*</i>
								</label>
							</div>
							<div class="col_2">
								<div class="select_wrap dev-corp-type">
									<select id="Corp_Type" name="bform">
										<option value=""></option>
										<option value="3">대기업</option>
										<option value="4">대기업 계열사·자회사</option>
										<option value="1">중소기업(300명이하)</option>
										<option value="2">중견기업(300명이상)</option>
										<option value="5">벤처기업</option>
										<option value="6">외국계(외국 투자기업)</option>
										<option value="8">외국계(외국 법인기업)</option>
										<option value="7">국내 공공기관·공기업</option>
										<option value="9">비영리단체·협회·교육재단</option>
										<option value="10">외국 기관·비영리기구·단체</option>
									</select>
								</div>
							</div>
						</div>

						<div class="row company_num">
							<div class="col_1">
								<label for="Corp_RegNum">사업자등록번호 <i
									class="icon required" aria-hidden="hidde">*</i>
								</label>
							</div>
							<div class="col_2">
								<input type="text" name="brno" id="Corp_RegNum"
									class="mbr_name dev-corp-num" maxlength="12" value="">
								<div class="notice_msg" id="notice_msg_regnum"></div>
							</div>
						</div>
						<div class="row business_license" style="display: none;">
							<div class="col_1">
								<div class="label">
									<p class="fileLabel">
										사업자등록증 첨부<i class="icon required" aria-hidden="hidde"
											style="display: none;">*</i>
									</p>
									<button type="button" class="fileDeleteButton">
										<span>첨부파일 삭제</span>
									</button>
								</div>
								<label for="Corp_RegFile" class="regFileLabel">파일첨부</label>
							</div>
							<div class="col_2">
								<input type="file" name="Corp_RegFile" id="Corp_RegFile"
									value="" accept=".gif, .jpeg, .png, .jpg, .pdf">
								<div class="notice_msg" id="notice_msg_corp_regfile"></div>
							</div>
						</div>
						<div class="rows">
							<div class="row company_name">
								<div class="col_1">
									<label class="mbr_name" for="Corp_Name">회사명 <i
										class="icon required" aria-hidden="hidde">*</i>
									</label>
								</div>
								<div class="col_2">
									<input class="mbr_name dev-corp-name" data-val="true"
										data-val-maxlength="필드 Corp_Name은(는) 최대 길이가 '50'인 문자열 또는 배열 형식이어야 합니다."
										data-val-maxlength-max="50"
										data-val-required="Corp_Name 필드가 필요합니다." id="Corp_Name"
										maxlength="50" name="bizname" type="text" value="">
									<div class="notice_msg" id="notice_msg_corp_name"></div>
								</div>
							</div>
							<div class="row company_bossname">
								<div class="col_1">
									<label class="mbr_name" for="Boss_Name">대표자명 <i
										class="icon required" aria-hidden="hidde">*</i>
									</label>
								</div>
								<div class="col_2">
									<input class="mbr_name dev-ceo-name" data-val="true"
										data-val-maxlength="필드 Boss_Name은(는) 최대 길이가 '20'인 문자열 또는 배열 형식이어야 합니다."
										data-val-maxlength-max="20"
										data-val-required="Boss_Name 필드가 필요합니다." id="Boss_Name"
										maxlength="20" name="brepName" type="text" value="">
									<div class="notice_msg" id="notice_msg_ceo_name"></div>
								</div>
							</div>
						</div>
						<div class="row mbr_zipcode">
							<div class="col_1">
								<label class="mbr_name" for="Zip_Code">회사주소 <i
									class="icon required" aria-hidden="hidde">*</i>
								</label>
							</div>
							<div class="col_2">
								<input class="mbr_name dev-ceo-name" data-val="true"
									data-val-maxlength="필드 Boss_Name은(는) 최대 길이가 '20'인 문자열 또는 배열 형식이어야 합니다."
									data-val-maxlength-max="20"
									data-val-required="Zip_Code 필드가 필요합니다." id="baddress"
									maxlength="20" name="baddress" type="text" value="" onclick="searchAddress_daumPostcode();">
								<div class="notice_msg" id="notice_msg_ceo_name"></div>
							</div>
						</div>

						<div class="row mbr_zipcode" style="display: none;">
							<div class="col_1">
								<label for="Corp_Addr">회사주소<i class="icon required"
									aria-hidden="hidde">*</i></label>
							</div>
							<div class="col_2">
								<input id="Addr_Foreign" name="Addr_Foreign" type="text"
									value="" maxlength="150">
								<div class="notice_msg" id="msg_addr"></div>
							</div>
						</div>
					</div>
					<!--[DEV - 20230522] 기업회원 - 기업인증 - 사업자등록증명원 -->
					<div class="row row_group mbr_info company_cert">
						<h4>기업로고</h4>
						<div class="row certificate_num">
							<div class="col_1">
								<input type="file" accept="image/*" id="logoimg">
								<input type="button" value="서버로 전송" style="width:80px;" onclick="uploadFile()">

							</div>
							<div class="layer-popup devCorpCertInfoPopup">
								<div class="layer-popup-content">
									
									<div class="layer-popup-table">
										<table class="layer-table">
											<colgroup>
												<col class="col1">
												<col class="col2">
											</colgroup>
										</table>
									</div>
								</div>
							</div>
							<div class="col_2">
								<input type="text" name="logoImg" id="CRTFCT_Issue_No"
									class="mbr_name dev-corp-cert CRTFCT_Issue_No" maxlength="20"
									value="">
								<input type="hidden" id="CRTFCT_Issue_No1"
									name="CRTFCT_Issue_No1" class="CRTFCT_Issue_No" value="">
								<input type="hidden" id="CRTFCT_Issue_No2"
									name="CRTFCT_Issue_No2" class="CRTFCT_Issue_No" value="">
								<input type="hidden" id="CRTFCT_Issue_No3"
									name="CRTFCT_Issue_No3" class="CRTFCT_Issue_No" value="">
								<input type="hidden" id="CRTFCT_Issue_No4"
									name="CRTFCT_Issue_No4" class="CRTFCT_Issue_No" value="">
								<div class="notice_msg" id="notice_msg_regnum"></div>
							</div>
						</div>
						
					</div>
					<!-- 인사담당자 정보 -->
					<div class="row_group line_bottom mbr_info">
						<h4>인사담당자 정보</h4>
						<!-- 인사담당자 정보 -->
						<!-- 인증 -->
						
						<!-- 기본정보 -->
						<div class="rows">
							<div class="row mbr_id">
								<div class="col_1">
									<label for="U_ID">아이디 <i class="icon required"
										aria-hidden="hidde">*</i>
									</label>
								</div>
								<div class="col_2">
									<input data-val="true" id="U_ID" maxlength="16" name="mid"
										class="dev-id" type="text" value="" pattern="(?=.*[a-z])[a-z\d]+" required>
									<div class="notice_msg" id="notice_msg_id"></div>
								</div>
							</div>
							<div class="row mbr_passwd">
								<div class="col_1">
									<label for="U_PWD">비밀번호 <i class="icon required"
										aria-hidden="hidde">*</i>
									</label>
								</div>
								<div class="col_2">
									<input id="U_PWD" class="dev-password" maxlength="16"
										name="mpw" type="password" style="ime-mode: disabled;"
										value="" pattern="(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@#$%^&+=!.]).{8,16}" required>
									<button type="button" class="btnHelp devPwdHelpBtn"
										title="안전한 비밀번호 작성법">?</button>
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
									<div class="notice_msg" id="notice_msg_pwd">
										<p class="failure"></p>
									</div>
								</div>
								<div class="col_3">
									<button type="button" class="mbrBtnAuth dev-password-dp">
										<span>표시</span>
									</button>
								</div>
							</div>
						</div>
						<div class="row mbr_name">
							<div class="col_1">
								<label class="mbr_name" for="Mem_Name">가입자명 <i
									class="icon required" aria-hidden="hidde">*</i>
								</label>
							</div>
							<div class="col_2">
								<input class="mbr_name dev-name" id="Mem_Name" maxlength="12"
									name="bname" type="text" value="">
								<div class="notice_msg" id="notice_msg_name"></div>
							</div>
						</div>
						<div class="row mbr_phone">
							<div class="col_1">
								<label class="mbr_phone" for="Corp_Phone">전화번호 <i
									class="icon required" aria-hidden="hidde">*</i>
								</label>
							</div>
							<div class="col_2">
								<input class="mbr_phone dev-phone" data-val="true"
									id="Corp_Phone" maxlength="13" name="btel" title="전화번호"
									type="text" value="">
								<div class="notice_msg" id="notice_msg_phone">
									<p class="failure">필수 정보입니다.</p>
								</div>
								<input type="hidden" id="Corp_Phone1" name="Corp_Phone1"
									value="">
								<input type="hidden" id="Corp_Phone2" name="Corp_Phone2"
									value="">
								<input type="hidden" id="Corp_Phone3" name="Corp_Phone3"
									value="">
								<input type="hidden" id="Corp_Phone_Etc" name="Corp_Phone_Etc"
									value="">
							</div>
						</div>
						<div class="row mbr_email">
							<div class="col_1">
								<label for="Email_ID" class="mbr_email_id">이메일 <i
									class="icon required" aria-hidden="hidde">*</i>
								</label>
							</div>
							<div class="col_2">
								<input type="text" id="email" name="bemail"
									class="mbr_email_id dev-mail" size="8" maxlength="100" value="">
								<div class="notice_msg" id="notice_msg_mail"></div>
								<input type="hidden" id="Email_ID" name="Email_ID">
								<input type="hidden" id="Email_Addr" name="Email_Addr">
							</div>
						</div>
					</div>
					<h4 class="skip">사이트 이용 정보</h4>
					<!-- 기업 로고 업로드 -->
					

					
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
					<div class="row_group line_none regist_complete"
						style="position: relative;">
						<div class="row">
							<button type="submit" class="mbrBtnRegist dev-submit">가입하기</button>
						</div>
					</div>

				</form>
				
				
								<script>

					function uploadFile(){
						
						var formData = new FormData();
						formData.append('upload', logoimg.files[0]);
						
						fetch('<%=request.getContextPath()%>/image/upload', {
							method: 'POST',		
							body: formData
						})
						.then(response => response.json())
						.then(data => {
							var imageUrl = data.url;
							var imageUrlInput = document.getElementById('CRTFCT_Issue_No');
							imageUrlInput.src = imageUrl;
							
							alert("파일 전송 완료");
							
							document.getElementById('CRTFCT_Issue_No').value = imageUrl;
						})
						.catch(err => console.error('Error uploading image: ', err));
						
						
						
						
					}
				</script>
			</fieldset>
			

		</div>
	</div>
	<script>
		// select 요소를 선택합니다.
		var selectElement = document.getElementById('Corp_Type');
	
		// select 요소의 선택이 변경될 때 스타일을 적용하는 함수
		function applySelectStyle(event) {
		    var parentRow = event.target.closest('.row');
		    if (event.target.value !== '') {
		        parentRow.querySelector('.col_1').style.cssText = 'top: 4px';
		        parentRow.querySelector('label').style.cssText = 'font-size: 11px';
		    } else {
		        parentRow.querySelector('.col_1').style.cssText = '';
		        parentRow.querySelector('label').style.cssText = '';
		    }
		}
	
		// select 요소에 change 이벤트 리스너 등록
		selectElement.addEventListener('change', applySelectStyle);
	
		// 페이지 로드 시 초기 상태에 따라 스타일 적용
		applySelectStyle({ target: selectElement });
	
		// 모든 입력 필드 요소를 선택
		var inputFields = document.querySelectorAll('.row input');
	
		// 입력 필드에 포커스 시 스타일을 적용하는 함수
		function applyFocusStyle(event) {
		    var parentRow = event.target.closest('.row');
		    if (event.target.value === '') {
		        parentRow.querySelector('.col_1').style.cssText = 'top: 4px';
		        parentRow.querySelector('label').style.cssText = 'font-size: 11px';
		    }
		}
	
		// 입력 필드에서 포커스가 벗어났을 때 스타일을 초기화하는 함수
		function resetStyle(event) {
		    var parentRow = event.target.closest('.row');
		    if (event.target.value === '') {
		        parentRow.querySelector('.col_1').style.cssText = '';
		        parentRow.querySelector('label').style.cssText = '';
		    }
		}
	
		// 입력 필드에 포커스 및 블러 이벤트 리스너 등록
		inputFields.forEach(function(inputField) {
		    inputField.addEventListener('focus', applyFocusStyle);
		    inputField.addEventListener('blur', resetStyle);
	
		    // 초기 로드 시 입력 값이 있는 경우에도 스타일 적용
		    if (inputField.value !== '') {
		        applyFocusStyle({ target: inputField });
		    }
		});
	</script>
</body>

</html>