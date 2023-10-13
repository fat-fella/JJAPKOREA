<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- jQuery 스크립트 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<script>
	/* function getinfo(jid) {

	 $.ajax({
	 type: 'GET',
	 url: '${pageContext.request.contextPath}/jobpostinginfo',
	 contentType: 'application/json',
	 data: JSON.stringify({
	 jid: jid 
	 }),

	 dataType: 'json',  // 서버에서 문자열 응답을 받기 위해 설정
	 success: function (response) {

	 console.log('취업공고 상세 ajax 성공:', response);
	 if (response === "success") {
	 // 채용공고 상세 페이지로 이동
	 window.location.assign('${pageContext.request.contextPath}/jobpostinginfo');
	 } else {
	 // 다른 처리를 원하는 경우
	 window.location.href = '${pageContext.request.contextPath}/login';
	 }
	 },
	 error: function (error) {
	 console.log('취업공고 상세 ajax 실패:', error);
	 }
	 });
	 }
	 */
	function getinfo(jid) {
		location.href = '${pageContext.request.contextPath}/jobpostinginfo?jid='
				+ jid;
		/* 	    $.ajax({
		 type: 'GET',
		 url: '${pageContext.request.contextPath}/jobpostinginfo?jid=' + jid,
		 //dataType: 'json',
		 success: function (response) {
		 console.log('취업공고 상세 ajax 성공:', response);
		 if (response === "success") {
		 // 채용공고 상세 페이지로 이동
		 window.location.assign('${pageContext.request.contextPath}/jobpostinginfo');
		 } else {
		 // 다른 처리를 원하는 경우
		 window.location.href = '${pageContext.request.contextPath}/login';
		 }
		 },
		 error: function (error) {
		 console.log('취업공고 상세 ajax 실패:', error);
		 }
		 }); */
	}

	$(function() {
		$(window).scroll(function() {
			if ($(this).scrollTop() > 500) {
				$('.go_top').fadeIn();
			} else {
				$('.go_top').fadeOut();
			}
		});

		$(".go_top").click(function() {
			$('html, body').animate({
				scrollTop : 0
			}, 0);
			return false;
		});
	});

	$(document)
			.ready(
					function() {
						$("[data-jid]")
								.each(
										function() {
											var jid = $(this).data("jid");
											var scrapButton = $(this);

											// 서버에서 JSON 데이터 가져오기
											var selectListScrapJson = '${selectListScrapJson}';

											if (selectListScrapJson) {
												var selectListScrap = JSON
														.parse(selectListScrapJson);

												if (Array
														.isArray(selectListScrap)) {
													var selectOneScrap = selectListScrap
															.find(function(item) {
																return item.jid === jid;
															});

													if (selectOneScrap) {
														var isScrapAction = JSON
																.parse(selectOneScrap.isScrapAction);

														if (isScrapAction) {
															scrapButton
																	.addClass('scraped');
															scrapButton
																	.text('스크랩됨');
															scrapButton
																	.removeClass('scrap');
														} else {
															scrapButton
																	.removeClass('scraped');
															scrapButton
																	.text('채용정보 스크랩');
															scrapButton
																	.addClass('scrap');
														}
													}
												}
											}
										});
					});

	// 스크랩 버튼 클릭 시
	function setScrap(jid) {
		var mid = "${mid}";
		var scrapButton = $('[data-jid="' + jid + '"]');

		// 현재 스크랩 상태 가져오기
		var isScrapAction = scrapButton.hasClass('scrap'); // 스크랩 버튼이 'scrap' 클래스를 가지고 있는지 여부에 따라 설정

		$.ajax({
			url : "${pageContext.request.contextPath}/person/myPage",
			type : "post",
			contentType : "application/json", // JSON 형식으로 데이터 전송
			data : JSON.stringify({
				jid : jid,
				mid : mid,
				isScrapAction : isScrapAction.toString()
			// 문자열로 변환하여 보냄
			}),
			success : function(result) {
				if (result === "스크랩 성공") {
					// 스크랩 성공 처리
					scrapButton.toggleClass('scraped');
					scrapButton.text('스크랩됨');
					scrapButton.removeClass('scrap');
					alert("스크랩 성공");
				} else if (result === "스크랩 해제 성공") {
					// 스크랩 해제 성공 처리
					scrapButton.toggleClass('scraped');
					scrapButton.text('채용정보 스크랩');
					scrapButton.addClass('scrap');
					alert("스크랩 해제 성공");
				} else {
					// 스크랩 실패 처리
					alert("스크랩 실패");
				}
			},
			error : function(xhr, status, error) {
				if (xhr.status === 400) {
					alert("클라이언트 오류"); // 클라이언트 오류
				} else if (xhr.status === 500) {
					alert("서버 오류"); // 서버 오류
				} else {
					alert("알 수 없는 오류: " + xhr.status); // 기타 오류
				}
			}
		});
	}

	// 이메일 보내기 
	$(function sendEmail(mid) {
		var mid = "${mid}";
		
		$("#devApplyBtn").click(function() {
			$.ajax({
				url : "${pageContext.request.contextPath}/person/noticeMail",
				type : "post",
				data : "json",
				success : function(data){
					alert("[지원완료] 이메일이 전송되었습니다.");
				},
				error: function (xhr, status, e) {
					if (xhr.status === 400) {
		                alert("클라이언트 오류"); // 클라이언트 오류
		            } else if (xhr.status === 500) {
		                alert("서버 오류"); // 서버 오류
		            } else {
		                alert("알 수 없는 오류: " + xhr.status); // 기타 오류
		            }
				}); // error
			}); // ajax
		}); // click
	} // sendEmail
	
