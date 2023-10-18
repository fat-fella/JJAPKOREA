<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채용공고 상세페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	// 이메일 보내기 
	function sendEmail(jid) {
		var mid = "${mid}";

		$.ajax({
			url : "${pageContext.request.contextPath}/person/noticeMail",
			type : "post",
			/* contentType : "application/json", // JSON 형식으로 데이터 전송
			data : JSON.stringify({
				jid : jid,
				mid : mid
			// 문자열로 변환하여 보냄
			}), */
			success : function() {
				alert("[지원완료] 이메일 전송되었습니다.")
			}/* ,
			error : function() {
				alert("에러가 발생하였습니다. 여러분의 잘못이 아니니 다음에 다시 시도해주세요.");
			},// error */
		}); // ajax

	}
</script>



<link rel="icon" href="resources/favicon.ico">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/jpostinfo.css">

</head>
<body>
	<header class="jobkorea-header">
		<div class="jobkorea-logo">
			<a href="<%=request.getContextPath()%>/index">JJAPKorea</a>
		</div>
		<div class="jobkorea-menu">
			<ul>
				<li><a href="<%=request.getContextPath()%>/index">홈</a></li>
				<li><a
					href="<%=request.getContextPath()%>/business/jobpostingupload/list">채용정보</a></li>
			</ul>
		</div>
	</header>
	<section class="secReadSummary   ">
		<div class="readSumWrap clear">
			<article class="artReadJobSum">
				<div class="sumTit">
					<h3 class="hd_3">
						<div class="header">
							<span class="coName"> ${jobPosting.BIZNAME} </span>

							<div class="item favorite">
								<!-- <button type="button"
									class="girBtn girBtn_2 girBtnFav  devFavor5_15983790"
									onclick=" JKLoginLayer.open('/Recruit/Booth_GI_Read/42887747?Oem_Code=C1&amp;productType=FirstVVIP&amp;logpath=0'); ">
									<span>관심기업</span>
								</button>
 -->
							</div>
						</div>
						<p>${jobPosting.RE_TITLE}</p>
					</h3>
				</div>
				<div class="tbRow clear">
					<div class="tbcolrow">
						<div class="tbCol ">

							<h4 class="hd_4">지원자격</h4>
							<dl class="tbList">
								<dt>경력</dt>
								<dd>
									<strong class="col_1">${jobPosting.CAREER}</strong>
								</dd>
								<dt>학력</dt>
								<dd>
									<strong class="col_1">${jobPosting.USER_EDUCATION}</strong>
									(졸업예정자 가능)
								</dd>
							</dl>
						</div>
						<div class="tbCol ">

							<h4 class="hd_4">근무조건</h4>
							<dl class="tbList">
								<dt>고용형태</dt>
								<dd>
									<ul class="addList">

										<li><strong class="col_1">${jobPosting.WORK_TYPE}</strong>
											<span class="tahoma"></span></li>

									</ul>
								</dd>

								<dt>급여</dt>
								<dd>
									<em class="dotum"></em> ${jobPosting.SALARY}
								</dd>
								<dt>지역</dt>
								<dd>
									<a
										href="https://www.jobkorea.co.kr/List_GI/GI_Area_List.asp?AreaNo=I130&amp;AllStat=1"
										target="_blank" title="새창"
										onclick="javascript:go_Area_List('I130',1); return false;">서울시
									</a>
									<button id="openMapButton" onclick="openMapModal()">지도</button>
								</dd>

							</dl>
						</div>
					</div>
					<div class="tbCoInfo">
						<h4 class="hd_4">기업정보</h4>

						<div class="tbLogo">
							<div class="logo">
								<p>
									<a href="/Company/1824494/?C_IDX=807" target="_blank"
										title="새창"
										onclick="GA_Event('공고_PC', '기업정보상단', '기업로고_중앙일보㈜');"></a>
								</p>
							</div>
						</div>

						<dl class="tbList">
							<dt>산업(업종)</dt>
							<dd>
								<text>${jobPosting.FIELD_TITLE}</text>
							</dd>
							<dt>사원수</dt>
							<dd>
								<span class="tahoma">${jobPosting.BEMP}</span>명
							</dd>
							<dt>설립년도</dt>
							<dd>
								<text> <span class="tahoma">${jobPosting.BESTD}</span>년 (<span
									class="tahoma"></span>년차) </text>
							</dd>
							<dt>기업형태</dt>
							<dd>${BFORM}</dd>
							<dt>홈페이지</dt>
							<dd>

								<span class="tahoma"><a class="devCoHomepageLink"
									href="http://www.joongang.co.kr"
									onclick="javascript:go_HomePageTrace('http://www.joongang.co.kr','45389898');return false;">joongang.co.kr</a></span>
							</dd>
						</dl>
						<p class="coBtn">
							<a href="/Company/1824494/?C_IDX=807" target="_blank"
								title="기업정보(새창)" class="girBtn girBtn_3"
								onclick="GA_Event('공고_PC', '기업정보상단', '기업정보_중앙일보㈜');"><span>기업정보</span></a>
							<a href="/Recruit/Co_Read/15983790/CoRecruitLink" target="_blank"
								title="새창" class="girBtn girBtn_3"
								onclick="GA_Event('공고_PC', '기업정보상단', '진행중인채용보기_중앙일보㈜');"><span>진행중인
									채용보기</span></a>
						</p>
					</div>
					<div class="tbCoInfo">
						<p>${jobPosting.JPOSTDETAIL}</p>
					</div>

				</div>
			</article>
		</div>




		<form>
		<p class="sumBtn">
			<button type="button" onclick="sendEmail('${item.JID}')"
				class="tplBtn tplBtn_1 tplBtnBlue devHomePageApplyBtn"
				title="홈페이지 지원(새창)" id="devApplyBtn">
				<span>이력서 지원</span>
			</button>
		</p>
		</form>


		<p class="deadlineInfo" id="devTimeGuide"></p>
	</section>
	<div id="mapModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeMapModal()">&times;</span>
        <div class="map_wrap">
		<div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
            <div id="menu_wrap" class="bg_white">
                <div class="option">
                    <div>
                        <form onsubmit="searchPlaces(); return false;">
                            키워드 : <input type="text" id="keyword" size="15" placeholder="기업명 입력!"> 
                            <button type="submit">검색하기</button>
                        </form>
                    </div>
                </div>
                <hr>
                <ul id="placesList"></ul>
                <div id="pagination"></div>
            </div>
        </div>
    </div>
</div>
</html>