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
<!-- [4] button 3개 class 미리 만들어두기 -->
<!-- [4] a 모양 미리 만들어두기 -->
<!-- [5] layout 영역 -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/jobkh_layout.css">
<!-- [6] header 영역 -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/jobkh_header.css">
<!-- [7] nav 영역 -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/jobkh_nav.css">
<!-- [8] main 영역 -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/jobkh_main.css">
<!-- [9] footer 영역 -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/jobkh_footer.css">
<!-- 스크랩부 -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources//member/css/jobkh_mypage.css">
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

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MY페이지 | KH</title>
<!-- jQuery 스크립트 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- nav active 별 스크립트 구성 -->
<script>
        $(document).ready(function() {
            $(".person-tab li").click(function() {
                // 모든 person-tab 항목에서 active 클래스를 제거합니다.
                $(".person-tab li").removeClass("active");
                
                // 클릭한 person-tab 항목에 active 클래스를 추가합니다.
                $(this).addClass("active");
                
                // 클릭한 person-tab 항목의 data-contentnumber를 가져옵니다.
                var contentNumber = $(this).data("contentnumber");
                
                // 모든 tab-cont 항목에서 active 클래스를 제거합니다.
                $(".tab-cont").removeClass("active");
                
                // data-contentnumber와 일치하는 tab-cont 항목에 active 클래스를 추가합니다.
                $(".tab-cont[data-contentnumber='" + contentNumber + "']").addClass("active");
            });

                // 개인 메뉴 클릭 시
                $(".person-menu").click(function() {
                    // corp-tab 비활성화
                    $(".corp-tab").removeClass("active");
                    $(".corp-menu").removeClass("active");

                    // person-tab 활성화
                    $(".person-tab").addClass("active");
                    $(".person-menu").addClass("active");

                    // person-tab에 있는 data-contentnumber를 가져옵니다.
                    var contentNumber = $(".person-tab li").data("contentnumber");

                    // 모든 tab-cont 항목에서 active 클래스를 제거합니다.
                    $(".tab-cont").removeClass("active");
                
                    // data-contentnumber와 일치하는 tab-cont 항목에 active 클래스를 추가합니다.
                    $(".tab-cont[data-contentnumber='" + contentNumber + "']").addClass("active");
                    });

                // 기업 메뉴 클릭 시
                $(".corp-menu").click(function() {
                    // person-tab 비활성화
                    $(".person-tab").removeClass("active");
                    $(".person-menu").removeClass("active");

                    // corp-tab 활성화
                    $(".corp-tab").addClass("active");
                    $(".corp-menu").addClass("active");

                    // corp-tab에 있는 data-contentnumber를 가져옵니다.
                    var contentNumber = $(".corp-tab li").data("contentnumber");

                    // 모든 tab-cont 항목에서 active 클래스를 제거합니다.
                    $(".tab-cont").removeClass("active");
                    
                    // data-contentnumber와 일치하는 tab-cont 항목에 active 클래스를 추가합니다.
                    $(".tab-cont[data-contentnumber='" + contentNumber + "']").addClass("active");
            });
</script>
<jsp:include page="header.jsp"></jsp:include>
</head>
<body>
	<div class="contWrap">
		<div class="mtuTab devFixedTab">
			<ul>
				<li class="on">
					<a href="#" onclick="GA_Event('마이페이지_PC', '나의소식', '스크랩 공고')">스크랩
						공고</a>
				</li>
				<li>
					<a href="#" onclick="GA_Event('마이페이지_PC', '나의소식', '최근 본 공고')">최근
						본 공고</a>
				</li>
				<li>
					<a href="#" onclick="GA_Event('마이페이지_PC', '나의소식', '스마트매치')">스마트매치</a>
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
									target="_blank">${scrapList.COMPANY_NAME}</a>
								<button type="button" class="tplBtnTy tplBtnFavOff js-tplBtn"
									data-mem-sys="13401121">
									<span class="blind">관심기업</span>
								</button>
							</div>
							<div class="tit">
								<a class="devLinkRecruit"
									href="/Recruit/GI_Read/${scrapList.JID}?Oem_Code=C1"
									target="_blank">${scrapList.RE_TITLE}</a>
							</div>
							<div class="desc">
								<a class="devLinkRecruit"
									href="/Recruit/GI_Read/${scrapList.JID}?Oem_Code=C1"
									target="_blank">
									<span class="cell">${scrapList.CAREER}</span> <span
										class="cell">${scrapList.USER_EDUCATION}</span> <span
										class="cell">${scrapList.SALARY}</span> <span class="cell">${scrapList.WORK_TYPE}</span>
								</a>
							</div>
						</div>
						<div class="col btnCol">
							<button type="button"
								class="tplBtn tplBtn_1 tplBtnBlue mtuBtn_2 mtuBtnBdDi devBtnPassHomepage"
								onclick="_LA.EVT('5283')">
								<span>홈페이지 지원</span>
							</button>
							<em class="deadline date"><span class="tahoma">~${scrapList.CLOSE_DATE}</span>(화)</em>
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
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>