</script>
<div class="wrap">
	<main>
		<div id="content">
			<section class="First VVIP 채용관">
				<div class="bannerwrap">
					<h4>First VVIp 채용관</h4>
					<button type="button" class="viewmore">
						상품안내 ><i aria-hidden="true"></i>
					</button>
				</div>
				<ul class="grid-container">
					<c:forEach items="${list1}" var="item">
						<li>
							<form id="scrapForm">
								<div>
									<%
									// 이미지 파일들의 경로 배열
									String[] imagePaths = { "/jjapkorea/resources/images/maru/maru1.png", "/jjapkorea/resources/images/maru/maru2.png",
											"/jjapkorea/resources/images/maru/maru3.png", "/jjapkorea/resources/images/maru/maru4.png",
											"/jjapkorea/resources/images/maru/maru5.png", "/jjapkorea/resources/images/maru/maru6.png",
											"/jjapkorea/resources/images/maru/maru7.png", "/jjapkorea/resources/images/maru/maru8.png"
											// 추가 이미지 경로들...
									};

									// 랜덤으로 인덱스 생성
									int randomIndex = (int) (Math.random() * imagePaths.length);

									// 랜덤 이미지의 경로
									String randomImagePath = imagePaths[randomIndex];
									%>
									<img src="<%=randomImagePath%>" alt="랜덤 이미지">
								</div>
								<div class="compName" onclick="getinfo('${item.JID}')">${item.BIZNAME}</div>
								<div class="recruitInfo" data-jid="${item.JID}"
									onclick="getinfo('${item.JID}')">
									${item.RE_TITLE}<br> <br>
								</div>
								<div id="applyscrap">
									<c:choose>
										<c:when test="${item.TODAY == 0}">
											<div class="applydateWithApply">오늘시작</div>
										</c:when>
										<c:when test="${item.DDAY == 0}">
											<div class="applydateWithApply">오늘마감</div>
										</c:when>
										<c:when test="${item.DDAY <= 7}">
											<button onclick="" class="applynow">즉시지원</button>
											<div class="applydateWithApply">D-${item.DDAY}</div>
										</c:when>
										<c:otherwise>
											<div class="applydateWithApply">D-${item.DDAY}</div>
										</c:otherwise>
									</c:choose>
									<!-- 클릭한 채용 정보 데이터를 폼에 담아 서버로 전송 -->
									<input type="hidden" name="jid" value="${item.JID}"> <input
										type="hidden" name="recruitField"
										value="${item.RECRUIT_FIELD}"> <input type="hidden"
										name="bizname" value="${item.BIZNAME}"> <input
										type="hidden" name="brno" value="${item.BRNO}"> <input
										type="hidden" name="userEducation"
										value="${item.USER_EDUCATION}"> <input type="hidden"
										name="salary" value="${item.SALARY}"> <input
										type="hidden" name="minSalary" value="${item.MIN_SALARY}">
									<input type="hidden" name="maxSalary"
										value="${item.MAX_SALARY}"> <input type="hidden"
										name="registDate" value="${item.REGIST_DATE}"> <input
										type="hidden" name="closeDate" value="${item.CLOSE_DATE}">
									<input type="hidden" name="reTitle" value="${item.RE_TITLE}">
									<input type="hidden" name="career" value="${item.CAREER}">
									<input type="hidden" name="workType" value="${item.WORK_TYPE}">
									<input type="hidden" name="empTypeCode"
										value="${item.EMP_TYPE_CODE}">
									<button type="button" onclick="setScrap('${item.JID}')"
										data-jid="${item.JID}" class="scrap">채용정보 스크랩</button>
								</div>
							</form>
						</li>
					</c:forEach>
				</ul>
			</section>
			<section class="sliderwrap">
				<!--todo 슬라이더-->
				<div class="flow_banner_box">
					<div>
						<div>
							<div>
								<div id="carouselExampleAutoplaying" class="carousel slide"
									data-bs-ride="carousel">
									<div class="carousel-inner">
										<div class="carousel-item active">
											<ul>
												<li class="sliderbutton">
													<div style="align-content: center">
														<button type="button">
															<img
																src="https://imgs.jobkorea.co.kr/Images/Logo/86/a/s/2000q80cpqaqckaq_3720cqbrxiprp2vc.gif?p=y&hash=c"
																alt="">
														</button>
														<button type="button">
															<img
																src="https://imgs.jobkorea.co.kr/Images/Logo/86/k/a/2360y60pycx39y_2120py9kw3d29p.gif?p=y&hash=c"
																alt="">
														</button>
														<button type="button">
															<img
																src="https://imgs.jobkorea.co.kr/Images/Logo/86/k/o/2140fa0gmajnqld9wf_3620gfdlwndaqgj23g.gif?p=y&hash=c"
																alt="">
														</button>
														<button type="button">
															<img
																src="https://imgs.jobkorea.co.kr/Images/Logo/86/e/l/2000d80hjipcdscd_3720hdbqlzcix2ih.gif?p=y&hash=c"
																alt="">
														</button>
														<button type="button">
															<img
																src="https://imgs.jobkorea.co.kr/Images/Logo/86/b/y/2720e40oarke_2020oe7ok2xo.gif?p=y&hash=c"
																alt="">
														</button>
														<button type="button">
															<img
																src="https://imgs.jobkorea.co.kr/Images/Logo/86/k/d/2380v70pfahee2s_2420pvaaqohesvp.gif?p=y&hash=c"
																alt="">
														</button>
														<button type="button">
															<img
																src="https://imgs.jobkorea.co.kr/Images/Logo/86/g/o/2360t60kbdxoet_2120kt9kxmj2qk.gif?p=y&hash=c"
																alt="">
														</button>
														<button type="button">
															<img
																src="https://imgs.jobkorea.co.kr/Images/Logo/86/i/n/2380d70ji8o5625_2420jdarj5036dj.gif?p=y&hash=c"
																alt="">
														</button>
														<button type="button">
															<img
																src="https://imgs.jobkorea.co.kr/Images/Logo/86/g/o/2360t60kbksozt_2120kt9vxfx2qk.gif?p=y&hash=c"
																alt="">
														</button>
														<button type="button">
															<img
																src="https://imgs.jobkorea.co.kr/Images/Logo/86/k/b/2000m80fyabjpqwm_3720fmbemqnoo2pf.gif?p=y&hash=c"
																alt="">
														</button>
														<button type="button">
															<img
																src="https://imgs.jobkorea.co.kr/Images/Logo/86/g/u/2380s70oprozi2l_2420osaredolmso.gif?p=y&hash=c"
																alt="">
														</button>
													</div>
												</li>
											</ul>
										</div>
										<div class="carousel-item">
											<ul>
												<li class="sliderbutton">
													<div style="align-content: center">
														<button type="button">
															<img
																src="https://imgs.jobkorea.co.kr/Images/Logo/86/w/s/2360Z60XMKUJLZ_2120XZ9IFBX2CX.gif?p=y&hash=c"
																alt="">
														</button>
														<button type="button">
															<img
																src="https://imgs.jobkorea.co.kr/Images/Logo/86/w/r/2140w50ltiv2w_2620lw8pjgrwl.gif?p=y&hash=c"
																alt="">
														</button>
														<button type="button">
															<img
																src="https://imgs.jobkorea.co.kr/Images/Logo/86/d/e/2380P70MQGOHL2A_2420MPaRALGMVPM.gif?p=y&hash=c"
																alt="">
														</button>
														<button type="button">
															<img
																src="https://imgs.jobkorea.co.kr/Images/Logo/86/c/o/2360i60ku6txzi_2120ki9wxf52fk.gif?p=y&hash=c"
																alt="">
														</button>
														<button type="button">
															<img
																src="https://imgs.jobkorea.co.kr/Images/Logo/86/h/a/2000a80qnhalj08a_3720qabrpdl7u24q.gif?p=y&hash=c"
																alt="">
														</button>
														<button type="button">
															<img
																src="https://imgs.jobkorea.co.kr/Images/Logo/86/m/n/2380u70jzza8l26_2420juamjlm50uj.gif?p=y&hash=c"
																alt="">
														</button>
														<button type="button">
															<img
																src="https://imgs.jobkorea.co.kr/Images/Logo/86/u/b/2360f60mzpujqf_2120mf9ieow2cm.gif?p=y&hash=c"
																alt="">
														</button>
														<button type="button">
															<img
																src="https://imgs.jobkorea.co.kr/Images/Logo/86/s/a/2360xb0pfutcw6b2921_3120pxewwpotd3574xp.gif?p=y&hash=c"
																alt="">
														</button>
														<button type="button">
															<img
																src="https://imgs.jobkorea.co.kr/Images/Logo/86/k/a/2000m80qyex4356m_3720qmbcp8b9921q.gif?p=y&hash=c"
																alt="">
														</button>
														<button type="button">
															<img
																src="https://imgs.jobkorea.co.kr/Images/Logo/86/k/c/2380v70rf8t5620_2420rvato5086vr.gif?p=y&hash=c"
																alt="">
														</button>
														<button type="button">
															<img
																src="https://imgs.jobkorea.co.kr/Images/Logo/86/d/o/2360db0kjtdpotdec24_3120kdecxubcwjb2hdk.gif?p=y&hash=c"
																alt="">
														</button>
													</div>
												</li>
											</ul>
										</div>
										<div class="carousel-item">
											<ul>
												<li class="sliderbutton">
													<div style="align-content: center">
														<button type="button">
															<img
																src="https://imgs.jobkorea.co.kr/Images/Logo/86/n/e/2000i80dcekqlkci_3720dibwjhbip2vd.gif?p=y&hash=c"
																alt="">
														</button>
														<button type="button">
															<img
																src="https://imgs.jobkorea.co.kr/Images/Logo/86/f/a/2000x80qgwxzkoox_3720qxbcpwkjd2wq.gif?p=y&hash=c"
																alt="">
														</button>
														<button type="button">
															<img
																src="https://imgs.jobkorea.co.kr/Images/Logo/86/n/h/2000i80acrccc53i_3720aibinia8x21a.gif?p=y&hash=c"
																alt="">
														</button>
														<button type="button">
															<img
																src="https://imgs.jobkorea.co.kr/Images/Logo/86/m/a/2720t90wuqrbgdm26_3020wtcuqxlcs4jtw.gif?p=y&hash=c"
																alt="">
														</button>
														<button type="button">
															<img
																src="https://imgs.jobkorea.co.kr/Images/Logo/86/a/g/2720w90bqjg5q4524_3020bwcxswp9876wb.gif?p=y&hash=c"
																alt="">
														</button>
														<button type="button">
															<img
																src="https://imgs.jobkorea.co.kr/Images/Logo/86/w/7/2140w508t5328_26208w89064w8.gif?p=y&hash=c"
																alt="">
														</button>
														<button type="button">
															<img
																src="https://imgs.jobkorea.co.kr/Images/Logo/86/k/o/2000m80wyqckcsjm_3720wmbikipdv2iw.gif?p=y&hash=c"
																alt="">
														</button>
														<button type="button">
															<img
																src="https://imgs.jobkorea.co.kr/Images/Logo/86/t/e/2140va0akahmstr9cv_3620avdsdodiaxe23a.gif?p=y&hash=c"
																alt="">
														</button>
														<button type="button">
															<img
																src="https://imgs.jobkorea.co.kr/Images/Logo/86/c/s/2720u90frxvcl7q21_3020fucynqgwm84uf.gif?p=y&hash=c"
																alt="">
														</button>
														<button type="button">
															<img
																src="https://imgs.jobkorea.co.kr/Images/Logo/86/n/e/2380j70mjgczj2l_2420mjacajglmjm.gif?p=y&hash=c"
																alt="">
														</button>
														<button type="button">
															<img
																src="https://imgs.jobkorea.co.kr/Images/Logo/86/n/s/2720d90fjqq5h5528_3020fdcwnsl9858df.gif?p=y&hash=c"
																alt="">
														</button>
													</div>
												</li>
											</ul>
										</div>
									</div>
									<button class="carousel-control-prev" type="button"
										data-bs-target="#carouselExampleAutoplaying"
										data-bs-slide="prev">
										<span class="carousel-control-prev-icon" aria-hidden="true"></span>
										<span class="visually-hidden">Previous</span>
									</button>
									<button class="carousel-control-next" type="button"
										data-bs-target="#carouselExampleAutoplaying"
										data-bs-slide="next">
										<span class="carousel-control-next-icon" aria-hidden="true"></span>
										<span class="visually-hidden">Next</span>
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<section class="VVIP 채용관">
				<div class="bannerwrap">
					<h4>VVIp 채용관</h4>
					<button type="button" class="viewmore">
						상품안내 ><i aria-hidden="true"></i>
					</button>
				</div>
				<ul class="grid-container">
					<c:forEach items="${list2}" var="item">
						<li>
							<div>
								<%
								// 이미지 파일들의 경로 배열
								String[] imagePaths = { "/jjapkorea/resources/images/maru/maru1.png", "/jjapkorea/resources/images/maru/maru2.png",
										"/jjapkorea/resources/images/maru/maru3.png", "/jjapkorea/resources/images/maru/maru4.png",
										"/jjapkorea/resources/images/maru/maru5.png", "/jjapkorea/resources/images/maru/maru6.png",
										"/jjapkorea/resources/images/maru/maru7.png", "/jjapkorea/resources/images/maru/maru8.png"
										// 추가 이미지 경로들...
								};

								// 랜덤으로 인덱스 생성
								int randomIndex = (int) (Math.random() * imagePaths.length);

								// 랜덤 이미지의 경로
								String randomImagePath = imagePaths[randomIndex];
								%>
								<img src="<%=randomImagePath%>" alt="랜덤 이미지">
							</div>
							<div class="compName" onclick="getinfo('${item.JID}')">${item.BIZNAME}</div>
							<div class="recruitInfo" onclick="getinfo('${item.JID}')">
								${item.RE_TITLE}<br> <br>
							</div>
							<div id="applyscrap">
								<c:choose>
									<c:when test="${item.TODAY == 0}">
										<div class="applydateWithApply">오늘시작</div>
									</c:when>
									<c:when test="${item.DDAY == 0}">
										<div class="applydateWithApply">오늘마감</div>
									</c:when>
									<c:when test="${item.DDAY <= 7}">
										<button onclick="" class="applynow">즉시지원</button>
										<div class="applydateWithApply">D-${item.DDAY}</div>
									</c:when>
									<c:otherwise>
										<div class="applydateWithApply">D-${item.DDAY}</div>
									</c:otherwise>
								</c:choose>
								<button type="button" onclick="setScrap('${item.JID}')"
									data-jid="${item.JID}" class="scrap">채용정보 스크랩</button>
							</div>
						</li>
					</c:forEach>
				</ul>
			</section>
			<section>
				<!--TODO 4개짜리 배너-->
				<div class="middle_banner_wrap">
					<h3 class="skip">이미지 배너</h3>
					<div class="list">
						<ul class="imagebanner">
							<li><iframe
									src="https://yellow.contentsfeed.com/RealMedia/ads/adstream_sx.ads/jobkorea/main@Middle1"
									scrolling="no" frameborder="0" marginheight="0" marginwidth="0"
									width="306" height="200" title="채용광고"></iframe></li>
							<li><iframe
									src="https://yellow.contentsfeed.com/RealMedia/ads/adstream_sx.ads/jobkorea/main@Middle2"
									scrolling="no" frameborder="0" marginheight="0" marginwidth="0"
									width="306" height="200" title="채용광고"></iframe></li>
							<li><iframe
									src="https://yellow.contentsfeed.com/RealMedia/ads/adstream_sx.ads/jobkorea/main@Middle3"
									scrolling="no" frameborder="0" marginheight="0" marginwidth="0"
									width="306" height="200" title="채용광고"></iframe></li>
							<li><iframe
									src="https://yellow.contentsfeed.com/RealMedia/ads/adstream_sx.ads/jobkorea/main@Middle"
									scrolling="no" frameborder="0" marginheight="0" marginwidth="0"
									width="306" height="200" title="채용광고"></iframe></li>
						</ul>
					</div>
				</div>

				<hr />
			</section>
			<section class="Excellent 채용관">
				<div class="bannerwrap">
					<h4>Excellent 채용관</h4>
					<button type="button" class="viewmore">
						상품안내 ><i aria-hidden="true"></i>
					</button>
				</div>
				<ul class="grid-container">
					<c:forEach items="${list3}" var="item">
						<li>
							<div>
								<%
								// 이미지 파일들의 경로 배열
								String[] imagePaths = { "/jjapkorea/resources/images/maru/maru1.png", "/jjapkorea/resources/images/maru/maru2.png",
										"/jjapkorea/resources/images/maru/maru3.png", "/jjapkorea/resources/images/maru/maru4.png",
										"/jjapkorea/resources/images/maru/maru5.png", "/jjapkorea/resources/images/maru/maru6.png",
										"/jjapkorea/resources/images/maru/maru7.png", "/jjapkorea/resources/images/maru/maru8.png"
										// 추가 이미지 경로들...
								};

								// 랜덤으로 인덱스 생성
								int randomIndex = (int) (Math.random() * imagePaths.length);

								// 랜덤 이미지의 경로
								String randomImagePath = imagePaths[randomIndex];
								%>
								<img src="<%=randomImagePath%>" alt="랜덤 이미지">
							</div>
							<div class="compName" onclick="getinfo('${item.JID}')">${item.BIZNAME}</div>
							<div class="recruitInfo" onclick="getinfo('${item.JID}')">
								${item.RE_TITLE}<br> <br>
							</div>
							<div id="applyscrap">
								<c:choose>
									<c:when test="${item.TODAY == 0}">
										<div class="applydateWithApply">오늘시작</div>
									</c:when>
									<c:when test="${item.DDAY == 0}">
										<div class="applydateWithApply">오늘마감</div>
									</c:when>
									<c:when test="${item.DDAY <= 7}">
										<button onclick="" class="applynow">즉시지원</button>
										<div class="applydateWithApply">D-${item.DDAY}</div>
									</c:when>
									<c:otherwise>
										<div class="applydateWithApply">D-${item.DDAY}</div>
									</c:otherwise>
								</c:choose>
								<button type="button" onclick="setScrap('${item.JID}')"
									data-jid="${item.JID}" class="scrap">채용정보 스크랩</button>
							</div>
						</li>
					</c:forEach>
				</ul>
			</section>
			<section class="게임분야 채용정보">
				<div class="l-wrap-bottom l-gamejob-wrap">
					<div class="l-gamejob">
						<h3 class="header">게임분야 채용정보</h3>
						<ul class="list">
							<li class="item">
								<div class="company bg1">
									<div class="logo">
										<img src="//www.gamejob.co.kr/Images/Booth/B_Logo/vagames.gif"
											width="100" height="30"
											onerror="this.src='//www.gamejob.co.kr/Images/Booth/B_Logo/Logo_None.gif';"
											alt="브이에이게임즈" />
									</div>
									브이에이게임즈
								</div>
								<ul>
									<li><a href="#" target="_blank"
										onclick="GA_Event('홈_PC','게임분야채용정보','게임잡이동_브이에이게임즈_[아우터플레인] 서버 프로그래머');">[아우터플레인]
											서버 프로그래머</a></li>
									<li><a href="#" target="_blank"
										onclick="GA_Event('홈_PC','게임분야채용정보','게임잡이동_브이에이게임즈_[아우터플레인] 전 직군 인재채용');">[아우터플레인]
											전 직군 인재채용</a></li>
									<li><a href="#" target="_blank"
										onclick="GA_Event('홈_PC','게임분야채용정보','게임잡이동_브이에이게임즈_[레트로홀릭스튜디오] 도트 디자이너 모집');">[레트로홀릭스튜디오]
											도트 디자이너 모집</a></li>
								</ul>
								<div class="extra">
									<div class="total">
										진행중인 채용공고 <span>13</span>건
									</div>
									<a href="#" target="_blank" class="btn_more"
										onclick="GA_Event('홈_PC','게임분야채용정보','게임잡이동_브이에이게임즈_더보기');">
										더보기<i class="icon-more-arrow-right" aria-hidden="true"></i>
									</a>
								</div>
							</li>
							<li class="item">
								<div class="company bg2">
									<div class="logo">
										<img
											src="//www.gamejob.co.kr/Images/Booth/B_Logo/111percent.gif"
											width="100" height="30"
											onerror="this.src='//www.gamejob.co.kr/Images/Booth/B_Logo/Logo_None.gif';"
											alt="111퍼센트㈜" />
									</div>
									111퍼센트㈜
								</div>
								<ul>
									<li><a href="#" target="_blank"
										onclick="GA_Event('홈_PC','게임분야채용정보','게임잡이동_111퍼센트㈜_[111퍼센트]마케팅 영상 콘텐츠 디자이너');">[111퍼센트]마케팅
											영상 콘텐츠 디자이너</a></li>
									<li><a href="#" target="_blank"
										onclick="GA_Event('홈_PC','게임분야채용정보','게임잡이동_111퍼센트㈜_[111퍼센트] 로블록스 개발자 모집');">[111퍼센트]
											로블록스 개발자 모집</a></li>
									<li><a href="#" target="_blank"
										onclick="GA_Event('홈_PC','게임분야채용정보','게임잡이동_111퍼센트㈜_[곰블]게임 클라이언트 개발자');">[곰블]게임
											클라이언트 개발자</a></li>
								</ul>
								<div class="extra">
									<div class="total">
										진행중인 채용공고 <span>12</span>건
									</div>
									<a href="#" target="_blank" class="btn_more"
										onclick="GA_Event('홈_PC','게임분야채용정보','게임잡이동_111퍼센트㈜_더보기');">
										더보기<i class="icon-more-arrow-right" aria-hidden="true"></i>
									</a>
								</div>
							</li>
							<li class="item">
								<div class="company bg3">
									<div class="logo">
										<img src="//www.gamejob.co.kr/Images/Booth/B_Logo/gameduo.gif"
											width="100" height="30"
											onerror="this.src='//www.gamejob.co.kr/Images/Booth/B_Logo/Logo_None.gif';"
											alt="게임듀오" />
									</div>
									게임듀오
								</div>
								<ul>
									<li><a href="#" target="_blank"
										onclick="GA_Event('홈_PC','게임분야채용정보','게임잡이동_게임듀오_[경력] 유니티 클라이언트 개발자 모집');">[경력]
											유니티 클라이언트 개발자 모집</a></li>
									<li><a href="#" target="_blank"
										onclick="GA_Event('홈_PC','게임분야채용정보','게임잡이동_게임듀오_[경력] 퍼포먼스 마케터 모집');">[경력]
											퍼포먼스 마케터 모집</a></li>
									<li><a href="#" target="_blank"
										onclick="GA_Event('홈_PC','게임분야채용정보','게임잡이동_게임듀오_[경력] QA 엔지니어 모집');">[경력]
											QA 엔지니어 모집</a></li>
								</ul>
								<div class="extra">
									<div class="total">
										진행중인 채용공고 <span>19</span>건
									</div>
									<a href="#" target="_blank" class="btn_more"
										onclick="GA_Event('홈_PC','게임분야채용정보','게임잡이동_게임듀오_더보기');">
										더보기<i class="icon-more-arrow-right" aria-hidden="true"></i>
									</a>
								</div>
							</li>
							<li class="item">
								<div class="company bg4">
									<div class="logo">
										<img src="//www.gamejob.co.kr/Images/Booth/B_Logo/nhnent.gif"
											width="100" height="30"
											onerror="this.src='//www.gamejob.co.kr/Images/Booth/B_Logo/Logo_None.gif';"
											alt="NHN" />
									</div>
									NHN
								</div>
								<ul>
									<li><a href="#" target="_blank"
										onclick="GA_Event('홈_PC','게임분야채용정보','게임잡이동_NHN_[NHN] GameBI DW/DM 엔지니어');">[NHN]
											GameBI DW/DM 엔지니어</a></li>
									<li><a href="#" target="_blank"
										onclick="GA_Event('홈_PC','게임분야채용정보','게임잡이동_NHN_[NHN] 글로벌 신규 소셜 카지노 게임사업 PM');">
											[NHN] 글로벌 신규 소셜 카지노 게임<br>사업 PM
									</a></li>
									<li><a href="#" target="_blank"
										onclick="GA_Event('홈_PC','게임분야채용정보','게임잡이동_NHN_[NHN] 글로벌 신규 소셜 카지노 게임 서버 개발');">[NHN]
											글로벌 신규 소셜 카지노 게임 서버 개발</a></li>
								</ul>
								<div class="extra">
									<div class="total">
										진행중인 채용공고 <span>17</span>건
									</div>
									<a href="#" target="_blank" class="btn_more"
										onclick="GA_Event('홈_PC','게임분야채용정보','게임잡이동_NHN_더보기');">
										더보기<i class="icon-more-arrow-right" aria-hidden="true"></i>
									</a>
								</div>
							</li>
						</ul>
						<a href="#" class="btn_more_header" target="_blank"
							onclick="GA_Event('홈_PC','게임분야채용정보','게임잡이동_채용광고더보기');"> 채용광고
							더보기<i class="icon-more-arrow-right" aria-hidden="true"></i>
						</a>
					</div>
				</div>
			</section>
		</div>
		<button class="go_top" style="display: inline-block;">
			<span class="txt">위로 가기</span>
		</button>
	</main>
</div>