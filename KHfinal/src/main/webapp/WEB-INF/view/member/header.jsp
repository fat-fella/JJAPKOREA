<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Mainpage Header</title>
<!-- jQuery 스크립트 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		var menuCount = $('.bannBx .bann-logo').length;
		var currentIndex = 0;

		$('.btnBannPrev.spGnb').click(function() {
			$('.bann-logo.on').removeClass('on');
			currentIndex = (currentIndex - 1 + menuCount) % menuCount;
			$('.bannBx .bann-logo').eq(currentIndex).addClass('on');
		});

		$('.btnBannNext.spGnb').click(function() {
			$('.bann-logo.on').removeClass('on');
			currentIndex = (currentIndex + 1) % menuCount;
			$('.bannBx .bann-logo').eq(currentIndex).addClass('on');
		});

		$('.btnAllService').click(function() {
			$('.allArea').toggleClass("active");
			$('.jkNavDimm-click').toggleClass("on");
		})

		$(document).ready(function() {
			$('.userNav-item.my.member').hover(function() {
				$('.userNav-item.my.member .lyMyArea').css({
					display : 'block'
				})
			}, function() {
				$('.userNav-item.my.member .lyMyArea').css({
					display : 'none'
				})
			});
		});
		
		$(document).ready(function() {
			$('.userNav-item.corp').hover(function() {
				$('.userNav-item.corp .lyMyArea').css({
					display : 'block'
				})
			}, function() {
				$('.userNav-item.corp .lyMyArea').css({
					display : 'none'
				})
			});
		});
	});
