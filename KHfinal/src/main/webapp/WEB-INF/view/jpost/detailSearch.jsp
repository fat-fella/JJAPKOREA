<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 검색</title>
<link rel="icon" href="resources/favicon.ico">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/jobkh_layout.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/jobkh_header.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/jobkh_main.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/jobkh_footer.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
</head>
<style>
.custom-select {
	display: flex;
	gap: 50px;
	border: 1px solid #000;
	height: 300px;
}

.select-container {
	width: 300px;
	display: flex;
	flex-direction: column;
	align-items: flex-start;
	justify-content: flex-start;
	margin: 10px 10px 0 10px;
}

.custom-select label {
	display: block;
	margin-bottom: 0;
	align-self: flex-start;
	padding-bottom: 25px;
}

.select-options {
	width: 250px;
	display: inline-block;
	padding: 0;
	margin: 0;
	overflow-y: auto;
	overflow-x: hidden;
}

.select-options ul {
	list-style: none;
	margin: 0;
	padding: 0;
}

.selected {
	background-color: #f0f0f0;
}

.search-bar {
	display: flex;
	justify-content: space-between;
	border-left: 1px solid #000;
    border-right: 1px solid #000;
    border-bottom: 1px solid #000;
    padding: 10px;
}
</style>
<body>
	<script>
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

		$(document).ready(function() {
			$("[data-jid]").each(function() {
				var jid = $(this).data("jid");
				var scrapButton = $(this);

				// 서버에서 JSON 데이터 가져오기
				var selectListScrapJson = '${selectListScrapJson}';

				if (selectListScrapJson) {
					var selectListScrap = JSON.parse(selectListScrapJson);

					if (Array.isArray(selectListScrap)) {
						var selectOneScrap = selectListScrap
								.find(function(item) {
									return item.jid === jid;
								});

						if (selectOneScrap) {
							var isScrapAction = JSON
									.parse(selectOneScrap.isScrapAction);

							if (isScrapAction) {
								scrapButton.addClass('scraped');
								scrapButton.text('스크랩됨');
								scrapButton.removeClass('scrap');
							} else {
								scrapButton.removeClass('scraped');
								scrapButton.text('채용정보 스크랩');
								scrapButton.addClass('scrap');
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

		function getinfo(jid) {
			location.href = '${pageContext.request.contextPath}/jobpostinginfo?jid=' + jid;
		}
	</script>
	<div class="wrap">
		<header><jsp:include page="/WEB-INF/view/member/header.jsp"></jsp:include></header>
		<main>
			<div id="content">
				<br>
				<h5>
					<b>채용공고 상세검색</b>
				</h5>
				<br>
				<form action="<%=request.getContextPath()%>/detailSearchResult"
					method="GET">
					<div class="custom-select">
						<div class="select-container">
							<label for="keywordBaddress">근무지역</label>
							<div class="select-options">
								<ul id="keywordBaddress">
									<li data-value="서울">서울특별시</li>
									<li data-value="경기">경기도</li>
									<li data-value="인천">인천광역시</li>
									<li data-value="대전">대전광역시</li>
									<li data-value="세종">세종특별자치시</li>
									<li data-value="충청">충청도</li>
									<li data-value="광주">광주광역시</li>
									<li data-value="전라">전라도</li>
									<li data-value="대구">대구광역시</li>
									<li data-value="경상">경상도</li>
									<li data-value="부산">부산광역시</li>
									<li data-value="울산">울산광역시</li>
									<li data-value="강원">강원특별자치도</li>
									<li data-value="제주">제주특별자치도</li>
									<li data-value="전국">전국</li>
									<li data-value="아시아·중동">아시아·중동</li>
									<li data-value="중국·홍콩">중국·홍콩</li>
									<li data-value="일본">일본</li>
									<li data-value="미국">미국</li>
									<li data-value="북아메리카">북아메리카</li>
									<li data-value="남아메리카">남아메리카</li>
									<li data-value="유럽">유럽</li>
									<li data-value="오세아니아">오세아니아</li>
									<li data-value="아프리카">아프리카</li>
								</ul>
							</div>
						</div>
						<input type="hidden" class="keywordBaddress"
							name="keywordBaddress" value="">
						<div class="select-container">
							<label for="keywordCareer">경력</label>
							<div class="select-options">
								<ul id="keywordCareer">
									<li data-value="신입">신입</li>
									<li data-value="1~3년">1~3년</li>
									<li data-value="4~6년">4~6년</li>
									<li data-value="7~9년">7~9년</li>
									<li data-value="10~15년">10~15년</li>
									<li data-value="16~20년">16~20년</li>
									<li data-value="21년 이상">21년 이상</li>
									<li data-value="경력무관">경력무관</li>
								</ul>
							</div>
						</div>
						<input type="hidden" class="keywordCareer" name="keywordCareer"
							value="">
						<div class="select-container">
							<label for="keywordUserEducation">학력</label>
							<div class="select-options">
								<ul id="keywordUserEducation">
									<li data-value="대학">대학교졸업</li>
									<li data-value="박사">대학원 졸업</li>
									<li data-value="고등학교">고등학교졸업</li>
									<li data-value="학력무관">학력무관</li>
								</ul>
							</div>
						</div>
						<input type="hidden" class="keywordUserEducation"
							name="keywordUserEducation" value="">
						<div class="select-container">
							<label for="keywordBformName">기업형태</label>
							<div class="select-options">
								<ul id="keywordBformName">
									<li data-value="대기업">대기업</li>
									<li data-value="대기업 계열사·자회사">대기업 계열사·자회사</li>
									<li data-value="중소기업(300명이하)">중소기업(300명이하)</li>
									<li data-value="중견기업(300명이상)">중견기업(300명이상)</li>
									<li data-value="벤처기업">벤처기업</li>
									<li data-value="외국계(외국 투자기업)">외국계(외국 투자기업)</li>
									<li data-value="외국계(외국 법인기업)">외국계(외국 법인기업)</li>
									<li data-value="국내 공공기관·공기업">국내 공공기관·공기업</li>
									<li data-value="비영리단체·협회·교육재단">비영리단체·협회·교육재단</li>
									<li data-value="외국 기관·비영리기구·단체">외국 기관·비영리기구·단체</li>
								</ul>
							</div>
						</div>
						<input type="hidden" class="keywordBformName"
							name="keywordBformName" value="">
					</div>
					<div class="search-bar">
						<div class="selected-value">
							<span id="selectedBaddress">---</span> <span id="selectedCareer">---</span>
							<span id="selectedEducation">---</span> <span
								id="selectedBformName">---</span>
						</div>
						<button type="submit">검색</button>
					</div>
				</form>
				<c:if test="${not empty getJobPostingByKeywords}">
					<br>
					<jsp:include page="/WEB-INF/view/jpost/detailSearchResult.jsp"></jsp:include>
				</c:if>
			</div>
			<button class="go_top" style="display: inline-block;">
				<span class="txt">위로 가기</span>
			</button>
		</main>
		<footer><jsp:include page="/WEB-INF/view/footer.jsp"></jsp:include></footer>
	</div>
	<script>
	document.addEventListener('DOMContentLoaded', function () {
		function addOptionEvent(selectId, inputName, displayElementId) {
			const select = document.getElementById(selectId);
			const displayElement = document.getElementById(displayElementId);
			
			if (select && displayElement) {
				const hiddenInput = document.querySelector('input[name="' + inputName + '"]');
				if (hiddenInput) {
					const options = select.querySelectorAll('li');

					options.forEach(option => {
						option.addEventListener('click', () => {
							const selectedValue = option.dataset.value;
							hiddenInput.value = selectedValue;
							console.log(hiddenInput.value);
							displayElement.textContent = selectedValue;
							
							// 모든 li 요소에 적용된 클래스를 제거
							options.forEach(item => {
							  item.classList.remove('selected');
							});
							
							// 선택한 li 요소에 클래스를 추가하여 스타일 적용
							option.classList.add('selected');
						});
					});
				} else {
					console.error(`이름이 "${inputName}"인 입력 요소를 찾을 수 없습니다.`);
				}
			} else {
				console.error(`ID가 "${selectId}"인 선택 요소를 찾을 수 없습니다.`);
			}
		}

		addOptionEvent('keywordBaddress', 'keywordBaddress', 'selectedBaddress');
		addOptionEvent('keywordCareer', 'keywordCareer', 'selectedCareer');
		addOptionEvent('keywordUserEducation', 'keywordUserEducation', 'selectedEducation');
		addOptionEvent('keywordBformName', 'keywordBformName', 'selectedBformName');
	});
	
	// Get the banner list and banner items
	let bannerList = document.getElementById('banner_list');
	let bannerItems = document.querySelectorAll('.bannereach');

	// Define the number of items to show initially and the current count of visible items
	let itemsToShow = 16;
	let visibleItems = itemsToShow;

	// Add a scroll event listener to the window
	window.addEventListener('scroll', updateList);

	function updateList() {
		// Check if all items are already visible
		if (visibleItems >= bannerItems.length) {
			return;
		}

		// Get the index of the last visible item
		let lastVisibleIndex = getLastVisibleIndex();

		// Check if the scroll is at the bottom of the page
		let isScrollAtBottom = (window.innerHeight + window.scrollY) >= document.body.scrollHeight;

		// If the last visible item is the last item in the list and the scroll is at the bottom, show more items
		if (lastVisibleIndex !== -1 && isScrollAtBottom) {
			showMoreItems();
		}
	};

	// Function to show more items
	function showMoreItems() {
		// Calculate the index range of the next set of items to show
		let nextEndIndex = Math
				.min(visibleItems + itemsToShow, bannerItems.length);

		// Show the items in the calculated range
		showItemsInRange(visibleItems, nextEndIndex);

		// Update the count of visible items
		visibleItems = nextEndIndex;
	}

	// Function to show items in a given range
	function showItemsInRange(start, end) {
		for (let i = start; i < end; i++) {
			let bannerItem = bannerItems[i];
			bannerItem.style.display = 'grid';
		}
	}

	// Function to get the index of the last visible item
	function getLastVisibleIndex() {
		let scrollPosition = window.scrollY;
		let windowHeight = window.innerHeight;

		for (let i = visibleItems; i < bannerItems.length; i++) {
			let item = bannerItems[i];
			let itemTop = item.getBoundingClientRect().top + scrollPosition;

			if (itemTop < scrollPosition + windowHeight) {
				return i;
			}
		}

		return -1;
	}

	// Initially hide all items except the first 16
	for (let i = itemsToShow; i < bannerItems.length; i++) {
		bannerItems[i].style.display = 'none';
	}
	</script>
</body>
</html>