<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- [1] 해상도 - 최적해상도 1260 결정 -->
<!-- [2] content 영역 1260px -->
<!-- [3] reset.css 폴더경로 -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/reset.css">
<!-- [4] project명 또는 core.css 폴더경로 - bootstrap 등으로 대체 -->
<!-- [4] 기본색상 10~15개 정도 class 미리 만들어두기 -->
<!-- [4] 폰트크기 3~7개 정도 class 미리 만들어두기 -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.6/dist/web/static/pretendard.css" /> 
<!-- [4] button 3개 class 미리 만들어두기 -->
<!-- [4] a 모양 미리 만들어두기 -->
<!-- [5] layout 영역 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jobkh_layout.css">
<!-- [6] header 영역 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jobkh_header.css">
<!-- [7] nav 영역 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jobkh_nav.css">
<!-- [8] main 영역 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jobkh_main.css">
<!-- [9] footer 영역 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jobkh_footer.css">
<!-- 스크랩부 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/member/css/jobkh_mypage.css">
<!-- swiper css -->
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<!-- 부트스트랩 css -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="icon" href="resources/favicon.ico">
<script>
	

</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MY페이지 | KH</title>
<!-- jQuery 스크립트 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- nav active 별 스크립트 구성 -->
<jsp:include page="header.jsp"></jsp:include>
</head>
<body>
<!-- 좌측메뉴 -->




<!-- 좌측메뉴끝 -->

<div id="wrap">
	<!-- 본문시작  -->
	<section id="containd" style="background:#f2f4f7">
		<div class="contWrapa" style="width: 20%" >
		<p> </p>



		</div>
		<section id="containd" style="padding:5px 3 5 3px ;  display: flex; justify-content: center;"" >
		<div class="contWrap" style="width: 60% ;background:#ffffff ; padding:50px; margin:30px">
			<div class="mtuTab devFixedTab">
				<ul>
					<li class="on">
						<a href="#" onclick="GA_Event('마이페이지_PC', '나의소식', '스크랩 공고')">스크랩
							공고</a>
					</li>
					<li>
						<a href="infoModifyPerson" onclick="GA_Event('마이페이지_PC', '나의소식', '스크랩 공고')">회원 정보 수정</a>
					</li>
					<li>
						 <a href="#" onclick="deleteAccount(event); return false;">회원 탈퇴</a>
					</li>
				</ul>
			</div>
	
			<!-- 스마트매치 -->
			<h2 class="skip">스마트매치 리스트</h2>
			<div class="mtuList boothList smartMatchList" id="smartMatch">
				<ul>
					<c:forEach items="${scrapList}" var="item">
						<li>
							<div class="col infoCol">
								<div class="company">
									<a class="company"
										href="/Recruit/Co_Read/C/univtomorrow?Oem_Code=C1&amp;sc=10"
										target="_blank">${item.COMPANY_NAME}</a>
									<button type="button" class="tplBtnTy tplBtnFavOff js-tplBtn"
										data-mem-sys="13401121">
										<span class="blind">관심기업</span>
									</button>
								</div>
								<div class="tit">
									<a class="devLinkRecruit"
										href="/Recruit/GI_Read/${item.JID}?Oem_Code=C1"
										target="_blank">${item.RE_TITLE}</a>
								</div>
								<div class="desc">
									<a class="devLinkRecruit"
										href="/Recruit/GI_Read/${item.JID}?Oem_Code=C1"
										target="_blank">
										<span class="cell">${item.CAREER}</span> <span
											class="cell">${item.USER_EDUCATION}</span> <span
											class="cell">${item.SALARY}</span> <span class="cell">${item.WORK_TYPE}</span>
									</a>
								</div>
							</div>
							<div class="col btnCol">
								<button type="button"
									class="tplBtn tplBtn_1 tplBtnBlue mtuBtn_2 mtuBtnBdDi devBtnPassHomepage"
									onclick="_LA.EVT('5283')">
									<span>홈페이지 지원</span>
								</button>
								<em class="deadline date"><span class="tahoma">~${item.CLOSE_DATE}</span>(화)</em>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
			<div class="btnMoreBlock">
				<a class=" mtuSpImgAfter" href="myPage"
					onclick="GA_Event('마이페이지_PC', '나의소식', '스크랩공고 더보기')">스크랩공고 더보기</a>
			</div>
		</div>
		</section>
		
	</section>
	</div>
	
	
	<jsp:include page="footer.jsp"></jsp:include>
	<script>
		function deleteAccount(event) {
			event.preventDefault();
			
		    var mid = "${mid}";
		    var csrfToken = $("meta[name='_csrf']").attr("content");
		
		    // 회원 탈퇴 처리 AJAX 요청
		    $.ajax({
		        type: "POST",
		        url: "${pageContext.request.contextPath}/person/myPage",
		        contentType: "application/json",
		        data: JSON.stringify({ mid: mid }),
		        success: function(response) {
		            if (response === "success") {
		                // 회원 탈퇴 성공 시, 로그아웃 요청 AJAX 요청
		                $.ajax({
		                    type: "POST",
		                    url: "${pageContext.request.contextPath}/logout",
		                    beforeSend: function(xhr) {
		                        xhr.setRequestHeader("X-CSRF-TOKEN", csrfToken);
		                    },
		                    success: function() {
		                        alert("회원 탈퇴와 로그아웃이 완료되었습니다.");
		                        window.location.href = "${pageContext.request.contextPath}/index";
		                    },
		                    error: function(error) {
		                        console.error("로그아웃 요청 실패:", error);
		                    }
		                });
		            } else {
		                console.error("회원 탈퇴 요청 실패:", response);
		            }
		        },
		        error: function(error) {
		            console.error("회원 탈퇴 요청 실패:", error);
		        }
		    });
		}
	</script>
</body>
</html>