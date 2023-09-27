<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/jpostinfo.css">

</head>
<body>
	<section class="secReadSummary   ">
		<div class="readSumWrap clear">
			<article class="artReadJobSum">
				<div class="sumTit">
					<h3 class="hd_3">
						<div class="header">
							<span class="coName"> 중앙일보㈜ </span>
							<div class="item favorite">
								<button type="button"
									class="girBtn girBtn_2 girBtnFav  devFavor5_15983790"
									onclick=" JKLoginLayer.open('/Recruit/Booth_GI_Read/42887747?Oem_Code=C1&amp;productType=FirstVVIP&amp;logpath=0'); ">
									<span>관심기업</span>
								</button>
							</div>
						</div>

						2023 중앙그룹 신입사원 모집
					</h3>
				</div>
				<div class="tbRow clear">
				<div class="tbcolrow">
					<div class="tbCol ">

						<h4 class="hd_4">지원자격</h4>
						<dl class="tbList">
							<dt>경력</dt>
							<dd>
								<strong class="col_1">신입·경력</strong>
							</dd>
							<dt>학력</dt>
							<dd>
								<strong class="col_1">대졸이상</strong> (졸업예정자 가능)
							</dd>
						</dl>
					</div>
						<div class="tbCol ">

							<h4 class="hd_4">근무조건</h4>
							<dl class="tbList">
								<dt>고용형태</dt>
								<dd>
									<ul class="addList">

										<li><strong class="col_1">정규직</strong> <span
											class="tahoma"></span></li>

									</ul>
								</dd>

								<dt>급여</dt>
								<dd>
									<em class="dotum"></em> 회사내규에 따름 - 면접 후 결정
								</dd>
								<dt>지역</dt>
								<dd>
									<a
										href="https://www.jobkorea.co.kr/List_GI/GI_Area_List.asp?AreaNo=I130&amp;AllStat=1"
										target="_blank" title="새창"
										onclick="javascript:go_Area_List('I130',1); return false;">서울시
										마포구</a>
									<button type="button" class="girBtn girBtn_3 girBtnMap"
										onclick="$('html, body').stop().animate({ scrollTop: $('#secReadWork').offset().top - 70 }, 500);">
										<span>지도</span>
									</button>

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
										onclick="GA_Event('공고_PC', '기업정보상단', '기업로고_중앙일보㈜');"><img
										src="//imgs.jobkorea.co.kr/img1/_whitebg/200X80/Co_Logo/Logo/2022/5/31/JK_CO_MYXPLxP22053110144946.gif?v=202309271603"
										id="cologo" name="cologo" alt="중앙일보㈜"
										onload="go_logo_size(this, 100, 40);" width="100" height="40"></a>
								</p>
							</div>
						</div>

						<dl class="tbList">

							<dt>산업(업종)</dt>
							<dd>
								<text>신문 발행업</text>
							</dd>
							<dt>사원수</dt>
							<dd>
								<span class="tahoma">606</span>명
							</dd>
							<dt>설립년도</dt>
							<dd>
								<text> <span class="tahoma">1965</span>년 (<span
									class="tahoma">59</span>년차) </text>
							</dd>
							<dt>기업형태</dt>
							<dd>중견기업 (비상장)</dd>
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
				</div>
			</article>
		</div>



		<p class="sumBtn">

			<button type="button"
				class="tplBtn tplBtn_1 tplBtnBlue devHomePageApplyBtn"
				onclick="window.open('/List_GI/GIB_Read_homepage_Link.asp?GI_NO=45389898&amp;logpath=0'); GI_Click_Cnt('', 'E05'); _LA.EVT('5283'); GA_Event('공고_PC', '공고지원상단', '홈페이지 지원');  BrazeCustomEventSetProperty(104, 'FirstVVIP|중앙일보㈜|42887747|2023-09-18|2023-10-04|15983790');"
				title="홈페이지 지원(새창)" id="devApplyBtn">
				<span>홈페이지 지원</span>
			</button>
			<button type="button"
				class="girBtn girBtn_1 girBtnScr devScrap142887747  "
				onclick="GA_Event('공고_PC','공고지원상단','스크랩_' + ($(this).hasClass('girBtnScrOn')?'해제':'등록') + '_중앙일보㈜_중앙일보㈜2023 중앙그룹 신입사원 모집'); JKLoginLayer.open('/Recruit/Booth_GI_Read/42887747?Oem_Code=C1&amp;productType=FirstVVIP&amp;logpath=0'); ;">
				<span>스크랩</span>
			</button>

		</p>
		<p class="deadlineInfo" id="devTimeGuide"></p>
	</section>
</html>