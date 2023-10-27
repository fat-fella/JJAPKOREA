<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<jsp:include page="/WEB-INF/view/msg/message.jsp"></jsp:include>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인 | KH</title>
<link rel="icon" href="<%=request.getContextPath()%>/resources/favicon.ico">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/member/css/jobkh_login.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>

<body>
	<div id="wrap">

		<div id="container">
			<div class="logtop logtop_login">
				<h1 class="hd">
					<span class="logo"></span>짭코리아에 오신 것을 환영합니다.
				</h1>
				<p class="lnb">
					<a href="${pageContext.request.contextPath}/index">잡코리아홈</a>
					<span class="txtBar">|</span>
					<a href="http://www.jobkorea.co.kr/Customer_C/CC_Main.asp">고객센터</a>
				</p>
			</div>

			<div class="secLogin">
				<div class="logWrap" id="loginFormWrite">
					<h2 class="blind">로그인</h2>

					<fieldset class="login_form">
						<legend class="blind">로그인 입력폼</legend>

						<form name="form" id="form" method="post"
							action="${pageContext.request.contextPath}/login">
							<input type="hidden" name="mtype" id="mtype" value="ROLE_PERSON">
							<!-- 회원선택-->
							<div class="select_row">
								<ul id="devMemTab">
									<li class="on"><a href="#" data-m-type="M">개인회원</a></li>
									<li class=""><a href="#" data-m-type="Co">기업회원</a></li>
								</ul>
							</div>

							<div class="input_row">
								<label for="M_ID" id="lb_id" class="blind">아이디</label>
								<input type="text" class="inpTxt inpID off" name="mid" id="M_ID"
									size="16" maxlength="20" title="아이디 입력"
									style="ime-mode: inactive;" autocomplete="off">
								<label for="M_PWD" id="lb_pw" class="blind">비밀번호</label>
								<input type="password" class="inpTxt inpPW devCapsLock off"
									name="mpw" id="M_PWD" size="16" title="비밀번호 입력"
									autocomplete="off">
								<button type="submit" class="btLoin">로그인</button>
								<div class="lyCapsLock" id="ipNotice">
									<em>Caps Lock</em>이 켜져 있습니다.<span class="mainIcn mainIcnArrUp"></span>
								</div>
							</div>
							<div class="check_row">
								<input type="checkbox" name="remember-me" id="lb_idSave" value="Y">
								<label for="lb_idSave">로그인 상태 유지</label> <span class="txtBar">
									| </span>
								<a href="javascript:void(0)" class="devSecPop">IP보안</a>
								<button type="button" class="btnSecurity btnSecurity_on"
									onclick="ipCheckSetting();">
									<span class="setOn">ON</span>
								</button>
								<!--<span id="ipNotice" class="devHide"><img src="https://i.jobkorea.kr/content/images/login/ver_1/ip_layer_bg.png" alt="개인정보 보호를 위해 IP보완을 ON으로 변경해주세요"></span>-->
								<p class="sch">
									<a href="../findId"

										target="_new">아이디 찾기</a>
									<span class="txtBar"> | </span>
									<a
										href="../findPassword"
										target="_new">비밀번호 찾기</a>
								</p>
							</div>
						</form>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

						<!--	API SNS Login   -->
						<div class="list-social">
							<ul>
								<li><a href="${ naver_url }" id="btnNvLogin" class="naver"
										onclick="_LA.EVT('4287')" style="display: block;">네이버 로그인</a></li>
								<li><a href="${ kakao_url }" id="btnKaLogin" class="kakao"
										onclick="_LA.EVT('4286')" style="display: block;">카카오 로그인</a></li>
								<li><a href="${ google_url }" id="btnGlLogin"
										class="google" onclick="_LA.EVT('4288')"
										style="display: block;"> 구글 로그인</a></li>
							</ul>
						</div>

						<div class="join">
							<div id="M_Alert" style="display: block;">
								좋은 일을 찾으시나요? 회원가입하시고 다양한 혜택을 누리세요!
								<a href="../../jjapkorea/signup/person" target="_new">회원가입</a>
							</div>
							<div id="Co_Alert" style="display: none;">
								좋은 인재를 구하시나요? 회원가입하시고 다양한 혜택을 누리세요!
								<a href="../../jjapkorea/signup/business" target="_new">회원가입</a>
								<div class="text-balloon" style="display: none;">
									신규가입 <span>3종</span> 쿠폰 제공!
								</div>
							</div>
						</div>
					</fieldset>
				</div>
				<div class="adBan">
					<h2 class="skip">광고</h2>
					<iframe width="325" height="310" noresize="" scrolling="no"
						frameborder="0" marginheight="0" marginwidth="0"
						src="https://yellow.contentsfeed.com/RealMedia/ads/adstream_sx.ads/jobkorea/login@x01"
						title="광고"></iframe>
				</div>
				<!-- AD //-->
			</div>
			<!-- // content -->

			<div class="section-company" style="display: none;">
				<div class="article-jobkorea target">
					<div class="inner">
						<img
							src="https://i.jobkorea.kr/content/images/join/company/img_company_01.png"
							alt="">
					</div>
				</div>
				<div class="article-super target">
					<div class="inner">
						<img
							src="https://i.jobkorea.kr/content/images/join/company/img_company_02.png"
							alt="">
					</div>
				</div>
				<div class="article-smart target">
					<div class="inner">
						<img
							src="https://i.jobkorea.kr/content/images/join/company/img_company_03.png"
							alt="">
					</div>
				</div>
				<div class="article-search target">
					<div class="inner">
						<img
							src="https://i.jobkorea.kr/content/images/join/company/img_company_04.png"
							alt="">
					</div>
				</div>
				<div class="article-hunting target">
					<div class="inner">
						<img
							src="https://i.jobkorea.kr/content/images/join/company/img_company_05.png"
							alt="">
					</div>
				</div>
				<div class="article-learning target">
					<div class="inner">
						<img
							src="https://i.jobkorea.kr/content/images/join/company/img_company_06.png"
							alt="">
					</div>
				</div>
				<div class="article-start target">
					<div class="inner">
						<img
							src="https://i.jobkorea.kr/content/images/join/company/img_company_07.png?20200327"
							alt="">
						<a href="https://www.jobkorea.co.kr/Join/GI_Regist"
							class="btn-start">
							<img
								src="https://i.jobkorea.kr/content/images/join/company/btn_join.png"
								alt="">
						</a>
					</div>
				</div>
				<div class="btn-fixed-right">
					<a href="signup/person" class="btn-join-right">가입하기</a>
					<a href="javascript:;"
						onclick="$('html, body').animate({scrollTop: 0}, 800);"
						class="btn-top btn-top-scroll">
						<img
							src="https://i.jobkorea.kr/content/images/join/company/btn_top.png"
							alt="">
					</a>
				</div>
			</div>

			<div id="adFooter" class="footer footer--short">
				<div class="footer__wrap">
					<div class="footer__advertisement clear">
						<h3 class="blind">배너</h3>


						<p class="footer__advertisement--text">
							<iframe width="195" height="35" noresize="" scrolling="no"
								frameborder="0" marginheight="0" marginwidth="0"
								src="https://yellow.contentsfeed.com/RealMedia/ads/adstream_sx.ads/jobkorea/sub@Frame1"
								title="광고"></iframe>
						</p>
						<p class="footer__advertisement--text">
							<iframe width="495" height="110" noresize="" scrolling="no"
								frameborder="0" marginheight="0" marginwidth="0"
								src="https://yellow.contentsfeed.com/RealMedia/ads/adstream_sx.ads/jobkorea/sub@Bottom"
								title="광고"></iframe>
						</p>
						<p class="footer__advertisement--text">
							<iframe width="195" height="35" noresize="" scrolling="no"
								frameborder="0" marginheight="0" marginwidth="0"
								src="https://yellow.contentsfeed.com/RealMedia/ads/adstream_sx.ads/jobkorea/sub@Frame2"
								title="광고"></iframe>
						</p>
					</div>
				</div>
			</div>
		</div>
		<!-- container //-->

		<div id="footer">
			<p id="copyright">
				<img
					src="https://i.jobkorea.kr/content/images/login/ver_1/copyright.png?220104"
					alt="©JOBKOREA Corp. All Rights Reserved.">
			</p>
		</div>
		<!-- footer //-->

	</div>
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			// 링크 클릭 시 기본 동작(페이지 새로고침) 막기
			var aList = document.querySelectorAll("#devMemTab a");
			for (var i = 0; i < aList.length; i++) {
				aList[i].addEventListener("click", function(e) {
					e.preventDefault();
				});
			}

			// 개인회원, 기업회원 탭 클릭 시 내용 변경
			var tabs = devMemTab.querySelectorAll("li");

			tabs[0].addEventListener("click", function() {
				$("#mtype").val("ROLE_PERSON");
				tabs[0].classList.add("on");
				tabs[1].classList.remove("on");
				document.querySelector("#M_Alert").style.display = "block";
				document.querySelector("#Co_Alert").style.display = "none";
				$("#M_ID").val("");
				$("#M_PWD").val("");
			});

			tabs[1].addEventListener("click", function() {
				$("#mtype").val("ROLE_BUSINESS");
				tabs[0].classList.remove("on");
				tabs[1].classList.add("on");
				document.querySelector("#M_Alert").style.display = "none";
				document.querySelector("#Co_Alert").style.display = "block";
				$("#M_ID").val("");
				$("#M_PWD").val("");
			});
		});
	</script>
</body>
</html>