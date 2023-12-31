<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Onpick Nav</title>
    <!-- swiper css -->
	<!-- 부트스트랩 css -->
    <!-- jQuery 스크립트 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- nav script -->
    <script src="<%=request.getContextPath() %>/onpick/js/onpick_nav.js"></script>
    <script src="<%=request.getContextPath() %>/onpick/js/onpick_nav2.js"></script>
</head>
<body>
    <div class="wrap">
        <nav>
            <div class="recruitTitBox">
                <p class="recruitTit">원픽공고</p>
                <span class="recruitTxt"><em><span class="dev-select-partName">전체</span></em> 직무 합격축하금 공고를 확인하세요! </span>
            </div>
            <div class="job-tab swiper-container job-swi-container swiper-container-horizontal swiper-container-free-mode">
                <div class="job-tab-list swiper-wrapper" style="transform: translate3d(0px, 0px, 0px); transition-duration: 0ms;">
                    <div class="swiper-slide check-slide-box swiper-slide-active">
                        <input type="checkbox" class="check-slide dev-check-all on" autocomplete="off" checked="checked" id="check-slide-all" value="">
                        <label class="input-label" for="check-slide-all">전체</label>
                    </div>
                        <div class="swiper-slide check-slide-box swiper-slide-next">
                            <input type="checkbox" id="check-slide-item-0" autocomplete="off" value="10026" class="check-slide dev-check-item">
                            <label class="input-label" for="check-slide-item-0">기획·전략</label>
                        </div>
                        <div class="swiper-slide check-slide-box">
                            <input type="checkbox" id="check-slide-item-1" autocomplete="off" value="10027" class="check-slide dev-check-item">
                            <label class="input-label" for="check-slide-item-1">법무·사무·총무</label>
                        </div>
                        <div class="swiper-slide check-slide-box">
                            <input type="checkbox" id="check-slide-item-2" autocomplete="off" value="10028" class="check-slide dev-check-item">
                            <label class="input-label" for="check-slide-item-2">인사·HR</label>
                        </div>
                        <div class="swiper-slide check-slide-box">
                            <input type="checkbox" id="check-slide-item-3" autocomplete="off" value="10029" class="check-slide dev-check-item">
                            <label class="input-label" for="check-slide-item-3">회계·세무</label>
                        </div>
                        <div class="swiper-slide check-slide-box">
                            <input type="checkbox" id="check-slide-item-4" autocomplete="off" value="10030" class="check-slide dev-check-item">
                            <label class="input-label" for="check-slide-item-4">마케팅·광고·MD</label>
                        </div>
                        <div class="swiper-slide check-slide-box">
                            <input type="checkbox" id="check-slide-item-5" autocomplete="off" value="10031" class="check-slide dev-check-item">
                            <label class="input-label" for="check-slide-item-5">개발·데이터</label>
                        </div>
                        <div class="swiper-slide check-slide-box">
                            <input type="checkbox" id="check-slide-item-6" autocomplete="off" value="10032" class="check-slide dev-check-item">
                            <label class="input-label" for="check-slide-item-6">디자인</label>
                        </div>
                        <div class="swiper-slide check-slide-box">
                            <input type="checkbox" id="check-slide-item-7" autocomplete="off" value="10033" class="check-slide dev-check-item">
                            <label class="input-label" for="check-slide-item-7">물류·무역</label>
                        </div>
                        <div class="swiper-slide check-slide-box">
                            <input type="checkbox" id="check-slide-item-8" autocomplete="off" value="10034" class="check-slide dev-check-item">
                            <label class="input-label" for="check-slide-item-8">운전·운송·배송</label>
                        </div>
                        <div class="swiper-slide check-slide-box">
                            <input type="checkbox" id="check-slide-item-9" autocomplete="off" value="10035" class="check-slide dev-check-item">
                            <label class="input-label" for="check-slide-item-9">영업</label>
                        </div>
                        <div class="swiper-slide check-slide-box">
                            <input type="checkbox" id="check-slide-item-10" autocomplete="off" value="10036" class="check-slide dev-check-item">
                            <label class="input-label" for="check-slide-item-10">고객상담·TM</label>
                        </div>
                        <div class="swiper-slide check-slide-box">
                            <input type="checkbox" id="check-slide-item-11" autocomplete="off" value="10037" class="check-slide dev-check-item">
                            <label class="input-label" for="check-slide-item-11">금융·보험</label>
                        </div>
                        <div class="swiper-slide check-slide-box">
                            <input type="checkbox" id="check-slide-item-12" autocomplete="off" value="10038" class="check-slide dev-check-item">
                            <label class="input-label" for="check-slide-item-12">식·음료</label>
                        </div>
                        <div class="swiper-slide check-slide-box">
                            <input type="checkbox" id="check-slide-item-13" autocomplete="off" value="10039" class="check-slide dev-check-item">
                            <label class="input-label" for="check-slide-item-13">고객서비스·리테일</label>
                        </div>
                        <div class="swiper-slide check-slide-box">
                            <input type="checkbox" id="check-slide-item-14" autocomplete="off" value="10040" class="check-slide dev-check-item">
                            <label class="input-label" for="check-slide-item-14">엔지니어링·설계</label>
                        </div>
                        <div class="swiper-slide check-slide-box">
                            <input type="checkbox" id="check-slide-item-15" autocomplete="off" value="10041" class="check-slide dev-check-item">
                            <label class="input-label" for="check-slide-item-15">제조·생산</label>
                        </div>
                        <div class="swiper-slide check-slide-box">
                            <input type="checkbox" id="check-slide-item-16" autocomplete="off" value="10042" class="check-slide dev-check-item">
                            <label class="input-label" for="check-slide-item-16">교육</label>
                        </div>
                        <div class="swiper-slide check-slide-box">
                            <input type="checkbox" id="check-slide-item-17" autocomplete="off" value="10043" class="check-slide dev-check-item">
                            <label class="input-label" for="check-slide-item-17">건축·시설</label>
                        </div>
                        <div class="swiper-slide check-slide-box">
                            <input type="checkbox" id="check-slide-item-18" autocomplete="off" value="10044" class="check-slide dev-check-item">
                            <label class="input-label" for="check-slide-item-18">의료·바이오</label>
                        </div>
                        <div class="swiper-slide check-slide-box">
                            <input type="checkbox" id="check-slide-item-19" autocomplete="off" value="10045" class="check-slide dev-check-item">
                            <label class="input-label" for="check-slide-item-19">미디어·문화·스포츠</label>
                        </div>
                        <div class="swiper-slide check-slide-box">
                            <input type="checkbox" id="check-slide-item-20" autocomplete="off" value="10046" class="check-slide dev-check-item">
                            <label class="input-label" for="check-slide-item-20">공공·복지</label>
                        </div>
                </div>
                <div class="swiper-button-prev job-tab-btn-prev swiper-button-disabled" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></div>
                <div class="swiper-button-next job-tab-btn-next" tabindex="0" role="button" aria-label="Next slide" aria-disabled="false"></div>
                <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span>
            </div>
            <div class="recruitFilter-section">
                <div class="sort-select-box">
                    <div class="sort-select-all">
                        <span>총<em id="totalCount" data-totalcount="0">1,064</em>건</span>
                    </div>
                    <button class="filter-button">
                        <span id="badgeCount" style="display: none;">0</span>
                    </button>
                    <div class="search-box input-box_common sh-after">
                        <form id="searchForm" onsubmit="return false">
                            <input type="text" id="searchText" autocomplete="off" search="" name="Keyword" maxlength="30" placeholder="텍스트 입력">
                            <button type="button" class="search-button"></button>
                            <button type="button" class="btnKeywordClear" style="display: none;"><span>삭제</span></button>
        
                            <input type="hidden" search="" id="pageNo" name="Page" data-no="0" data-maxno="100" value="1">
                            <input type="hidden" search="" id="pageSize" name="PageSize" value="20">
                            <input type="hidden" search="" id="searchOrder" name="Ord" value="GcmCodeAmtDesc">
        
                            <input type="hidden" search="" badge="" id="codePartCtgr" name="DutyCtgr" value="">
                            <input type="hidden" search="" badge="" id="codeLocal" name="Local" value="">
                            <input type="hidden" search="" badge="" id="codeCareer" name="CareerType" value="">
                            <input type="hidden" search="" badge="" id="codeEduLevel" name="EduLevel" value="">
                            <input type="hidden" search="" badge="" id="codeCoType" name="CoType" value="">
                            <input type="hidden" badge="" id="codeDay" value="">
                        </form>
                    </div>
                    <div class="drop-down-box">
                        <div class="button-box">
                            <button class="sort-button">합격축하금 높은 순</button>
                            <div class="sort-select-modal select-modal_common">
                                <ul>
                                    <li><button data-code="GcmCodeAmtDesc">합격축하금 높은 순</button></li>
                                    <li><button data-code="ReadCntDesc">조회수 높은 순</button></li>
                                    <li><button data-code="RegDtDesc">등록일순</button></li>
                                    <li><button data-code="ApplyCloseDtAsc">마감일순</button></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="filter-modal">
                <div class="content-box">
                    <p class="all-title">상세검색</p>
                    <div class="filter-box job-box dev-wrap-filterPartCtgr">
                        <div class="title">직무</div>
                        <ul>
                            <li><button class="dev-check-all active" data-code="">전체</button></li>
                                <li><button class="dev-check-item" data-code="10026">기획·전략</button></li>
                                <li><button class="dev-check-item" data-code="10027">법무·사무·총무</button></li>
                                <li><button class="dev-check-item" data-code="10028">인사·HR</button></li>
                                <li><button class="dev-check-item" data-code="10029">회계·세무</button></li>
                                <li><button class="dev-check-item" data-code="10030">마케팅·광고·MD</button></li>
                                <li><button class="dev-check-item" data-code="10031">개발·데이터</button></li>
                                <li><button class="dev-check-item" data-code="10032">디자인</button></li>
                                <li><button class="dev-check-item" data-code="10033">물류·무역</button></li>
                                <li><button class="dev-check-item" data-code="10034">운전·운송·배송</button></li>
                                <li><button class="dev-check-item" data-code="10035">영업</button></li>
                                <li><button class="dev-check-item" data-code="10036">고객상담·TM</button></li>
                                <li><button class="dev-check-item" data-code="10037">금융·보험</button></li>
                                <li><button class="dev-check-item" data-code="10038">식·음료</button></li>
                                <li><button class="dev-check-item" data-code="10039">고객서비스·리테일</button></li>
                                <li><button class="dev-check-item" data-code="10040">엔지니어링·설계</button></li>
                                <li><button class="dev-check-item" data-code="10041">제조·생산</button></li>
                                <li><button class="dev-check-item" data-code="10042">교육</button></li>
                                <li><button class="dev-check-item" data-code="10043">건축·시설</button></li>
                                <li><button class="dev-check-item" data-code="10044">의료·바이오</button></li>
                                <li><button class="dev-check-item" data-code="10045">미디어·문화·스포츠</button></li>
                                <li><button class="dev-check-item" data-code="10046">공공·복지</button></li>
                        </ul>
                    </div>
                    <div class="filter-box district-box dev-wrap-filterLocal">
                        <div class="title">지역</div>
                        <ul>
                            <li><button class="dev-check-all active">전체</button></li>
                                <li><button class="dev-check-item" data-code="I000">서울</button></li>
                                <li><button class="dev-check-item" data-code="B000">경기</button></li>
                                <li><button class="dev-check-item" data-code="K000">인천</button></li>
                                <li><button class="dev-check-item" data-code="G000">대전</button></li>
                                <li><button class="dev-check-item" data-code="1000">세종</button></li>
                                <li><button class="dev-check-item" data-code="O000">충남</button></li>
                                <li><button class="dev-check-item" data-code="P000">충북</button></li>
                                <li><button class="dev-check-item" data-code="E000">광주</button></li>
                                <li><button class="dev-check-item" data-code="L000">전남</button></li>
                                <li><button class="dev-check-item" data-code="M000">전북</button></li>
                                <li><button class="dev-check-item" data-code="F000">대구</button></li>
                                <li><button class="dev-check-item" data-code="D000">경북</button></li>
                                <li><button class="dev-check-item" data-code="H000">부산</button></li>
                                <li><button class="dev-check-item" data-code="J000">울산</button></li>
                                <li><button class="dev-check-item" data-code="C000">경남</button></li>
                                <li><button class="dev-check-item" data-code="A000">강원</button></li>
                                <li><button class="dev-check-item" data-code="N000">제주</button></li>
                                <li><button class="dev-check-item" data-code="Q000">전국</button></li>
                        </ul>
                    </div>
                    <div class="filter-box career-box dev-wrap-filterCareer">
                        <div class="title">경력</div>
                        <ul>
                            <li><button class="dev-check-item" data-code="1">신입</button></li>
                            <li><button class="dev-check-item" data-code="2">경력</button></li>
                            <li><button class="dev-check-item" data-code="4">경력무관</button></li>
                        </ul>
                    </div>
                    <div class="filter-box eventually-box dev-wrap-filterEduLevel">
                        <div class="title">학력</div>
                        <ul>
                                <li><button class="dev-check-item" data-code="0">학력무관</button></li>
                                <li><button class="dev-check-item" data-code="3">고등학교졸업</button></li>
                                <li><button class="dev-check-item" data-code="4">대학졸업(2,3년)</button></li>
                                <li><button class="dev-check-item" data-code="5">대학교졸업(4년)</button></li>
                                <li><button class="dev-check-item" data-code="6">대학원 석사졸업</button></li>
                                <li><button class="dev-check-item" data-code="7">대학원 박사졸업</button></li>
                        </ul>
                    </div>
                    <div class="filter-box firm-box dev-wrap-filterCoType">
                        <div class="title">기업형태</div>
                        <ul>
                                <li><button class="dev-check-item" data-code="1">대기업</button></li>
                                <li><button class="dev-check-item" data-code="2">30대그룹사</button></li>
                                <li><button class="dev-check-item" data-code="3">매출1000대기업</button></li>
                                <li><button class="dev-check-item" data-code="4">중견기업</button></li>
                                <li><button class="dev-check-item" data-code="5">강소기업</button></li>
                                <li><button class="dev-check-item" data-code="6">외국계기업</button></li>
                                <li><button class="dev-check-item" data-code="15">중소기업</button></li>
                                <li><button class="dev-check-item" data-code="7">벤처기업</button></li>
                                <li><button class="dev-check-item" data-code="8">공공기관·공기업</button></li>
                                <li><button class="dev-check-item" data-code="9">비영리단체·협회재단</button></li>
                                <li><button class="dev-check-item" data-code="10">외국기관·단체</button></li>
                                <li><button class="dev-check-item" data-code="11">주권상장</button></li>
                                <li><button class="dev-check-item" data-code="12">코스닥상장</button></li>
                                <li><button class="dev-check-item" data-code="13">코넥스상장</button></li>
                                <li><button class="dev-check-item" data-code="14">해외상장</button></li>
                        </ul>
                    </div>
                    <div class="filter-box day-box dev-wrap-filterDay">
                        <div class="title">필터</div>
                        <ul>
                            <li><button class="dev-check-item" data-code="todayRegist">오늘등록</button></li>
                            <li><button class="dev-check-item" data-code="todayClose">오늘마감</button></li>
                        </ul>
                    </div>

                </div>
                <div class="button-box">
                    <button class="search-reset">초기화</button>
                    <button class="search-button">적용하기</button>
                </div>
                <button class="close-button">닫기</button>
            </div>
        </nav>
    </div>
    <!-- swiper 스크립트 -->
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script>
        var swiper = new Swiper('.job-swi-container', {
            direction: 'horizontal',
            spaceBetween: 5,
            // centeredSlides: true,
            watchOverflow : true,
            slidesPerView: 'auto',
            navigation: {
                nextEl: ".job-tab-btn-next",
                prevEl: ".job-tab-btn-prev",
            },
            observer: true,
            observeParents: true,
        });
    </script>
</body>
</html>