</script>
</head>
<body>
<div class="wrap">
	<header>
		<!-- // headerInner -->
		<div class="headInner">
			<h1 class="jkLogo">
				<a href="<%=request.getContextPath()%>/index"></a>
			</h1>
			<!-- // search -->
			<div class="search">
				<h2 class="skip">검색</h2>
				<form class="global_seek" action="<%=request.getContextPath()%>/search" method="get">
					<fieldset>
						<legend>Smart Match 통합검색</legend>
						<div class="smKey">
							<input type="text" id="stext" title="검색어 입력" name="stext"
								placeholder="NEW JOB, NEW ME" maxlength="50"
								style="background: none;">
							<input type="submit" value="검색" class="submit spGnb"
								id="common_search_btn">
						</div>
					</fieldset>
				</form>
			</div>
			<!-- search // -->
			<div class="subSchArea">
				<div class="subSchLink">
					<a href="<%=request.getContextPath()%>/detailSearch" class="linkItem">
						<span class="spNav"> <span class="txIr">상세검색</span>
						</span>
					</a>
				</div>
			</div>
			<!-- // 배너 영역 -->
			<div class="headBann">
				<strong class="skip">잡코리아 주요 서비스</strong>
				<div class="headBannBtns">
					<button type="button" class="btnBannPrev spGnb">이전</button>
					<button type="button" class="btnBannNext spGnb">다음</button>
				</div>
				<div class="bannBx">
					<a href="#" target="_blank" title="새창 열림"
						class="bann-logo bann-albamon on"></a>
					<a href="#" target="_blank" title="새창 열림"
						class="bann-logo bann-gamejob"></a>
				</div>
				<!-- 배너 영역 // -->
			</div>
		</div>
		<!-- headerInner // -->
		<div id="headNavBar" class="headNavBar">
			<div class="navInner">
				<!-- 전체보기 버튼 클릭시 active 클래스 추가 -->
				<div class="jkNavArea">
					<h2 class="skip">주요서비스</h2>
					<ul class="serviceNav">
						<!-- 메뉴 활성화 클래스 navFixed 마우스 오버시 active 클래스 추가 -->
						<li id="gnbGi" class="navItem gi">
							<a href="<%=request.getContextPath()%>/jobPostingList/date" class="linkItem">
								<span class="spNav"><span class="txIr">채용정보</span></span>
							</a>
							<!-- // 채용정보 레이어 -->
							
							<!-- 채용정보 레이어 // -->
						</li>
						
						<li class="navItem lyNull theme" id="theme">
							<a href="<%=request.getContextPath()%>/one-pick" class="linkItem">
								<span class="spNav"><span class="txIr">원픽</span></span>
							</a>
						</li>
						<li id="gnbSalary" class="navItem salary">
							<a href="${pageContext.request.contextPath}/businessList" class="linkItem">
								<span class="spNav"><span class="txIr">기업정보</span></span>
							</a>
							<!-- // 연봉 레이어 -->
							<div class="lyNavArea">
								<h3 class="skip">기업·연봉 세부메뉴</h3>
								<div class="lyNavWrap">
									<div class="lyNavInner full">
										<div class="lyRow row01">
											<div class="lyCol col4">
												<div class="colItem">
													<strong class="titArea"><a href="#"
															class="tit beta">
															기업리뷰<span class="spGnb"></span>
														</a></strong>
													<div class="listBx">
														<ul>
															<li>
																<a href="#">기업리뷰 홈</a>
															</li>
															<li>
																<a href="#">리뷰 비교</a>
															</li>
															<li>
																<a
																	href="javascript:if('' != '' &amp;&amp; '' != 'M'){alert('기업리뷰는 개인회원만 작성이 가능합니다.');}else{location.href='/Review/MyReview';}">MY
																	기업리뷰</a>
															</li>
														</ul>
													</div>
												</div>
											</div>
											<div class="lyCol col4">
												<div class="colItem">
													<strong class="titArea"><a href="#" class="tit">
															연봉 정보<span class="spGnb"></span>
														</a></strong>
													<div class="listBx">
														<ul>
															<li>
																<a href="#">기업별</a>
															</li>
															<li>
																<a href="#">분야별</a>
															</li>
															<li>
																<a href="#">직원별</a>
															</li>
															<li>
																<a href="#" class="tit">연봉뉴스</a>
															</li>

														</ul>
													</div>
												</div>
											</div>
											<div class="lyCol col4">
												<div class="colItem">
													<strong class="titArea"><a href="#" class="tit">
															기업심층분석<span class="spGnb"></span>
														</a></strong>
													<div class="listBx">
														<ul>
															<li>
																<a href="#">기업분석보고서</a>
															</li>
														</ul>
													</div>
												</div>
											</div>
										</div>
										<button type="button" class="btnCloseNav spGnb">기업·연봉
											메뉴 닫기</button>

									</div>
								</div>
							</div>
							<!-- 연봉 레이어 // -->
						</li>
						<li id="futurelab" class="navItem futurelab">
							<a href="${pageContext.request.contextPath}/rooms" class="linkItem">
								<span class="spNav"><span class="txIr">톡톡상담</span></span>
							</a>
							
						</li>
						<li id="gnbQna" class="navItem qna lyNull">
							<a href="${pageContext.request.contextPath}/board/list" class="linkItem">
								<span class="spNav"><span class="txIr">취업톡톡</span></span>
							</a>
						</li>
						
					</ul>
					<!-- my 홈일경우 클래스 myPage -->
					<ul id="devMyPage" class="userNav">
						<sec:authorize access="isAnonymous()">
							<li class="userNav-item login">
								<a href="<%=request.getContextPath() %>/login/" class="txt-button login-button">로그인</a>
							</li>
							<li class="userNav-item join">
								<a href="<%=request.getContextPath() %>/signup/person" class="txt-button join-button">회원가입</a>
							</li>
						</sec:authorize>
						<sec:authorize access="hasRole('ROLE_PERSON')">
							<li class="userNav-item resume">
								<a href="<%=request.getContextPath() %>/person/resume/write" class="txt-button ico-mng"
									onclick="GA_Event('공통_PC', 'gnb', '이력서 관리');">이력서 관리</a>
							</li>
							<li class="userNav-item my member">
								<a href="<%=request.getContextPath() %>/person/myPage" class="btnMyOpen txt-button ico-cp"
									onclick="GA_Event('공통_PC', 'gnb', '개인회원홈');">
									<span class="spGnb"></span><span class="user-name">${selectOnePerson.pname}</span><span
										class="skip">열기</span>
								</a>
								<div class="lyMyArea">
									<div class="myInner">
										<div class="myLists">
											<ul>
												<li>
													<a href="<%=request.getContextPath() %>/person/resume/write"
														onclick="GA_Event('공통_PC', 'gnb', '이력서 관리');">
														<span class="tx">이력서 관리</span>
													</a>
												</li>
												<li>
													<a href="<%=request.getContextPath() %>/person/apply/list"
														onclick="GA_Event('공통_PC', 'gnb', '입사지원 현황');">
														<span class="tx">입사지원 현황</span>
													</a>
												</li>
												<li>
													<a href="<%=request.getContextPath() %>/person/scrap"
														onclick="GA_Event('공통_PC', 'gnb', '스크랩');">
														<span class="tx">스크랩</span>
													</a>
												</li>
												<li>
													<a href="<%=request.getContextPath() %>/person/infoModifyPerson"
														onclick="GA_Event('공통_PC', 'gnb', '개인정보 수정');">
														<span class="tx">개인정보 수정</span>
													</a>
												</li>
											</ul>
										</div>
										<div class="lyRow">
											<div class="btnRowWrap">
												<form action="<%=request.getContextPath() %>/logout" method="post">
													<a href="/Login/Logout.asp" class="btnLogOut"
														onclick="GA_Event('공통_PC', 'gnb', '로그아웃');">로그아웃</a>
												</form>
											</div>
										</div>
									</div>
									<span class="icnArr spGnb"></span>
								</div>
							</li>
						</sec:authorize>
						<sec:authorize access="hasRole('ROLE_BUSINESS')">
							<li class="userNav-item corp">
								<a href="<%=request.getContextPath() %>/login" target="_blank">
									<span class="spGnb">기업서비스</span>
								</a>
								<div class="lyMyArea">
									<div class="myInner">
										<div class="lyRow">
											<div class="btnRowWrap">
												<a href="<%=request.getContextPath() %>/login">기업회원 로그인</a>
											</div>
										</div>
										<div class="myLists">
											<ul>
												<li>
													<a href="https://www.jobkorea.co.kr/Corp/Main">
														<span class="tx">기업회원 홈</span>
													</a>
												</li>
												<li>
													<a href="business/jobpostingupload/list">
														<span class="tx">채용공고·지원자 관리</span>
													</a>
												</li>
											</ul>
											<div class="lyRow">
												<div class="btnRowWrap">
													<form action="logout" method="post">
														<a href="<%=request.getContextPath() %>/Login/Logout.asp" class="btnLogOut"
															onclick="GA_Event('공통_PC', 'gnb', '로그아웃');">로그아웃</a>
													</form>
												</div>
											</div>
										</div>
									</div>
									<span class="icnArr spGnb"></span>
								</div>
							</li>
						</sec:authorize>
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<li class="userNav-item admin">
								<form action="logout" method="post">
									<a href="<%=request.getContextPath() %>/Login/Logout.asp" class="btnLogOut"
										onclick="GA_Event('공통_PC', 'gnb', '로그아웃');">로그아웃</a>
								</form>
							</li>
							<li>
								<a href="<%=request.getContextPath()%>/admin/index">
									<span class="tx">관리자페이지</span>
								</a>
							</li>
						</sec:authorize>
					</ul>
				</div>
			</div>
		</div>
			<div class="jkNavDimm-click"></div>
			<div class="jkNavDimm-hover1"></div>
			<div class="jkNavDimm-hover2"></div>
			<div class="jkNavDimm-hover3"></div>
			<div class="jkNavDimm-hover4"></div>
			<div class="jkNavDimm-hover5"></div>
		</header>
	</div>

	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	<script>
		var swiper = new Swiper('.bnr-swiper', {
		direction : 'horizontal',
		centeredSlides : true,
		watchOverflow : true,
		slidesPerView : 1,
		loop : true,
		navigation : {
		nextEl : ".bnrs-next",
		prevEl : ".bnrs-prev",
		},
		observer : true,
		observeParents : true,
		});
		
		document.addEventListener("DOMContentLoaded", function() {
			// DOMContentLoaded 이벤트가 발생하면 실행될 코드
			var btnLogOut = document.querySelector(".btnLogOut");
			if (btnLogOut) {
				btnLogOut.addEventListener("click", function(e) {
					e.preventDefault(); // 버튼 클릭 시 기본 동작을 중단
					var form = btnLogOut.closest("form"); // 가장 가까운 form 요소 찾기
					if (form) {
						form.submit(); // form 요소의 submit 호출
					}
				});
			}
		});
	</script>
</body>
</html>